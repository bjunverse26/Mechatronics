;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Wed Apr 08 10:06:11 2026                                *
;******************************************************************************

;******************************************************************************
;* GLOBAL FILE PARAMETERS                                                     *
;*                                                                            *
;*   Architecture      : TMS320C670x                                          *
;*   Optimization      : Disabled                                             *
;*   Optimizing for    : Compile time, Ease of Development                    *
;*                       Based on options: no -o, no -ms                      *
;*   Endian            : Little                                               *
;*   Interrupt Thrshld : Disabled                                             *
;*   Memory Model      : Large                                                *
;*   Calls to RTS      : Far                                                  *
;*   Pipelining        : Disabled                                             *
;*   Memory Aliases    : Presume are aliases (pessimistic)                    *
;*   Debug Info        : No Debug Info                                        *
;*                                                                            *
;******************************************************************************

	.asg	A15, FP
	.asg	B14, DP
	.asg	B15, SP
	.global	$bss

	.global	_TINTCnt
_TINTCnt:	.usect	.far,4,4
	.global	_timerCheckCnt
_timerCheckCnt:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\W10\AppData\Local\Temp\TI9468_2 --template_info_file C:\Users\W10\AppData\Local\Temp\TI9468_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
	.sect	".text"
	.global	_InitEXINTF

;******************************************************************************
;* FUNCTION NAME: _InitEXINTF                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A3,A4,B4,B5,B6                                    *
;*   Regs Used         : A0,A3,A4,B3,B4,B5,B6                                 *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_InitEXINTF:
;** --------------------------------------------------------------------------*
           ZERO    .D1     A0                ; |18| 
           MVKH    .S1     0x1800000,A0      ; |18| 
           LDW     .D1T1   *A0,A4            ; |18| 
           MVKL    .S2     0x1800008,B5      ; |21| 
           MVKL    .S2     0x22120821,B6     ; |33| 
           B       .S2     B3                ; |43| 

           MVKL    .S2     0x1800010,B4      ; |33| 
||         MVKL    .S1     0xd00321,A3       ; |21| 

           CLR     .S1     A4,3,5,A4         ; |18| 
||         MVKH    .S2     0x1800008,B5      ; |21| 

           STW     .D1T1   A4,*A0            ; |18| 
||         MVKH    .S2     0x22120821,B6     ; |33| 
||         MVKH    .S1     0xd00321,A3       ; |21| 

           STW     .D2T1   A3,*B5            ; |21| 
||         MVKH    .S2     0x1800010,B4      ; |33| 

           STW     .D2T2   B6,*B4            ; |33| 
           ; BRANCH OCCURS                   ; |43| 


	.sect	".text"
	.global	_InitTimer

;******************************************************************************
;* FUNCTION NAME: _InitTimer                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A3,B4,B5                                          *
;*   Regs Used         : A0,A3,B3,B4,B5                                       *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_InitTimer:
;** --------------------------------------------------------------------------*
           ZERO    .D2     B4                ; |48| 
           MVKH    .S2     0x1940000,B4      ; |48| 
           LDW     .D2T2   *B4,B5            ; |48| 
           MVKL    .S1     0x1940004,A0      ; |51| 
           MVKH    .S1     0x1940004,A0      ; |51| 
           ZERO    .D1     A3                ; |54| 
           MVKH    .S1     0x1940000,A3      ; |54| 
           SET     .S2     B5,8,9,B5         ; |48| 

           MVK     .S2     20000,B4          ; |51| 
||         STW     .D2T2   B5,*B4            ; |48| 

           STW     .D1T2   B4,*A0            ; |51| 
           LDW     .D1T1   *A3,A0            ; |54| 
           B       .S2     B3                ; |55| 
           NOP             3
           SET     .S1     A0,6,7,A0         ; |54| 
           STW     .D1T1   A0,*A3            ; |54| 
           ; BRANCH OCCURS                   ; |55| 


	.sect	".text"
	.global	_InitINT

;******************************************************************************
;* FUNCTION NAME: _InitINT                                                    *
;*                                                                            *
;*   Regs Modified     : A0,B4                                                *
;*   Regs Used         : A0,B3,B4                                             *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_InitINT:
;** --------------------------------------------------------------------------*
           MVC     .S2     IER,B4            ; |60| 
           MVK     .S1     16450,A0          ; |60| 
           OR      .S2X    A0,B4,B4          ; |60| 
           MVC     .S2     B4,IER            ; |60| 
           B       .S2     B3                ; |61| 
           NOP             5
           ; BRANCH OCCURS                   ; |61| 


	.sect	".text"
	.global	_GIE

