;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Wed May 06 12:49:37 2026                                *
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


	.sect	".const"
	.align 4
_full_step_phase:
	.field  	2,32			; _full_step_phase[0] @ 0
	.field  	8,32			; _full_step_phase[1] @ 32
	.field  	1,32			; _full_step_phase[2] @ 64
	.field  	4,32			; _full_step_phase[3] @ 96
	.sect	".text"
	.global	_full_step_phase
	.global	_vel_profile
_vel_profile:	.usect	.far,800,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_mon_angle+0,32
	.word	000000000h		; _mon_angle @ 0
	.sect	".text"
	.global	_mon_angle
_mon_angle:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_mon_vel+0,32
	.word	000000000h		; _mon_vel @ 0
	.sect	".text"
	.global	_mon_vel
_mon_vel:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_phase_idx$1+0,32
	.field  	0,32			; _phase_idx$1 @ 0
	.sect	".text"
_phase_idx$1:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\W10\AppData\Local\Temp\TI5584_2 --template_info_file C:\Users\W10\AppData\Local\Temp\TI5584_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
           ZERO    .D1     A0                ; |27| 
           MVKH    .S1     0x1800000,A0      ; |27| 
           LDW     .D1T1   *A0,A4            ; |27| 
           MVKL    .S2     0x1800008,B5      ; |30| 
           MVKL    .S2     0x22120821,B6     ; |42| 
           B       .S2     B3                ; |52| 

           MVKL    .S2     0x1800010,B4      ; |42| 
||         MVKL    .S1     0xd00321,A3       ; |30| 

           CLR     .S1     A4,3,5,A4         ; |27| 
||         MVKH    .S2     0x1800008,B5      ; |30| 

           STW     .D1T1   A4,*A0            ; |27| 
||         MVKH    .S2     0x22120821,B6     ; |42| 
||         MVKH    .S1     0xd00321,A3       ; |30| 

           STW     .D2T1   A3,*B5            ; |30| 
||         MVKH    .S2     0x1800010,B4      ; |42| 

           STW     .D2T2   B6,*B4            ; |42| 
           ; BRANCH OCCURS                   ; |52| 


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
           ZERO    .D2     B4                ; |57| 
           MVKH    .S2     0x1940000,B4      ; |57| 
           LDW     .D2T2   *B4,B5            ; |57| 
           MVKL    .S1     0x1940004,A0      ; |60| 
           MVKH    .S1     0x1940004,A0      ; |60| 
           ZERO    .D1     A3                ; |63| 
           MVKH    .S1     0x1940000,A3      ; |63| 
           SET     .S2     B5,8,9,B5         ; |57| 

           MVK     .S2     200,B4            ; |60| 
||         STW     .D2T2   B5,*B4            ; |57| 

           STW     .D1T2   B4,*A0            ; |60| 
           LDW     .D1T1   *A3,A0            ; |63| 
           B       .S2     B3                ; |64| 
           NOP             3
           SET     .S1     A0,6,7,A0         ; |63| 
           STW     .D1T1   A0,*A3            ; |63| 
           ; BRANCH OCCURS                   ; |64| 


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
           MVC     .S2     IER,B4            ; |69| 
           MVK     .S1     16450,A0          ; |69| 
           OR      .S2X    A0,B4,B4          ; |69| 
           MVC     .S2     B4,IER            ; |69| 
           B       .S2     B3                ; |70| 
           NOP             5
           ; BRANCH OCCURS                   ; |70| 


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
           MVC     .S2     CSR,B4            ; |75| 
           OR      .S2     1,B4,B4           ; |75| 
           MVC     .S2     B4,CSR            ; |75| 
           B       .S2     B3                ; |76| 
           NOP             5
           ; BRANCH OCCURS                   ; |76| 


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
           MV      .S2X    A4,B4             ; |80| 
           SHL     .S2     B4,4,B5           ; |83| 

           ZERO    .S2     B4                ; |83| 
||         SUBAH   .D2     B5,B4,B5          ; |83| 

           CMPLTU  .L2     B4,B5,B0          ; |83| 
   [!B0]   B       .S1     L2                ; |83| 
           SUB     .D2     SP,8,SP           ; |80| 
           STW     .D2T1   A4,*+SP(4)        ; |80| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |83| 
           NOP             2
           ; BRANCH OCCURS                   ; |83| 
;** --------------------------------------------------------------------------*
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L1:    
           SHL     .S2     B5,4,B6           ; |83| 

           SUBAH   .D2     B6,B5,B5          ; |83| 
||         ADD     .S2     1,B4,B4           ; |83| 

           CMPLTU  .L2     B4,B5,B0          ; |83| 
   [ B0]   B       .S1     L1                ; |83| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |83| 
           NOP             4
           ; BRANCH OCCURS                   ; |83| 
;** --------------------------------------------------------------------------*
L2:    
           B       .S2     B3                ; |84| 
           ADD     .D2     8,SP,SP           ; |84| 
           NOP             4
           ; BRANCH OCCURS                   ; |84| 


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
           ZERO    .D2     B7                ; |91| 
           CMPLTU  .L2X    B7,A4,B0
   [!B0]   B       .S1     L4                ; |91| 
           SUB     .D2     SP,8,SP           ; |88| 
           STW     .D2T1   A4,*+SP(4)        ; |88| 
           MV      .L2     B3,B9             ; |88| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |92| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |92| 
           ; BRANCH OCCURS                   ; |91| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L3:    
           B       .S2     B4                ; |92| 
           MVKL    .S2     RL0,B3            ; |92| 
           MVKH    .S2     RL0,B3            ; |92| 
           MVK     .S1     0x3e8,A4          ; |92| 
           NOP             2
RL0:       ; CALL OCCURS                     ; |92| 
           LDW     .D2T2   *+SP(4),B4        ; |93| 
           ADD     .D2     1,B7,B7           ; |93| 
           NOP             3
           CMPLTU  .L2     B7,B4,B0          ; |93| 
   [ B0]   B       .S1     L3                ; |93| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |92| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |92| 
           NOP             3
           ; BRANCH OCCURS                   ; |93| 
