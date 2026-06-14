;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Mon May 25 14:24:59 2026                                *
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


	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_hall_count+0,32
	.field  	0,32			; _hall_count @ 0
	.sect	".text"
	.global	_hall_count
_hall_count:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_ref_angle+0,32
	.word	043b40000h		; _ref_angle @ 0
	.sect	".text"
	.global	_ref_angle
_ref_angle:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_ref_count+0,32
	.word	043a20000h		; _ref_count @ 0
	.sect	".text"
	.global	_ref_count
_ref_count:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_duty+0,32
	.word	000000000h		; _duty @ 0
	.sect	".text"
	.global	_duty
_duty:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_prev_hall$1+0,32
	.field  	0,32			; _prev_hall$1 @ 0
	.sect	".text"
_prev_hall$1:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\W10\AppData\Local\Temp\TI10424_2 --template_info_file C:\Users\W10\AppData\Local\Temp\TI10424_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
	.global	_BLDCDrive

;******************************************************************************
;* FUNCTION NAME: _BLDCDrive                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 20 Auto + 4 Save = 24 byte                  *
;******************************************************************************
_BLDCDrive:
;** --------------------------------------------------------------------------*

           STW     .D2T2   B3,*SP--(24)      ; |118| 
||         MVKL    .S1     0x2000120,A0      ; |126| 
||         ZERO    .S2     B4                ; |128| 

           STW     .D2T1   A4,*+SP(4)        ; |118| 
||         MVKH    .S2     0x42480000,B4     ; |128| 
||         MVKH    .S1     0x2000120,A0      ; |126| 
||         ZERO    .D1     A3                ; |128| 
||         MV      .L2X    A4,B5             ; |126| 

           LDW     .D1T1   *A0,A0            ; |126| 
||         CMPGTSP .S2     B5,B4,B0          ; |128| 
||         MVKH    .S1     0x42480000,A3     ; |128| 

   [ B0]   STW     .D2T1   A3,*+SP(4)        ; |128| 
           LDW     .D2T2   *+SP(4),B5        ; |129| 
           ZERO    .D2     B4                ; |129| 
           ZERO    .D1     A3                ; |129| 
           MVKH    .S2     0xc2480000,B4     ; |129| 
           MVKH    .S1     0xc2480000,A3     ; |129| 
           CMPLTSP .S2     B5,B4,B0          ; |129| 
   [ B0]   STW     .D2T1   A3,*+SP(4)        ; |129| 
           LDW     .D2T2   *+SP(4),B6        ; |131| 
           MVKL    .S2     __divf,B5         ; |131| 
           MVKH    .S2     __divf,B5         ; |131| 

           B       .S2     B5                ; |131| 
||         MVKL    .S1     0x457ff000,A3     ; |131| 

           MVKH    .S1     0x457ff000,A3     ; |131| 
           MPYSP   .M1X    A3,B6,A4          ; |131| 
           MVKL    .S2     RL4,B3            ; |131| 

           ZERO    .D2     B4                ; |131| 
||         AND     .S1     7,A0,A0           ; |126| 
||         MVKH    .S2     RL4,B3            ; |131| 

           MVKH    .S2     0x42c80000,B4     ; |131| 
||         STW     .D2T1   A0,*+SP(8)        ; |126| 

RL4:       ; CALL OCCURS                     ; |131| 
           SPTRUNC .L1     A4,A0             ; |131| 
           LDW     .D2T2   *+SP(8),B7        ; |136| 
           MVK     .S2     2048,B6           ; |134| 
           MVK     .S1     2048,A3           ; |137| 
           MV      .L2X    A0,B4             ; |131| 

           MV      .L2X    A0,B5             ; |131| 
||         STW     .D2T1   A0,*+SP(12)       ; |131| 
||         ADDK    .S2     2048,B4           ; |133| 

           SUB     .S2     B6,B5,B4          ; |134| 
||         STW     .D2T2   B4,*+SP(16)       ; |133| 
||         MVKL    .S1     0x2000110,A0      ; |137| 

           STW     .D2T2   B4,*+SP(20)       ; |134| 
