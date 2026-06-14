;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Fri Jun 12 17:47:25 2026                                *
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
	.field  	_TFlag+0,32
	.field  	0,32			; _TFlag @ 0
	.sect	".text"
	.global	_TFlag
_TFlag:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_theta_p$1+0,32
	.word	000000000h		; _theta_p$1 @ 0
	.sect	".text"
_theta_p$1:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_theta_i$2+0,32
	.word	000000000h		; _theta_i$2 @ 0
	.sect	".text"
_theta_i$2:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_theta_dot$3+0,32
	.word	000000000h		; _theta_dot$3 @ 0
	.sect	".text"
_theta_dot$3:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_theta_angle_p$4+0,32
	.word	000000000h		; _theta_angle_p$4 @ 0
	.sect	".text"
_theta_angle_p$4:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_theta_dot_count$5+0,32
	.field  	0,32			; _theta_dot_count$5 @ 0
	.sect	".text"
_theta_dot_count$5:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_x_p$6+0,32
	.word	000000000h		; _x_p$6 @ 0
	.sect	".text"
_x_p$6:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_x_i$7+0,32
	.word	000000000h		; _x_i$7 @ 0
	.sect	".text"
_x_i$7:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_swing_direction$8+0,32
	.word	03f800000h		; _swing_direction$8 @ 0
	.sect	".text"
_swing_direction$8:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_swing_hold_count$9+0,32
	.field  	0,32			; _swing_hold_count$9 @ 0
	.sect	".text"
_swing_hold_count$9:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_mode$10+0,32
	.field  	0,32			; _mode$10 @ 0
	.sect	".text"
_mode$10:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\W10\AppData\Local\Temp\TI40792_2 --template_info_file C:\Users\W10\AppData\Local\Temp\TI40792_3 --object_file interrupt.obj --opt_shell 9 interrupt.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 interrupt.c 
	.sect	".text"
	.global	_ISRextint4

;******************************************************************************
;* FUNCTION NAME: _ISRextint4                                                 *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_ISRextint4:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |11| 
           NOP             5
           ; BRANCH OCCURS                   ; |11| 


	.sect	".text"
	.global	_ISRextint5

;******************************************************************************
;* FUNCTION NAME: _ISRextint5                                                 *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_ISRextint5:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |17| 
           NOP             5
           ; BRANCH OCCURS                   ; |17| 


	.sect	".text"
	.global	_c_int08

;******************************************************************************
;* FUNCTION NAME: _c_int08                                                    *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_c_int08:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |29| 
           NOP             5
           ; BRANCH OCCURS                   ; |29| 


	.sect	".text"
	.global	_c_int09

;******************************************************************************
;* FUNCTION NAME: _c_int09                                                    *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_c_int09:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |35| 
           NOP             5
           ; BRANCH OCCURS                   ; |35| 


	.sect	".text"
	.global	_ISRtimer0

;******************************************************************************
;* FUNCTION NAME: _ISRtimer0                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,B0,B1,B2,B3,B4,B5, *
;*                           B6,B7,B8,B9,B10,B11,SP                           *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,B0,B1,B2,B3,B4,B5, *
;*                           B6,B7,B8,B9,B10,B11,SP                           *
;*   Local Frame Size  : 0 Args + 48 Auto + 96 Save = 144 byte                *
;******************************************************************************
_ISRtimer0:
;** --------------------------------------------------------------------------*
           ADDK    .S2     -144,SP           ; |42| 
           STW     .D2T2   B5,*+SP(120)      ; |42| 
           STW     .D2T1   A0,*+SP(56)       ; |42| 
           STW     .D2T2   B4,*+SP(116)      ; |42| 
           STW     .D2T1   A3,*+SP(68)       ; |42| 
           STW     .D2T1   A4,*+SP(72)       ; |42| 
           STW     .D2T1   A5,*+SP(76)       ; |42| 
           STW     .D2T1   A6,*+SP(80)       ; |42| 
           STW     .D2T1   A7,*+SP(84)       ; |42| 
           STW     .D2T1   A8,*+SP(88)       ; |42| 
           STW     .D2T1   A9,*+SP(92)       ; |42| 
           STW     .D2T1   A10,*+SP(96)      ; |42| 
           STW     .D2T2   B0,*+SP(100)      ; |42| 
           STW     .D2T2   B1,*+SP(104)      ; |42| 
           STW     .D2T2   B2,*+SP(108)      ; |42| 
           STW     .D2T2   B3,*+SP(112)      ; |42| 
           STW     .D2T2   B6,*+SP(124)      ; |42| 
           STW     .D2T2   B7,*+SP(128)      ; |42| 
           STW     .D2T2   B8,*+SP(132)      ; |42| 
           STW     .D2T2   B9,*+SP(136)      ; |42| 
           STW     .D2T2   B10,*+SP(140)     ; |42| 
           STW     .D2T2   B11,*+SP(144)     ; |42| 

           MVK     .S2     1,B5              ; |76| 
||         MVKL    .S1     _TFlag,A0         ; |76| 
||         STW     .D2T1   A2,*+SP(64)       ; |42| 

           MVKH    .S1     _TFlag,A0         ; |76| 
||         MVKL    .S2     _TINTCnt,B4       ; |78| 
||         STW     .D2T1   A1,*+SP(60)       ; |42| 

           MVKL    .S1     _GetAngle,A0      ; |82| 
||         STW     .D1T2   B5,*A0            ; |76| 
||         MVKH    .S2     _TINTCnt,B4       ; |78| 

           LDW     .D2T2   *B4,B5            ; |78| 
||         MVKH    .S1     _GetAngle,A0      ; |82| 

           B       .S2X    A0                ; |82| 
           MVKL    .S2     RL0,B3            ; |82| 
           MVKH    .S2     RL0,B3            ; |82| 
           NOP             1
           ADD     .D2     1,B5,B5           ; |78| 
           STW     .D2T2   B5,*B4            ; |78| 
RL0:       ; CALL OCCURS                     ; |82| 

           MVKL    .S1     0x20000a8,A0      ; |83| 
||         MV      .S2X    A4,B4             ; |82| 

           MVKH    .S1     0x20000a8,A0      ; |83| 