;** --------------------------------------------------------------------------*
L4:    
           B       .S2     B9                ; |94| 
           ADD     .D2     8,SP,SP           ; |94| 
           NOP             4
           ; BRANCH OCCURS                   ; |94| 


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
           MVKL    .S1     _TFlag,A0         ; |99| 
           MVKH    .S1     _TFlag,A0         ; |99| 
           LDW     .D1T1   *A0,A1            ; |99| 
           NOP             4
   [ A1]   B       .S1     L6                ; |99| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |99| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |99| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |99| 
           NOP             2
           ; BRANCH OCCURS                   ; |99| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L5:    
           NOP             2
   [!A1]   B       .S1     L5                ; |99| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |99| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |99| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |99| 
           NOP             2
           ; BRANCH OCCURS                   ; |99| 
;** --------------------------------------------------------------------------*
L6:    
           B       .S2     B3                ; |101| 
           MVKL    .S1     _TFlag,A0         ; |100| 
           MVKH    .S1     _TFlag,A0         ; |100| 
           ZERO    .D1     A3                ; |100| 
           STW     .D1T1   A3,*A0            ; |100| 
           NOP             1
           ; BRANCH OCCURS                   ; |101| 


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

           SUB     .D2     SP,8,SP           ; |105| 
||         MVKL    .S1     _TFlag,A0         ; |108| 

           STW     .D2T1   A4,*+SP(4)        ; |105| 
||         MVKH    .S1     _TFlag,A0         ; |108| 
||         ZERO    .D1     A3                ; |108| 

           STW     .D1T1   A3,*A0            ; |108| 
           LDW     .D2T2   *+SP(4),B5        ; |110| 
           ZERO    .D2     B4                ; |110| 
           STW     .D2T2   B4,*+SP(8)        ; |110| 
           MV      .S2     B3,B9             ; |105| 
           NOP             1
           CMPLTU  .L2     B4,B5,B0          ; |110| 
   [!B0]   B       .S1     L8                ; |110| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |111| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |111| 
           NOP             3
           ; BRANCH OCCURS                   ; |110| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L7:    
           B       .S2X    A0                ; |111| 
           MVKL    .S2     RL2,B3            ; |111| 
           MVKH    .S2     RL2,B3            ; |111| 
           NOP             3
RL2:       ; CALL OCCURS                     ; |111| 
           LDW     .D2T2   *+SP(8),B4        ; |112| 
           LDW     .D2T2   *+SP(4),B5        ; |112| 
           NOP             3
           ADD     .D2     1,B4,B4           ; |112| 
           CMPLTU  .L2     B4,B5,B0          ; |112| 
   [ B0]   B       .S1     L7                ; |112| 
           STW     .D2T2   B4,*+SP(8)        ; |112| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |111| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |111| 
           NOP             2
           ; BRANCH OCCURS                   ; |112| 
;** --------------------------------------------------------------------------*
L8:    
           B       .S2     B9                ; |113| 
           ADD     .D2     8,SP,SP           ; |113| 
           NOP             4
           ; BRANCH OCCURS                   ; |113| 


	.sect	".text"
	.global	_OneStepMove

;******************************************************************************
;* FUNCTION NAME: _OneStepMove                                                *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,A4,B0,B3,B4,B5,B6,B7,B8,B9,SP               *
;*   Regs Used         : A0,A1,A3,A4,B0,B3,B4,B5,B6,B7,B8,B9,SP               *
;*   Local Frame Size  : 0 Args + 8 Auto + 0 Save = 8 byte                    *
;******************************************************************************
_OneStepMove:
;** --------------------------------------------------------------------------*
           MV      .S2X    A4,B0             ; |122| 

   [ B0]   B       .S1     L9                ; |125| 
||         MVKL    .S2     _phase_idx$1,B5   ; |127| 

           MVKL    .S2     _phase_idx$1,B7   ; |135| 
           MVKL    .S2     _phase_idx$1,B6   ; |128| 

           MVKH    .S2     _phase_idx$1,B5   ; |127| 
||         SUB     .D2     SP,8,SP           ; |122| 

           STW     .D2T2   B4,*+SP(8)        ; |122| 
||         MVKH    .S2     _phase_idx$1,B7   ; |135| 
||         MVKL    .S1     _phase_idx$1,A3   ; |134| 

           MV      .L1X    B5,A0             ; |127| 
||         STW     .D2T1   A4,*+SP(4)        ; |122| 
||         MVKH    .S2     _phase_idx$1,B6   ; |128| 
||         MVKH    .S1     _phase_idx$1,A3   ; |134| 
||         MV      .L2     B3,B8             ; |122| 

           ; BRANCH OCCURS                   ; |125| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A0,A3            ; |127| 
           MVKL    .S2     _phase_idx$1,B4   ; |129| 
           MVKH    .S2     _phase_idx$1,B4   ; |129| 
           NOP             2
           ADD     .D1     1,A3,A3           ; |127| 
           STW     .D1T1   A3,*A0            ; |127| 
           LDW     .D2T2   *B6,B5            ; |128| 
           B       .S1     L10               ; |131| 
           MVKL    .S1     _phase_idx$1,A0   ; |141| 
           NOP             2

           ZERO    .D2     B5                ; |129| 
||         CMPLT   .L2     B5,4,B0           ; |128| 

   [!B0]   STW     .D2T2   B5,*B4            ; |129| 
           ; BRANCH OCCURS                   ; |131| 
;** --------------------------------------------------------------------------*
L9:    
           LDW     .D1T1   *A3,A0            ; |134| 
           MVKL    .S2     _phase_idx$1,B4   ; |136| 
           MVKH    .S2     _phase_idx$1,B4   ; |136| 
           NOP             2
           SUB     .D1     A0,1,A0           ; |134| 
           STW     .D1T1   A0,*A3            ; |134| 
           LDW     .D2T2   *B7,B5            ; |135| 
           MVK     .S1     3,A0              ; |136| 
           NOP             3
           CMPLT   .L2     B5,0,B0           ; |135| 
   [ B0]   STW     .D2T1   A0,*B4            ; |136| 
           MVKL    .S1     _phase_idx$1,A0   ; |141| 