||         CMPEQ   .L2     B7,2,B0           ; |136| 
||         MVKH    .S1     0x2000110,A0      ; |137| 

   [ B0]   STW     .D1T1   A3,*A0            ; |137| 
   [ B0]   LDW     .D2T2   *+SP(20),B5       ; |138| 
           MVKL    .S2     0x200010c,B4      ; |138| 
           MVKH    .S2     0x200010c,B4      ; |138| 
           MVKL    .S1     0x2000108,A0      ; |139| 
           MVKH    .S1     0x2000108,A0      ; |139| 
   [ B0]   STW     .D2T2   B5,*B4            ; |138| 

   [ B0]   LDW     .D2T2   *+SP(16),B4       ; |139| 
|| [ B0]   B       .S1     L9                ; |140| 

           CMPEQ   .L2     B7,3,B1
   [!B0]   LDW     .D2T1   *+SP(16),A0       ; |141| 
           NOP             2
   [ B0]   STW     .D1T2   B4,*A0            ; |139| 
           ; BRANCH OCCURS                   ; |140| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     0x2000110,B4      ; |141| 
           MVKH    .S2     0x2000110,B4      ; |141| 
           LDW     .D2T2   *+SP(8),B5        ; |144| 
           MVKL    .S1     0x2000108,A3      ; |143| 
   [ B1]   STW     .D2T1   A0,*B4            ; |141| 
   [ B1]   LDW     .D2T2   *+SP(20),B4       ; |142| 
   [ B1]   B       .S1     L9                ; |144| 
           MVKL    .S1     0x200010c,A0      ; |142| 
           MVKH    .S1     0x200010c,A0      ; |142| 
           MVKH    .S1     0x2000108,A3      ; |143| 

   [ B1]   STW     .D1T2   B4,*A0            ; |142| 
||         MVK     .S2     2048,B4           ; |143| 

   [ B1]   STW     .D1T2   B4,*A3            ; |143| 
||         CMPEQ   .L2     B5,1,B0           ; |144| 
|| [!B1]   LDW     .D2T1   *+SP(16),A3       ; |145| 

           ; BRANCH OCCURS                   ; |144| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     0x2000110,B4      ; |145| 
           MVKH    .S2     0x2000110,B4      ; |145| 
           LDW     .D2T2   *+SP(8),B5        ; |148| 
           MVKL    .S1     0x200010c,A0      ; |146| 

           MVK     .S2     2048,B4           ; |146| 
|| [ B0]   STW     .D2T1   A3,*B4            ; |145| 
||         MVKH    .S1     0x200010c,A0      ; |146| 

   [ B0]   STW     .D1T2   B4,*A0            ; |146| 

   [ B0]   B       .S1     L9                ; |148| 
|| [ B0]   LDW     .D2T2   *+SP(20),B4       ; |147| 

           MVKL    .S1     0x2000108,A0      ; |147| 
           MVKH    .S1     0x2000108,A0      ; |147| 
           CMPEQ   .L2     B5,5,B1           ; |148| 
   [!B0]   MVKL    .S1     0x2000110,A0      ; |149| 
   [ B0]   STW     .D1T2   B4,*A0            ; |147| 
           ; BRANCH OCCURS                   ; |148| 
;** --------------------------------------------------------------------------*

           MVKH    .S1     0x2000110,A0      ; |149| 
||         LDW     .D2T2   *+SP(8),B5        ; |152| 
||         MVK     .S2     2048,B4           ; |149| 

   [ B1]   STW     .D1T2   B4,*A0            ; |149| 
   [ B1]   LDW     .D2T1   *+SP(16),A0       ; |150| 
           MVKL    .S2     0x200010c,B4      ; |150| 
           MVKH    .S2     0x200010c,B4      ; |150| 
           CMPEQ   .L2     B5,4,B0           ; |152| 
   [!B1]   LDW     .D2T1   *+SP(20),A3       ; |153| 
   [ B1]   STW     .D2T1   A0,*B4            ; |150| 

   [ B1]   LDW     .D2T2   *+SP(20),B4       ; |151| 
