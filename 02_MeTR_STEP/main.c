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

#define DelayCnt			(1e5)	// 1s delay
#define STEP_ANGLE 			(1.8f)	// 1.8 degree


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

// -----------------------------
/* 2026.04.29 (수, lab1~lab2) */
// -----------------------------
// lab2: 1스텝 이동
const unsigned int full_step_phase[4] = {0x2, 0x8, 0x1, 0x4};

void OneStepMove(unsigned int dir, unsigned int tDelayCnt)
{
	static int idx = 0;

	if (dir == 0) {
		// A -> B -> /A -> /B
		idx++;
		if (idx >= 4) {
			idx = 0;
		}
	} else {
		// A -> /B -> /A -> B
		idx--;
		if (idx < 0) {
			idx = 3;
		}
	}
	//*STEP_PHASE_R = full_step_phase[idx];
	*STEP_PHASE_L = full_step_phase[idx];
	WaitTFlagCnt(tDelayCnt);
}	

// lab2: 고정 속도를 통한 동작
void StepMoveCV(float angle, float spd)
{
	unsigned int dir;
	unsigned int step_num;
	float step_delay;
	
	unsigned int tDelayCnt;
	int k;

	// 1. 방향 결정
	if (angle >= 0.0f) {
		dir = 0;
	} else {
		dir = 1;
		angle = -angle;
	}

	// 2. Step Num
	step_num = (unsigned int)(angle / STEP_ANGLE + 0.5f);

	// 3. Step Delay
	step_delay = (float)(STEP_ANGLE / spd);

	// 4. DelayCnt
	tDelayCnt = (unsigned int)(step_delay * TIMER_FRQ);
	
	// 5. OneStepMove 호출
	for (k = 0; k < step_num; k++) {
		OneStepMove(dir, tDelayCnt);
	}
}

// -----------------------------
/* 2026.05.04 (월, lab3) */
// -----------------------------
#define PROFILE_MAX    	    (200)

unsigned int vel_profile[PROFILE_MAX];	// 속도 프로파일 (step마다 delay 값 저장)

float mon_angle = 0.0f;
float mon_vel = 0.0f;

// lab3: 가속 구간 array/step 계산
unsigned int MakeVelProfile(float maxVel, float accel)
{
	float accel_angle;
	unsigned int accel_step;
	unsigned int tDelayCnt;
	float tDelaySec;

	int k;
	
	// 1. 가속 구간 이동 각도 계산
	accel_angle = (maxVel * maxVel) / (2.0f * accel);

	// 2. 각도를 step 수로 변환
	accel_step = (unsigned int)(accel_angle / STEP_ANGLE + 0.5f);
	MACRO_PRINT((tmp_string, "accel_step=%3u\r\n", accel_step));

	// 3. 각 step마다 delay 계산
	for (k = 1; k <= accel_step; k++) {

		tDelaySec = sqrtf(STEP_ANGLE / (2.0f * accel * (float)k));

		tDelayCnt = (unsigned int)(tDelaySec * TIMER_FRQ + 0.5f);


		vel_profile[k - 1] = tDelayCnt;
	}
	return accel_step;
}

// lab3: 속도 프로파일을 통한 동작
void StepMoveVP(float angle, float maxVel, float accel)
{
	unsigned int dir;
	unsigned int total_step;
	unsigned int accel_step;

	unsigned int idx;
	unsigned int tDelayCnt;
	int i;
	
	// 1. 방향 결정
	if (angle >= 0.0f) {
		dir = 0;
	} else {
		dir = 1;
		angle = -angle;		// 절댓값으로 변환
	}

	// 2. 속도, 가속도 음수 방지
	if (maxVel < 0.0f) maxVel = -maxVel;
	if (accel < 0.0f) accel = -accel;

	// 3. 전체 이동 step 수 계산
	total_step = (unsigned int)(angle / STEP_ANGLE + 0.5f);
	MACRO_PRINT((tmp_string, "total_step=%3u\r\n", total_step));

	// 4. 속도 프로파일 생성
	accel_step = MakeVelProfile(maxVel, accel);

	// 5. 이동 거리가 짧으면 삼각형 프로파일
	if ((2 * accel_step) > total_step) {
		accel_step = total_step / 2;
	}

	// 6. 전체 step 수행
	for (i = 0; i < total_step; i++) {
		if (i < accel_step) {
			idx = i;							// 가속
		} else if (i >= (total_step - accel_step)) {
			idx = total_step - i - 1;			// 감속
		} else {
			idx = accel_step - 1;				// 등속
		}

		tDelayCnt = vel_profile[idx];

		// 추가: USBMonitor 확인용 (mon_anlge, mon_vel)
		if (dir == 0) {
			mon_angle += STEP_ANGLE;
			mon_vel = STEP_ANGLE * TIMER_FRQ / (float)tDelayCnt;
		} else {
			mon_angle -= STEP_ANGLE;
			mon_vel = -STEP_ANGLE * TIMER_FRQ / (float)tDelayCnt;
		}
		OneStepMove(dir, tDelayCnt);
	}
}