||         STW     .D2T2   B4,*+SP(4)        ; |82| 

           LDW     .D1T1   *A0,A0            ; |83| 
           MVKL    .S2     _TINTCnt,B4       ; |88| 
           MVKH    .S2     _TINTCnt,B4       ; |88| 
           LDW     .D2T2   *+SP(4),B6        ; |89| 
           MVKL    .S1     _theta_dot_count$5,A3 ; |93| 
           INTSP   .L1     A0,A0             ; |83| 
           MVKH    .S1     _theta_dot_count$5,A3 ; |93| 
           NOP             2
           STW     .D2T1   A0,*+SP(24)       ; |83| 
           LDW     .D2T2   *B4,B5            ; |88| 
           MVKL    .S1     _theta_angle_p$4,A0 ; |89| 
           MVKL    .S2     _theta_dot_count$5,B4 ; |90| 
           MVKH    .S1     _theta_angle_p$4,A0 ; |89| 
           MVKH    .S2     _theta_dot_count$5,B4 ; |90| 
           CMPEQ   .L2     B5,1,B0           ; |88| 
   [ B0]   B       .S1     L2                ; |91| 
           MVKL    .S2     _theta_dot_count$5,B5 ; |95| 
   [ B0]   STW     .D1T2   B6,*A0            ; |89| 
           ZERO    .L1     A0                ; |90| 
           MVKH    .S2     _theta_dot_count$5,B5 ; |95| 
   [ B0]   STW     .D2T1   A0,*B4            ; |90| 
           ; BRANCH OCCURS                   ; |91| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A3,A0            ; |93| 
           ZERO    .D2     B4                ; |98| 
           MVKH    .S2     0x43340000,B4     ; |98| 
           NOP             2
           ADD     .D1     1,A0,A0           ; |93| 
           STW     .D1T1   A0,*A3            ; |93| 
           LDW     .D2T2   *B5,B5            ; |95| 
           LDW     .D2T1   *+SP(4),A3        ; |96| 
           NOP             3
           CMPLTU  .L2     B5,5,B0           ; |95| 
   [ B0]   B       .S1     L3                ; |95| 
           MVKL    .S1     _theta_angle_p$4,A0 ; |96| 
           MVKH    .S1     _theta_angle_p$4,A0 ; |96| 

   [!B0]   LDW     .D1T1   *A0,A0            ; |96| 
|| [ B0]   LDW     .D2T2   *+SP(4),B5        ; |112| 

           NOP             2
           ; BRANCH OCCURS                   ; |95| 
;** --------------------------------------------------------------------------*
           NOP             2
           SUBSP   .L1     A3,A0,A0          ; |96| 
           NOP             3
           MV      .S2X    A0,B7
           MV      .S2X    A0,B5

           CMPGTSP .S2     B5,B4,B0          ; |98| 
||         ZERO    .D1     A0                ; |99| 
||         STW     .D2T1   A0,*+SP(20)       ; |96| 
||         MV      .L2X    A0,B6             ; |96| 

   [ B0]   B       .S2     L1                ; |99| 
||         MVKH    .S1     0x43b40000,A0     ; |99| 

           SUBSP   .L2X    B6,A0,B8          ; |99| 
           ZERO    .D2     B6                ; |100| 
           MVKH    .S2     0xc3340000,B6     ; |100| 
           CMPLTSP .S2     B7,B6,B1          ; |100| 
   [ B0]   STW     .D2T2   B8,*+SP(20)       ; |99| 
           ; BRANCH OCCURS                   ; |99| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(20),B4       ; |101| 
           ZERO    .D1     A0                ; |101| 
           MVKH    .S1     0x43b40000,A0     ; |101| 
           NOP             2
           ADDSP   .L2X    A0,B4,B4          ; |101| 
           NOP             3
   [ B1]   STW     .D2T2   B4,*+SP(20)       ; |101| 
;** --------------------------------------------------------------------------*
L1:    
           LDW     .D2T2   *+SP(20),B4       ; |103| 
           ZERO    .D1     A0                ; |103| 
           MVKH    .S1     0x447a0000,A0     ; |103| 
           MVKL    .S2     RL2,B3            ; |103| 
           MVKH    .S2     RL2,B3            ; |103| 

           MVKL    .S1     __divf,A0         ; |103| 
||         MPYSP   .M1X    A0,B4,A4          ; |103| 

           MVKH    .S1     __divf,A0         ; |103| 
           B       .S2X    A0                ; |103| 
           ZERO    .D2     B4                ; |103| 
           MVKH    .S2     0x40a00000,B4     ; |103| 
           NOP             3
RL2:       ; CALL OCCURS                     ; |103| 
           MVKL    .S2     _theta_dot$3,B4   ; |104| 

           MVKH    .S2     _theta_dot$3,B4   ; |104| 
||         STW     .D2T1   A4,*+SP(20)       ; |103| 

           LDW     .D2T2   *B4,B5            ; |104| 
           MVKL    .S1     0x3f333333,A3     ; |104| 
           MVKH    .S1     0x3f333333,A3     ; |104| 
           MVKL    .S1     0x3e99999a,A0     ; |104| 
           MV      .S2X    A4,B4             ; |104| 

           MVKH    .S1     0x3e99999a,A0     ; |104| 
||         MPYSP   .M2X    B5,A3,B5          ; |104| 

           MPYSP   .M2X    B4,A0,B4          ; |104| 
           MVKL    .S1     _theta_angle_p$4,A0 ; |105| 
           MVKH    .S1     _theta_angle_p$4,A0 ; |105| 
           NOP             1
           ADDSP   .L2     B4,B5,B5          ; |104| 
           MVKL    .S2     _theta_dot$3,B4   ; |104| 
           MVKH    .S2     _theta_dot$3,B4   ; |104| 
           NOP             1
           STW     .D2T2   B5,*B4            ; |104| 
           LDW     .D2T2   *+SP(4),B5        ; |105| 
           MVKL    .S2     _theta_dot_count$5,B4 ; |106| 
           MVKH    .S2     _theta_dot_count$5,B4 ; |106| 
           NOP             2

           ZERO    .S1     A0                ; |106| 
||         STW     .D1T2   B5,*A0            ; |105| 

           STW     .D2T1   A0,*B4            ; |106| 