;******************************************************************************
;* FUNCTION NAME: _GIE                                                        *
;*                                                                            *
;*   Regs Modified     : B4                                                   *
;*   Regs Used         : B3,B4                                                *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_GIE:
;** --------------------------------------------------------------------------*
           MVC     .S2     CSR,B4            ; |66| 
           OR      .S2     1,B4,B4           ; |66| 
           MVC     .S2     B4,CSR            ; |66| 
           B       .S2     B3                ; |67| 
           NOP             5
           ; BRANCH OCCURS                   ; |67| 


	.sect	".text"
	.global	_delay_us

;******************************************************************************
;* FUNCTION NAME: _delay_us                                                   *
;*                                                                            *
;*   Regs Modified     : B0,B4,B5,B6,SP                                       *
;*   Regs Used         : A4,B0,B3,B4,B5,B6,SP                                 *
;*   Local Frame Size  : 0 Args + 4 Auto + 0 Save = 4 byte                    *
;******************************************************************************
_delay_us:
;** --------------------------------------------------------------------------*
           MV      .S2X    A4,B4             ; |71| 
           SHL     .S2     B4,4,B5           ; |74| 

           ZERO    .S2     B4                ; |74| 
||         SUBAH   .D2     B5,B4,B5          ; |74| 

           CMPLTU  .L2     B4,B5,B0          ; |74| 
   [!B0]   B       .S1     L2                ; |74| 
           SUB     .D2     SP,8,SP           ; |71| 
           STW     .D2T1   A4,*+SP(4)        ; |71| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |74| 
           NOP             2
           ; BRANCH OCCURS                   ; |74| 
;** --------------------------------------------------------------------------*
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L1:    
           SHL     .S2     B5,4,B6           ; |74| 

           SUBAH   .D2     B6,B5,B5          ; |74| 
||         ADD     .S2     1,B4,B4           ; |74| 

           CMPLTU  .L2     B4,B5,B0          ; |74| 
   [ B0]   B       .S1     L1                ; |74| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |74| 
           NOP             4
           ; BRANCH OCCURS                   ; |74| 
;** --------------------------------------------------------------------------*
L2:    
           B       .S2     B3                ; |75| 
           ADD     .D2     8,SP,SP           ; |75| 
           NOP             4
           ; BRANCH OCCURS                   ; |75| 


	.sect	".text"
	.global	_delay_ms

;******************************************************************************
;* FUNCTION NAME: _delay_ms                                                   *
;*                                                                            *
;*   Regs Modified     : A4,B0,B3,B4,B5,B6,B7,B9,SP                           *
;*   Regs Used         : A4,B0,B3,B4,B5,B6,B7,B9,SP                           *
;*   Local Frame Size  : 0 Args + 4 Auto + 0 Save = 4 byte                    *
;******************************************************************************
_delay_ms:
;** --------------------------------------------------------------------------*
           ZERO    .D2     B7                ; |82| 
           CMPLTU  .L2X    B7,A4,B0
   [!B0]   B       .S1     L4                ; |82| 
           SUB     .D2     SP,8,SP           ; |79| 
           STW     .D2T1   A4,*+SP(4)        ; |79| 
           MV      .L2     B3,B9             ; |79| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |83| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |83| 
           ; BRANCH OCCURS                   ; |82| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L3:    
           B       .S2     B4                ; |83| 
           MVKL    .S2     RL0,B3            ; |83| 
           MVKH    .S2     RL0,B3            ; |83| 
           MVK     .S1     0x3e8,A4          ; |83| 
           NOP             2
RL0:       ; CALL OCCURS                     ; |83| 
           LDW     .D2T2   *+SP(4),B4        ; |84| 
           ADD     .D2     1,B7,B7           ; |84| 
           NOP             3
           CMPLTU  .L2     B7,B4,B0          ; |84| 
   [ B0]   B       .S1     L3                ; |84| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |83| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |83| 
           NOP             3
           ; BRANCH OCCURS                   ; |84| 
;** --------------------------------------------------------------------------*
L4:    
           B       .S2     B9                ; |85| 
           ADD     .D2     8,SP,SP           ; |85| 
           NOP             4
           ; BRANCH OCCURS                   ; |85| 


	.sect	".text"
	.global	_WaitTFlag

