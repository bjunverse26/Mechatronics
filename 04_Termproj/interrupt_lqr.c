/* Interrupt_lqr.c */

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

// -------------------------------
/* 2026.06.11 - LQR balance */
// -------------------------------
// State vector: [cart position, cart velocity, pendulum angle, pendulum velocity]
//
// These gains must be calculated from the actual cart-pole model.
// Cart states currently use encoder count and count/s.
#define K_LQR_X				(0.0f)
#define K_LQR_X_DOT			(0.0f)
#define K_LQR_THETA			(0.0f)
#define K_LQR_THETA_DOT		(0.0f)

#define LQR_ENABLE			(0)
#define REF_CART_POS		(0.0f)
#define REF_THETA_DEG		(0.0f)
#define PWM_LIMIT			(48.0f)
#define LQR_ANGLE_LIMIT		(20.0f)
#define VELOCITY_FILTER		(0.2f)
#define DEG_TO_RAD			(0.0174532925f)

unsigned int TFlag = 0;

interrupt void ISRtimer0()
{
	// LQR state variables
	float theta;
	float theta_rad;
	float theta_dot_raw;
	static float theta_dot = 0.0f;
	static float theta_prev = 0.0f;

	float x;
	float x_dot_raw;
	static float x_dot = 0.0f;
	static float x_prev = 0.0f;

	static int initialized = 0;

	// Control input variables
	float u;
	float u_sat;

	TFlag = 1;

	TINTCnt++;

	// Read current pendulum angle and cart position
	theta = (float)GetAngle() - REF_THETA_DEG;
	x = (float)(*DC_ENC_POSCNT_R) - REF_CART_POS;

	if (!initialized) {
		theta_prev = theta;
		x_prev = x;
		initialized = 1;
	}

	// Calculate and filter state velocities
	theta_dot_raw = (theta - theta_prev) * DEG_TO_RAD * TIMER_FRQ;
	x_dot_raw = (x - x_prev) * TIMER_FRQ;

	theta_dot += VELOCITY_FILTER * (theta_dot_raw - theta_dot);
	x_dot += VELOCITY_FILTER * (x_dot_raw - x_dot);

	theta_prev = theta;
	x_prev = x;

	theta_rad = theta * DEG_TO_RAD;

	// LQR state feedback: u = -Kx
	u = -(K_LQR_X * x
		+ K_LQR_X_DOT * x_dot
		+ K_LQR_THETA * theta_rad
		+ K_LQR_THETA_DOT * theta_dot);

	// LQR is a local balance controller around the upright position.
	if ((!LQR_ENABLE) ||
		(theta > LQR_ANGLE_LIMIT) ||
		(theta < -LQR_ANGLE_LIMIT)) {
		u_sat = 0.0f;
	}
	else if (u > PWM_LIMIT) {
		u_sat = PWM_LIMIT;
	}
	else if (u < -PWM_LIMIT) {
		u_sat = -PWM_LIMIT;
	}
	else {
		u_sat = u;
	}

	PWMOut(u_sat);

	UMAddData(theta, theta_dot, x, u_sat);
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
