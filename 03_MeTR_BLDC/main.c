/* Main.c */

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
#include "USBMon.h"

void InitEXINTF()
{
	// Disable SSCEN(bit#5), CLK1EN(bit#4), CLK2EN(bit#3)
	*GBLCTL &= 0xFFFFFFC7;

	// IOCS0: Async 32bit Mode, Setup 0 and Strobe 3, Hold 1  
	*CECTL0 = 	(0x00 << 28)	|	// (4-bit) WriteSetup[31:28]
				(0x03 << 22)	|	// (6-bit) WriteStrobe[27:22]
				(0x01 << 20)	|	// (2-bit) WriteHold[21:20]
				(0x00 << 16)	|	// (4-bit) ReadSetup[19:16]
				(0x00 << 14)	|	// (2-bit) Rsvd[15:14]
				(0x03 <<  8)	|	// (6-bit) ReadStrobe[13:8]
				(0x00 <<  7)	|	// (1-bit) Rsvd[7]
				(0x02 <<  4)	|	// (3-bit) MType[6:4]
				(0x00 <<  2)	|	// (2-bit) Rsvd[3:2]
				(0x01 <<  0)	;	// (2-bit) ReadHold[1:0]

	// IOCS2: Async 32bit Mode, Setup 2 and Strobe 5, Hold 1
	*CECTL2 =	(0x02 << 28)	|	// (4-bit) WriteSetup[31:28]
				(0x08 << 22)	|	// (6-bit) WriteStrobe[27:22]
				(0x01 << 20)	|	// (2-bit) WriteHold[21:20]
				(0x02 << 16)	|	// (4-bit) ReadSetup[19:16]
				(0x00 << 14)	|	// (2-bit) Rsvd[15:14]
				(0x08 <<  8)	|	// (6-bit) ReadStrobe[13:8]
				(0x00 <<  7)	|	// (1-bit) Rsvd[7]
				(0x02 <<  4)	|	// (3-bit) MType[6:4]
				(0x00 <<  2)	|	// (2-bit) Rsvd[3:2]
				(0x01 <<  0)	;	// (2-bit) ReadHold[1:0]
}

void InitTimer()
{
	// Hold 0 and Go 0, Internal Clock Source (160Mhz/4), Clock Mode   
	*T0CTL |= 0x00000300;

	// Timer Period
	*T0PRD = (CPU_FRQ/4.0f)/(2.0f*TIMER_FRQ);	// f = 40Mhz/2*Period 

	// Hold 1 and Go 1   
	*T0CTL |= 0x000000C0;
}

void InitINT()
{
	// Enable CPU Interrupt INT06(EXTINT6), INT14(TINT0) and NMI
	IER |= 0x00004042;
}

void GIE()
{
	// Global Interrupt Enable
	CSR |= 0x00000001;
}

// Caution: The delayed time is not exact.
void delay_us(unsigned int time_us)
{
	register unsigned int i;

	for (i = 0; i < (time_us * 14); i++) ;
}

// Caution: The delayed time is not exact.
void delay_ms(unsigned int time_ms)
{
	register unsigned int i;

	for (i = 0; i < time_ms; i++) {
		delay_us(1000);
	}
}

// Wait until timer interrupt
void WaitTFlag()
{
	while (!TFlag) ;
	TFlag = 0;
}

// Waiting time = (Timer Period) * cnt
void WaitTFlagCnt(unsigned int cnt)
{
	unsigned int i;

	TFlag = 0;

	for (i=0; i<cnt; i++) {
		WaitTFlag();
	}
}

#define DEF_LOW		0x400
#define DEF_HIZ		0x800
#define DEF_HIGH	0xC00

#define DelayCnt    1000
#define DEF_DUTY	-40

int hall_count = 0;
float ref_angle = 360.0f;
float ref_count = 324.0f;
float duty = 0.0f;

