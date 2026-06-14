;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Fri Jun 12 17:23:27 2026                                *
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
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\W10\AppData\Local\Temp\TI35788_2 --template_info_file C:\Users\W10\AppData\Local\Temp\TI35788_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
           ZERO    .D1     A3                ; |117| 

           MVKH    .S1     0x42480000,A3     ; |117| 
||         ZERO    .D1     A0                ; |117| 

           MVKH    .S1     0x42480000,A0     ; |117| 
||         STW     .D2T2   B3,*SP--(16)      ; |113| 
||         MV      .S2X    A4,B4             ; |113| 

           CMPGTSP .S1X    B4,A3,A1          ; |117| 
||         STW     .D2T1   A4,*+SP(4)        ; |113| 

   [ A1]   STW     .D2T1   A0,*+SP(4)        ; |117| 
           LDW     .D2T2   *+SP(4),B5        ; |118| 
           ZERO    .D2     B4                ; |118| 
           ZERO    .D1     A0                ; |118| 
           MVKH    .S2     0xc2480000,B4     ; |118| 
           MVKH    .S1     0xc2480000,A0     ; |118| 
           CMPLTSP .S2     B5,B4,B0          ; |118| 
   [ B0]   STW     .D2T1   A0,*+SP(4)        ; |118| 
           LDW     .D2T2   *+SP(4),B4        ; |120| 
           ZERO    .D1     A0                ; |120| 
           MVKH    .S1     0x42480000,A0     ; |120| 
           MVKL    .S2     __divf,B5         ; |120| 
           MVKH    .S2     __divf,B5         ; |120| 
           ADDSP   .L2X    A0,B4,B6          ; |120| 
           MVKL    .S2     0x457ff000,B4     ; |120| 
           MVKH    .S2     0x457ff000,B4     ; |120| 
           B       .S2     B5                ; |120| 
           MPYSP   .M2     B4,B6,B6          ; |120| 
           ZERO    .D1     A0                ; |120| 
           ZERO    .D2     B4                ; |115| 

           MVKH    .S1     0x42c80000,A0     ; |120| 
||         MVKL    .S2     RL4,B3            ; |120| 

           MV      .L2X    A0,B4             ; |120| 
||         STW     .D2T2   B4,*+SP(8)        ; |115| 
||         MV      .S1X    B6,A4             ; |120| 
||         MVKH    .S2     RL4,B3            ; |120| 

RL4:       ; CALL OCCURS                     ; |120| 
           ZERO    .D2     B4                ; |120| 
           MVKH    .S2     0x3f000000,B4     ; |120| 
           ADDSP   .L1X    B4,A4,A0          ; |120| 
           NOP             3
           SPTRUNC .L1     A0,A0             ; |120| 
           NOP             3
           STW     .D2T1   A0,*+SP(8)        ; |120| 
           LDW     .D2T2   *+SP(8),B4        ; |121| 
           MVKL    .S1     0x2000088,A0      ; |121| 
           MVKH    .S1     0x2000088,A0      ; |121| 
           NOP             2
           STW     .D1T2   B4,*A0            ; |121| 
           LDW     .D2T2   *++SP(16),B3      ; |122| 
           NOP             4
           B       .S2     B3                ; |122| 
           NOP             5
           ; BRANCH OCCURS                   ; |122| 


	.sect	".text"
	.global	_GetAngle

;******************************************************************************
;* FUNCTION NAME: _GetAngle                                                   *
;*                                                                            *
;*   Regs Modified     : A0,A1,A4,B0,B4,B5,SP                                 *
;*   Regs Used         : A0,A1,A4,B0,B3,B4,B5,SP                              *
;*   Local Frame Size  : 0 Args + 8 Auto + 0 Save = 8 byte                    *
;******************************************************************************
_GetAngle:
;** --------------------------------------------------------------------------*
           MVKL    .S2     0x20000ac,B4      ; |129| 
           MVKH    .S2     0x20000ac,B4      ; |129| 
           LDW     .D2T2   *B4,B4            ; |129| 
           SUB     .D2     SP,8,SP           ; |125| 
           ZERO    .D1     A0                ; |130| 
           MVKH    .S1     0xbeb40000,A0     ; |130| 
           NOP             1

           INTSP   .L2     B4,B4             ; |130| 