;** --------------------------------------------------------------------------*
L10:    
           MVKH    .S1     _phase_idx$1,A0   ; |141| 
           LDW     .D1T1   *A0,A3            ; |141| 
           MVKL    .S1     _full_step_phase,A0 ; |141| 
           MVKH    .S1     _full_step_phase,A0 ; |141| 
           MVKL    .S2     RL4,B3            ; |142| 
           MVKH    .S2     RL4,B3            ; |142| 
           LDW     .D1T1   *+A0[A3],A0       ; |141| 
           MVKL    .S2     0x20000c4,B5      ; |141| 
           MVKL    .S2     _WaitTFlagCnt,B4  ; |142| 
           MVKH    .S2     0x20000c4,B5      ; |141| 
           MVKH    .S2     _WaitTFlagCnt,B4  ; |142| 

           STW     .D2T1   A0,*B5            ; |141| 
||         B       .S2     B4                ; |142| 

           LDW     .D2T1   *+SP(8),A4        ; |142| 
           NOP             4
RL4:       ; CALL OCCURS                     ; |142| 
           B       .S2     B8                ; |143| 
           ADD     .D2     8,SP,SP           ; |143| 
           NOP             4
           ; BRANCH OCCURS                   ; |143| 


	.sect	".text"
	.global	_StepMoveCV

;******************************************************************************
;* FUNCTION NAME: _StepMoveCV                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 28 Auto + 4 Save = 32 byte                  *
;******************************************************************************
_StepMoveCV:
;** --------------------------------------------------------------------------*

           MV      .S2X    A4,B6             ; |147| 
||         ZERO    .D2     B7                ; |160| 

           SET     .S2     B7,31,31,B7       ; |160| 
||         MV      .L2X    A4,B5             ; |147| 
||         ZERO    .D1     A0                ; |155| 
||         STW     .D2T2   B3,*SP--(32)      ; |147| 

           XOR     .S2     B6,B7,B5          ; |160| 
||         STW     .D2T1   A4,*+SP(4)        ; |147| 
||         CMPLTSP .S1X    B5,A0,A1          ; |155| 

           MVKL    .S2     __divf,B5         ; |163| 
|| [ A1]   STW     .D2T2   B5,*+SP(4)        ; |160| 

           MVKH    .S2     __divf,B5         ; |163| 
           B       .S2     B5                ; |163| 
           LDW     .D2T1   *+SP(4),A4
           MVKL    .S1     0x3fe66666,A0     ; |163| 

           MVKH    .S1     0x3fe66666,A0     ; |163| 
||         STW     .D2T2   B4,*+SP(8)        ; |147| 
||         ZERO    .D1     A3                ; |156| 

           MVK     .S1     1,A0              ; |159| 
||         MV      .L2X    A0,B4             ; |163| 
|| [!A1]   STW     .D2T1   A3,*+SP(12)       ; |156| 
||         MVKL    .S2     RL6,B3            ; |163| 

   [ A1]   STW     .D2T1   A0,*+SP(12)       ; |159| 
||         MVKH    .S2     RL6,B3            ; |163| 

RL6:       ; CALL OCCURS                     ; |163| 
           ZERO    .D2     B4                ; |163| 
           MVKH    .S2     0x3f000000,B4     ; |163| 
           ADDSP   .L1X    B4,A4,A0          ; |163| 
           NOP             3

           MVKL    .S1     __divf,A0         ; |165| 
||         SPTRUNC .L1     A0,A3             ; |163| 

           MVKH    .S1     __divf,A0         ; |165| 
           B       .S2X    A0                ; |165| 
           LDW     .D2T2   *+SP(8),B4        ; |165| 
           MVKL    .S2     0x3fe66666,B5     ; |165| 
           MVKH    .S2     0x3fe66666,B5     ; |165| 
           MVKL    .S2     RL8,B3            ; |165| 

           MVKH    .S2     RL8,B3            ; |165| 
||         STW     .D2T1   A3,*+SP(16)       ; |163| 
||         MV      .S1X    B5,A4             ; |165| 

RL8:       ; CALL OCCURS                     ; |165| 
           MVKL    .S1     0x47c35000,A0     ; |167| 
           MVKH    .S1     0x47c35000,A0     ; |167| 

           ZERO    .D1     A0                ; |169| 
||         MPYSP   .M1     A0,A4,A3

           STW     .D2T1   A0,*+SP(28)       ; |169| 
           LDW     .D2T2   *+SP(28),B5       ; |169| 
           LDW     .D2T2   *+SP(16),B4       ; |169| 
           STW     .D2T1   A4,*+SP(20)       ; |165| 
           NOP             3
           CMPLTU  .L2     B5,B4,B0          ; |169| 

           SPTRUNC .L1     A3,A0             ; |167| 
|| [!B0]   B       .S1     L12               ; |169| 

           NOP             3
           STW     .D2T1   A0,*+SP(24)       ; |167| 
   [ B0]   MVKL    .S1     _OneStepMove,A0   ; |170| 
           ; BRANCH OCCURS                   ; |169| 
;** --------------------------------------------------------------------------*
           MVKH    .S1     _OneStepMove,A0   ; |170| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L11:    

           B       .S2X    A0                ; |170| 
||         LDW     .D2T2   *+SP(24),B4       ; |170| 

           LDW     .D2T1   *+SP(12),A4       ; |170| 
           MVKL    .S2     RL10,B3           ; |170| 
           MVKH    .S2     RL10,B3           ; |170| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |170| 
           LDW     .D2T2   *+SP(28),B4       ; |171| 
           NOP             4
           ADD     .D2     1,B4,B4           ; |171| 
           STW     .D2T2   B4,*+SP(28)       ; |171| 
           LDW     .D2T2   *+SP(28),B5       ; |171| 
           LDW     .D2T2   *+SP(16),B4       ; |171| 
           NOP             4
           CMPLTU  .L2     B5,B4,B0          ; |171| 
   [ B0]   B       .S1     L11               ; |171| 
   [ B0]   MVKL    .S1     _OneStepMove,A0   ; |170| 
   [ B0]   MVKH    .S1     _OneStepMove,A0   ; |170| 
           NOP             3
           ; BRANCH OCCURS                   ; |171| 
;** --------------------------------------------------------------------------*
L12:    
           LDW     .D2T2   *++SP(32),B3      ; |172| 
           NOP             4
           B       .S2     B3                ; |172| 
           NOP             5
           ; BRANCH OCCURS                   ; |172| 


	.sect	".text"
	.global	_MakeVelProfile

