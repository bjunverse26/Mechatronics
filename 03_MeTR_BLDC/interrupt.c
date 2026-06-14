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

// -----------------------------
/* 2026.05.26 (화, lab4) */
// -----------------------------
#define Kp 			(1.0f)
#define Kd 			(0.0f)
#define Ki 			(0.0f)

#define GEAR_RATIO (27.0f)
#define POLE_PAIR	(2.0f)

unsigned int TFlag = 0;

interrupt void ISRtimer0()
{
	// static unsigned int cnt=0;
	// static float mmag = 0.2f;

	// float sig0, sig1, sig2, sig3;
	
	// float my_angle;
	float error;
	static float s_error = 0.0f;
	static float p_error = 0.0f;
	float P_term, I_term, D_term;
	float u;


	TFlag = 1;

	// my_angle = ((float)hall_count / (6.0f * GEAR_RATIO * POLE_PAIR)) * 360;

	// error = ref_angle - my_angle;
	error = ref_count - (float)hall_count;

	s_error += error;

	P_term = Kp * error;
	D_term = Kd * (error - p_error);
	I_term = Ki * s_error;

	p_error = error;

	u = P_term + I_term + D_term;

	if (u > 50.0f) u = 50.0f;
	if (u < -50.0f) u = -50.0f;

	duty = u;

	// Start of example code to use USBMonitor. You can modify or delete as required.
	// sig0 = mmag*sinf(2.0f*3.141592f/5000.0f*cnt);
	// sig1 = mmag*cosf(2.0f*3.141592f/2000.0f*cnt);
	// sig2 = mmag*sinf(2.0f*3.141592f/2500.0f*cnt);
	// sig3 = mmag*cosf(2.0f*3.141592f/25000.0f*cnt);

	// cnt++;
	// if ((cnt%5000) == 0) {
	// 	mmag += 0.01f;
	// 	if (mmag > 2.0f) {
	// 		mmag = 0.2f;
	// 	}
	// }
	// End of example code

	// UMAddData(ref_angle, my_angle, error, duty);	// Add 4 data set to USBMon
	UMAddData(ref_count, hall_count, error, duty);
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