;** --------------------------------------------------------------------------*
L2:    
           LDW     .D2T2   *+SP(4),B5        ; |112| 
           NOP             1
;** --------------------------------------------------------------------------*
L3:    
           ZERO    .D2     B4                ; |112| 
           MVKH    .S2     0x43340000,B4     ; |112| 
           ZERO    .D1     A0                ; |114| 

           SUBSP   .L2     B5,B4,B4          ; |112| 
||         MVKH    .S1     0x43340000,A0     ; |114| 

           ADDSP   .L2X    A0,B5,B5
||         MV      .D2     B5,B6             ; |112| 

           ZERO    .D1     A0                ; |111| 
           CMPLTSP .S2X    B6,A0,B0          ; |111| 
   [!B0]   STW     .D2T2   B4,*+SP(16)       ; |112| 
   [ B0]   STW     .D2T2   B5,*+SP(16)       ; |114| 

           LDW     .D2T2   *+SP(16),B4       ; |120| 
||         MVKL    .S1     _mode$10,A0       ; |119| 

           MVKH    .S1     _mode$10,A0       ; |119| 
           LDW     .D1T1   *A0,A1            ; |119| 
           ZERO    .D2     B7                ; |120| 
           ZERO    .D1     A7                ; |131| 

           SPDP    .S1X    B4,A5:A4          ; |120| 
||         MV      .D2     B4,B5             ; |120| 

           SPDP    .S2     B5,B5:B4          ; |131| 
   [ A1]   B       .S1     L4                ; |119| 

           ABSDP   .S1     A5:A4,A5:A4       ; |120| 
||         ABSDP   .S2     B5:B4,B5:B4       ; |131| 

           ZERO    .D2     B6                ; |120| 

           MVKH    .S2     0x402e0000,B7     ; |120| 
||         MVKH    .S1     0x40390000,A7     ; |131| 
||         ZERO    .D1     A6                ; |131| 

           CMPGTDP .S1X    B5:B4,A7:A6,A2    ; |131| 
||         CMPLTDP .S2X    A5:A4,B7:B6,B0    ; |120| 

           NOP             1
           ; BRANCH OCCURS                   ; |119| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _theta_dot$3,A0   ; |120| 
           MVKH    .S1     _theta_dot$3,A0   ; |120| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |120| 
           MVKL    .S2     0x4062c000,B5     ; |120| 
           MVKH    .S2     0x4062c000,B5     ; |120| 
           NOP             2
   [ B0]   SPDP    .S1     A0,A1:A0          ; |120| 
           ZERO    .D2     B4                ; |120| 
   [ B0]   ABSDP   .S1     A1:A0,A1:A0       ; |120| 
           NOP             1
   [ B0]   CMPLTDP .S2X    A1:A0,B5:B4,B0    ; |120| 
           MVKL    .S1     _mode$10,A0       ; |122| 

           MV      .L1X    B0,A1             ; |120| 
||         MVKH    .S1     _mode$10,A0       ; |122| 
||         MVK     .S2     1,B4              ; |122| 

   [ A1]   STW     .D1T2   B4,*A0            ; |122| 
   [ A1]   LDW     .D2T2   *+SP(16),B6       ; |124| 
           MVKL    .S2     _theta_p$1,B5     ; |124| 
           MVKH    .S2     _theta_p$1,B5     ; |124| 
           MVKL    .S2     _theta_i$2,B4     ; |125| 
           MVKH    .S2     _theta_i$2,B4     ; |125| 

   [ A1]   STW     .D2T2   B6,*B5            ; |124| 
||         ZERO    .L2     B5                ; |125| 

   [ A1]   STW     .D2T2   B5,*B4            ; |125| 
   [ A1]   LDW     .D2T2   *+SP(24),B4       ; |126| 
           ZERO    .D1     A0                ; |126| 
           NOP             3

   [ A1]   SUBSP   .L1X    B4,A0,A4          ; |126| 
||         B       .S1     L5                ; |129| 

           MVKL    .S1     _x_i$7,A3         ; |127| 
           MVKL    .S1     _x_p$6,A0         ; |126| 
           MVKH    .S1     _x_p$6,A0         ; |126| 

           ZERO    .L1     A0                ; |127| 
||         MVKH    .S1     _x_i$7,A3         ; |127| 
|| [ A1]   STW     .D1T1   A4,*A0            ; |126| 

   [ A1]   STW     .D1T1   A0,*A3            ; |127| 
           ; BRANCH OCCURS                   ; |129| 
;** --------------------------------------------------------------------------*
L4:    
           MVKL    .S2     _mode$10,B4       ; |132| 

           MVKH    .S2     _mode$10,B4       ; |132| 
||         MVKL    .S1     _theta_p$1,A0     ; |134| 
||         ZERO    .D2     B5                ; |132| 

           MVKL    .S2     _theta_i$2,B4     ; |135| 
|| [ A2]   STW     .D2T2   B5,*B4            ; |132| 
||         MVKH    .S1     _theta_p$1,A0     ; |134| 
||         ZERO    .D1     A3                ; |134| 

           MVKL    .S1     _x_p$6,A0         ; |136| 
|| [ A2]   STW     .D1T1   A3,*A0            ; |134| 
||         MVKH    .S2     _theta_i$2,B4     ; |135| 

           MVKL    .S2     _x_i$7,B4         ; |137| 
|| [ A2]   STW     .D2T2   B5,*B4            ; |135| 
||         MVKH    .S1     _x_p$6,A0         ; |136| 

           MVKL    .S1     _swing_hold_count$9,A0 ; |138| 
|| [ A2]   STW     .D1T1   A3,*A0            ; |136| 
||         MVKH    .S2     _x_i$7,B4         ; |137| 

   [ A2]   STW     .D2T2   B5,*B4            ; |137| 
||         MVKH    .S1     _swing_hold_count$9,A0 ; |138| 

   [ A2]   STW     .D1T1   A3,*A0            ; |138| 
;** --------------------------------------------------------------------------*
L5:    
           MVKL    .S1     _mode$10,A3       ; |142| 
           MVKH    .S1     _mode$10,A3       ; |142| 
           LDW     .D1T1   *A3,A1            ; |142| 
           MVKL    .S2     _x_i$7,B6         ; |179| 

           LDW     .D2T2   *+SP(24),B9       ; |176| 
