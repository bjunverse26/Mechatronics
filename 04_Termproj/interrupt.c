/* Interrupt.c */

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

// 밸런싱 제어 -> 진자 & 카트 PID 튜닝
#define Kp_angle               (25.0f)
#define Kd_angle               (0.9f)
#define Ki_angle               (0.0f)

#define Kp_cart                (0.0005f)
#define Kd_cart                (0.0f)
#define Ki_cart                (0.0f)

#define REF_THETA_DEG          (0.0f)
#define REF_CART_POS           (0.0f)

// 스윙업 제어 -> 고정 PWM & 경계 각도
#define PI					   (3.14159265f)
#define BALANCE_START_ANGLE    (15.0f)

// 모드 정의
#define MODE_SWINGUP           (0)
#define MODE_BALANCE           (1)

#define SWING_PUMP     		   (0)
#define SWING_COAST    		   (1)

unsigned int TFlag = 0;

interrupt void ISRtimer0()
{
	float theta;              // 진자 현재 각도
	float theta_error;        // 진자 각도 오차
	float theta_ref;          // 목표 진자각
	float theta_rad;          // 진자 각도 -> rad
	
	float theta_dot;          
	static float theta_speed = 0.0f;    // 필터링된 진자 각속도
	static float theta_angle_p = 0.0f;  // 이전 샘플의 진자 각도
	
	static int angle_initialized = 0;   // 각속도 계산 초기화 플래그

	float x;                  
	float x_error;	// 카트 위치 오차
	static float x_p = 0.0f; 
	static float x_i = 0.0f;  

	static float theta_p = 0.0f;  
	static float theta_i = 0.0f;  

	// 진자 밸런싱 PID 출력
	float pendulum_pid;  
	// 카트 위치 PID 출력     
	float cart_pid;       
	
	float u;                 
	float u_sat;          

	float swing_value = 0.0f;           // 스윙 방향 판단값
	static float swing_direction = 1.0f; // 스윙업 PWM 방향

	static int swing_hold_cnt = 0;       // 스윙 방향 유지 카운터
	float abs_theta_error;              // 꼭대기 기준 각도 오차 절댓값
	float swing_pwm;                    // 스윙업 PWM 크기

	static int mode = MODE_SWINGUP;      // 현재 제어 모드
	static int swing_state = SWING_PUMP; // 스윙업 세부 상태

	TFlag = 1;
	TINTCnt++;

	// 센서값 읽기
	theta = (float)GetAngle();
	x = (int)(*DC_ENC_POSCNT_R);

	// 진자 각속도 계산 및 저역통과 필터 적용
	if (!angle_initialized) {
		theta_angle_p = theta;
		angle_initialized = 1;
	} else {
		theta_dot = theta - theta_angle_p;
		theta_dot = theta_dot * TIMER_FRQ;

		theta_speed = 0.8f * theta_speed + 0.2f * theta_dot;
		theta_angle_p = theta;
	}   

	// 진자 각도를 꼭대기 기준 오차로 변환
	if (theta >= 0.0f) theta_error = theta - 180.0f;
	else 			   theta_error = theta + 180.0f;

	x_error = x - REF_CART_POS;
	u = 0.0f;

	// 꼭대기 근처 진입 시 밸런싱 모드로 전환
	if (mode == MODE_SWINGUP) {
		if (fabsf(theta_error) < BALANCE_START_ANGLE) {
			mode = MODE_BALANCE;

			theta_p = theta_error;
			theta_i = 0.0f;

			x_p = x_error;
			x_i = 0.0f;
		}
	}

	if (mode == MODE_SWINGUP) {
		// 스윙업 제어
		theta_rad = theta * (PI / 180.0f);
		swing_value = theta_speed * cos(theta_rad);

		abs_theta_error = fabsf(theta_error);
		
		// 꼭대기 근처에서는 PWM을 낮춰 접근
		if (swing_state == SWING_PUMP) {
			if (abs_theta_error < 40.0f) {
				swing_state = SWING_COAST;
				swing_hold_cnt = 0;
			}
		}
		
		if (swing_state == SWING_PUMP) {
			swing_pwm = 30;

			if (swing_hold_cnt < 90) {
				swing_hold_cnt++;
			} else {
				if (swing_value > 0) swing_direction = 1.0f;
				else 				 swing_direction = -1.0f;

				swing_hold_cnt = 0;
			}
		} else {
			swing_pwm = 25;

			if (swing_value > 0) swing_direction = 1.0f;
			else 				 swing_direction = -1.0f;
		}
		
		u = swing_pwm * swing_direction;
	} else {
		// 밸런싱 제어
		x_i += x_error;

		cart_pid = Kp_cart * x_error
				 + Kd_cart * (x_error - x_p)
				 + Ki_cart * x_i;

		theta_ref = REF_THETA_DEG + cart_pid;

		theta_error -= theta_ref;
		theta_i += theta_error;

		pendulum_pid = Kp_angle * theta_error
					 + Kd_angle * (theta_error - theta_p)
					 + Ki_angle * theta_i;

		u = pendulum_pid;

		theta_p = theta_error;
		x_p = x_error;
	}

	// PWM 출력 제한
	if (u > 48.0f) 		 u_sat = 48.0f;
	else if (u < -48.0f) u_sat = -48.0f;
	else				 u_sat = u;

	PWMOut(u_sat);

	UMAddData(theta, x_error, theta_error, u_sat);
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