;******************************************************************************
;* FUNCTION NAME: _MakeVelProfile                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 8 Args + 28 Auto + 4 Save = 40 byte                  *
;******************************************************************************
_MakeVelProfile:
;** --------------------------------------------------------------------------*
           ZERO    .D1     A0                ; |191| 

           MVKH    .S1     0x40000000,A0     ; |191| 
||         STW     .D2T2   B3,*SP--(40)      ; |183| 

           MVKL    .S1     __divf,A0         ; |191| 
||         MPYSP   .M2X    B4,A0,B4          ; |191| 
||         STW     .D2T2   B4,*+SP(16)       ; |183| 

           MVKH    .S1     __divf,A0         ; |191| 
||         MV      .S2X    A4,B5

           B       .S2X    A0                ; |191| 

           MPYSP   .M2X    A4,B5,B5
||         STW     .D2T2   B5,*+SP(12)       ; |183| 

           MVKL    .S2     RL12,B3           ; |191| 
           MVKH    .S2     RL12,B3           ; |191| 
           NOP             1
           MV      .S1X    B5,A4             ; |191| 
RL12:      ; CALL OCCURS                     ; |191| 
           MVKL    .S1     __divf,A0         ; |193| 
           MVKH    .S1     __divf,A0         ; |193| 
           B       .S2X    A0                ; |193| 
           MVKL    .S2     0x3fe66666,B4     ; |193| 
           MVKL    .S2     RL14,B3           ; |193| 
           MVKH    .S2     0x3fe66666,B4     ; |193| 
           MVKH    .S2     RL14,B3           ; |193| 
           STW     .D2T1   A4,*+SP(24)       ; |191| 
RL14:      ; CALL OCCURS                     ; |193| 
           ZERO    .D1     A0                ; |193| 
           MVKH    .S1     0x3f000000,A0     ; |193| 
           ADDSP   .L1     A0,A4,A0          ; |193| 
           MVKL    .S2     _sprintf,B6       ; |195| 
           MVKH    .S2     _sprintf,B6       ; |195| 
           MVKL    .S2     SL1+0,B4          ; |195| 

           B       .S2     B6                ; |195| 
||         SPTRUNC .L1     A0,A0             ; |193| 

           MVKH    .S2     SL1+0,B4          ; |195| 
           STW     .D2T2   B4,*+SP(4)        ; |195| 
           MVKL    .S2     RL16,B3           ; |195| 

           MV      .L2X    A0,B5             ; |195| 
||         MVKL    .S1     _tmp_string,A4    ; |195| 
||         STW     .D2T1   A0,*+SP(28)       ; |193| 

           MVKH    .S2     RL16,B3           ; |195| 
||         MVKH    .S1     _tmp_string,A4    ; |195| 
||         STW     .D2T2   B5,*+SP(8)        ; |195| 

RL16:      ; CALL OCCURS                     ; |195| 
           MVKL    .S1     _Report,A0        ; |195| 
           MVKH    .S1     _Report,A0        ; |195| 
           B       .S2X    A0                ; |195| 
           MVKL    .S2     RL18,B3           ; |195| 
           MVKH    .S2     RL18,B3           ; |195| 
           NOP             3
RL18:      ; CALL OCCURS                     ; |195| 
           MVK     .S2     1,B4              ; |198| 
           STW     .D2T2   B4,*+SP(20)       ; |198| 

           LDW     .D2T2   *+SP(28),B4       ; |198| 
||         MV      .S2     B4,B5             ; |198| 

           NOP             4
           CMPGTU  .L2     B5,B4,B0          ; |198| 
   [ B0]   B       .S1     L14               ; |198| 
   [ B0]   LDW     .D2T1   *+SP(28),A4       ; |207| 
   [ B0]   LDW     .D2T2   *++SP(40),B3      ; |208| 
   [!B0]   LDW     .D2T2   *+SP(16),B5       ; |199| 
   [!B0]   LDW     .D2T2   *+SP(20),B4       ; |199| 
           NOP             1
           ; BRANCH OCCURS                   ; |198| 
;** --------------------------------------------------------------------------*
           ZERO    .D1     A0                ; |199| 
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L13:    
           MVKH    .S1     0x40000000,A0     ; |199| 

           INTSPU  .L2     B4,B4             ; |199| 
||         MVKL    .S1     __divf,A0         ; |199| 
||         MPYSP   .M2X    B5,A0,B6          ; |199| 

           MVKH    .S1     __divf,A0         ; |199| 
           B       .S2X    A0                ; |199| 
           MVKL    .S2     RL20,B3           ; |199| 
           MPYSP   .M2     B4,B6,B4          ; |199| 
           MVKL    .S2     0x3fe66666,B5     ; |199| 
           MVKH    .S2     0x3fe66666,B5     ; |199| 

           MV      .S1X    B5,A4             ; |199| 
||         MVKH    .S2     RL20,B3           ; |199| 

RL20:      ; CALL OCCURS                     ; |199| 
           MVKL    .S2     _sqrtf,B4         ; |199| 
           MVKH    .S2     _sqrtf,B4         ; |199| 
           B       .S2     B4                ; |199| 
           MVKL    .S2     RL22,B3           ; |199| 
           MVKH    .S2     RL22,B3           ; |199| 
           NOP             3
RL22:      ; CALL OCCURS                     ; |199| 
           MVKL    .S1     0x47c35000,A0     ; |201| 
           MVKH    .S1     0x47c35000,A0     ; |201| 
           MPYSP   .M1     A0,A4,A0
           ZERO    .D2     B4                ; |201| 
           MVKH    .S2     0x3f000000,B4     ; |201| 
           LDW     .D2T2   *+SP(20),B5       ; |203| 
           ADDSP   .L1X    B4,A0,A0          ; |201| 
           STW     .D2T1   A4,*+SP(32)       ; |199| 
           MVKL    .S1     _tmp_string,A4    ; |204| 
           MVKH    .S1     _tmp_string,A4    ; |204| 
           SPTRUNC .L1     A0,A0             ; |201| 
           SHL     .S2     B5,2,B5           ; |203| 
           SUB     .D2     B5,4,B5           ; |203| 
           MVKL    .S2     RL24,B3           ; |204| 

           MVKL    .S1     _vel_profile,A0   ; |203| 