||         MVKL    .S1     0x3c8efa35,A0     ; |146| 
||         MVKL    .S2     RL4,B3            ; |147| 

           MVKL    .S2     _cos,B4           ; |147| 
||         MVKL    .S1     _theta_dot$3,A10  ; |147| 

           MVKL    .S2     _swing_hold_count$9,B10 ; |150| 
||         MVKL    .S1     _x_p$6,A4         ; |182| 
||         LDW     .D2T2   *+SP(4),B5        ; |146| 

   [ A1]   B       .S1     L7                ; |142| 
||         MVKH    .S2     _x_i$7,B6         ; |179| 

           MVK     .S2     100,B11           ; |150| 
||         MVKL    .S1     _x_i$7,A5         ; |182| 
||         ZERO    .D2     B8                ; |176| 

           SUBSP   .L2     B9,B8,B6          ; |176| 
||         MV      .L1X    B6,A3             ; |179| 
||         MVKH    .S2     RL4,B3            ; |147| 
||         MVKH    .S1     0x3c8efa35,A0     ; |146| 
||         ZERO    .D2     B7                ; |186| 

           MVKH    .S1     _theta_dot$3,A10  ; |147| 
||         MVKH    .S2     0x40400000,B7     ; |186| 

           MPYSP   .M2X    A0,B5,B5          ; |146| 
||         MVKH    .S2     _cos,B4           ; |147| 
||         MVKH    .S1     _x_p$6,A4         ; |182| 

           ZERO    .D1     A0                ; |182| 
||         MVKH    .S2     _swing_hold_count$9,B10 ; |150| 
||         MVKH    .S1     _x_i$7,A5         ; |182| 
||         ZERO    .D2     B0                ; |184| 
||         ZERO    .L1     A7                ; |182| 

           ; BRANCH OCCURS                   ; |142| 
;** --------------------------------------------------------------------------*
           B       .S2     B4                ; |147| 
           NOP             1
           SPDP    .S2     B5,B7:B6          ; |147| 
           NOP             1
           MV      .S1X    B7,A5             ; |147| 

           MV      .S1X    B6,A4             ; |147| 
||         STW     .D2T2   B5,*+SP(8)        ; |146| 

RL4:       ; CALL OCCURS                     ; |147| 
           LDW     .D1T1   *A10,A0           ; |147| 
           NOP             4
           SPDP    .S1     A0,A1:A0          ; |147| 
           NOP             1
           MPYDP   .M1     A5:A4,A1:A0,A1:A0 ; |147| 
           NOP             9
           DPSP    .L1     A1:A0,A0          ; |147| 
           NOP             3
           STW     .D2T1   A0,*+SP(48)       ; |147| 
           LDW     .D2T2   *B10,B5           ; |150| 
           NOP             3
           MVKL    .S2     _swing_hold_count$9,B4 ; |151| 

           CMPLTU  .L2     B5,B11,B0         ; |150| 
||         MVKH    .S2     _swing_hold_count$9,B4 ; |151| 

   [ B0]   LDW     .D2T2   *B4,B5            ; |151| 
   [ B0]   B       .S1     L6                ; |151| 
           NOP             2

           ZERO    .D1     A0                ; |153| 
||         MV      .S2X    A0,B6             ; |151| 

   [ B0]   ADD     .D2     1,B5,B5           ; |151| 
||         MVKH    .S1     0x42480000,A0     ; |153| 

   [ B0]   STW     .D2T2   B5,*B4            ; |151| 
||         CMPGTSP .S1X    B6,A0,A1          ; |153| 

           ; BRANCH OCCURS                   ; |151| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _swing_direction$8,A0 ; |153| 
           MVKH    .S1     _swing_direction$8,A0 ; |153| 
   [ A1]   LDW     .D1T1   *A0,A4            ; |153| 
           ZERO    .D1     A3                ; |153| 
           LDW     .D2T2   *+SP(48),B6       ; |158| 
           ZERO    .D1     A0                ; |155| 
           MVKL    .S2     _swing_hold_count$9,B4 ; |156| 
   [ A1]   CMPLTSP .S1     A4,A3,A1          ; |153| 
   [ A1]   B       .S1     L6                ; |157| 
           MVKL    .S2     _swing_direction$8,B5 ; |155| 
           MVKH    .S1     0x3f800000,A0     ; |155| 
           MVKH    .S2     _swing_direction$8,B5 ; |155| 

           ZERO    .L2     B5                ; |156| 
|| [ A1]   STW     .D2T1   A0,*B5            ; |155| 
||         MVKH    .S1     0xc2480000,A3     ; |158| 
||         MVKH    .S2     _swing_hold_count$9,B4 ; |156| 

   [ A1]   STW     .D2T2   B5,*B4            ; |156| 
||         CMPLTSP .S1X    B6,A3,A2          ; |158| 

           ; BRANCH OCCURS                   ; |157| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _swing_direction$8,A0 ; |158| 
           MVKH    .S1     _swing_direction$8,A0 ; |158| 
   [ A2]   LDW     .D1T1   *A0,A4            ; |158| 
           ZERO    .D1     A0                ; |160| 
           MVKL    .S2     _swing_direction$8,B5 ; |160| 
           MVKH    .S1     0xbf800000,A0     ; |160| 

           MVKL    .S2     _swing_hold_count$9,B4 ; |161| 
||         ZERO    .D1     A3                ; |158| 

   [ A2]   CMPGTSP .S1     A4,A3,A2          ; |158| 
||         MVKH    .S2     _swing_direction$8,B5 ; |160| 

           ZERO    .L2     B5                ; |161| 
|| [ A2]   STW     .D2T1   A0,*B5            ; |160| 
||         MVKH    .S2     _swing_hold_count$9,B4 ; |161| 

   [ A2]   STW     .D2T2   B5,*B4            ; |161| 