;******************************************************************************
;* FUNCTION NAME: _WaitTFlag                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3                                             *
;*   Regs Used         : A0,A1,A3,B3                                          *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_WaitTFlag:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _TFlag,A0         ; |90| 
           MVKH    .S1     _TFlag,A0         ; |90| 
           LDW     .D1T1   *A0,A1            ; |90| 
           NOP             4
   [ A1]   B       .S1     L6                ; |90| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |90| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |90| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |90| 
           NOP             2
           ; BRANCH OCCURS                   ; |90| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L5:    
           NOP             2
   [!A1]   B       .S1     L5                ; |90| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |90| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |90| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |90| 
           NOP             2
           ; BRANCH OCCURS                   ; |90| 
;** --------------------------------------------------------------------------*
L6:    
           B       .S2     B3                ; |92| 
           MVKL    .S1     _TFlag,A0         ; |91| 
           MVKH    .S1     _TFlag,A0         ; |91| 
           ZERO    .D1     A3                ; |91| 
           STW     .D1T1   A3,*A0            ; |91| 
           NOP             1
           ; BRANCH OCCURS                   ; |92| 


	.sect	".text"
	.global	_WaitTFlagCnt

;******************************************************************************
;* FUNCTION NAME: _WaitTFlagCnt                                               *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,B0,B3,B4,B5,B9,SP                           *
;*   Regs Used         : A0,A1,A3,A4,B0,B3,B4,B5,B9,SP                        *
;*   Local Frame Size  : 0 Args + 8 Auto + 0 Save = 8 byte                    *
;******************************************************************************
_WaitTFlagCnt:
;** --------------------------------------------------------------------------*

           SUB     .D2     SP,8,SP           ; |96| 
||         MVKL    .S1     _TFlag,A0         ; |99| 

           STW     .D2T1   A4,*+SP(4)        ; |96| 
||         MVKH    .S1     _TFlag,A0         ; |99| 
||         ZERO    .D1     A3                ; |99| 

           STW     .D1T1   A3,*A0            ; |99| 
           LDW     .D2T2   *+SP(4),B5        ; |101| 
           ZERO    .D2     B4                ; |101| 
           STW     .D2T2   B4,*+SP(8)        ; |101| 
           MV      .S2     B3,B9             ; |96| 
           NOP             1
           CMPLTU  .L2     B4,B5,B0          ; |101| 
   [!B0]   B       .S1     L8                ; |101| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |102| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |102| 
           NOP             3
           ; BRANCH OCCURS                   ; |101| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L7:    
           B       .S2X    A0                ; |102| 
           MVKL    .S2     RL2,B3            ; |102| 
           MVKH    .S2     RL2,B3            ; |102| 
           NOP             3
RL2:       ; CALL OCCURS                     ; |102| 
           LDW     .D2T2   *+SP(8),B4        ; |103| 
           LDW     .D2T2   *+SP(4),B5        ; |103| 
           NOP             3
           ADD     .D2     1,B4,B4           ; |103| 
           CMPLTU  .L2     B4,B5,B0          ; |103| 
   [ B0]   B       .S1     L7                ; |103| 
           STW     .D2T2   B4,*+SP(8)        ; |103| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |102| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |102| 
           NOP             2
           ; BRANCH OCCURS                   ; |103| 
;** --------------------------------------------------------------------------*
L8:    
           B       .S2     B9                ; |104| 
           ADD     .D2     8,SP,SP           ; |104| 
           NOP             4
           ; BRANCH OCCURS                   ; |104| 


	.sect	".text"
	.global	_PWMOut

;******************************************************************************
;* FUNCTION NAME: _PWMOut                                                     *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 8 Auto + 4 Save = 12 byte                   *
;******************************************************************************
_PWMOut:
;** --------------------------------------------------------------------------*
           ZERO    .D1     A3                ; |116| 

           MVKH    .S1     0x42400000,A3     ; |116| 
||         ZERO    .D1     A0                ; |116| 

           MVKH    .S1     0x42400000,A0     ; |116| 
||         STW     .D2T2   B3,*SP--(16)      ; |113| 
||         MV      .S2X    A4,B4             ; |113| 

           CMPGTSP .S1X    B4,A3,A1          ; |116| 