|| [ B1]   B       .S1     L9                ; |152| 

           MVKL    .S1     0x2000108,A0      ; |151| 
           MVKH    .S1     0x2000108,A0      ; |151| 
           NOP             2
   [ B1]   STW     .D1T2   B4,*A0            ; |151| 
           ; BRANCH OCCURS                   ; |152| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     0x2000110,B4      ; |153| 
           MVKL    .S2     0x2000110,B5      ; |157| 
           MVKH    .S2     0x2000110,B4      ; |153| 
           MVKH    .S2     0x2000110,B5      ; |157| 

           MV      .D1     A3,A0             ; |153| 
|| [ B0]   STW     .D2T1   A3,*B4            ; |153| 

           MVKL    .S1     0x200010c,A0      ; |158| 
|| [!B0]   STW     .D2T1   A0,*B5            ; |157| 

   [ B0]   LDW     .D2T1   *+SP(16),A4       ; |154| 
||         MVKH    .S1     0x200010c,A0      ; |158| 
||         MVK     .S2     2048,B4           ; |158| 

   [!B0]   STW     .D1T2   B4,*A0            ; |158| 
||         MVKL    .S1     0x2000108,A5      ; |159| 

   [!B0]   LDW     .D2T2   *+SP(16),B5       ; |159| 
||         MVKL    .S1     0x2000108,A3      ; |155| 

           MVKL    .S1     0x200010c,A0      ; |154| 
           MVKH    .S1     0x200010c,A0      ; |154| 

   [ B0]   STW     .D1T1   A4,*A0            ; |154| 
||         MVKH    .S1     0x2000108,A3      ; |155| 

   [ B0]   STW     .D1T2   B4,*A3            ; |155| 
||         MVKH    .S1     0x2000108,A5      ; |159| 

   [!B0]   STW     .D1T2   B5,*A5            ; |159| 
;** --------------------------------------------------------------------------*
L9:    
           MVKL    .S2     _prev_hall$1,B4   ; |162| 
           MVKH    .S2     _prev_hall$1,B4   ; |162| 
           LDW     .D2T2   *B4,B0            ; |162| 
           LDW     .D2T2   *+SP(8),B5        ; |163| 
           MVKL    .S1     _prev_hall$1,A0   ; |163| 
           MVKL    .S1     _prev_hall$1,A3   ; |167| 
           MVKH    .S1     _prev_hall$1,A0   ; |163| 
   [!B0]   B       .S1     L11               ; |164| 

   [!B0]   STW     .D1T2   B5,*A0            ; |163| 
||         LDW     .D2T1   *+SP(8),A0        ; |167| 

           MVKH    .S1     _prev_hall$1,A3   ; |167| 
           NOP             3
           ; BRANCH OCCURS                   ; |164| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A3,A3            ; |167| 
           LDW     .D2T2   *+SP(8),B4        ; |168| 
           NOP             3
           CMPEQ   .L1     A0,A3,A1          ; |167| 
   [ A1]   B       .S1     L12               ; |167| 
   [ A1]   LDW     .D2T2   *++SP(24),B3      ; |184| 
           CMPEQ   .L2     B4,2,B0           ; |168| 
           NOP             3
           ; BRANCH OCCURS                   ; |167| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _prev_hall$1,B4   ; |168| 
           MVKH    .S2     _prev_hall$1,B4   ; |168| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |168| 
           MVKL    .S1     _hall_count,A0    ; |168| 
           MVKH    .S1     _hall_count,A0    ; |168| 
           NOP             2
   [ B0]   CMPEQ   .L2     B4,6,B0           ; |168| 
           MV      .L1X    B0,A1             ; |168| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |168| 

           LDW     .D2T2   *+SP(8),B4        ; |169| 
|| [ A1]   B       .S1     L10               ; |168| 

           NOP             3
   [ A1]   ADD     .D1     1,A3,A3           ; |168| 

   [ A1]   STW     .D1T1   A3,*A0            ; |168| 
