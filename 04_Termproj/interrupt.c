/* Interupt.c */

#include <c6x.h>
#include <math.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "c6701.h"
#include "constant.h"
#include "typedef.h"
#include "bss.h"
#include "function.h"
#include "interrupt.h"
#include "USBMon.h"

/* 진자 각도 PID 게인 */
#define Kp_angle            (40.0f)
#define Kd_angle            (0.0f)
#define Ki_angle            (0.0f)

/* 카트 위치 PID 게인 */
#define Kp_cart             (0.0f)
#define Kd_cart             (0.0f)
#define Ki_cart             (0.0f)

/* 기준값 및 제한값 */
#define REF_THETA_DEG       (0.0f)
#define REF_CART_POS        (0.0f)
#define THETA_REF_LIMIT     (3.0f)

/* Swing-up용 Bang-bang 제어 파라미터 */
#define BANG_BANG_PWM           (25.0f)
#define BANG_BANG_DEADBAND      (50.0f)
#define BANG_BANG_HOLD_COUNT    (100)

/* 모드 전환 조건 */
#define BALANCE_START_ANGLE     (15.0f)
#define BALANCE_START_SPEED     (150.0f)
#define BALANCE_RETURN_ANGLE    (25.0f)

/* 제어 모드 */
#define MODE_SWINGUP            (0)
#define MODE_BALANCE            (1)

unsigned int TFlag = 0;