||         STW     .D2T1   A4,*+SP(4)        ; |113| 

   [ A1]   STW     .D2T1   A0,*+SP(4)        ; |116| 
           LDW     .D2T2   *+SP(4),B5        ; |117| 
           ZERO    .D2     B4                ; |117| 
           ZERO    .D1     A0                ; |117| 
           MVKH    .S2     0xc2400000,B4     ; |117| 
           MVKH    .S1     0xc2400000,A0     ; |117| 
           CMPLTSP .S2     B5,B4,B0          ; |117| 
   [ B0]   STW     .D2T1   A0,*+SP(4)        ; |117| 
           LDW     .D2T2   *+SP(4),B4        ; |119| 
           ZERO    .D1     A0                ; |119| 
           MVKH    .S1     0x42480000,A0     ; |119| 
           MVKL    .S2     __divf,B5         ; |119| 
           MVKH    .S2     __divf,B5         ; |119| 
           ADDSP   .L2X    A0,B4,B6          ; |119| 
           MVKL    .S2     0x457ff000,B4     ; |119| 
           MVKH    .S2     0x457ff000,B4     ; |119| 
           B       .S2     B5                ; |119| 
           MPYSP   .M2     B4,B6,B6          ; |119| 
           ZERO    .D1     A0                ; |119| 
           ZERO    .D2     B4                ; |115| 

           MVKH    .S1     0x42c80000,A0     ; |119| 
||         MVKL    .S2     RL4,B3            ; |119| 

           MV      .L2X    A0,B4             ; |119| 
||         STW     .D2T2   B4,*+SP(8)        ; |115| 
||         MV      .S1X    B6,A4             ; |119| 
||         MVKH    .S2     RL4,B3            ; |119| 

RL4:       ; CALL OCCURS                     ; |119| 
           ZERO    .D2     B4                ; |119| 
           MVKH    .S2     0x3f000000,B4     ; |119| 
           ADDSP   .L1X    B4,A4,A0          ; |119| 
           NOP             3
           SPTRUNC .L1     A0,A0             ; |119| 
           NOP             3
           STW     .D2T1   A0,*+SP(8)        ; |119| 
           LDW     .D2T2   *+SP(8),B4        ; |120| 
           MVKL    .S1     0x2000084,A0      ; |120| 
           MVKH    .S1     0x2000084,A0      ; |120| 
           NOP             2
           STW     .D1T2   B4,*A0            ; |120| 
           LDW     .D2T2   *++SP(16),B3      ; |121| 
           NOP             4
           B       .S2     B3                ; |121| 
           NOP             5
           ; BRANCH OCCURS                   ; |121| 


	.sect	".text"
	.global	_GetAngle

;******************************************************************************
;* FUNCTION NAME: _GetAngle                                                   *
;*                                                                            *
;*   Regs Modified     : A0,A4,B4,SP                                          *
;*   Regs Used         : A0,A4,B3,B4,SP                                       *
;*   Local Frame Size  : 0 Args + 8 Auto + 0 Save = 8 byte                    *
;******************************************************************************
_GetAngle:
;** --------------------------------------------------------------------------*
           MVKL    .S2     0x20000a8,B4      ; |126| 
           MVKH    .S2     0x20000a8,B4      ; |126| 
           LDW     .D2T2   *B4,B4            ; |126| 
           SUB     .D2     SP,8,SP           ; |124| 
           ZERO    .D1     A0                ; |128| 
           MVKH    .S1     0x3dc00000,A0     ; |128| 
           NOP             1

           INTSP   .L2     B4,B4             ; |128| 
||         STW     .D2T2   B4,*+SP(8)        ; |126| 

           NOP             2
           B       .S2     B3                ; |130| 
           MPYSP   .M2X    A0,B4,B4          ; |128| 
           NOP             3

           ADD     .S2     8,SP,SP           ; |130| 
||         MV      .S1X    B4,A4             ; |128| 
||         STW     .D2T2   B4,*+SP(4)        ; |128| 

           ; BRANCH OCCURS                   ; |130| 


	.sect	".text"
	.global	_main

;******************************************************************************
;* FUNCTION NAME: _main                                                       *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 24 Args + 8 Auto + 4 Save = 36 byte                  *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _InitEXINTF,A0    ; |138| 
           MVKH    .S1     _InitEXINTF,A0    ; |138| 
           B       .S2X    A0                ; |138| 
           STW     .D2T2   B3,*SP--(40)      ; |134| 
           MVKL    .S2     RL8,B3            ; |138| 
           MVKH    .S2     RL8,B3            ; |138| 
           NOP             2