||         CMPEQ   .L2     B4,3,B0           ; |169| 

           ; BRANCH OCCURS                   ; |168| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _prev_hall$1,B4   ; |169| 
           MVKH    .S2     _prev_hall$1,B4   ; |169| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |169| 
           MVKL    .S1     _hall_count,A0    ; |169| 
           MVKH    .S1     _hall_count,A0    ; |169| 
           NOP             2
   [ B0]   CMPEQ   .L2     B4,2,B0           ; |169| 
           MV      .L1X    B0,A1             ; |169| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |169| 

           LDW     .D2T2   *+SP(8),B4        ; |170| 
|| [ A1]   B       .S1     L10               ; |169| 

           NOP             3
   [ A1]   ADD     .D1     1,A3,A3           ; |169| 

   [ A1]   STW     .D1T1   A3,*A0            ; |169| 
||         CMPEQ   .L2     B4,1,B0           ; |170| 

           ; BRANCH OCCURS                   ; |169| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _prev_hall$1,B4   ; |170| 
           MVKH    .S2     _prev_hall$1,B4   ; |170| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |170| 
           MVKL    .S1     _hall_count,A0    ; |170| 
           MVKH    .S1     _hall_count,A0    ; |170| 
           NOP             2
   [ B0]   CMPEQ   .L2     B4,3,B0           ; |170| 
           MV      .L1X    B0,A1             ; |170| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |170| 

           LDW     .D2T2   *+SP(8),B4        ; |171| 
|| [ A1]   B       .S1     L10               ; |170| 

           NOP             3
   [ A1]   ADD     .D1     1,A3,A3           ; |170| 

   [ A1]   STW     .D1T1   A3,*A0            ; |170| 
||         CMPEQ   .L2     B4,5,B0           ; |171| 

           ; BRANCH OCCURS                   ; |170| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _prev_hall$1,B4   ; |171| 
           MVKH    .S2     _prev_hall$1,B4   ; |171| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |171| 
           MVKL    .S1     _hall_count,A0    ; |171| 
           MVKH    .S1     _hall_count,A0    ; |171| 
           NOP             2
   [ B0]   CMPEQ   .L2     B4,1,B0           ; |171| 
           MV      .L1X    B0,A1             ; |171| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |171| 

           LDW     .D2T2   *+SP(8),B4        ; |172| 
|| [ A1]   B       .S1     L10               ; |171| 

           NOP             3
   [ A1]   ADD     .D1     1,A3,A3           ; |171| 

   [ A1]   STW     .D1T1   A3,*A0            ; |171| 
||         CMPEQ   .L2     B4,4,B0           ; |172| 

           ; BRANCH OCCURS                   ; |171| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _prev_hall$1,B4   ; |172| 
           MVKH    .S2     _prev_hall$1,B4   ; |172| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |172| 
           MVKL    .S1     _hall_count,A0    ; |172| 
           MVKH    .S1     _hall_count,A0    ; |172| 
           NOP             2
   [ B0]   CMPEQ   .L2     B4,5,B0           ; |172| 
           MV      .L1X    B0,A1             ; |172| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |172| 

           LDW     .D2T2   *+SP(8),B4        ; |173| 
|| [ A1]   B       .S1     L10               ; |172| 

           NOP             3
   [ A1]   ADD     .D1     1,A3,A3           ; |172| 

   [ A1]   STW     .D1T1   A3,*A0            ; |172| 
||         CMPEQ   .L2     B4,6,B0           ; |173| 

           ; BRANCH OCCURS                   ; |172| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _prev_hall$1,B4   ; |173| 
           MVKH    .S2     _prev_hall$1,B4   ; |173| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |173| 
           MVKL    .S1     _hall_count,A0    ; |173| 
           MVKH    .S1     _hall_count,A0    ; |173| 
           NOP             2
   [ B0]   CMPEQ   .L2     B4,4,B0           ; |173| 
           MV      .L1X    B0,A1             ; |173| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |173| 

           LDW     .D2T2   *+SP(8),B4        ; |175| 
|| [ A1]   B       .S1     L10               ; |173| 

           NOP             3
   [ A1]   ADD     .D1     1,A3,A3           ; |173| 

   [ A1]   STW     .D1T1   A3,*A0            ; |173| 