;** --------------------------------------------------------------------------*
L6:    
           MVKL    .S1     _swing_direction$8,A0 ; |165| 
           MVKH    .S1     _swing_direction$8,A0 ; |165| 
           LDW     .D1T1   *A0,A0            ; |165| 
           ZERO    .D2     B4                ; |165| 
           MVKH    .S2     0x41c80000,B4     ; |165| 
           NOP             2
           MPYSP   .M2X    A0,B4,B6          ; |165| 
           B       .S1     L9                ; |170| 
           MVKL    .S2     _theta_i$2,B5     ; |168| 
           MVKH    .S2     _theta_i$2,B5     ; |168| 

           MVKL    .S2     _x_i$7,B4         ; |169| 
||         STW     .D2T2   B6,*+SP(40)       ; |165| 
||         ZERO    .D1     A0                ; |168| 

           ZERO    .L2     B5                ; |169| 
||         MVKH    .S2     _x_i$7,B4         ; |169| 
||         STW     .D2T1   A0,*B5            ; |168| 

           STW     .D2T2   B5,*B4            ; |169| 
           ; BRANCH OCCURS                   ; |170| 
;** --------------------------------------------------------------------------*
L7:    
           STW     .D2T2   B6,*+SP(28)       ; |176| 
           LDW     .D1T1   *A3,A6            ; |179| 
           NOP             4
           ADDSP   .L2X    B6,A6,B4
           NOP             3
           STW     .D1T2   B4,*A3            ; |179| 

           LDW     .D1T1   *A4,A3            ; |182| 
||         LDW     .D2T2   *+SP(28),B5       ; |182| 

           NOP             4
           SUBSP   .L1X    B5,A3,A4          ; |182| 
           LDW     .D1T1   *A5,A3            ; |182| 
           NOP             2

           MPYSP   .M1     A4,A7,A4          ; |182| 
||         MPYSP   .M2     B5,B8,B4

           NOP             3

           ADDSP   .L1X    A4,B4,A0          ; |182| 
||         MPYSP   .M1     A3,A0,A3          ; |182| 

           NOP             3
           ADDSP   .L1     A3,A0,A0          ; |182| 
           NOP             3
           ADDSP   .L2X    A0,B0,B4
           NOP             3
           MV      .D2     B4,B6             ; |184| 
           CMPGTSP .S2     B6,B7,B0          ; |186| 
   [ B0]   B       .S1     L8                ; |187| 
           STW     .D2T1   A0,*+SP(36)       ; |182| 

           ZERO    .D1     A0                ; |188| 
||         ZERO    .S2     B4                ; |187| 
||         STW     .D2T2   B4,*+SP(12)       ; |184| 
||         MV      .L2     B4,B5             ; |184| 

           MVKH    .S2     0x40400000,B4     ; |187| 
||         MVKH    .S1     0xc0400000,A0     ; |188| 

   [ B0]   STW     .D2T2   B4,*+SP(12)       ; |187| 
||         CMPLTSP .S1X    B5,A0,A1          ; |188| 

   [!B0]   ZERO    .D1     A0                ; |189| 
|| [ B0]   LDW     .D2T2   *+SP(12),B4       ; |191| 

           ; BRANCH OCCURS                   ; |187| 
;** --------------------------------------------------------------------------*
           MVKH    .S1     0xc0400000,A0     ; |189| 
   [ A1]   STW     .D2T1   A0,*+SP(12)       ; |189| 
           LDW     .D2T2   *+SP(12),B4       ; |191| 
;** --------------------------------------------------------------------------*
L8:    
           LDW     .D2T2   *+SP(16),B5       ; |191| 
           MVKL    .S1     _theta_i$2,A0     ; |192| 
           MVKH    .S1     _theta_i$2,A0     ; |192| 
           NOP             2
           SUBSP   .L2     B5,B4,B4          ; |191| 
           MVKL    .S2     _theta_i$2,B5     ; |194| 
           MVKH    .S2     _theta_i$2,B5     ; |194| 
           NOP             1
           STW     .D2T2   B4,*+SP(16)       ; |191| 
           LDW     .D1T1   *A0,A3            ; |192| 
           NOP             4
           ADDSP   .L1X    B4,A3,A4          ; |192| 
           MVKL    .S1     _theta_p$1,A3     ; |194| 
           MVKH    .S1     _theta_p$1,A3     ; |194| 
           NOP             1
           STW     .D1T1   A4,*A0            ; |192| 

           LDW     .D1T1   *A3,A0            ; |194| 
||         LDW     .D2T2   *+SP(16),B4       ; |194| 

           NOP             4
           SUBSP   .L2X    B4,A0,B6          ; |194| 

           ZERO    .D2     B4                ; |194| 
||         MV      .L2     B4,B7             ; |194| 

           MVKH    .S2     0x42200000,B4     ; |194| 

           ZERO    .S2     B5                ; |194| 
||         LDW     .D2T2   *B5,B7            ; |194| 
||         MPYSP   .M2     B7,B4,B4          ; |194| 

           MPYSP   .M2     B6,B5,B5          ; |194| 
           ZERO    .D1     A0                ; |194| 
           NOP             2

           MPYSP   .M2X    B7,A0,B5          ; |194| 
||         ADDSP   .L2     B5,B4,B4          ; |194| 

           LDW     .D2T1   *+SP(16),A0       ; |199| 
           NOP             2
           ADDSP   .L2     B5,B4,B4          ; |194| 
           NOP             3

           MVKL    .S2     _theta_p$1,B4     ; |199| 
||         MV      .L2     B4,B5             ; |194| 
||         STW     .D2T2   B4,*+SP(32)       ; |194| 

           MVKH    .S2     _theta_p$1,B4     ; |199| 
||         STW     .D2T2   B5,*+SP(40)       ; |196| 

           STW     .D2T1   A0,*B4            ; |199| 
           LDW     .D2T2   *+SP(28),B4       ; |200| 
           MVKL    .S1     _x_p$6,A0         ; |200| 
           MVKH    .S1     _x_p$6,A0         ; |200| 
           NOP             2
           STW     .D1T2   B4,*A0            ; |200| 
;** --------------------------------------------------------------------------*
L9:    
           LDW     .D2T2   *+SP(40),B6       ; |203| 
           ZERO    .D2     B5                ; |203| 
           MVKH    .S2     0x42400000,B5     ; |203| 
           ZERO    .D1     A3                ; |205| 
           MVKH    .S1     0xc2400000,A3     ; |205| 
           CMPGTSP .S2     B6,B5,B1          ; |203| 
   [ B1]   B       .S1     L10               ; |204| 
           ZERO    .D1     A0                ; |204| 
           MVKH    .S1     0x42400000,A0     ; |204| 
           MV      .D2     B6,B4             ; |203| 

   [ B1]   STW     .D2T1   A0,*+SP(44)       ; |204| 
