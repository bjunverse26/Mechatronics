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


/************************************************************
 * 실습 선택
 *
 * LAB_SELECT = 1 : 실습 1 - Full Step / Half Step 직접 구동
 * LAB_SELECT = 2 : 실습 2 - OneStepMove(), StepMoveCV()
 * LAB_SELECT = 3 : 실습 3 - StepMoveVP(), 속도 프로파일 적용
 ************************************************************/
#define LAB_SELECT          2

/************************************************************
 * 실습 1 설정
 *
 * LAB1_HALF_STEP = 0 : Full Step 구동
 * LAB1_HALF_STEP = 1 : Half Step 구동
 *
 * LAB1_DELAY_CNT 값 변경으로 모터 속도 조절
 * WaitTFlagCnt(1) = 10 us
 * WaitTFlagCnt(10000) = 0.1 s
 ************************************************************/
#define LAB1_HALF_STEP      0
#define LAB1_DELAY_CNT      10000


/************************************************************
 * 공통 설정
 ************************************************************/
#define STEP_ANGLE          1.8f
#define MAX_PROFILE_SIZE    200

/************************************************************
 * Full Step phase sequence
 * STPPHA[3:0] = {B, /B, A, /A}
 *
 * 0x2 : A
 * 0x8 : B
 * 0x1 : /A
 * 0x4 : /B
 ************************************************************/
const unsigned int full_step_phase[4] = {
	0x2, 0x8, 0x1, 0x4
};

/************************************************************
 * Half Step phase sequence
 *
 * A -> A+B -> B -> B+/A -> /A -> /A+/B -> /B -> /B+A
 ************************************************************/
const unsigned int half_step_phase[8] = {
	0x2, 0xA, 0x8, 0x9, 0x1, 0x5, 0x4, 0x6
};

/************************************************************
 * 실습 3에서 사용할 속도 프로파일 테이블
 ************************************************************/
unsigned int VelProfile[MAX_PROFILE_SIZE];


/************************************************************
 * 기존 초기화 함수들
 ************************************************************/
void InitEXINTF()
{
	// Disable SSCEN(bit#5), CLK1EN(bit#4), CLK2EN(bit#3)
	*GBLCTL &= 0xFFFFFFC7;

	// IOCS0: Async 32bit Mode, Setup 0 and Strobe 3, Hold 1
	*CECTL0 = 	(0x00 << 28)	|
				(0x03 << 22)	|
				(0x01 << 20)	|
				(0x00 << 16)	|
				(0x00 << 14)	|
				(0x03 <<  8)	|
				(0x00 <<  7)	|
				(0x02 <<  4)	|
				(0x00 <<  2)	|
				(0x01 <<  0)	;

	// IOCS2: Async 32bit Mode, Setup 2 and Strobe 5, Hold 1
	*CECTL2 =	(0x02 << 28)	|
				(0x08 << 22)	|
				(0x01 << 20)	|
				(0x02 << 16)	|
				(0x00 << 14)	|
				(0x08 <<  8)	|
				(0x00 <<  7)	|
				(0x02 <<  4)	|
				(0x00 <<  2)	|
				(0x01 <<  0)	;
}

void InitTimer()
{
	// Hold 0 and Go 0, Internal Clock Source (160Mhz/4), Clock Mode
	*T0CTL |= 0x00000300;

	// Timer Period
	*T0PRD = (CPU_FRQ/4.0f)/(2.0f*TIMER_FRQ);

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

	for (i = 0; i < cnt; i++) {
		WaitTFlag();
	}
}


/************************************************************
 * 실습 1 함수
 *
 * Full Step 또는 Half Step을 직접 반복 출력한다.
 ************************************************************/
void Lab1_FullStep(unsigned int delayCnt)
{
	*STEP_PHASE_L = 0x2;		// A
	WaitTFlagCnt(delayCnt);

	*STEP_PHASE_L = 0x8;		// B
	WaitTFlagCnt(delayCnt);

	*STEP_PHASE_L = 0x1;		// /A
	WaitTFlagCnt(delayCnt);

	*STEP_PHASE_L = 0x4;		// /B
	WaitTFlagCnt(delayCnt);
}

void Lab1_HalfStep(unsigned int delayCnt)
{
	*STEP_PHASE_L = 0x2;		// A
	WaitTFlagCnt(delayCnt);

	*STEP_PHASE_L = 0xA;		// A + B
	WaitTFlagCnt(delayCnt);

	*STEP_PHASE_L = 0x8;		// B
	WaitTFlagCnt(delayCnt);

	*STEP_PHASE_L = 0x9;		// B + /A
	WaitTFlagCnt(delayCnt);

	*STEP_PHASE_L = 0x1;		// /A
	WaitTFlagCnt(delayCnt);

	*STEP_PHASE_L = 0x5;		// /A + /B
	WaitTFlagCnt(delayCnt);

	*STEP_PHASE_L = 0x4;		// /B
	WaitTFlagCnt(delayCnt);

	*STEP_PHASE_L = 0x6;		// /B + A
	WaitTFlagCnt(delayCnt);
}