||         CMPEQ   .L2     B4,6,B0           ; |175| 

           ; BRANCH OCCURS                   ; |173| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _prev_hall$1,B4   ; |175| 
           MVKH    .S2     _prev_hall$1,B4   ; |175| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |175| 
           MVKL    .S1     _hall_count,A0    ; |175| 
           MVKH    .S1     _hall_count,A0    ; |175| 
           NOP             2
   [ B0]   CMPEQ   .L2     B4,2,B0           ; |175| 
           MV      .L1X    B0,A1             ; |175| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |175| 

           LDW     .D2T2   *+SP(8),B4        ; |176| 
|| [ A1]   B       .S1     L10               ; |175| 

           NOP             3
   [ A1]   SUB     .D1     A3,1,A3           ; |175| 

   [ A1]   STW     .D1T1   A3,*A0            ; |175| 
||         CMPEQ   .L2     B4,2,B0           ; |176| 

           ; BRANCH OCCURS                   ; |175| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _prev_hall$1,B4   ; |176| 
           MVKH    .S2     _prev_hall$1,B4   ; |176| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |176| 
           MVKL    .S1     _hall_count,A0    ; |176| 
           MVKH    .S1     _hall_count,A0    ; |176| 
           NOP             2
   [ B0]   CMPEQ   .L2     B4,3,B0           ; |176| 
           MV      .L1X    B0,A1             ; |176| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |176| 

           LDW     .D2T2   *+SP(8),B4        ; |177| 
|| [ A1]   B       .S1     L10               ; |176| 

           NOP             3
   [ A1]   SUB     .D1     A3,1,A3           ; |176| 

   [ A1]   STW     .D1T1   A3,*A0            ; |176| 
||         CMPEQ   .L2     B4,3,B0           ; |177| 

           ; BRANCH OCCURS                   ; |176| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _prev_hall$1,B4   ; |177| 
           MVKH    .S2     _prev_hall$1,B4   ; |177| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |177| 
           MVKL    .S1     _hall_count,A0    ; |177| 
           MVKH    .S1     _hall_count,A0    ; |177| 
           NOP             2
   [ B0]   CMPEQ   .L2     B4,1,B0           ; |177| 
           MV      .L1X    B0,A1             ; |177| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |177| 

           LDW     .D2T2   *+SP(8),B4        ; |178| 
|| [ A1]   B       .S1     L10               ; |177| 

           NOP             3
   [ A1]   SUB     .D1     A3,1,A3           ; |177| 

   [ A1]   STW     .D1T1   A3,*A0            ; |177| 
||         CMPEQ   .L2     B4,1,B0           ; |178| 

           ; BRANCH OCCURS                   ; |177| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _prev_hall$1,B4   ; |178| 
           MVKH    .S2     _prev_hall$1,B4   ; |178| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |178| 
           MVKL    .S1     _hall_count,A0    ; |178| 
           MVKH    .S1     _hall_count,A0    ; |178| 
           NOP             2
   [ B0]   CMPEQ   .L2     B4,5,B0           ; |178| 
           MV      .L1X    B0,A1             ; |178| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |178| 

           LDW     .D2T2   *+SP(8),B4        ; |179| 
|| [ A1]   B       .S1     L10               ; |178| 

           NOP             3
   [ A1]   SUB     .D1     A3,1,A3           ; |178| 

   [ A1]   STW     .D1T1   A3,*A0            ; |178| 
||         CMPEQ   .L2     B4,5,B0           ; |179| 

           ; BRANCH OCCURS                   ; |178| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _prev_hall$1,B4   ; |179| 
           MVKH    .S2     _prev_hall$1,B4   ; |179| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |179| 
           MVKL    .S1     _hall_count,A0    ; |179| 
           MVKH    .S1     _hall_count,A0    ; |179| 
           NOP             2
   [ B0]   CMPEQ   .L2     B4,4,B0           ; |179| 
           MV      .L1X    B0,A1             ; |179| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |179| 

           LDW     .D2T2   *+SP(8),B4        ; |180| 
|| [ A1]   B       .S1     L10               ; |179| 

           NOP             3
   [ A1]   SUB     .D1     A3,1,A3           ; |179| 

   [ A1]   STW     .D1T1   A3,*A0            ; |179| 