interrupt void ISRtimer0()
{
    // -------------------------------
    /* 2026.06.05 (금) - 진자 밸런싱 */
    // -------------------------------

    /* 진자 제어 변수 */
    float theta;
    float theta_rad;
    float theta_ref;
    float theta_error;
    static float theta_p = 0.0f;
    static float theta_i = 0.0f;
    float theta_dot_raw;
    static float theta_dot = 0.0f;
    static float theta_angle_p = 0.0f;
    static unsigned int theta_dot_count = 0;

    /* 카트 제어 변수 */
    float x;
    float x_error;
    static float x_p = 0.0f;
    static float x_i = 0.0f;

    /* 제어 입력 변수 */
    float pendulum_pid;
    float cart_pid;
    float u;
    float u_sat;

    /* Swing-up 제어 변수 */
    float swing_value;
    static float swing_direction = 1.0f;
    static unsigned int swing_hold_count = 0;
    static int mode = MODE_SWINGUP;

    TFlag = 1;
    TINTCnt++;

    /*
     * 현재 진자 각도와 카트 위치를 읽는다.
     *
     * theta 기준:
     *   아래쪽       : 0도
     *   수평         : +/-90도
     *   꼭대기       : +/-180도
     */
    theta = (float)GetAngle();
    x = (int)(*DC_ENC_POSCNT_R);

    // -------------------------------
    /* 1단계: 진자 각속도 계산 */
    // -------------------------------
    /*
     * 현재 각도와 이전 각도의 차이로 각속도를 추정한다.
     * 각속도는 매 인터럽트마다 계산하지 않고, 5틱마다 한 번 계산한다.
     */
    if (TINTCnt == 1) {
        /* 첫 실행 시에는 이전 각도 기준값만 저장한다. */
        theta_angle_p = theta;
        theta_dot_count = 0;
    }
    else {
        theta_dot_count++;

        if (theta_dot_count >= 5) {
            /*
             * 5틱 동안의 각도 변화량을 계산한다.
             * theta_dot_raw는 아직 각속도가 아니라 각도 변화량이다.
             */
            theta_dot_raw = theta - theta_angle_p;

            /*
             * +/-180도 경계에서 각도값이 튀는 현상을 보정한다.
             * 예: 179도 -> -179도 변화는 -358도가 아니라 +2도에 가깝다.
             */
            if (theta_dot_raw > 180.0f)
                theta_dot_raw -= 360.0f;
            else if (theta_dot_raw < -180.0f)
                theta_dot_raw += 360.0f;

            /*
             * 각도 변화량을 초당 각속도(deg/s)로 변환한다.
             * TIMER_FRQ가 1000Hz라면 5틱은 5ms에 해당한다.
             */
            theta_dot_raw = theta_dot_raw * TIMER_FRQ / 5.0f;

            /*
             * 각속도 노이즈를 줄이기 위해 간단한 저역통과 필터를 적용한다.
             * 이전 값 70%, 새 값 30%를 반영한다.
             */
            theta_dot = 0.7f * theta_dot + 0.3f * theta_dot_raw;

            /* 다음 각속도 계산을 위한 기준값 갱신 */
            theta_angle_p = theta;
            theta_dot_count = 0;
        }
    }

    /*
     * 꼭대기 위치를 기준으로 진자 각도 오차를 계산한다.
     *
     * 꼭대기는 +180도 또는 -180도로 표현될 수 있으므로,
     * 현재 각도의 부호에 따라 오차 계산식을 나눈다.
     *
     * theta_error가 0에 가까울수록 진자가 꼭대기 근처에 있다는 뜻이다.
     */
    if (theta >= 0.0f)
        theta_error = theta - 180.0f;
    else
        theta_error = theta + 180.0f;

    // -------------------------------
    /* 2단계: Swing-up / Balance 모드 전환 */
    // -------------------------------
    if (mode == MODE_SWINGUP) {
        /*
         * 진자가 꼭대기 근처에 있고 각속도도 충분히 작으면
         * Swing-up을 끝내고 Balance 모드로 전환한다.
         */
        if (fabs(theta_error) < BALANCE_START_ANGLE &&
            fabs(theta_dot) < BALANCE_START_SPEED) {
            mode = MODE_BALANCE;

            /*
             * Balance 모드 진입 시 PID 상태값을 초기화한다.
             * 이전 오차값은 현재 상태에 맞추어 설정하고,
             * 적분항은 0으로 초기화한다.
             */
            theta_p = theta_error;
            theta_i = 0.0f;
            x_p = (float)x - REF_CART_POS;
            x_i = 0.0f;
        }
    }
    else {
        /*
         * Balance 중 진자가 너무 많이 기울어지면
         * 다시 Swing-up 모드로 돌아간다.
         */
        if (fabs(theta_error) > BALANCE_RETURN_ANGLE) {
            mode = MODE_SWINGUP;

            /* 재시작 시 이전 PID 상태가 영향을 주지 않도록 초기화 */
            theta_p = 0.0f;
            theta_i = 0.0f;
            x_p = 0.0f;
            x_i = 0.0f;
            swing_hold_count = 0;
        }
    }

    if (mode == MODE_SWINGUP) {
        // -------------------------------
        /* 3단계: Bang-bang Swing-up 제어 */
        // -------------------------------

        /*
         * cos() 함수는 radian 단위를 사용하므로
         * 진자 각도를 degree에서 radian으로 변환한다.
         */
        theta_rad = theta * (3.14159265f / 180.0f);

        /*
         * 진자의 각속도와 현재 위치를 이용해
         * Swing-up 출력 방향을 바꿀 타이밍을 판단한다.
         */
        swing_value = theta_dot * cos(theta_rad);

        /*
         * 출력 방향이 너무 자주 바뀌지 않도록,
         * 방향 전환 후 일정 시간 동안은 기존 방향을 유지한다.
         */
        if (swing_hold_count < BANG_BANG_HOLD_COUNT)
            swing_hold_count++;
        else {
            /*
             * swing_value가 충분히 크고 현재 출력 방향이 반대라면
             * 양의 방향으로 전환한다.
             */
            if (swing_value > BANG_BANG_DEADBAND &&
                swing_direction < 0.0f) {
                swing_direction = 1.0f;
                swing_hold_count = 0;
            }
            /*
             * swing_value가 충분히 작고 현재 출력 방향이 반대라면
             * 음의 방향으로 전환한다.
             */
            else if (swing_value < -BANG_BANG_DEADBAND &&
                     swing_direction > 0.0f) {
                swing_direction = -1.0f;
                swing_hold_count = 0;
            }
        }

        /*
         * Bang-bang 제어에서는 PWM 크기는 고정하고 방향만 바꾼다.
         * 따라서 출력은 +BANG_BANG_PWM 또는 -BANG_BANG_PWM이 된다.
         */
        u = BANG_BANG_PWM * swing_direction;

        /*
         * Swing-up 중에는 Balance PID의 적분값을 사용하지 않으므로
         * 적분항이 누적되지 않도록 0으로 유지한다.
         */
        theta_i = 0.0f;
        x_i = 0.0f;
    }
    else {
        // -------------------------------
        /* 4단계: Balance PID 제어 */
        // -------------------------------

        /* 현재 카트 위치와 기준 위치 사이의 오차 */
        x_error = (float)x - REF_CART_POS;

        /* 카트 위치 오차 적분 */
        x_i += x_error;

        /*
         * 카트 위치 PID 계산.
         * 현재 게인은 0으로 설정되어 있으므로 실제 영향은 없다.
         */
        cart_pid = Kp_cart * x_error
                 + Kd_cart * (x_error - x_p)
                 + Ki_cart * x_i;

        /*
         * 카트 위치 제어 결과를 진자 목표각에 반영한다.
         * 카트가 중심에서 벗어나면 진자를 약간 기울여 복귀시키는 구조이다.
         */
        theta_ref = REF_THETA_DEG + cart_pid;

        /*
         * 진자 목표각이 너무 커지지 않도록 제한한다.
         */
        if (theta_ref > THETA_REF_LIMIT)
            theta_ref = THETA_REF_LIMIT;
        else if (theta_ref < -THETA_REF_LIMIT)
            theta_ref = -THETA_REF_LIMIT;

        /*
         * 꼭대기 기준 오차에서 목표각을 반영한 최종 진자 오차를 계산한다.
         */
        theta_error = theta_error - theta_ref;

        /* 진자 각도 오차 적분 */
        theta_i += theta_error;

        /*
         * 진자 Balance PID 계산.
         * 계산 결과가 최종 제어 입력 u가 된다.
         */
        pendulum_pid = Kp_angle * theta_error
                     + Kd_angle * (theta_error - theta_p)
                     + Ki_angle * theta_i;

        u = pendulum_pid;

        /* 다음 PID 계산을 위한 이전 오차값 저장 */
        theta_p = theta_error;
        x_p = x_error;
    }

    /*
     * PWM 출력 제한.
     * 모터에 과도한 명령이 들어가지 않도록 제어 입력을 제한한다.
     */
    if (u > 48.0f)
        u_sat = 48.0f;
    else if (u < -48.0f)
        u_sat = -48.0f;
    else
        u_sat = u;

    PWMOut(u_sat);

    /*
     * 모니터링용 데이터 전송.
     * 순서: 진자 각도, 진자 각속도, 현재 모드, PWM 출력
     */
    UMAddData(theta, theta_dot, (float)mode, u_sat);
}

interrupt void ISRNMI()
{
}

interrupt void ISRextint6()
{
	volatile unsigned int tmp;

	while((tmp = *intid_fifo & 0x0F) != 1) {
		if(tmp == 0x04) {
			while(*linestatus&0x01) {
				*(compacket.wr_ptr) = *txrx_divl & 0xFF;
				SendByte(*(compacket.wr_ptr));
				if(compacket.wr_ptr == (compacket.packet+SIZE_OF_COMPACKET-1)) {
					compacket.wr_ptr = compacket.packet;
				}
				else {
					compacket.wr_ptr++;
				}
			}
		}
		else if(tmp == 0x02) {
			if(respacket.char_num-- > 0) {
				*txrx_divl = respacket.string[respacket.char_to_send++];
			}
			else {
				*inten_divh = 0x01;			
				respacket.flag = 0;
			}
		}
		else if(tmp == 0x0C) {
			while(*linestatus & 0x01) {
				*(compacket.wr_ptr) = *txrx_divl & 0xFF;
				if(compacket.wr_ptr == (compacket.packet+SIZE_OF_COMPACKET-1)) {
					compacket.wr_ptr = compacket.packet;
				}
				else {
					compacket.wr_ptr++;
				}
			}
		}
	}
}