/************************************************************
 * 실습 2 함수
 *
 * OneStepMove()
 * - dir = 0 : 정방향
 * - dir = 1 : 역방향
 *
 * StepMoveCV()
 * - angle : 회전 각도 [deg]
 * - spd   : 회전 속도 [deg/s]
 ************************************************************/
void OneStepMove(unsigned int dir, unsigned int tDelayCnt)
{
	static int phase_idx = 0;

	if (dir == 0) {
		// 정방향: A -> B -> /A -> /B
		phase_idx++;
		if (phase_idx >= 4) {
			phase_idx = 0;
		}
	}
	else {
		// 역방향: A -> /B -> /A -> B
		phase_idx--;
		if (phase_idx < 0) {
			phase_idx = 3;
		}
	}

	*STEP_PHASE_L = full_step_phase[phase_idx];
	WaitTFlagCnt(tDelayCnt);
}

void StepMoveCV(float angle, float spd)
{
	unsigned int dir;
	unsigned int step_num;
	unsigned int tDelayCnt;
	unsigned int k;

	// 속도가 0이면 구동 불가
	if (spd == 0.0f) {
		return;
	}

	// angle 부호로 방향 결정
	if (angle >= 0.0f) {
		dir = 0;
	}
	else {
		dir = 1;
		angle = -angle;
	}

	// spd는 절대값 사용
	if (spd < 0.0f) {
		spd = -spd;
	}

	// 회전 각도 -> step 수
	step_num = (unsigned int)(angle / STEP_ANGLE + 0.5f);

	// 속도 -> timer interrupt count
	// tDelayCnt = step delay time * TIMER_FRQ
	//           = (STEP_ANGLE / spd) * TIMER_FRQ
	tDelayCnt = (unsigned int)((STEP_ANGLE / spd) * TIMER_FRQ);

	if (tDelayCnt < 1) {
		tDelayCnt = 1;
	}

	for (k = 0; k < step_num; k++) {
		OneStepMove(dir, tDelayCnt);
	}
}


/************************************************************
 * 실습 3 함수
 *
 * MakeVelProfile()
 * - maxVel : 최대 속도 [deg/s]
 * - accel  : 각가속도 [deg/s^2]
 * - 가속 구간의 step별 delay count를 VelProfile[]에 저장
 *
 * StepMoveVP()
 * - 사다리꼴 속도 프로파일 적용
 ************************************************************/
unsigned int MakeVelProfile(float maxVel, float accel)
{
	unsigned int k;
	unsigned int accelStep;
	float angle_accel;
	float vel;
	float delay_time;

	if (maxVel < 0.0f) {
		maxVel = -maxVel;
	}

	if (accel < 0.0f) {
		accel = -accel;
	}

	if (maxVel == 0.0f || accel == 0.0f) {
		VelProfile[0] = 10000;
		return 1;
	}

	// 가속 구간 이동 각도 = v^2 / (2a)
	angle_accel = (maxVel * maxVel) / (2.0f * accel);

	// 가속 구간 step 수
	accelStep = (unsigned int)(angle_accel / STEP_ANGLE + 0.5f);

	if (accelStep < 1) {
		accelStep = 1;
	}

	if (accelStep > MAX_PROFILE_SIZE) {
		accelStep = MAX_PROFILE_SIZE;
	}

	MACRO_PRINT((tmp_string, "\r\nVelocity Profile\r\n"));

	for (k = 1; k <= accelStep; k++) {
		// v = sqrt(2as)
		// s = STEP_ANGLE * k
		vel = sqrtf(2.0f * accel * STEP_ANGLE * k);

		if (vel > maxVel) {
			vel = maxVel;
		}

		delay_time = STEP_ANGLE / vel;

		VelProfile[k - 1] = (unsigned int)(delay_time * TIMER_FRQ);

		if (VelProfile[k - 1] < 1) {
			VelProfile[k - 1] = 1;
		}

		// 생성된 lookup table 확인
		MACRO_PRINT((tmp_string, "%d, %d\r\n", k - 1, VelProfile[k - 1]));
	}

	return accelStep;
}