||         CMPLTSP .S2X    B4,A3,B0          ; |205| 
|| [!B1]   ZERO    .D1     A0                ; |206| 

   [ B1]   MVKL    .S2     _PWMOut,B4        ; |210| 
           ; BRANCH OCCURS                   ; |204| 
;** --------------------------------------------------------------------------*

           MVKH    .S1     0xc2400000,A0     ; |206| 
|| [!B0]   STW     .D2T2   B4,*+SP(44)       ; |208| 

   [ B0]   STW     .D2T1   A0,*+SP(44)       ; |206| 
           MVKL    .S2     _PWMOut,B4        ; |210| 
;** --------------------------------------------------------------------------*
L10:    
           MVKH    .S2     _PWMOut,B4        ; |210| 
           B       .S2     B4                ; |210| 
           LDW     .D2T1   *+SP(44),A4       ; |210| 
           MVKL    .S2     RL6,B3            ; |210| 
           MVKH    .S2     RL6,B3            ; |210| 
           NOP             2
RL6:       ; CALL OCCURS                     ; |210| 
           MVKL    .S1     _mode$10,A0       ; |212| 
           MVKH    .S1     _mode$10,A0       ; |212| 
           LDW     .D1T1   *A0,A0            ; |212| 
           MVKL    .S2     _theta_dot$3,B4   ; |212| 
           MVKH    .S2     _theta_dot$3,B4   ; |212| 
           LDW     .D2T2   *B4,B4            ; |212| 
           LDW     .D2T2   *+SP(44),B6       ; |212| 

           MVKL    .S1     _UMAddData,A0     ; |212| 
||         INTSP   .L1     A0,A6             ; |212| 

           MVKH    .S1     _UMAddData,A0     ; |212| 
           B       .S2X    A0                ; |212| 
           LDW     .D2T1   *+SP(4),A4        ; |212| 
           MVKL    .S2     RL8,B3            ; |212| 
           MVKH    .S2     RL8,B3            ; |212| 
           NOP             2
RL8:       ; CALL OCCURS                     ; |212| 
           LDW     .D2T2   *+SP(144),B11     ; |213| 
           LDW     .D2T2   *+SP(140),B10     ; |213| 
           LDW     .D2T2   *+SP(136),B9      ; |213| 
           LDW     .D2T2   *+SP(132),B8      ; |213| 
           LDW     .D2T2   *+SP(128),B7      ; |213| 
           LDW     .D2T2   *+SP(120),B5      ; |213| 
           LDW     .D2T2   *+SP(108),B2      ; |213| 
           LDW     .D2T2   *+SP(104),B1      ; |213| 
           LDW     .D2T2   *+SP(100),B0      ; |213| 
           LDW     .D2T1   *+SP(96),A10      ; |213| 
           LDW     .D2T1   *+SP(92),A9       ; |213| 
           LDW     .D2T1   *+SP(88),A8       ; |213| 
           LDW     .D2T1   *+SP(84),A7       ; |213| 
           LDW     .D2T1   *+SP(76),A5       ; |213| 
           LDW     .D2T1   *+SP(68),A3       ; |213| 
           LDW     .D2T1   *+SP(64),A2       ; |213| 
           LDW     .D2T1   *+SP(60),A1       ; |213| 
           LDW     .D2T1   *+SP(56),A0       ; |213| 
           LDW     .D2T2   *+SP(112),B3      ; |213| 
           LDW     .D2T2   *+SP(116),B4      ; |213| 
           LDW     .D2T1   *+SP(80),A6       ; |213| 

           B       .S2     IRP               ; |213| 
||         LDW     .D2T2   *+SP(124),B6      ; |213| 

           LDW     .D2T1   *+SP(72),A4       ; |213| 
           ADDK    .S2     144,SP            ; |213| 
           NOP             3
           ; BRANCH OCCURS                   ; |213| 


	.sect	".text"
	.global	_ISRNMI

;******************************************************************************
;* FUNCTION NAME: _ISRNMI                                                     *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_ISRNMI:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |217| 
           NOP             5
           ; BRANCH OCCURS                   ; |217| 


	.sect	".text"
	.global	_ISRextint6

;******************************************************************************
;* FUNCTION NAME: _ISRextint6                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 4 Auto + 84 Save = 88 byte                  *
;******************************************************************************
_ISRextint6:
;** --------------------------------------------------------------------------*
           STW     .D2T2   B9,*SP--(88)      ; |220| 
           STW     .D2T1   A0,*+SP(12)       ; |220| 
           STW     .D2T2   B7,*+SP(80)       ; |220| 
           STW     .D2T2   B6,*+SP(76)       ; |220| 
           STW     .D2T2   B5,*+SP(72)       ; |220| 
           STW     .D2T2   B4,*+SP(68)       ; |220| 
           STW     .D2T2   B3,*+SP(64)       ; |220| 
           STW     .D2T2   B2,*+SP(60)       ; |220| 
           STW     .D2T2   B1,*+SP(56)       ; |220| 
           STW     .D2T2   B0,*+SP(52)       ; |220| 
           STW     .D2T1   A9,*+SP(48)       ; |220| 
           STW     .D2T1   A8,*+SP(44)       ; |220| 
           STW     .D2T1   A7,*+SP(40)       ; |220| 
           STW     .D2T1   A6,*+SP(36)       ; |220| 
           STW     .D2T1   A5,*+SP(32)       ; |220| 
           STW     .D2T1   A4,*+SP(28)       ; |220| 
           STW     .D2T1   A3,*+SP(24)       ; |220| 
           STW     .D2T1   A2,*+SP(20)       ; |220| 

           STW     .D2T1   A1,*+SP(16)       ; |220| 
||         MVKL    .S1     0x2000008,A0      ; |223| 

           MVKH    .S1     0x2000008,A0      ; |223| 