||         STW     .D2T2   B4,*+SP(8)        ; |129| 

           NOP             3
           MPYSP   .M2X    A0,B4,B4          ; |130| 
           ZERO    .D1     A0                ; |132| 
           MVKH    .S1     0x43340000,A0     ; |132| 
           NOP             1
           CMPGTSP .S1X    B4,A0,A1          ; |132| 
   [!A1]   B       .S1     L10               ; |132| 
           STW     .D2T2   B4,*+SP(4)        ; |130| 
   [!A1]   LDW     .D2T2   *+SP(4),B4        ; |134| 
   [ A1]   LDW     .D2T2   *+SP(4),B4        ; |133| 
   [!A1]   ZERO    .D1     A0                ; |134| 
           NOP             1
           ; BRANCH OCCURS                   ; |132| 
;** --------------------------------------------------------------------------*
           ZERO    .D1     A0                ; |133| 
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L9:    
           MVKH    .S1     0x43b40000,A0     ; |133| 
           SUBSP   .L2X    B4,A0,B4          ; |133| 
           NOP             3

           ZERO    .S2     B4                ; |133| 
||         MV      .L2     B4,B5             ; |133| 
||         STW     .D2T2   B4,*+SP(4)        ; |133| 

           MVKH    .S2     0x43340000,B4     ; |133| 
           CMPGTSP .S2     B5,B4,B0          ; |133| 
   [ B0]   B       .S1     L9                ; |133| 
   [ B0]   LDW     .D2T2   *+SP(4),B4        ; |133| 
   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |134| 
   [!B0]   ZERO    .D1     A0                ; |134| 
   [ B0]   ZERO    .S1     A0                ; |133| 
           NOP             1
           ; BRANCH OCCURS                   ; |133| 
;** --------------------------------------------------------------------------*
L10:    
           MVKH    .S1     0xc3340000,A0     ; |134| 
           CMPLTSP .S2X    B4,A0,B0          ; |134| 
   [!B0]   B       .S1     L12               ; |134| 
   [ B0]   LDW     .D2T2   *+SP(4),B4        ; |135| 
   [ B0]   ZERO    .D1     A0                ; |135| 
   [ B0]   MVKH    .S1     0x43b40000,A0     ; |135| 
           NOP             2
           ; BRANCH OCCURS                   ; |134| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L11:    
           ADDSP   .L2X    A0,B4,B4          ; |135| 
           NOP             3

           ZERO    .S2     B4                ; |135| 
||         MV      .L2     B4,B5             ; |135| 
||         STW     .D2T2   B4,*+SP(4)        ; |135| 

           MVKH    .S2     0xc3340000,B4     ; |135| 
           CMPLTSP .S2     B5,B4,B0          ; |135| 
   [ B0]   B       .S1     L11               ; |135| 
   [ B0]   LDW     .D2T2   *+SP(4),B4        ; |135| 
   [ B0]   ZERO    .D1     A0                ; |135| 
   [ B0]   MVKH    .S1     0x43b40000,A0     ; |135| 
           NOP             2
           ; BRANCH OCCURS                   ; |135| 
;** --------------------------------------------------------------------------*
L12:    
           B       .S2     B3                ; |138| 
           LDW     .D2T1   *+SP(4),A4        ; |137| 
           ADD     .D2     8,SP,SP           ; |138| 
           NOP             3
           ; BRANCH OCCURS                   ; |138| 


	.sect	".text"
	.global	_main

;******************************************************************************
;* FUNCTION NAME: _main                                                       *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 16 Args + 8 Auto + 4 Save = 28 byte                  *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _InitEXINTF,A0    ; |147| 
           MVKH    .S1     _InitEXINTF,A0    ; |147| 
           B       .S2X    A0                ; |147| 
           STW     .D2T2   B3,*SP--(32)      ; |143| 
           MVKL    .S2     RL6,B3            ; |147| 
           MVKH    .S2     RL6,B3            ; |147| 
           NOP             2
RL6:       ; CALL OCCURS                     ; |147| 
           MVKL    .S1     _InitTimer,A0     ; |148| 
           MVKH    .S1     _InitTimer,A0     ; |148| 
           B       .S2X    A0                ; |148| 
           MVKL    .S2     RL8,B3            ; |148| 
           MVKH    .S2     RL8,B3            ; |148| 
           NOP             3