void StepMoveVP(float angle, float maxVel, float accel)
{
	unsigned int dir;
	unsigned int totalStep;
	unsigned int accelStep;
	unsigned int useAccelStep;
	unsigned int k;
	unsigned int idx;
	unsigned int delayCnt;

	// angle이 0이면 이동 없음
	if (angle == 0.0f) {
		return;
	}

	// angle 부호로 방향 결정
	if (angle >= 0.0f) {
		dir = 0;
	}
	else {
		dir = 1;
		angle = -angle;
	}

	if (maxVel < 0.0f) {
		maxVel = -maxVel;
	}

	if (accel < 0.0f) {
		accel = -accel;
	}

	// 전체 이동 step 수
	totalStep = (unsigned int)(angle / STEP_ANGLE + 0.5f);

	if (totalStep < 1) {
		return;
	}

	// 가속 구간 lookup table 생성
	accelStep = MakeVelProfile(maxVel, accel);

	/*
	 * 전체 이동 거리가 짧으면 등속 구간이 없는 삼각형 프로파일 적용
	 * 즉, 실제 가속 step 수를 전체 step 수의 절반으로 제한
	 */
	if ((2 * accelStep) > totalStep) {
		useAccelStep = totalStep / 2;
	}
	else {
		useAccelStep = accelStep;
	}

	// 1 step만 이동하는 경우
	if (useAccelStep < 1) {
		useAccelStep = 1;
	}

	for (k = 0; k < totalStep; k++) {
		if (k < useAccelStep) {
			// 가속 구간: index 증가
			idx = k;
		}
		else if (k >= (totalStep - useAccelStep)) {
			// 감속 구간: index 감소
			idx = totalStep - k - 1;
		}
		else {
			// 등속 구간: 최소 delay 유지
			idx = useAccelStep - 1;
		}

		if (idx >= accelStep) {
			idx = accelStep - 1;
		}

		delayCnt = VelProfile[idx];

		OneStepMove(dir, delayCnt);
	}
}


/************************************************************
 * main 함수
 ************************************************************/
void main()
{
	int i = 0;

	InitEXINTF();	// Asynchronous Bus Initialization
	InitTimer();	// Timer Initialization
	InitUART();		// UART Initialization
	InitINT();		// Interrupt Enable
	InitUSBMon();	// USB Monitor Initialization

	MACRO_PRINT((tmp_string, "\r\n\r\n"));
	MACRO_PRINT((tmp_string, "Mechatronics Course %d\r\n", 2026));
	MACRO_PRINT((tmp_string, "FPGA Ver%2x.%02x\r\n",
		((*FPGAVER >> 8) & 0xFF), (*FPGAVER & 0xFF)));

	TFlag = 0;

	*FPGALED = 1;			// FPGA LED 1 : ON, 0 : OFF

	GIE();

	WaitTFlagCnt(100);

	/*
	 * 초기 phase 설정
	 * Full Step 기준 A phase로 시작
	 */
	*STEP_PHASE_L = 0x2;
	WaitTFlagCnt(1000);

	while (1) {

#if (LAB_SELECT == 1)

		/********************************************************
		 * 실습 1
		 *
		 * 1) LAB1_DELAY_CNT 값을 바꾸면서 속도 변화 확인
		 * 2) LAB1_HALF_STEP 값을 0/1로 바꾸면서
		 *    Full Step / Half Step 비교
		 ********************************************************/
		#if (LAB1_HALF_STEP == 0)
			Lab1_FullStep(LAB1_DELAY_CNT);
		#else
			Lab1_HalfStep(LAB1_DELAY_CNT);
		#endif

		MACRO_PRINT((tmp_string, "Lab1 Count: %d\r\n", i++));
		*FPGALED = ~*FPGALED;


#elif (LAB_SELECT == 2)

		/********************************************************
		 * 실습 2
		 *
		 * StepMoveCV(angle, spd)
		 * angle > 0 : 정방향
		 * angle < 0 : 역방향
		 *
		 * spd 단위 : deg/s
		 ********************************************************/
		StepMoveCV(360.0f, 180.0f);		// 정방향 1회전
		WaitTFlagCnt(100000);			// 1초 대기

		StepMoveCV(-360.0f, 180.0f);	// 역방향 1회전
		WaitTFlagCnt(100000);			// 1초 대기

		MACRO_PRINT((tmp_string, "Lab2 Count: %d\r\n", i++));
		*FPGALED = ~*FPGALED;


#elif (LAB_SELECT == 3)

		/********************************************************
		 * 실습 3
		 *
		 * StepMoveVP(angle, maxVel, accel)
		 *
		 * angle  : deg
		 * maxVel : deg/s
		 * accel  : deg/s^2
		 *
		 * 처음에는 maxVel, accel을 작게 설정하고
		 * 정상 동작 확인 후 점진적으로 증가시킨다.
		 ********************************************************/
		StepMoveVP(360.0f, 180.0f, 360.0f);		// 정방향 1회전
		WaitTFlagCnt(100000);					// 1초 대기

		StepMoveVP(-360.0f, 180.0f, 360.0f);	// 역방향 1회전
		WaitTFlagCnt(100000);					// 1초 대기

		MACRO_PRINT((tmp_string, "Lab3 Count: %d\r\n", i++));
		*FPGALED = ~*FPGALED;

#endif

	}
}