void BLDCDrive(float duty) {
	unsigned int hall;
	int duty_output;
	int HIGH;
	int LOW;

	static int prev_hall = 0;

	hall = (*BLDC_HALLST) & 0x07;

	if (duty > 50.0f) duty = 50.0f;
	if (duty < -50.0f) duty = -50.0f;

	duty_output = (int)(duty * 4095.0f / 100.0f);

	HIGH = DEF_HIZ + duty_output;
	LOW  = DEF_HIZ - duty_output;

	if (hall == 2) {
		*BLDC_PWM2 = DEF_HIZ;
		*BLDC_PWM1 = LOW;
		*BLDC_PWM0 = HIGH;
	} else if (hall == 3) {
		*BLDC_PWM2 = HIGH;
		*BLDC_PWM1 = LOW;
		*BLDC_PWM0 = DEF_HIZ;
	} else if (hall == 1) {
		*BLDC_PWM2 = HIGH;
		*BLDC_PWM1 = DEF_HIZ;
		*BLDC_PWM0 = LOW;
	} else if (hall == 5) {
		*BLDC_PWM2 = DEF_HIZ;
		*BLDC_PWM1 = HIGH;
		*BLDC_PWM0 = LOW;
	} else if (hall == 4) {
		*BLDC_PWM2 = LOW;
		*BLDC_PWM1 = HIGH;
		*BLDC_PWM0 = DEF_HIZ;
	} else {	// hall == 6
		*BLDC_PWM2 = LOW;
		*BLDC_PWM1 = DEF_HIZ;
		*BLDC_PWM0 = HIGH;
	}

	if (prev_hall == 0) {
		prev_hall = hall;
		return;
	}

	if (hall != prev_hall) {
		if ((hall == 2) && (prev_hall == 6)) hall_count++;
		else if ((hall == 3) && (prev_hall == 2)) hall_count++;
		else if ((hall == 1) && (prev_hall == 3)) hall_count++;
		else if ((hall == 5) && (prev_hall == 1)) hall_count++;
		else if ((hall == 4) && (prev_hall == 5)) hall_count++;
		else if ((hall == 6) && (prev_hall == 4)) hall_count++;

		else if ((hall == 6) && (prev_hall == 2)) hall_count--;
		else if ((hall == 2) && (prev_hall == 3)) hall_count--;
		else if ((hall == 3) && (prev_hall == 1)) hall_count--;
		else if ((hall == 1) && (prev_hall == 5)) hall_count--;
		else if ((hall == 5) && (prev_hall == 4)) hall_count--;
		else if ((hall == 4) && (prev_hall == 6)) hall_count--;

		prev_hall = hall;
	}
}