RL8:       ; CALL OCCURS                     ; |148| 
           MVKL    .S2     _InitUART,B4      ; |149| 
           MVKH    .S2     _InitUART,B4      ; |149| 
           B       .S2     B4                ; |149| 
           MVKL    .S2     RL10,B3           ; |149| 
           MVKH    .S2     RL10,B3           ; |149| 
           NOP             3
RL10:      ; CALL OCCURS                     ; |149| 
           MVKL    .S1     _InitINT,A0       ; |150| 
           MVKH    .S1     _InitINT,A0       ; |150| 
           B       .S2X    A0                ; |150| 
           MVKL    .S2     RL12,B3           ; |150| 
           MVKH    .S2     RL12,B3           ; |150| 
           NOP             3
RL12:      ; CALL OCCURS                     ; |150| 
           MVKL    .S1     _InitUSBMon,A0    ; |151| 
           MVKH    .S1     _InitUSBMon,A0    ; |151| 
           B       .S2X    A0                ; |151| 
           MVKL    .S2     RL14,B3           ; |151| 
           MVKH    .S2     RL14,B3           ; |151| 
           NOP             3
RL14:      ; CALL OCCURS                     ; |151| 
           MVKL    .S1     _sprintf,A0       ; |153| 

           MVKH    .S1     _sprintf,A0       ; |153| 
||         MVKL    .S2     _tmp_string,B5    ; |153| 

           B       .S2X    A0                ; |153| 
           MVKL    .S2     RL16,B3           ; |153| 
           MVKH    .S2     _tmp_string,B5    ; |153| 
           MVKL    .S2     SL1+0,B4          ; |153| 
           MVKH    .S2     SL1+0,B4          ; |153| 

           MVKH    .S2     RL16,B3           ; |153| 
||         MV      .S1X    B5,A4             ; |153| 
||         STW     .D2T2   B4,*+SP(4)        ; |153| 

RL16:      ; CALL OCCURS                     ; |153| 
           MVKL    .S1     _Report,A0        ; |153| 
           MVKH    .S1     _Report,A0        ; |153| 
           B       .S2X    A0                ; |153| 
           MVKL    .S2     RL18,B3           ; |153| 
           MVKH    .S2     RL18,B3           ; |153| 
           NOP             3
RL18:      ; CALL OCCURS                     ; |153| 
           MVK     .S1     2026,A0           ; |154| 

           MVKL    .S1     _sprintf,A0       ; |154| 
||         STW     .D2T1   A0,*+SP(8)        ; |154| 

           MVKH    .S1     _sprintf,A0       ; |154| 
||         MVKL    .S2     SL2+0,B4          ; |154| 

           B       .S2X    A0                ; |154| 
           MVKH    .S2     SL2+0,B4          ; |154| 
           MVKL    .S2     _tmp_string,B5    ; |154| 
           MVKH    .S2     _tmp_string,B5    ; |154| 
           MVKL    .S2     RL20,B3           ; |154| 

           STW     .D2T2   B4,*+SP(4)        ; |154| 
||         MVKH    .S2     RL20,B3           ; |154| 
||         MV      .S1X    B5,A4             ; |154| 

RL20:      ; CALL OCCURS                     ; |154| 
           MVKL    .S1     _Report,A0        ; |154| 
           MVKH    .S1     _Report,A0        ; |154| 
           B       .S2X    A0                ; |154| 
           MVKL    .S2     RL22,B3           ; |154| 
           MVKH    .S2     RL22,B3           ; |154| 
           NOP             3
RL22:      ; CALL OCCURS                     ; |154| 
           MVKL    .S2     SL3+0,B4          ; |155| 
           MVKL    .S2     0x20003fc,B5      ; |155| 
           MVKH    .S2     SL3+0,B4          ; |155| 

           MVKH    .S2     0x20003fc,B5      ; |155| 