RL8:       ; CALL OCCURS                     ; |138| 
           MVKL    .S1     _InitTimer,A0     ; |139| 
           MVKH    .S1     _InitTimer,A0     ; |139| 
           B       .S2X    A0                ; |139| 
           MVKL    .S2     RL10,B3           ; |139| 
           MVKH    .S2     RL10,B3           ; |139| 
           NOP             3
RL10:      ; CALL OCCURS                     ; |139| 
           MVKL    .S2     _InitUART,B4      ; |140| 
           MVKH    .S2     _InitUART,B4      ; |140| 
           B       .S2     B4                ; |140| 
           MVKL    .S2     RL12,B3           ; |140| 
           MVKH    .S2     RL12,B3           ; |140| 
           NOP             3
RL12:      ; CALL OCCURS                     ; |140| 
           MVKL    .S1     _InitINT,A0       ; |141| 
           MVKH    .S1     _InitINT,A0       ; |141| 
           B       .S2X    A0                ; |141| 
           MVKL    .S2     RL14,B3           ; |141| 
           MVKH    .S2     RL14,B3           ; |141| 
           NOP             3
RL14:      ; CALL OCCURS                     ; |141| 
           MVKL    .S1     _InitUSBMon,A0    ; |142| 
           MVKH    .S1     _InitUSBMon,A0    ; |142| 
           B       .S2X    A0                ; |142| 
           MVKL    .S2     RL16,B3           ; |142| 
           MVKH    .S2     RL16,B3           ; |142| 
           NOP             3
RL16:      ; CALL OCCURS                     ; |142| 
           MVKL    .S1     _sprintf,A0       ; |144| 

           MVKH    .S1     _sprintf,A0       ; |144| 
||         MVKL    .S2     _tmp_string,B5    ; |144| 

           B       .S2X    A0                ; |144| 
           MVKL    .S2     RL18,B3           ; |144| 
           MVKH    .S2     _tmp_string,B5    ; |144| 
           MVKL    .S2     SL1+0,B4          ; |144| 
           MVKH    .S2     SL1+0,B4          ; |144| 

           MVKH    .S2     RL18,B3           ; |144| 
||         MV      .S1X    B5,A4             ; |144| 
||         STW     .D2T2   B4,*+SP(4)        ; |144| 

RL18:      ; CALL OCCURS                     ; |144| 
           MVKL    .S1     _Report,A0        ; |144| 
           MVKH    .S1     _Report,A0        ; |144| 
           B       .S2X    A0                ; |144| 
           MVKL    .S2     RL20,B3           ; |144| 
           MVKH    .S2     RL20,B3           ; |144| 
           NOP             3
RL20:      ; CALL OCCURS                     ; |144| 
           MVK     .S1     2026,A0           ; |145| 

           MVKL    .S1     _sprintf,A0       ; |145| 
||         STW     .D2T1   A0,*+SP(8)        ; |145| 

           MVKH    .S1     _sprintf,A0       ; |145| 
||         MVKL    .S2     SL2+0,B4          ; |145| 

           B       .S2X    A0                ; |145| 
           MVKH    .S2     SL2+0,B4          ; |145| 
           MVKL    .S2     _tmp_string,B5    ; |145| 
           MVKH    .S2     _tmp_string,B5    ; |145| 
           MVKL    .S2     RL22,B3           ; |145| 

           STW     .D2T2   B4,*+SP(4)        ; |145| 
||         MVKH    .S2     RL22,B3           ; |145| 
||         MV      .S1X    B5,A4             ; |145| 

RL22:      ; CALL OCCURS                     ; |145| 
           MVKL    .S1     _Report,A0        ; |145| 
           MVKH    .S1     _Report,A0        ; |145| 
           B       .S2X    A0                ; |145| 
           MVKL    .S2     RL24,B3           ; |145| 
           MVKH    .S2     RL24,B3           ; |145| 
           NOP             3
RL24:      ; CALL OCCURS                     ; |145| 
           MVKL    .S2     SL3+0,B4          ; |146| 
           MVKL    .S2     0x20003fc,B5      ; |146| 
           MVKH    .S2     SL3+0,B4          ; |146| 

           MVKH    .S2     0x20003fc,B5      ; |146| 