void main()
{
	unsigned int hall;
	
	int duty_output;
	int duty_input;
	int HIGH;
	int LOW;

	// hall = (*BLDC_HALLST) & 0x07;

	// Lab3: Test
	duty_input = DEF_DUTY;

	if (duty_input > 50) duty_input = 50;
	if (duty_input < -50) duty_input = -50;

	duty_output = (int)((duty_input * 4095.0f / 100.0f) + 0.5f);

	HIGH = DEF_HIZ + duty_output;
	LOW = DEF_HIZ - duty_output;
	
	InitEXINTF();	// Asynchronous Bus Initialization
	InitTimer();	// Timer Initialization
	InitUART();		// UART Initialization
	InitINT();		// Interrupt Enable(External INT and Timer INT)
	InitUSBMon();	// USB Monitor Initialization

	MACRO_PRINT((tmp_string, "\r\n\r\n"));
	MACRO_PRINT((tmp_string, "Mechatronics Course %d\r\n", 2026));
	MACRO_PRINT((tmp_string, "FPGA Ver. %2x.%02x\r\n", ((*FPGAVER>>8) & 0xFF), (*FPGAVER & 0xFF)));

	TFlag = 0;

	*BLDC_DRV_EN = 1;	// BLDC Motor Driver Enable

	GIE();

	WaitTFlagCnt(100);

	// -----------------------------
	/* 2026.05.13 (수, lab1~lab2) */
	// -----------------------------
	// Lab1: Operation Check
	while (0) {
		*BLDC_PWM2 = DEF_LOW;
		*BLDC_PWM1 = DEF_HIZ;
		*BLDC_PWM0 = DEF_HIGH;
		WaitTFlagCnt(DelayCnt);

		*BLDC_PWM2 = DEF_HIZ;
		*BLDC_PWM1 = DEF_LOW;
		*BLDC_PWM0 = DEF_HIGH;
		WaitTFlagCnt(DelayCnt);

		*BLDC_PWM2 = DEF_HIGH;
		*BLDC_PWM1 = DEF_LOW;
		*BLDC_PWM0 = DEF_HIZ;
		WaitTFlagCnt(DelayCnt);

		*BLDC_PWM2 = DEF_HIGH;
		*BLDC_PWM1 = DEF_HIZ;
		*BLDC_PWM0 = DEF_LOW;
		WaitTFlagCnt(DelayCnt);

		*BLDC_PWM2 = DEF_HIZ;
		*BLDC_PWM1 = DEF_HIGH;
		*BLDC_PWM0 = DEF_LOW;
		WaitTFlagCnt(DelayCnt);

		*BLDC_PWM2 = DEF_LOW;
		*BLDC_PWM1 = DEF_HIGH;
		*BLDC_PWM0 = DEF_HIZ;
		WaitTFlagCnt(DelayCnt);
	}

	// Lab2: BLDC Hall Sensor Read
	// *BLDC_PWM2 = DEF_LOW;
	// *BLDC_PWM1 = DEF_HIGH;
	// *BLDC_PWM0 = DEF_HIGH;
	// WaitTFlagCnt(DelayCnt);
	// hall = (*BLDC_HALLST) & 0x07;
	// MACRO_PRINT((tmp_string, "Hall value %u\r\n", hall));
	// WaitTFlagCnt(DelayCnt);
	// *BLDC_PWM2 = DEF_LOW;
	// *BLDC_PWM1 = DEF_LOW;
	// *BLDC_PWM0 = DEF_HIGH;
	// WaitTFlagCnt(DelayCnt);
	// hall = (*BLDC_HALLST) & 0x07;
	// MACRO_PRINT((tmp_string, "Hall value %u\r\n", hall));
	// WaitTFlagCnt(DelayCnt);
	// *BLDC_PWM2 = DEF_HIGH;
	// *BLDC_PWM1 = DEF_LOW;
	// *BLDC_PWM0 = DEF_HIGH;
	// WaitTFlagCnt(DelayCnt);
	// hall = (*BLDC_HALLST) & 0x07;
	// MACRO_PRINT((tmp_string, "Hall value %u\r\n", hall));
	// WaitTFlagCnt(DelayCnt);
	// *BLDC_PWM2 = DEF_HIGH;
	// *BLDC_PWM1 = DEF_LOW;
	// *BLDC_PWM0 = DEF_LOW;
	// WaitTFlagCnt(DelayCnt);
	// hall = (*BLDC_HALLST) & 0x07;
	// MACRO_PRINT((tmp_string, "Hall value %u\r\n", hall));
	// WaitTFlagCnt(DelayCnt);
	// *BLDC_PWM2 = DEF_HIGH;
	// *BLDC_PWM1 = DEF_HIGH;
	// *BLDC_PWM0 = DEF_LOW;
	// WaitTFlagCnt(DelayCnt);
	// hall = (*BLDC_HALLST) & 0x07;
	// MACRO_PRINT((tmp_string, "Hall value %u\r\n", hall));
	// WaitTFlagCnt(DelayCnt);
	// *BLDC_PWM2 = DEF_LOW;
	// *BLDC_PWM1 = DEF_HIGH;
	// *BLDC_PWM0 = DEF_LOW;
	// WaitTFlagCnt(DelayCnt);
	// hall = (*BLDC_HALLST) & 0x07;
	// MACRO_PRINT((tmp_string, "Hall value %u\r\n", hall));
	// WaitTFlagCnt(DelayCnt);

	// -----------------------------
	/* 2026.05.20 (수, lab3) */
	// -----------------------------
	
	// Lab3: Test
	while(0) {
		hall = (*BLDC_HALLST) & 0x07;

		if (hall == 2) {
			*BLDC_PWM2 = DEF_HIZ;
			*BLDC_PWM1 = LOW;
			*BLDC_PWM0 = HIGH;
		} else if (hall == 3) {
			*BLDC_PWM2 = HIGH;
			*BLDC_PWM1 = LOW;
			*BLDC_PWM0 = DEF_HIZ;
		} else if (hall == 1) {
			*BLDC_PWM2 = HIGH;
			*BLDC_PWM1 = DEF_HIZ;
			*BLDC_PWM0 = LOW;
		} else if (hall == 5) {
			*BLDC_PWM2 = DEF_HIZ;
			*BLDC_PWM1 = HIGH;
			*BLDC_PWM0 = LOW;
		} else if (hall == 4) {
			*BLDC_PWM2 = LOW;
			*BLDC_PWM1 = HIGH;
			*BLDC_PWM0 = DEF_HIZ;
		} else if (hall == 6) {
			*BLDC_PWM2 = LOW;
			*BLDC_PWM1 = DEF_HIZ;
			*BLDC_PWM0 = HIGH;
		}
	}

	// Lab3: Final Implement
	while (0) {
		BLDCDrive(DEF_DUTY);
	}

	// -----------------------------
	/* 2026.05.26 (화, lab4) */
	// -----------------------------
	while (1) {
		BLDCDrive(duty);
	}
}