||         CMPEQ   .L2     B4,4,B0           ; |180| 

           ; BRANCH OCCURS                   ; |179| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _prev_hall$1,B4   ; |180| 
           MVKH    .S2     _prev_hall$1,B4   ; |180| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |180| 
           MVKL    .S1     _hall_count,A0    ; |180| 
           MVKH    .S1     _hall_count,A0    ; |180| 
           NOP             2
   [ B0]   CMPEQ   .L2     B4,6,B0           ; |180| 
   [ B0]   LDW     .D1T1   *A0,A3            ; |180| 
           NOP             4
   [ B0]   SUB     .D1     A3,1,A3           ; |180| 
   [ B0]   STW     .D1T1   A3,*A0            ; |180| 
;** --------------------------------------------------------------------------*
L10:    
           LDW     .D2T2   *+SP(8),B4        ; |182| 
           MVKL    .S1     _prev_hall$1,A0   ; |182| 
           MVKH    .S1     _prev_hall$1,A0   ; |182| 
           NOP             2
           STW     .D1T2   B4,*A0            ; |182| 
;** --------------------------------------------------------------------------*
L11:    
           LDW     .D2T2   *++SP(24),B3      ; |184| 
;** --------------------------------------------------------------------------*
L12:    
           NOP             4
           B       .S2     B3                ; |184| 
           NOP             5
           ; BRANCH OCCURS                   ; |184| 


	.sect	".text"
	.global	_main

;******************************************************************************
;* FUNCTION NAME: _main                                                       *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 16 Args + 20 Auto + 4 Save = 40 byte                 *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*

           STW     .D2T2   B3,*SP--(40)      ; |187| 
||         MVK     .S1     -40,A0            ; |198| 

           MVK     .S1     50,A0             ; |200| 
||         STW     .D2T1   A0,*+SP(28)       ; |198| 
||         MV      .S2X    A0,B4             ; |198| 

           CMPGT   .L1X    B4,A0,A1          ; |200| 
   [ A1]   STW     .D2T1   A0,*+SP(28)       ; |200| 
           LDW     .D2T2   *+SP(28),B4       ; |201| 
           MVK     .S2     -50,B5            ; |201| 
           MVK     .S1     -50,A0            ; |201| 
           MVKL    .S2     RL6,B3            ; |203| 
           MVKH    .S2     RL6,B3            ; |203| 
           CMPLT   .L2     B4,B5,B0          ; |201| 
   [ B0]   STW     .D2T1   A0,*+SP(28)       ; |201| 
           LDW     .D2T2   *+SP(28),B4       ; |203| 
           MVKL    .S1     0x457ff000,A0     ; |203| 
           MVKH    .S1     0x457ff000,A0     ; |203| 
           NOP             2
           INTSP   .L2     B4,B4             ; |203| 
           NOP             3

           MVKL    .S1     __divf,A0         ; |203| 
||         MPYSP   .M1X    A0,B4,A4          ; |203| 

           MVKH    .S1     __divf,A0         ; |203| 
           B       .S2X    A0                ; |203| 
           ZERO    .D2     B4                ; |203| 
           MVKH    .S2     0x42c80000,B4     ; |203| 
           NOP             3
RL6:       ; CALL OCCURS                     ; |203| 
           ZERO    .D2     B4                ; |203| 
           MVKH    .S2     0x3f000000,B4     ; |203| 
           ADDSP   .L1X    B4,A4,A0          ; |203| 
           MVKL    .S2     _InitEXINTF,B4    ; |208| 
           MVKL    .S2     RL8,B3            ; |208| 
           MVKH    .S2     RL8,B3            ; |208| 
           SPTRUNC .L1     A0,A0             ; |203| 
           MVKH    .S2     _InitEXINTF,B4    ; |208| 
           B       .S2     B4                ; |208| 
           NOP             1
           MV      .S2X    A0,B5             ; |203| 

           MVK     .S1     2048,A0           ; |206| 
||         MV      .L2X    A0,B6             ; |203| 
||         ADDK    .S2     2048,B5           ; |205| 
||         STW     .D2T1   A0,*+SP(24)       ; |203| 

           SUB     .L2X    A0,B6,B5          ; |206| 