||         STW     .D2T2   B4,*+SP(4)        ; |146| 

           LDW     .D2T2   *B5,B4            ; |146| 
           MVKL    .S1     _sprintf,A3       ; |146| 
           MVKL    .S1     0x20003fc,A0      ; |146| 
           MVKH    .S1     0x20003fc,A0      ; |146| 
           MVKH    .S1     _sprintf,A3       ; |146| 
           EXTU    .S2     B4,16,24,B4       ; |146| 
           STW     .D2T2   B4,*+SP(8)        ; |146| 
           LDW     .D1T1   *A0,A0            ; |146| 
           B       .S2X    A3                ; |146| 
           MVKL    .S2     RL26,B3           ; |146| 
           MVKH    .S2     RL26,B3           ; |146| 
           MVKL    .S1     _tmp_string,A4    ; |146| 
           EXTU    .S1     A0,24,24,A0       ; |146| 

           STW     .D2T1   A0,*+SP(12)       ; |146| 
||         MVKH    .S1     _tmp_string,A4    ; |146| 

RL26:      ; CALL OCCURS                     ; |146| 
           MVKL    .S1     _Report,A0        ; |146| 
           MVKH    .S1     _Report,A0        ; |146| 
           B       .S2X    A0                ; |146| 
           MVKL    .S2     RL28,B3           ; |146| 
           MVKH    .S2     RL28,B3           ; |146| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |146| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _TFlag,B4         ; |148| 
           MVKL    .S2     _TINTCnt,B5       ; |149| 
           MVKL    .S2     0x200004c,B7      ; |151| 
           MVKL    .S2     0x2000090,B0      ; |153| 
           MVKL    .S2     0x200008c,B9      ; |154| 
           MVKH    .S2     _TFlag,B4         ; |148| 

           MVKL    .S2     0x2000084,B8      ; |155| 
||         ZERO    .D2     B6                ; |148| 

           STW     .D2T2   B6,*B4            ; |148| 
||         MVKH    .S2     _TINTCnt,B5       ; |149| 
||         ZERO    .D1     A0                ; |149| 

           MVK     .S1     1,A0              ; |151| 
||         STW     .D2T1   A0,*B5            ; |149| 
||         MVKH    .S2     0x200004c,B7      ; |151| 

           STW     .D2T1   A0,*B7            ; |151| 
||         ZERO    .L2     B4                ; |153| 
||         MVKH    .S2     0x2000090,B0      ; |153| 

           STW     .D2T2   B4,*B0            ; |153| 
||         MVKH    .S2     0x200008c,B9      ; |154| 

           STW     .D2T2   B4,*B9            ; |154| 
||         MVK     .S1     2048,A0           ; |155| 
||         MVKH    .S2     0x2000084,B8      ; |155| 

           MVKL    .S1     _InitTrajectory,A0 ; |160| 
||         STW     .D2T1   A0,*B8            ; |155| 

           MVKH    .S1     _InitTrajectory,A0 ; |160| 
           B       .S2X    A0                ; |160| 
           MVKL    .S2     0x2000080,B1      ; |157| 
           MVKL    .S2     RL30,B3           ; |160| 
           MVKH    .S2     0x2000080,B1      ; |157| 
           MVK     .S1     1,A3              ; |157| 

           STW     .D2T1   A3,*B1            ; |157| 
||         MVKH    .S2     RL30,B3           ; |160| 

RL30:      ; CALL OCCURS                     ; |160| 
           MVKL    .S2     _GIE,B4           ; |162| 
           MVKH    .S2     _GIE,B4           ; |162| 
           B       .S2     B4                ; |162| 
           MVKL    .S2     RL32,B3           ; |162| 
           MVKH    .S2     RL32,B3           ; |162| 
           NOP             3
RL32:      ; CALL OCCURS                     ; |162| 
           MVKL    .S1     _WaitTFlagCnt,A0  ; |164| 
           MVKH    .S1     _WaitTFlagCnt,A0  ; |164| 
           B       .S2X    A0                ; |164| 
           MVKL    .S2     RL34,B3           ; |164| 
           MVK     .S1     0x64,A4           ; |164| 
           MVKH    .S2     RL34,B3           ; |164| 
           NOP             2
RL34:      ; CALL OCCURS                     ; |164| 
           MVK     .S2     1,B5              ; |176| 
           MVKL    .S2     0x2000080,B4      ; |176| 

           MVKH    .S2     0x2000080,B4      ; |176| 