||         STW     .D2T2   B4,*+SP(4)        ; |155| 

           LDW     .D2T2   *B5,B4            ; |155| 
           MVKL    .S1     _sprintf,A3       ; |155| 
           MVKL    .S1     0x20003fc,A0      ; |155| 
           MVKH    .S1     0x20003fc,A0      ; |155| 
           MVKH    .S1     _sprintf,A3       ; |155| 
           EXTU    .S2     B4,16,24,B4       ; |155| 
           STW     .D2T2   B4,*+SP(8)        ; |155| 
           LDW     .D1T1   *A0,A0            ; |155| 
           B       .S2X    A3                ; |155| 
           MVKL    .S2     RL24,B3           ; |155| 
           MVKH    .S2     RL24,B3           ; |155| 
           MVKL    .S1     _tmp_string,A4    ; |155| 
           EXTU    .S1     A0,24,24,A0       ; |155| 

           STW     .D2T1   A0,*+SP(12)       ; |155| 
||         MVKH    .S1     _tmp_string,A4    ; |155| 

RL24:      ; CALL OCCURS                     ; |155| 
           MVKL    .S1     _Report,A0        ; |155| 
           MVKH    .S1     _Report,A0        ; |155| 
           B       .S2X    A0                ; |155| 
           MVKL    .S2     RL26,B3           ; |155| 
           MVKH    .S2     RL26,B3           ; |155| 
           NOP             3
RL26:      ; CALL OCCURS                     ; |155| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _GIE,B5           ; |167| 
           MVKL    .S2     _TINTCnt,B7       ; |158| 

           MVKL    .S2     0x200004c,B6      ; |160| 
||         MVKL    .S1     _TFlag,A0         ; |157| 

           MVKH    .S2     _GIE,B5           ; |167| 
||         MVK     .S1     1,A3              ; |160| 

           MVKH    .S2     _TINTCnt,B7       ; |158| 
||         MVKH    .S1     _TFlag,A0         ; |157| 
||         ZERO    .D1     A4                ; |157| 

           B       .S2     B5                ; |167| 
||         MVKL    .S1     0x2000090,A4      ; |162| 
||         STW     .D1T1   A4,*A0            ; |157| 
||         ZERO    .D2     B8                ; |158| 

           MVKH    .S1     0x2000090,A4      ; |162| 
||         STW     .D2T2   B8,*B7            ; |158| 
||         MVKH    .S2     0x200004c,B6      ; |160| 

           ZERO    .D1     A3                ; |162| 
||         STW     .D2T1   A3,*B6            ; |160| 
||         MVKL    .S1     0x2000080,A0      ; |165| 
||         MVKL    .S2     0x200008c,B4      ; |163| 

           STW     .D1T1   A3,*A4            ; |162| 
||         ZERO    .D2     B6                ; |163| 
||         MVKH    .S1     0x2000080,A0      ; |165| 
||         MVKH    .S2     0x200008c,B4      ; |163| 

           STW     .D2T2   B6,*B4            ; |163| 
||         MVK     .S1     1,A3              ; |165| 
||         MVKL    .S2     RL28,B3           ; |167| 

           STW     .D1T1   A3,*A0            ; |165| 
||         MVKH    .S2     RL28,B3           ; |167| 

RL28:      ; CALL OCCURS                     ; |167| 
           MVKL    .S1     _WaitTFlagCnt,A0  ; |169| 
           MVKH    .S1     _WaitTFlagCnt,A0  ; |169| 
           B       .S2X    A0                ; |169| 
           MVKL    .S2     RL30,B3           ; |169| 
           MVKH    .S2     RL30,B3           ; |169| 
           MVK     .S1     0x64,A4           ; |169| 
           NOP             2
RL30:      ; CALL OCCURS                     ; |169| 
           MVKL    .S1     _WaitTFlag,A0     ; |192| 
           MVKH    .S1     _WaitTFlag,A0     ; |192| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L13:    
           B       .S2X    A0                ; |192| 
           MVKL    .S2     RL48,B3           ; |192| 
           MVKH    .S2     RL48,B3           ; |192| 
           NOP             3
RL48:      ; CALL OCCURS                     ; |192| 
           B       .S1     L13               ; |193| 
           MVKL    .S1     _WaitTFlag,A0     ; |192| 
           MVKH    .S1     _WaitTFlag,A0     ; |192| 
           NOP             3
           ; BRANCH OCCURS                   ; |193| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	13,10,13,10,0
SL2:	.string	"Mechatronics Course %d",13,10,0
SL3:	.string	"FPGA Ver%2x.%02x",13,10,0
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