||         STW     .D2T1   A0,*+SP(36)       ; |201| 
||         MV      .L2X    A0,B4             ; |201| 

           MVKH    .S1     _vel_profile,A0   ; |203| 
           ADD     .S1X    A0,B5,A0          ; |203| 

           MVKL    .S1     _sprintf,A0       ; |204| 
||         STW     .D1T2   B4,*A0            ; |203| 

           MVKH    .S1     _sprintf,A0       ; |204| 
||         LDW     .D2T2   *+SP(36),B4       ; |204| 

           B       .S2X    A0                ; |204| 
           MVKL    .S2     SL2+0,B5          ; |204| 
           MVKH    .S2     SL2+0,B5          ; |204| 
           STW     .D2T2   B5,*+SP(4)        ; |204| 
           STW     .D2T2   B4,*+SP(8)        ; |204| 
           MVKH    .S2     RL24,B3           ; |204| 
RL24:      ; CALL OCCURS                     ; |204| 
           MVKL    .S2     _Report,B4        ; |204| 
           MVKH    .S2     _Report,B4        ; |204| 
           B       .S2     B4                ; |204| 
           MVKL    .S2     RL26,B3           ; |204| 
           MVKH    .S2     RL26,B3           ; |204| 
           NOP             3
RL26:      ; CALL OCCURS                     ; |204| 
           LDW     .D2T2   *+SP(20),B4       ; |205| 
           NOP             4

           ADD     .D2     1,B4,B4
||         ADD     .S2     1,B4,B5

           STW     .D2T2   B4,*+SP(20)       ; |205| 
           LDW     .D2T2   *+SP(28),B4       ; |205| 
           NOP             4
           CMPGTU  .L2     B5,B4,B0          ; |205| 
   [!B0]   B       .S1     L13               ; |205| 
   [!B0]   LDW     .D2T2   *+SP(16),B5       ; |199| 
   [!B0]   LDW     .D2T2   *+SP(20),B4       ; |199| 
   [ B0]   LDW     .D2T1   *+SP(28),A4       ; |207| 
   [ B0]   LDW     .D2T2   *++SP(40),B3      ; |208| 
   [!B0]   ZERO    .D1     A0                ; |199| 
           ; BRANCH OCCURS                   ; |205| 
;** --------------------------------------------------------------------------*
           NOP             2
;** --------------------------------------------------------------------------*
L14:    
           NOP             1
           B       .S2     B3                ; |208| 
           NOP             5
           ; BRANCH OCCURS                   ; |208| 


	.sect	".text"
	.global	_StepMoveVP

;******************************************************************************
;* FUNCTION NAME: _StepMoveVP                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 8 Args + 36 Auto + 4 Save = 48 byte                  *
;******************************************************************************
_StepMoveVP:
;** --------------------------------------------------------------------------*
           STW     .D2T2   B3,*SP--(48)      ; |212| 
           STW     .D2T1   A6,*+SP(20)       ; |212| 

           STW     .D2T1   A4,*+SP(12)       ; |212| 
||         MVKL    .S1     0x3fe66666,A6     ; |234| 
||         MV      .L1X    B4,A0             ; |212| 
||         MV      .D1     A6,A5
||         MV      .S2X    A6,B8

           MVKH    .S1     0x3fe66666,A6     ; |234| 
||         MV      .D1     A4,A0
||         STW     .D2T1   A0,*+SP(16)       ; |212| 
||         ZERO    .S2     B4                ; |226| 
||         ZERO    .L1     A3                ; |221| 

           LDW     .D2T1   *+SP(16),A4       ; |230| 
||         CMPLTSP .S1     A0,A3,A1          ; |221| 
||         SET     .S2     B4,31,31,B4       ; |226| 
||         MV      .L2X    A4,B5

           MVK     .S1     1,A0              ; |225| 
||         XOR     .S2     B5,B4,B4          ; |226| 

           MVKL    .S1     __divf,A6         ; |234| 
||         MV      .S2X    A6,B4             ; |234| 
|| [ A1]   STW     .D2T2   B4,*+SP(12)       ; |226| 

           MVKH    .S1     __divf,A6         ; |234| 
|| [!A1]   STW     .D2T1   A3,*+SP(24)       ; |222| 

           B       .S2X    A6                ; |234| 
|| [ A1]   STW     .D2T1   A0,*+SP(24)       ; |225| 

           LDW     .D2T1   *+SP(12),A4
||         CMPLTSP .S1     A4,A3,A1          ; |230| 
||         MV      .S2X    A4,B6             ; |230| 
||         ZERO    .L2     B5                ; |230| 

           SET     .S2     B5,31,31,B5       ; |230| 
||         ZERO    .D2     B9                ; |231| 

           ZERO    .D1     A0                ; |231| 
||         XOR     .L2     B6,B5,B5          ; |230| 
||         SET     .S2     B9,31,31,B9       ; |231| 

           CMPLTSP .S1     A5,A0,A1          ; |231| 
||         XOR     .L2     B8,B9,B5          ; |231| 
|| [ A1]   STW     .D2T2   B5,*+SP(16)       ; |230| 
||         MVKL    .S2     RL28,B3           ; |234| 

   [ A1]   STW     .D2T2   B5,*+SP(20)       ; |231| 
||         MVKH    .S2     RL28,B3           ; |234| 

RL28:      ; CALL OCCURS                     ; |234| 
           ZERO    .D2     B4                ; |234| 
           MVKH    .S2     0x3f000000,B4     ; |234| 
           ADDSP   .L1X    B4,A4,A0          ; |234| 
           MVKL    .S1     _sprintf,A3       ; |235| 
           MVKH    .S1     _sprintf,A3       ; |235| 
           MVKL    .S1     _tmp_string,A4    ; |235| 
           SPTRUNC .L1     A0,A0             ; |234| 
           MVKL    .S2     RL30,B3           ; |235| 
           MVKH    .S1     _tmp_string,A4    ; |235| 
           MVKH    .S2     RL30,B3           ; |235| 
           STW     .D2T1   A0,*+SP(28)       ; |234| 

           B       .S2X    A3                ; |235| 