||         MVKL    .S1     _timerCheckCnt,A3 ; |190| 

           MVKH    .S1     _timerCheckCnt,A3 ; |190| 
||         ZERO    .D1     A0                ; |190| 
||         STW     .D2T2   B5,*B4            ; |176| 

           STW     .D1T1   A0,*A3            ; |190| 
           MVKL    .S1     _TINTCnt,A0       ; |193| 
           MVKH    .S1     _TINTCnt,A0       ; |193| 
           LDW     .D1T1   *A0,A0            ; |193| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L9
;** --------------------------------------------------------------------------*
L9:    
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L10:    
           MVK     .S2     500,B4            ; |193| 
           NOP             1
           CMPLTU  .L2X    A0,B4,B0          ; |193| 
   [ B0]   B       .S1     L9                ; |193| 
           NOP             2
   [ B0]   MVKL    .S1     _TINTCnt,A0       ; |193| 
   [ B0]   MVKH    .S1     _TINTCnt,A0       ; |193| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |193| 
           ; BRANCH OCCURS                   ; |193| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GetAngle,A0      ; |195| 
           MVKH    .S1     _GetAngle,A0      ; |195| 
           B       .S2X    A0                ; |195| 
           MVKL    .S2     _TINTCnt,B4       ; |194| 
           MVKL    .S2     RL48,B3           ; |195| 
           MVKH    .S2     _TINTCnt,B4       ; |194| 
           ZERO    .D2     B5                ; |194| 

           STW     .D2T2   B5,*B4            ; |194| 
||         MVKH    .S2     RL48,B3           ; |195| 

RL48:      ; CALL OCCURS                     ; |195| 

           MVKL    .S2     SL5+0,B4          ; |195| 
||         MVKL    .S1     _timerCheckCnt,A0 ; |195| 

           MVKH    .S2     SL5+0,B4          ; |195| 
||         MVKH    .S1     _timerCheckCnt,A0 ; |195| 

           STW     .D2T2   B4,*+SP(4)        ; |195| 
||         MV      .D1     A0,A5             ; |195| 

           LDW     .D1T1   *A5,A6            ; |195| 
           MVKL    .S2     RL50,B3           ; |195| 
           MVKL    .S2     _tmp_string,B4    ; |195| 
           SPDP    .S1     A4,A1:A0          ; |195| 
           MVKH    .S2     _tmp_string,B4    ; |195| 

           ADD     .D1     1,A6,A0           ; |195| 
||         MV      .S1     A0,A7             ; |195| 

           MVKL    .S1     _sprintf,A0       ; |195| 
||         STW     .D1T1   A0,*A5            ; |195| 

           MVKH    .S1     _sprintf,A0       ; |195| 
           B       .S2X    A0                ; |195| 
           MV      .D1     A1,A3             ; |195| 
           STW     .D2T1   A7,*+SP(16)       ; |195| 
           STW     .D2T1   A3,*+SP(20)       ; |195| 
           STW     .D2T1   A6,*+SP(8)        ; |195| 

           MV      .S1X    B4,A4             ; |195| 
||         MVKH    .S2     RL50,B3           ; |195| 

RL50:      ; CALL OCCURS                     ; |195| 
           MVKL    .S2     _Report,B4        ; |195| 
           MVKH    .S2     _Report,B4        ; |195| 
           B       .S2     B4                ; |195| 
           MVKL    .S2     RL52,B3           ; |195| 
           MVKH    .S2     RL52,B3           ; |195| 
           NOP             3
RL52:      ; CALL OCCURS                     ; |195| 
           B       .S1     L10               ; |197| 
           MVKL    .S1     _TINTCnt,A0       ; |193| 
           MVKH    .S1     _TINTCnt,A0       ; |193| 
           LDW     .D1T1   *A0,A0            ; |193| 
           NOP             2
           ; BRANCH OCCURS                   ; |197| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	13,10,13,10,0
SL2:	.string	"Mechatronics Course Hello World %d",13,10,0
SL3:	.string	"FPGA Ver%2x.%02x",13,10,0
SL5:	.string	"Timer Check: %d %6.2f ",13,10,0
;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_sprintf
	.global	_InitUART
	.global	_Report
	.global	_InitUSBMon
	.global	_InitTrajectory
	.global	_tmp_string
	.global	_TFlag
	.global	__divf
