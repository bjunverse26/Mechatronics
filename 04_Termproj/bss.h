/* Bss.h */

// Serial.c
extern COMPACKET compacket;
extern RESPACKET respacket;
extern char tmp_string[SIZE_OF_RESPACKET];

// Interrupt.c
extern unsigned int TFlag;

// main.c
extern unsigned int TINTCnt;

// -----------------------------
/* 		 2026.05.27 (수) 	  */
// -----------------------------
extern void PWMOut(float duty);
extern float GetAngle();