||         STW     .D2T2   B8,*+SP(84)       ; |220| 

           LDW     .D1T1   *A0,A0            ; |223| 
           NOP             4
           AND     .S1     15,A0,A0          ; |223| 
           CMPEQ   .L1     A0,1,A1           ; |223| 
   [ A1]   B       .S1     L18               ; |223| 
           STW     .D2T1   A0,*+SP(4)        ; |223| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |257| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |257| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |257| 
   [ A1]   LDW     .D2T2   *+SP(68),B4       ; |257| 
           ; BRANCH OCCURS                   ; |223| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(4),B4        ; |224| 
           NOP             3
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L11
;** --------------------------------------------------------------------------*
L11:    
           NOP             1
           CMPEQ   .L2     B4,4,B0           ; |224| 
   [!B0]   B       .S1     L13               ; |224| 

   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |236| 
|| [ B0]   MVKL    .S1     0x2000014,A0      ; |225| 

   [ B0]   MVKH    .S1     0x2000014,A0      ; |225| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |225| 
           NOP             2
           ; BRANCH OCCURS                   ; |224| 
;** --------------------------------------------------------------------------*
           NOP             2
           AND     .S1     1,A0,A1           ; |225| 
   [!A1]   B       .S1     L17               ; |225| 
   [!A1]   MVKL    .S1     0x2000008,A0      ; |256| 
   [!A1]   MVKH    .S1     0x2000008,A0      ; |256| 

   [ A1]   ZERO    .D2     B4                ; |226| 
|| [ A1]   MVKL    .S2     _compacket+124,B5 ; |226| 
|| [!A1]   LDW     .D1T1   *A0,A0            ; |256| 

   [ A1]   MVKH    .S2     0x2000000,B4      ; |226| 

   [ A1]   MVKH    .S2     _compacket+124,B5 ; |226| 
|| [ A1]   LDW     .D2T2   *B4,B4            ; |226| 

           ; BRANCH OCCURS                   ; |225| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *B5,B5            ; |226| 
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L12:    
           MVKL    .S1     _compacket+124,A0 ; |227| 
           MVKH    .S1     _compacket+124,A0 ; |227| 
           EXTU    .S2     B4,24,24,B4       ; |226| 
           STB     .D2T2   B4,*B5            ; |226| 
           LDW     .D1T1   *A0,A3            ; |227| 
           MVKL    .S1     _SendByte,A0      ; |227| 
           MVKH    .S1     _SendByte,A0      ; |227| 
           MVKL    .S2     RL10,B3           ; |227| 
           B       .S2X    A0                ; |227| 
           LDB     .D1T1   *A3,A4            ; |227| 
           MVKH    .S2     RL10,B3           ; |227| 
           NOP             3
RL10:      ; CALL OCCURS                     ; |227| 
           MVKL    .S2     _compacket+124,B4 ; |228| 
           MVKH    .S2     _compacket+124,B4 ; |228| 
           LDW     .D2T2   *B4,B4            ; |228| 
           MVKL    .S1     _compacket+99,A0  ; |228| 
           MVKH    .S1     _compacket+99,A0  ; |228| 
           NOP             2
           CMPEQ   .L1X    B4,A0,A1          ; |228| 
   [!A1]   MVKL    .S2     _compacket+124,B4 ; |232| 
   [!A1]   MVKH    .S2     _compacket+124,B4 ; |232| 
   [!A1]   LDW     .D2T2   *B4,B5            ; |232| 
   [ A1]   MVKL    .S2     _compacket+124,B4 ; |229| 
   [ A1]   MVKL    .S1     _compacket,A0     ; |229| 
   [ A1]   MVKH    .S2     _compacket+124,B4 ; |229| 
   [ A1]   MVKH    .S1     _compacket,A0     ; |229| 

           MVKL    .S2     0x2000014,B5      ; |234| 
|| [!A1]   ADD     .D2     1,B5,B6           ; |232| 

   [!A1]   STW     .D2T2   B6,*B4            ; |232| 

   [ A1]   STW     .D2T1   A0,*B4            ; |229| 
||         MVKH    .S2     0x2000014,B5      ; |234| 

           LDW     .D2T2   *B5,B4            ; |234| 
           NOP             4
           AND     .S2     1,B4,B0           ; |234| 
   [ B0]   B       .S1     L12               ; |234| 

   [ B0]   ZERO    .D2     B4                ; |226| 
|| [ B0]   MVKL    .S2     _compacket+124,B5 ; |226| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |226| 

   [ B0]   MVKH    .S2     _compacket+124,B5 ; |226| 
|| [ B0]   LDW     .D2T2   *B4,B4            ; |226| 

   [ B0]   LDW     .D2T2   *B5,B5            ; |226| 
           NOP             1
           ; BRANCH OCCURS                   ; |234| 
;** --------------------------------------------------------------------------*
           B       .S1     L17               ; |235| 
           MVKL    .S1     0x2000008,A0      ; |256| 
           MVKH    .S1     0x2000008,A0      ; |256| 
           LDW     .D1T1   *A0,A0            ; |256| 
           NOP             2
           ; BRANCH OCCURS                   ; |235| 
;** --------------------------------------------------------------------------*
L13:    
           CMPEQ   .L2     B4,2,B0           ; |236| 
   [!B0]   B       .S1     L14               ; |236| 
   [ B0]   MVKL    .S2     _respacket+200,B4 ; |237| 
           NOP             3
   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |245| 
           ; BRANCH OCCURS                   ; |236| 
;** --------------------------------------------------------------------------*
           MVKH    .S2     _respacket+200,B4 ; |237| 
           LDW     .D2T2   *B4,B5            ; |237| 
           NOP             4
           CMPGT   .L2     B5,0,B0           ; |237| 

   [ B0]   MVKL    .S1     _respacket+204,A0 ; |238| 
||         SUB     .D2     B5,1,B5           ; |237| 

   [ B0]   MVKH    .S1     _respacket+204,A0 ; |238| 