||         LDW     .D2T2   *+SP(28),B4       ; |235| 

           MVKL    .S1     SL3+0,A0          ; |235| 
           MVKH    .S1     SL3+0,A0          ; |235| 
           STW     .D2T1   A0,*+SP(4)        ; |235| 
           NOP             1
           STW     .D2T2   B4,*+SP(8)        ; |235| 
RL30:      ; CALL OCCURS                     ; |235| 
           MVKL    .S2     _Report,B4        ; |235| 
           MVKH    .S2     _Report,B4        ; |235| 
           B       .S2     B4                ; |235| 
           MVKL    .S2     RL32,B3           ; |235| 
           MVKH    .S2     RL32,B3           ; |235| 
           NOP             3
RL32:      ; CALL OCCURS                     ; |235| 
           MVKL    .S1     _MakeVelProfile,A0 ; |238| 
           MVKH    .S1     _MakeVelProfile,A0 ; |238| 

           B       .S2X    A0                ; |238| 
||         LDW     .D2T1   *+SP(16),A4       ; |238| 

           LDW     .D2T2   *+SP(20),B4       ; |238| 
           MVKL    .S2     RL34,B3           ; |238| 
           MVKH    .S2     RL34,B3           ; |238| 
           NOP             2
RL34:      ; CALL OCCURS                     ; |238| 
           ZERO    .D2     B5                ; |246| 
           STW     .D2T2   B5,*+SP(36)       ; |246| 
           LDW     .D2T2   *+SP(28),B6       ; |242| 
           LDW     .D2T2   *+SP(36),B8       ; |246| 
           MV      .S2X    A4,B4
           ADD     .S2X    A4,B4,B4
           STW     .D2T1   A4,*+SP(32)       ; |238| 

           CMPGTU  .L2     B4,B6,B0
||         SHRU    .S2     B6,1,B4           ; |242| 

           CMPLTU  .L2     B8,B6,B0
|| [ B0]   STW     .D2T2   B4,*+SP(32)       ; |242| 

   [!B0]   LDW     .D2T2   *++SP(48),B3      ; |271| 
           NOP             4
   [!B0]   B       .S2     B3                ; |271| 
           NOP             5
           ; BRANCH OCCURS                   ; |271| ; chained return
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(32),B4       ; |247| 
           LDW     .D2T2   *+SP(36),B5       ; |247| 
           NOP             3
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L15:    
           NOP             1
           CMPLTU  .L2     B5,B4,B0          ; |247| 

   [ B0]   LDW     .D2T2   *+SP(36),B4       ; |248| 
|| [ B0]   B       .S1     L16               ; |249| 

           NOP             4
   [ B0]   STW     .D2T2   B4,*+SP(40)       ; |248| 
           ; BRANCH OCCURS                   ; |249| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(32),B6       ; |250| 
           LDW     .D2T2   *+SP(28),B5       ; |250| 
           LDW     .D2T2   *+SP(36),B4       ; |250| 
           NOP             3
           SUB     .D2     B5,B6,B5          ; |250| 
           CMPLTU  .L2     B4,B5,B0          ; |250| 
   [ B0]   LDW     .D2T2   *+SP(32),B4       ; |254| 
   [!B0]   LDW     .D2T2   *+SP(28),B4       ; |251| 
   [!B0]   LDW     .D2T2   *+SP(36),B5       ; |251| 
           NOP             4

   [!B0]   SUB     .D2     B4,B5,B4          ; |251| 
|| [ B0]   SUB     .S2     B4,1,B4           ; |254| 

   [!B0]   SUB     .S2     B4,1,B4           ; |251| 
|| [ B0]   STW     .D2T2   B4,*+SP(40)       ; |254| 

   [!B0]   STW     .D2T2   B4,*+SP(40)       ; |251| 
;** --------------------------------------------------------------------------*
L16:    
           LDW     .D2T2   *+SP(40),B5       ; |257| 
           LDW     .D2T2   *+SP(24),B0       ; |260| 
           MVKL    .S2     _vel_profile,B4   ; |257| 
           MVKH    .S2     _vel_profile,B4   ; |257| 
           NOP             2

           LDW     .D2T2   *+B4[B5],B4       ; |257| 
|| [ B0]   B       .S1     L17               ; |260| 

   [!B0]   MVKL    .S1     _mon_angle,A0     ; |261| 
           NOP             3
           STW     .D2T2   B4,*+SP(44)       ; |257| 
           ; BRANCH OCCURS                   ; |260| 
;** --------------------------------------------------------------------------*
           MVKH    .S1     _mon_angle,A0     ; |261| 
           LDW     .D1T1   *A0,A3            ; |261| 
           MVKL    .S2     0x3fe66666,B4     ; |261| 
           MVKH    .S2     0x3fe66666,B4     ; |261| 
           MVKL    .S2     RL36,B3           ; |262| 
           MVKL    .S1     0x482fc800,A4     ; |262| 
           ADDSP   .L2X    B4,A3,B4          ; |261| 
           MVKH    .S2     RL36,B3           ; |262| 
           MVKH    .S1     0x482fc800,A4     ; |262| 
           NOP             1
           STW     .D1T2   B4,*A0            ; |261| 
           LDW     .D2T2   *+SP(44),B4       ; |262| 
           MVKL    .S1     __divf,A0         ; |262| 
           MVKH    .S1     __divf,A0         ; |262| 
           B       .S2X    A0                ; |262| 
           NOP             1
           INTSPU  .L2     B4,B4             ; |262| 
           NOP             3
RL36:      ; CALL OCCURS                     ; |262| 
           B       .S1     L18               ; |263| 
           MVKL    .S2     _mon_vel,B4       ; |266| 
           MVKL    .S1     _OneStepMove,A0   ; |269| 
           MVKH    .S2     _mon_vel,B4       ; |266| 
           MVKH    .S1     _OneStepMove,A0   ; |269| 
           STW     .D2T1   A4,*B4            ; |266| 
           ; BRANCH OCCURS                   ; |263| 
