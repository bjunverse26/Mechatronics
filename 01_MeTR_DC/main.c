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

unsigned int TINTCnt;
unsigned int timerCheckCnt; // lab3 디버깅 체크

// -----------------------------
/* 2026.03.18 (수, lab1~lab2) */
// -----------------------------
// lab1
void PWMOut(float duty_input) {
	int duty_output;
	duty_output = 0;
	if (duty_input > 48) duty_input = 48;
	if (duty_input < -48) duty_input = -48;

	duty_output = (int)(((duty_input + 50.0f) * 4095.0f / 100.0f) + 0.5f);
	*DC_PWM_R = duty_output;
}

// lab2
float GetAngle() {
    float Angle;
    int count = (int)*DC_ENC_POSCNT_R;
    
    Angle = (float)count * (360.0f / 3840.0f);
    return Angle;
}
	

void main()
{
	unsigned int encr;
	float Angle;

	InitEXINTF();	// Asynchronous Bus Initialization
	InitTimer();	// Timer Initialization
	InitUART();		// UART Initialization
	InitINT();		// Interrupt Enable(External INT and Timer INT)
	InitUSBMon();	// USB Monitor Initialization

	MACRO_PRINT((tmp_string, "\r\n\r\n"));
	MACRO_PRINT((tmp_string, "Mechatronics Course Hello World %d\r\n", 2026));
	MACRO_PRINT((tmp_string, "FPGA Ver%2x.%02x\r\n", ((*FPGAVER>>8) & 0xFF), (*FPGAVER & 0xFF)));

	TFlag = 0;
	TINTCnt = 0;

	*FPGALED = 1;			// FPGA LED 1 : ON, 0 : OFF

	*DC_ENCCNT_MODE = 0;	// 0: 1X, 1 or 2: 2X, 3: 4X
	*DC_ENCCNT_CLR = 0;		// Encoder Counter Clear
	*DC_PWM_R = 0x800;		// PWM : 0x000 ~ 0x800 ~ 0xFFF

	*DC_DRV_EN = 1;			// PWMENABLE 1 : ON, 0 : 0FF

	// lab4
	InitTrajectory();

	GIE();

	WaitTFlagCnt(100);

	// EXP 1. Change the value and check motor rotation
	// *DC_PWM_R = 0x800;
	
	// lab1
	while (0) {
		PWMOut(0);
	}
	

	// EXP 2. Disable PWMDRVEN. Then, rotate the motor by hand, and check the displayed encoder count value
	*DC_DRV_EN = 1;			// PWMENABLE 1 : ON, 0 : 0FF

	// lab2
	while (0) {
		Angle = GetAngle();
		encr = *DC_ENC_POSCNT_R;
		MACRO_PRINT((tmp_string, "[%8d] Angle value : %8.2f, ENCPOSR value: 0x%08x(%10d)\r\n", TINTCnt, Angle, encr));
		WaitTFlagCnt(500);
	}
	
	// ------------------------
	/* 2026.03.25 (수, lab3) */
	// ------------------------
	// lab3 (For debugging, 주기 : 0.5s)
	timerCheckCnt = 0;
	
	while (1) {
		if (TINTCnt >= 500) {
			TINTCnt = 0;
			MACRO_PRINT((tmp_string, "Timer Check: %d %6.2f \r\n", timerCheckCnt++, GetAngle()));
		}
	}
}

