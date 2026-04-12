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

#define Kp 1.0f
#define Kd 16.0f
#define Ki 0.0f
#define Kff 0.013f

#define Ts (1.0f / TIMER_FRQ)

unsigned int TFlag = 0;

unsigned int traj_cnt = 0;
// -------------------------
/* 2026.03.25 (수, lab3) */
// -------------------------
float R_lab3 = 90.0f; 			// 목표 값 설정
float u_lab3;					// PID 출력
float u_sat_lab3;

// -------------------------
/* 2026.04.01 (수, lab4) */
// -------------------------
int use_tracking = 1; 			// Lab3, Lab4 구분
float ref_mon;					// Ref -> USBMonitor
float u_mon;					// U_Sat -> USBMonitor

// (a, Sref, Vmax)
float a = 12000.0f;
float Vmax = 1500.0f;
float Sref = 720.0f;

float R_lab4 = 0.0f;
float u_lab4;
float u_sat_lab4;

float target_v = 0.0f;
float t1, t2, t3;
float S1, S2;
int traj_mode;

// ---------------------------------
// Lab3, Lab4 연산 과정 내의 공통 변수
// ---------------------------------
float y; 						// 출력 값
float error;
static float s_error, p_error; 	// 누적해야하므로 static 선언
float P_term, I_term, D_term;

void InitTrajectory()
{
    traj_cnt = 0;
    R_lab4 = 0.0f;
    target_v = 0.0f;
    s_error = 0.0f;
    p_error = 0.0f;

    if (Sref > (Vmax * Vmax) / a) {
        // 1. 사다리꼴 프로파일
        traj_mode = 0;

        t1 = Vmax / a;
        t2 = Sref / Vmax;
        t3 = t2 + t1;

        S1 = 0.5f * a * t1 * t1;
        S2 = Sref - S1;
    }
    else {
        // 2. 삼각형 프로파일
        traj_mode = 1;

        t1 = sqrtf(Sref / a);
        t2 = t1;
        t3 = 2.0f * t1;

        S1 = 0.5f * a * t1 * t1;
        S2 = S1;
    }
}

interrupt void ISRtimer0()
{
	// static unsigned int cnt=0;
	// static float mmag = 0.2f;

	// float sig0, sig1, sig2, sig3;

	TFlag = 1;

	if (use_tracking) {
		float t = traj_cnt * Ts;

		if (traj_mode == 0) {
			// 1. 사다리꼴 프로파일
			if (t <= t1) {
				R_lab4 = 0.5f * a * t * t;
				target_v = a * t;
			}
			else if (t <= t2) {
				R_lab4 = S1 + Vmax * (t - t1);
				target_v = Vmax;
			}
			else if (t <= t3) {
				float td = t - t2;
				R_lab4 = S2 + Vmax * td - 0.5f * a * td * td;
				target_v = Vmax - a * td;
			}
			else {
				R_lab4 = Sref;
				target_v = 0.0f;
			}
		}
		else {
			// 2. 삼각형 프로파일
			if (t <= t1) {
				R_lab4 = 0.5f * a * t * t;
				target_v = a * t;
			}
			else if (t <= t3) {
				float td = t - t1;
				float Vpeak = a * t1;
				R_lab4 = S1 + Vpeak * td - 0.5f * a * td * td;
				target_v = Vpeak - a * td;
			}
			else {
				R_lab4 = Sref;
				target_v = 0.0f;
			}
		}

		traj_cnt++;
	}
	else {
		R_lab4 = 0.0f;
		target_v = 0.0f;
	}

	// -----------------------------
	/* 2026.04.06 (월, lab3-lab4) */
	// -----------------------------
	// 강의자료대로 추가 (주석 포함) - Lecture02 42Page
	// 1. Get Angle
	y = GetAngle();
	// 2. Compute Error
	if (use_tracking) {
		error = R_lab4 - y;
	}
	else {
		error = R_lab3 - y;
	}
	// 3. Accumulate the error to sum-of-error (s_error += error)
	s_error += error;
	// 4. Compute control input
	P_term = Kp * error;
	D_term = Kd * (error - p_error);
	I_term = Ki * s_error;
	// 5. Backup the error to p_error for next sampling and PID computation
	p_error = error;

	// Lab3: PID 단순 제어기
	u_lab3 = P_term + I_term + D_term;
	// Lab4: 위치 궤적 트래킹
	u_lab4 = P_term + I_term + D_term + Kff * target_v;
	
	// Saturation 구분 (u, u_sat)
	u_sat_lab3 = u_lab3;
	if (u_sat_lab3 > 48) u_sat_lab3 = 48;
	if (u_sat_lab3 < -48) u_sat_lab3 = -48;

	u_sat_lab4 = u_lab4;
	if (u_sat_lab4 > 48) u_sat_lab4 = 48;
	if (u_sat_lab4 < -48) u_sat_lab4 = -48;
	
	if (use_tracking) {
		PWMOut(u_sat_lab4);
		ref_mon = R_lab4;
		u_mon = u_sat_lab4;
	}	
	else {
		PWMOut(u_sat_lab3);
		ref_mon = R_lab3;
		u_mon = u_sat_lab3;
	}
	
	TINTCnt++;

	// Start of example code to use USBMonitor. You can modify or delete as required.
	/*sig0 = mmag*sinf(2.0f*3.141592f/5000.0f*cnt);
	sig1 = mmag*cosf(2.0f*3.141592f/2000.0f*cnt);
	sig2 = mmag*sinf(2.0f*3.141592f/2500.0f*cnt);
	sig3 = mmag*cosf(2.0f*3.141592f/25000.0f*cnt);

	cnt++;
	if ((cnt%5000) == 0) {
		mmag += 0.01f;
		if (mmag > 2.0f) {
			mmag = 0.2f;
		}
	}*/
	// End of example code

	UMAddData(ref_mon, target_v, error, u_mon);	// Add 4 data set to USBMon
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