||         STW     .D2T2   B5,*B4            ; |237| 

   [ B0]   LDW     .D1T1   *A0,A3            ; |238| 
   [ B0]   MVKL    .S1     _respacket,A4     ; |238| 
   [ B0]   MVKH    .S1     _respacket,A4     ; |238| 
   [!B0]   MVKL    .S1     0x2000004,A0      ; |241| 
   [!B0]   MVKL    .S2     _respacket+208,B4 ; |242| 
   [ B0]   ADD     .D1     1,A3,A5           ; |238| 
   [ B0]   STW     .D1T1   A5,*A0            ; |238| 

           B       .S1     L16               ; |244| 
|| [ B0]   LDB     .D1T1   *+A3[A4],A0       ; |238| 

   [!B0]   MVKH    .S1     0x2000004,A0      ; |241| 
   [!B0]   MVK     .S2     1,B5              ; |241| 

   [!B0]   ZERO    .D2     B5                ; |242| 
|| [ B0]   ZERO    .L2     B4                ; |238| 
|| [!B0]   MVKH    .S2     _respacket+208,B4 ; |242| 
|| [!B0]   STW     .D1T2   B5,*A0            ; |241| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |238| 
|| [!B0]   STW     .D2T2   B5,*B4            ; |242| 

   [ B0]   STW     .D2T1   A0,*B4            ; |238| 
           ; BRANCH OCCURS                   ; |244| 
;** --------------------------------------------------------------------------*
L14:    
           NOP             4
           CMPEQ   .L2     B4,12,B0          ; |245| 
   [!B0]   B       .S1     L16               ; |245| 
           NOP             2
   [ B0]   MVKL    .S1     0x2000014,A0      ; |246| 
   [ B0]   MVKH    .S1     0x2000014,A0      ; |246| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |246| 
           ; BRANCH OCCURS                   ; |245| 
;** --------------------------------------------------------------------------*
           NOP             4
           AND     .S1     1,A0,A1           ; |246| 
   [!A1]   B       .S1     L16               ; |246| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |247| 
           ; BRANCH OCCURS                   ; |246| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L15:    

           MVKH    .S2     0x2000000,B4      ; |247| 
||         MVKL    .S1     _compacket+124,A0 ; |247| 

           LDW     .D2T2   *B4,B4            ; |247| 
||         MVKH    .S1     _compacket+124,A0 ; |247| 

           LDW     .D1T1   *A0,A3            ; |247| 
           MVKL    .S1     _compacket+124,A0 ; |248| 
           MVKH    .S1     _compacket+124,A0 ; |248| 
           NOP             1
           EXTU    .S2     B4,24,24,B4       ; |247| 
           STB     .D1T2   B4,*A3            ; |247| 
           LDW     .D1T1   *A0,A0            ; |248| 
           MVKL    .S2     _compacket+99,B4  ; |248| 
           MVKH    .S2     _compacket+99,B4  ; |248| 
           NOP             2
           CMPEQ   .L2X    A0,B4,B0          ; |248| 
   [!B0]   MVKL    .S1     _compacket+124,A0 ; |252| 
   [!B0]   MVKH    .S1     _compacket+124,A0 ; |252| 
   [!B0]   MV      .D1     A0,A4             ; |252| 
   [!B0]   LDW     .D1T1   *A4,A0            ; |252| 
   [ B0]   MVKL    .S1     _compacket+124,A0 ; |249| 
   [ B0]   MVKL    .S2     _compacket,B4     ; |249| 
   [ B0]   MVKH    .S1     _compacket+124,A0 ; |249| 
   [ B0]   MVKH    .S2     _compacket,B4     ; |249| 

           MVKL    .S1     0x2000014,A0      ; |254| 
|| [!B0]   ADD     .L1     1,A0,A3           ; |252| 
|| [ B0]   STW     .D1T2   B4,*A0            ; |249| 

           MVKH    .S1     0x2000014,A0      ; |254| 
|| [!B0]   STW     .D1T1   A3,*A4            ; |252| 

           LDW     .D1T1   *A0,A0            ; |254| 
           NOP             4
           AND     .S1     1,A0,A1           ; |254| 
   [ A1]   B       .S1     L15               ; |254| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |247| 
           ; BRANCH OCCURS                   ; |254| 
;** --------------------------------------------------------------------------*
L16:    
           MVKL    .S1     0x2000008,A0      ; |256| 
           MVKH    .S1     0x2000008,A0      ; |256| 
           LDW     .D1T1   *A0,A0            ; |256| 
           NOP             2
;** --------------------------------------------------------------------------*
L17:    
           NOP             2
           AND     .S1     15,A0,A0          ; |256| 
           CMPEQ   .L1     A0,1,A1           ; |256| 
   [!A1]   B       .S1     L11               ; |256| 
           STW     .D2T1   A0,*+SP(4)        ; |256| 
   [!A1]   LDW     .D2T2   *+SP(4),B4        ; |224| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |257| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |257| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |257| 
           ; BRANCH OCCURS                   ; |256| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(68),B4       ; |257| 
;** --------------------------------------------------------------------------*
L18:    
           LDW     .D2T2   *+SP(64),B3       ; |257| 
           LDW     .D2T2   *+SP(60),B2       ; |257| 
           LDW     .D2T2   *+SP(56),B1       ; |257| 
           LDW     .D2T2   *+SP(52),B0       ; |257| 
           LDW     .D2T1   *+SP(48),A9       ; |257| 
           LDW     .D2T1   *+SP(44),A8       ; |257| 
           LDW     .D2T1   *+SP(40),A7       ; |257| 
           LDW     .D2T1   *+SP(36),A6       ; |257| 
           LDW     .D2T1   *+SP(32),A5       ; |257| 
           LDW     .D2T1   *+SP(28),A4       ; |257| 
           LDW     .D2T1   *+SP(24),A3       ; |257| 
           LDW     .D2T1   *+SP(20),A2       ; |257| 
           LDW     .D2T1   *+SP(16),A1       ; |257| 
           LDW     .D2T1   *+SP(12),A0       ; |257| 

           B       .S2     IRP               ; |257| 
||         LDW     .D2T2   *+SP(84),B8       ; |257| 

           LDW     .D2T2   *++SP(88),B9      ; |257| 
           NOP             4
           ; BRANCH OCCURS                   ; |257| 


;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_cos
	.global	_PWMOut
	.global	_GetAngle
	.global	_SendByte
	.global	_UMAddData
	.global	_compacket
	.global	_respacket
	.global	_TINTCnt
	.global	__divf