||         STW     .D2T2   B5,*+SP(32)       ; |205| 

           STW     .D2T2   B5,*+SP(36)       ; |206| 
RL8:       ; CALL OCCURS                     ; |208| 
           MVKL    .S1     _InitTimer,A0     ; |209| 
           MVKH    .S1     _InitTimer,A0     ; |209| 
           B       .S2X    A0                ; |209| 
           MVKL    .S2     RL10,B3           ; |209| 
           MVKH    .S2     RL10,B3           ; |209| 
           NOP             3
RL10:      ; CALL OCCURS                     ; |209| 
           MVKL    .S1     _InitUART,A0      ; |210| 
           MVKH    .S1     _InitUART,A0      ; |210| 
           B       .S2X    A0                ; |210| 
           MVKL    .S2     RL12,B3           ; |210| 
           MVKH    .S2     RL12,B3           ; |210| 
           NOP             3
RL12:      ; CALL OCCURS                     ; |210| 
           MVKL    .S1     _InitINT,A0       ; |211| 
           MVKH    .S1     _InitINT,A0       ; |211| 
           B       .S2X    A0                ; |211| 
           MVKL    .S2     RL14,B3           ; |211| 
           MVKH    .S2     RL14,B3           ; |211| 
           NOP             3
RL14:      ; CALL OCCURS                     ; |211| 
           MVKL    .S2     _InitUSBMon,B4    ; |212| 
           MVKH    .S2     _InitUSBMon,B4    ; |212| 
           B       .S2     B4                ; |212| 
           MVKL    .S2     RL16,B3           ; |212| 
           MVKH    .S2     RL16,B3           ; |212| 
           NOP             3
RL16:      ; CALL OCCURS                     ; |212| 
           MVKL    .S1     _sprintf,A3       ; |214| 
           MVKH    .S1     _sprintf,A3       ; |214| 
           B       .S2X    A3                ; |214| 
           MVKL    .S1     SL1+0,A0          ; |214| 
           MVKH    .S1     SL1+0,A0          ; |214| 
           MVKL    .S1     _tmp_string,A4    ; |214| 
           MVKL    .S2     RL18,B3           ; |214| 

           STW     .D2T1   A0,*+SP(4)        ; |214| 
||         MVKH    .S1     _tmp_string,A4    ; |214| 
||         MVKH    .S2     RL18,B3           ; |214| 

RL18:      ; CALL OCCURS                     ; |214| 
           MVKL    .S2     _Report,B4        ; |214| 
           MVKH    .S2     _Report,B4        ; |214| 
           B       .S2     B4                ; |214| 
           MVKL    .S2     RL20,B3           ; |214| 
           MVKH    .S2     RL20,B3           ; |214| 
           NOP             3
RL20:      ; CALL OCCURS                     ; |214| 
           MVKL    .S1     _sprintf,A0       ; |215| 
           MVKH    .S1     _sprintf,A0       ; |215| 
           B       .S2X    A0                ; |215| 
           MVK     .S1     2026,A4           ; |215| 
           MVKL    .S2     RL22,B3           ; |215| 

           MVKL    .S2     _tmp_string,B4    ; |215| 
||         MVKL    .S1     SL2+0,A3          ; |215| 

           STW     .D2T1   A4,*+SP(8)        ; |215| 
||         MVKH    .S2     _tmp_string,B4    ; |215| 
||         MVKH    .S1     SL2+0,A3          ; |215| 

           MV      .S1X    B4,A4             ; |215| 
||         STW     .D2T1   A3,*+SP(4)        ; |215| 
||         MVKH    .S2     RL22,B3           ; |215| 

RL22:      ; CALL OCCURS                     ; |215| 
           MVKL    .S2     _Report,B4        ; |215| 
           MVKH    .S2     _Report,B4        ; |215| 
           B       .S2     B4                ; |215| 
           MVKL    .S2     RL24,B3           ; |215| 
           MVKH    .S2     RL24,B3           ; |215| 
           NOP             3
RL24:      ; CALL OCCURS                     ; |215| 
           MVKL    .S1     SL3+0,A0          ; |216| 

           MVKL    .S2     0x20003fc,B4      ; |216| 