;** --------------------------------------------------------------------------*
L17:    
           MVKL    .S1     _mon_angle,A0     ; |265| 
           MVKH    .S1     _mon_angle,A0     ; |265| 
           LDW     .D1T1   *A0,A3            ; |265| 
           MVKL    .S2     0x3fe66666,B4     ; |265| 
           MVKH    .S2     0x3fe66666,B4     ; |265| 
           MVKL    .S2     RL38,B3           ; |266| 
           MVKL    .S1     0xc82fc800,A4     ; |266| 
           SUBSP   .L2X    A3,B4,B4          ; |265| 
           MVKH    .S2     RL38,B3           ; |266| 
           MVKH    .S1     0xc82fc800,A4     ; |266| 
           NOP             1
           STW     .D1T2   B4,*A0            ; |265| 
           LDW     .D2T2   *+SP(44),B4       ; |266| 
           MVKL    .S1     __divf,A0         ; |266| 
           MVKH    .S1     __divf,A0         ; |266| 
           B       .S2X    A0                ; |266| 
           NOP             1
           INTSPU  .L2     B4,B4             ; |266| 
           NOP             3
RL38:      ; CALL OCCURS                     ; |266| 
           MVKL    .S2     _mon_vel,B4       ; |266| 

           MVKL    .S1     _OneStepMove,A0   ; |269| 
||         MVKH    .S2     _mon_vel,B4       ; |266| 

           MVKH    .S1     _OneStepMove,A0   ; |269| 
||         STW     .D2T1   A4,*B4            ; |266| 

;** --------------------------------------------------------------------------*
L18:    

           B       .S2X    A0                ; |269| 
||         LDW     .D2T1   *+SP(24),A4       ; |269| 

           LDW     .D2T2   *+SP(44),B4       ; |269| 
           MVKL    .S2     RL40,B3           ; |269| 
           MVKH    .S2     RL40,B3           ; |269| 
           NOP             2
RL40:      ; CALL OCCURS                     ; |269| 
           LDW     .D2T2   *+SP(36),B4       ; |270| 
           NOP             4
           ADD     .D2     1,B4,B4           ; |270| 
           STW     .D2T2   B4,*+SP(36)       ; |270| 
           LDW     .D2T2   *+SP(36),B5       ; |270| 
           LDW     .D2T2   *+SP(28),B4       ; |270| 
           NOP             4
           CMPLTU  .L2     B5,B4,B0          ; |270| 
   [ B0]   B       .S1     L15               ; |270| 
   [ B0]   LDW     .D2T2   *+SP(32),B4       ; |247| 
   [ B0]   LDW     .D2T2   *+SP(36),B5       ; |247| 
   [!B0]   LDW     .D2T2   *++SP(48),B3      ; |271| 
           NOP             2
           ; BRANCH OCCURS                   ; |270| 
;** --------------------------------------------------------------------------*
           NOP             2
           B       .S2     B3                ; |271| 
           NOP             5
           ; BRANCH OCCURS                   ; |271| 


	.sect	".text"
	.global	_main

;******************************************************************************
;* FUNCTION NAME: _main                                                       *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 16 Args + 4 Auto + 4 Save = 24 byte                  *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _InitEXINTF,A0    ; |277| 
           MVKH    .S1     _InitEXINTF,A0    ; |277| 
           B       .S2X    A0                ; |277| 
           ZERO    .L2     B4                ; |275| 
           STW     .D2T2   B3,*SP--(24)      ; |274| 
           MVKL    .S2     RL42,B3           ; |277| 
           STW     .D2T2   B4,*+SP(20)       ; |275| 
           MVKH    .S2     RL42,B3           ; |277| 
RL42:      ; CALL OCCURS                     ; |277| 
           MVKL    .S1     _InitTimer,A0     ; |278| 
           MVKH    .S1     _InitTimer,A0     ; |278| 
           B       .S2X    A0                ; |278| 
           MVKL    .S2     RL44,B3           ; |278| 
           MVKH    .S2     RL44,B3           ; |278| 
           NOP             3
RL44:      ; CALL OCCURS                     ; |278| 
           MVKL    .S2     _InitUART,B4      ; |279| 
           MVKH    .S2     _InitUART,B4      ; |279| 
           B       .S2     B4                ; |279| 
           MVKL    .S2     RL46,B3           ; |279| 
           MVKH    .S2     RL46,B3           ; |279| 
           NOP             3
RL46:      ; CALL OCCURS                     ; |279| 
           MVKL    .S1     _InitINT,A0       ; |280| 
           MVKH    .S1     _InitINT,A0       ; |280| 
           B       .S2X    A0                ; |280| 
           MVKL    .S2     RL48,B3           ; |280| 
           MVKH    .S2     RL48,B3           ; |280| 
           NOP             3
RL48:      ; CALL OCCURS                     ; |280| 
           MVKL    .S1     _InitUSBMon,A0    ; |281| 
           MVKH    .S1     _InitUSBMon,A0    ; |281| 
           B       .S2X    A0                ; |281| 
           MVKL    .S2     RL50,B3           ; |281| 
           MVKH    .S2     RL50,B3           ; |281| 
           NOP             3
RL50:      ; CALL OCCURS                     ; |281| 
           MVKL    .S1     _sprintf,A0       ; |283| 

           MVKL    .S2     SL4+0,B4          ; |283| 
||         MVKH    .S1     _sprintf,A0       ; |283| 

           B       .S2X    A0                ; |283| 
           MVKL    .S2     RL52,B3           ; |283| 
           MVKL    .S2     _tmp_string,B5    ; |283| 
           MVKH    .S2     SL4+0,B4          ; |283| 
           MVKH    .S2     _tmp_string,B5    ; |283| 

           MV      .S1X    B5,A4             ; |283| 
||         MVKH    .S2     RL52,B3           ; |283| 
||         STW     .D2T2   B4,*+SP(4)        ; |283| 

RL52:      ; CALL OCCURS                     ; |283| 
           MVKL    .S1     _Report,A0        ; |283| 
           MVKH    .S1     _Report,A0        ; |283| 
           B       .S2X    A0                ; |283| 
           MVKL    .S2     RL54,B3           ; |283| 
           MVKH    .S2     RL54,B3           ; |283| 
           NOP             3
RL54:      ; CALL OCCURS                     ; |283| 
           MVK     .S1     2026,A0           ; |284| 

           MVKL    .S1     _sprintf,A0       ; |284| 