#define ANGLE				(360.0f) 
#define SPEED				(5000.0f)
#define ACCEL				(120000.0f)

void main()
{
	int i = 0;

	InitEXINTF();	// Asynchronous Bus Initialization
	InitTimer();	// Timer Initialization
	InitUART();		// UART Initialization
	InitINT();		// Interrupt Enable(External INT and Timer INT)
	InitUSBMon();	// USB Monitor Initialization

	MACRO_PRINT((tmp_string, "\r\n\r\n"));
	MACRO_PRINT((tmp_string, "Mechatronics Course %d\r\n", 2026));
	MACRO_PRINT((tmp_string, "FPGA Ver%2x.%02x\r\n", ((*FPGAVER>>8) & 0xFF), (*FPGAVER & 0xFF)));

	TFlag = 0;

	*FPGALED = 1;			// FPGA LED 1 : ON, 0 : OFF

	GIE();

	WaitTFlagCnt(100);
	
	while (0) {
		*STEP_PHASE_R = 0x2;		// A
		WaitTFlagCnt(10000);

		*STEP_PHASE_R = 0x8;		// B
		WaitTFlagCnt(10000);

		*STEP_PHASE_R = 0x1;		// /A
		WaitTFlagCnt(10000);

		*STEP_PHASE_R = 0x4;		// /B
		WaitTFlagCnt(10000);

		MACRO_PRINT((tmp_string, "%d\r\n", i++));
		*FPGALED = ~*FPGALED;
	}

	// -----------------------------
	/* 2026.04.29 (수, lab1~lab2) */
	// -----------------------------
	// lab1: Final Implement
	while (0) {
		*STEP_PHASE_L = 0x2;		// A
		WaitTFlagCnt(DelayCnt);
		i++;
		//*STEP_PHASE_L = 0xA;		// A + B
		//WaitTFlagCnt(DelayCnt);

		*STEP_PHASE_L = 0x8;		// B
		WaitTFlagCnt(DelayCnt);
		i++;
		//*STEP_PHASE_L = 0x9;		// /A + B
		//WaitTFlagCnt(DelayCnt);

		*STEP_PHASE_L = 0x1;		// /A
		WaitTFlagCnt(DelayCnt);
		i++;
		//*STEP_PHASE_L = 0x5;		// /A + /B
		//WaitTFlagCnt(DelayCnt);

		*STEP_PHASE_L = 0x4;		// /B
		WaitTFlagCnt(DelayCnt);
		i++;
		//*STEP_PHASE_L = 0x6;		// A + /B
		//WaitTFlagCnt(DelayCnt);

		MACRO_PRINT((tmp_string, "%d\r\n", i));
		*FPGALED = ~*FPGALED;
	}

	// lab2 OneStepMove Debug
	// while (0) {
	// 	OneStepMove(1, DelayCnt);
	// }
	
	// lab2: Final Implement
	while (0) {
		StepMoveCV(ANGLE, SPEED);
		WaitTFlagCnt(DelayCnt);
	}

	// lab3: Final Implement	
	//for (i = 0; i < 2; i++) {
	//	StepMoveVP(10 * ANGLE, 0.8 * SPEED, 0.8 * ACCEL);
	//	WaitTFlagCnt(DelayCnt);
	//}

	// Test 1
	while (1) {
		StepMoveVP(5 * ANGLE, 0.8 * SPEED, 0.8 * ACCEL);
		WaitTFlagCnt(DelayCnt);
	}

	// Test 2
	while (0) {
		StepMoveVP(120, 0.8 * SPEED, 0.8 * ACCEL);
		WaitTFlagCnt(DelayCnt);
	}
}