||         MVKH    .S1     SL3+0,A0          ; |216| 

           MVKH    .S2     0x20003fc,B4      ; |216| 
||         STW     .D2T1   A0,*+SP(4)        ; |216| 

           LDW     .D2T2   *B4,B4            ; |216| 
           MVKL    .S1     0x20003fc,A0      ; |216| 
           MVKH    .S1     0x20003fc,A0      ; |216| 
           MVKL    .S1     _tmp_string,A4    ; |216| 
           MVKL    .S2     RL26,B3           ; |216| 
           EXTU    .S2     B4,16,24,B4       ; |216| 
           STW     .D2T2   B4,*+SP(8)        ; |216| 
           MVKL    .S2     _sprintf,B4       ; |216| 

           MVKH    .S2     _sprintf,B4       ; |216| 
||         LDW     .D1T1   *A0,A0            ; |216| 

           B       .S2     B4                ; |216| 
           MVKH    .S2     RL26,B3           ; |216| 
           MVKH    .S1     _tmp_string,A4    ; |216| 
           NOP             1
           EXTU    .S1     A0,24,24,A0       ; |216| 
           STW     .D2T1   A0,*+SP(12)       ; |216| 
RL26:      ; CALL OCCURS                     ; |216| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _Report,A0        ; |216| 
           MVKH    .S1     _Report,A0        ; |216| 
           B       .S2X    A0                ; |216| 
           MVKL    .S2     RL28,B3           ; |216| 
           MVKH    .S2     RL28,B3           ; |216| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |216| 
           MVKL    .S2     _GIE,B6           ; |222| 
           MVKH    .S2     _GIE,B6           ; |222| 
           B       .S2     B6                ; |222| 
           MVKL    .S2     _TFlag,B4         ; |218| 
           MVKL    .S1     0x2000104,A0      ; |220| 

           ZERO    .D2     B5                ; |218| 
||         MVKH    .S2     _TFlag,B4         ; |218| 
||         MVK     .S1     1,A3              ; |220| 

           MVKH    .S1     0x2000104,A0      ; |220| 
||         MVKL    .S2     RL30,B3           ; |222| 
||         STW     .D2T2   B5,*B4            ; |218| 

           MVKH    .S2     RL30,B3           ; |222| 
||         STW     .D1T1   A3,*A0            ; |220| 

RL30:      ; CALL OCCURS                     ; |222| 
           MVKL    .S1     _WaitTFlagCnt,A0  ; |224| 
           MVKH    .S1     _WaitTFlagCnt,A0  ; |224| 
           B       .S2X    A0                ; |224| 
           MVKL    .S2     RL32,B3           ; |224| 
           MVK     .S1     0x64,A4           ; |224| 
           MVKH    .S2     RL32,B3           ; |224| 
           NOP             2
RL32:      ; CALL OCCURS                     ; |224| 
           MVKL    .S2     _BLDCDrive,B4     ; |350| 

           MVKH    .S2     _BLDCDrive,B4     ; |350| 
||         MVKL    .S1     _duty,A0          ; |350| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L13:    

           B       .S2     B4                ; |350| 
||         MVKH    .S1     _duty,A0          ; |350| 

           LDW     .D1T1   *A0,A4            ; |350| 
           MVKL    .S2     RL48,B3           ; |350| 
           MVKH    .S2     RL48,B3           ; |350| 
           NOP             2
RL48:      ; CALL OCCURS                     ; |350| 
           B       .S1     L13               ; |351| 
           MVKL    .S2     _BLDCDrive,B4     ; |350| 
           MVKL    .S1     _duty,A0          ; |350| 
           MVKH    .S2     _BLDCDrive,B4     ; |350| 
           NOP             2
           ; BRANCH OCCURS                   ; |351| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	13,10,13,10,0
SL2:	.string	"Mechatronics Course %d",13,10,0
SL3:	.string	"FPGA Ver. %2x.%02x",13,10,0
;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_sprintf
	.global	_InitUART
	.global	_Report
	.global	_InitUSBMon
	.global	_tmp_string
	.global	_TFlag
	.global	__divf