||         STW     .D2T1   A0,*+SP(8)        ; |284| 

           MVKL    .S2     SL5+0,B4          ; |284| 
||         MVKH    .S1     _sprintf,A0       ; |284| 

           B       .S2X    A0                ; |284| 
           MVKH    .S2     SL5+0,B4          ; |284| 
           MVKL    .S2     _tmp_string,B5    ; |284| 
           MVKL    .S2     RL56,B3           ; |284| 
           MVKH    .S2     _tmp_string,B5    ; |284| 

           STW     .D2T2   B4,*+SP(4)        ; |284| 
||         MV      .S1X    B5,A4             ; |284| 
||         MVKH    .S2     RL56,B3           ; |284| 

RL56:      ; CALL OCCURS                     ; |284| 
           MVKL    .S1     _Report,A0        ; |284| 
           MVKH    .S1     _Report,A0        ; |284| 
           B       .S2X    A0                ; |284| 
           MVKL    .S2     RL58,B3           ; |284| 
           MVKH    .S2     RL58,B3           ; |284| 
           NOP             3
RL58:      ; CALL OCCURS                     ; |284| 
           MVKL    .S2     0x20003fc,B5      ; |285| 
           MVKL    .S2     SL6+0,B4          ; |285| 
           MVKH    .S2     SL6+0,B4          ; |285| 

           STW     .D2T2   B4,*+SP(4)        ; |285| 
||         MVKH    .S2     0x20003fc,B5      ; |285| 

           LDW     .D2T2   *B5,B4            ; |285| 
           MVKL    .S1     0x20003fc,A0      ; |285| 
           MVKH    .S1     0x20003fc,A0      ; |285| 
           MVKL    .S1     _tmp_string,A4    ; |285| 
           MVKL    .S2     RL60,B3           ; |285| 
           EXTU    .S2     B4,16,24,B4       ; |285| 
           STW     .D2T2   B4,*+SP(8)        ; |285| 

           MVKL    .S1     _sprintf,A0       ; |285| 
||         LDW     .D1T1   *A0,A3            ; |285| 

           MVKH    .S1     _sprintf,A0       ; |285| 
           B       .S2X    A0                ; |285| 
           MVKH    .S1     _tmp_string,A4    ; |285| 
           MVKH    .S2     RL60,B3           ; |285| 
           NOP             1
           EXTU    .S1     A3,24,24,A3       ; |285| 
           STW     .D2T1   A3,*+SP(12)       ; |285| 
RL60:      ; CALL OCCURS                     ; |285| 
           MVKL    .S1     _Report,A0        ; |285| 
           MVKH    .S1     _Report,A0        ; |285| 
           B       .S2X    A0                ; |285| 
           MVKL    .S2     RL62,B3           ; |285| 
           MVKH    .S2     RL62,B3           ; |285| 
           NOP             3
RL62:      ; CALL OCCURS                     ; |285| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _GIE,B4           ; |291| 
           MVKH    .S2     _GIE,B4           ; |291| 
           B       .S2     B4                ; |291| 
           MVKL    .S1     0x200004c,A0      ; |289| 
           MVKL    .S2     _TFlag,B5         ; |287| 

           MVKH    .S2     _TFlag,B5         ; |287| 
||         MVK     .S1     1,A3              ; |289| 
||         ZERO    .D2     B6                ; |287| 

           STW     .D2T2   B6,*B5            ; |287| 
||         MVKH    .S1     0x200004c,A0      ; |289| 
||         MVKL    .S2     RL64,B3           ; |291| 

           STW     .D1T1   A3,*A0            ; |289| 
||         MVKH    .S2     RL64,B3           ; |291| 

RL64:      ; CALL OCCURS                     ; |291| 
           MVKL    .S1     _WaitTFlagCnt,A0  ; |293| 
           MVKH    .S1     _WaitTFlagCnt,A0  ; |293| 
           B       .S2X    A0                ; |293| 
           MVKL    .S2     RL66,B3           ; |293| 
           MVKH    .S2     RL66,B3           ; |293| 
           MVK     .S1     0x64,A4           ; |293| 
           NOP             2
RL66:      ; CALL OCCURS                     ; |293| 
           MVKL    .S2     _StepMoveVP,B5    ; |363| 
           MVKH    .S2     _StepMoveVP,B5    ; |363| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L19:    
           B       .S2     B5                ; |363| 
           MVKL    .S2     RL96,B3           ; |363| 
           MVKL    .S1     0x47bb8000,A6     ; |363| 
           ZERO    .D2     B4                ; |363| 

           MVKH    .S2     0x457a0000,B4     ; |363| 
||         MVKH    .S1     0x47bb8000,A6     ; |363| 
||         ZERO    .D1     A4                ; |363| 

           MVKH    .S1     0x44e10000,A4     ; |363| 
||         MVKH    .S2     RL96,B3           ; |363| 

RL96:      ; CALL OCCURS                     ; |363| 
           MVKL    .S2     _WaitTFlagCnt,B4  ; |364| 
           MVKH    .S2     _WaitTFlagCnt,B4  ; |364| 
           B       .S2     B4                ; |364| 
           MVKL    .S1     0x186a0,A4        ; |364| 
           MVKL    .S2     RL98,B3           ; |364| 
           MVKH    .S1     0x186a0,A4        ; |364| 
           MVKH    .S2     RL98,B3           ; |364| 
           NOP             1
RL98:      ; CALL OCCURS                     ; |364| 
           B       .S1     L19               ; |365| 
           MVKL    .S2     _StepMoveVP,B5    ; |363| 
           MVKH    .S2     _StepMoveVP,B5    ; |363| 
           NOP             3
           ; BRANCH OCCURS                   ; |365| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	"accel_step=%3u",13,10,0
SL2:	.string	"vel_array=%3u",13,10,0
SL3:	.string	"total_step=%3u",13,10,0
SL4:	.string	13,10,13,10,0
SL5:	.string	"Mechatronics Course %d",13,10,0
SL6:	.string	"FPGA Ver%2x.%02x",13,10,0
;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_sqrtf
	.global	_sprintf
	.global	_InitUART
	.global	_Report
	.global	_InitUSBMon
	.global	_tmp_string
	.global	_TFlag
	.global	__divf
