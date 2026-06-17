;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Tue Jun 16 16:19:03 2026                                *
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
	.field  	_theta_speed$1+0,32
	.word	000000000h		; _theta_speed$1 @ 0
	.sect	".text"
_theta_speed$1:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_theta_angle_p$2+0,32
	.word	000000000h		; _theta_angle_p$2 @ 0
	.sect	".text"
_theta_angle_p$2:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_angle_initialized$3+0,32
	.field  	0,32			; _angle_initialized$3 @ 0
	.sect	".text"
_angle_initialized$3:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_x_p$4+0,32
	.word	000000000h		; _x_p$4 @ 0
	.sect	".text"
_x_p$4:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_x_i$5+0,32
	.word	000000000h		; _x_i$5 @ 0
	.sect	".text"
_x_i$5:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_theta_p$6+0,32
	.word	000000000h		; _theta_p$6 @ 0
	.sect	".text"
_theta_p$6:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_theta_i$7+0,32
	.word	000000000h		; _theta_i$7 @ 0
	.sect	".text"
_theta_i$7:	.usect	.far,4,4

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
	.field  	_swing_hold_cnt$9+0,32
	.field  	0,32			; _swing_hold_cnt$9 @ 0
	.sect	".text"
_swing_hold_cnt$9:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_mode$10+0,32
	.field  	0,32			; _mode$10 @ 0
	.sect	".text"
_mode$10:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_swing_state$11+0,32
	.field  	0,32			; _swing_state$11 @ 0
	.sect	".text"
_swing_state$11:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\W10\AppData\Local\Temp\TI8384_2 --template_info_file C:\Users\W10\AppData\Local\Temp\TI8384_3 --object_file interrupt.obj --opt_shell 9 interrupt.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 interrupt.c 
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
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,SP                        *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,SP                        *
;*   Local Frame Size  : 0 Args + 60 Auto + 100 Save = 160 byte               *
;******************************************************************************
_ISRtimer0:
;** --------------------------------------------------------------------------*
           ADDK    .S2     -160,SP           ; |57| 
           STW     .D2T1   A0,*+SP(68)       ; |57| 
           STW     .D2T1   A3,*+SP(80)       ; |57| 
           STW     .D2T1   A4,*+SP(84)       ; |57| 
           STW     .D2T2   B4,*+SP(132)      ; |57| 
           STW     .D2T1   A2,*+SP(76)       ; |57| 
           STW     .D2T1   A5,*+SP(88)       ; |57| 
           STW     .D2T1   A6,*+SP(92)       ; |57| 
           STW     .D2T1   A7,*+SP(96)       ; |57| 
           STW     .D2T1   A8,*+SP(100)      ; |57| 
           STW     .D2T1   A9,*+SP(104)      ; |57| 
           STW     .D2T1   A10,*+SP(108)     ; |57| 
           STW     .D2T1   A11,*+SP(112)     ; |57| 
           STW     .D2T2   B0,*+SP(116)      ; |57| 
           STW     .D2T2   B1,*+SP(120)      ; |57| 
           STW     .D2T2   B2,*+SP(124)      ; |57| 
           STW     .D2T2   B3,*+SP(128)      ; |57| 
           STW     .D2T2   B5,*+SP(136)      ; |57| 
           STW     .D2T2   B6,*+SP(140)      ; |57| 
           STW     .D2T2   B7,*+SP(144)      ; |57| 
           STW     .D2T2   B8,*+SP(148)      ; |57| 
           STW     .D2T2   B9,*+SP(152)      ; |57| 
           STW     .D2T2   B10,*+SP(156)     ; |57| 

           STW     .D2T2   B11,*+SP(160)     ; |57| 
||         MVKL    .S1     _TFlag,A0         ; |91| 

           MVK     .S1     1,A3              ; |91| 
||         ZERO    .D1     A4                ; |82| 
||         STW     .D2T1   A1,*+SP(72)       ; |57| 

           STW     .D2T1   A4,*+SP(48)       ; |82| 
||         MVKH    .S1     _TFlag,A0         ; |91| 
||         MVKL    .S2     _TINTCnt,B4       ; |92| 

           MVKL    .S1     _GetAngle,A0      ; |95| 
||         STW     .D1T1   A3,*A0            ; |91| 
||         MVKH    .S2     _TINTCnt,B4       ; |92| 

           LDW     .D2T2   *B4,B5            ; |92| 
||         MVKH    .S1     _GetAngle,A0      ; |95| 

           B       .S2X    A0                ; |95| 
           MVKL    .S2     RL0,B3            ; |95| 
           MVKH    .S2     RL0,B3            ; |95| 
           NOP             1
           ADD     .D2     1,B5,B5           ; |92| 
           STW     .D2T2   B5,*B4            ; |92| 
RL0:       ; CALL OCCURS                     ; |95| 

           MVKL    .S1     0x20000a8,A0      ; |96| 
||         MV      .S2X    A4,B4             ; |95| 

           MVKH    .S1     0x20000a8,A0      ; |96| 
||         STW     .D2T2   B4,*+SP(4)        ; |95| 

           LDW     .D1T1   *A0,A0            ; |96| 
           MVKL    .S2     _angle_initialized$3,B4 ; |99| 
           MVKH    .S2     _angle_initialized$3,B4 ; |99| 
           MVKL    .S2     0x3e4ccccd,B7     ; |105| 
           MVKL    .S1     _theta_speed$1,A5 ; |105| 
           INTSP   .L1     A0,A3             ; |96| 
           MVK     .S2     1,B8              ; |101| 
           MVKH    .S1     _theta_speed$1,A5 ; |105| 
           MVKH    .S2     0x3e4ccccd,B7     ; |105| 
           STW     .D2T1   A3,*+SP(24)       ; |96| 
           LDW     .D2T2   *B4,B0            ; |99| 
           MVKL    .S1     _theta_speed$1,A6 ; |105| 
           LDW     .D2T2   *+SP(4),B6        ; |100| 
           MVKH    .S1     _theta_speed$1,A6 ; |105| 
           MVKL    .S1     _theta_angle_p$2,A0 ; |100| 
   [!B0]   B       .S2     L1                ; |102| 

           MVKL    .S2     _angle_initialized$3,B5 ; |101| 
||         MVKH    .S1     _theta_angle_p$2,A0 ; |100| 

           MVKH    .S2     _angle_initialized$3,B5 ; |101| 
||         MVKL    .S1     _theta_angle_p$2,A4 ; |103| 
|| [!B0]   STW     .D1T2   B6,*A0            ; |100| 
||         LDW     .D2T1   *+SP(4),A0        ; |103| 

           ZERO    .D2     B6                ; |104| 
||         MVKL    .S2     _theta_angle_p$2,B4 ; |106| 
||         MVKH    .S1     _theta_angle_p$2,A4 ; |103| 

           MVKL    .S1     0x3f4ccccd,A3     ; |105| 
||         MVKH    .S2     0x447a0000,B6     ; |104| 

   [!B0]   STW     .D2T2   B8,*B5            ; |101| 
|| [ B0]   LDW     .D1T1   *A4,A4            ; |103| 
||         MVKH    .S1     0x3f4ccccd,A3     ; |105| 
||         MVKH    .S2     _theta_angle_p$2,B4 ; |106| 

           ; BRANCH OCCURS                   ; |102| 
;** --------------------------------------------------------------------------*
           NOP             4
           SUBSP   .L1     A0,A4,A0          ; |103| 
           NOP             3
           MPYSP   .M2X    B6,A0,B5
           STW     .D2T1   A0,*+SP(20)       ; |103| 
           NOP             2
           STW     .D2T2   B5,*+SP(20)       ; |104| 
           LDW     .D1T1   *A6,A0            ; |105| 
           NOP             4

           MPYSP   .M1     A0,A3,A0          ; |105| 
||         MPYSP   .M2     B5,B7,B5          ; |105| 

           NOP             3
           ADDSP   .L1X    B5,A0,A0          ; |105| 
           NOP             3
           STW     .D1T1   A0,*A5            ; |105| 
           LDW     .D2T2   *+SP(4),B5        ; |106| 
           NOP             4
           STW     .D2T2   B5,*B4            ; |106| 
;** --------------------------------------------------------------------------*
L1:    
           LDW     .D2T2   *+SP(4),B8        ; |111| 
           LDW     .D2T2   *+SP(24),B7       ; |113| 
           ZERO    .D2     B4                ; |113| 
           ZERO    .D1     A0                ; |111| 
           MVKH    .S1     0x43340000,A0     ; |111| 
           MV      .D2     B8,B5

           MVKH    .S2     0x43340000,B4     ; |110| 
||         MV      .D2     B8,B6
||         SUBSP   .L2     B7,B4,B7          ; |113| 

           SUBSP   .L2     B6,B4,B4          ; |110| 

           ADDSP   .L2X    A0,B8,B8          ; |111| 
||         ZERO    .D1     A0                ; |114| 

           STW     .D2T1   A0,*+SP(40)       ; |114| 

           STW     .D2T2   B7,*+SP(28)       ; |113| 
||         CMPLTSP .S1X    B5,A0,A1          ; |110| 

   [!A1]   STW     .D2T2   B4,*+SP(8)        ; |110| 
||         MVKL    .S1     _mode$10,A0       ; |150| 

           MVKH    .S1     _mode$10,A0       ; |150| 
|| [ A1]   STW     .D2T2   B8,*+SP(8)        ; |111| 

           LDW     .D1T1   *A0,A1            ; |150| 
           MVKL    .S2     RL2,B3            ; |151| 
           LDW     .D2T1   *+SP(8),A4        ; |151| 
           NOP             2
   [ A1]   B       .S1     L2                ; |150| 
           ZERO    .D2     B10               ; |151| 
           MVKH    .S2     0x41700000,B10    ; |151| 
           MVKH    .S2     RL2,B3            ; |151| 
           MVKL    .S2     _fabsf,B4         ; |151| 
           MVKH    .S2     _fabsf,B4         ; |151| 
           ; BRANCH OCCURS                   ; |150| 
;** --------------------------------------------------------------------------*
           B       .S2     B4                ; |151| 
           NOP             5
RL2:       ; CALL OCCURS                     ; |151| 

           MVKL    .S1     _mode$10,A0       ; |152| 
||         MVK     .S2     1,B4              ; |152| 

           MVKH    .S1     _mode$10,A0       ; |152| 
||         CMPLTSP .S2X    A4,B10,B0         ; |151| 

   [ B0]   STW     .D1T2   B4,*A0            ; |152| 
   [ B0]   LDW     .D2T1   *+SP(8),A3        ; |153| 
           MVKL    .S2     _theta_p$6,B4     ; |153| 
           MVKL    .S1     _theta_i$7,A0     ; |154| 
           MVKH    .S2     _theta_p$6,B4     ; |153| 
           MVKH    .S1     _theta_i$7,A0     ; |154| 

   [ B0]   STW     .D2T1   A3,*B4            ; |153| 
||         ZERO    .S2     B4                ; |154| 

   [ B0]   STW     .D1T2   B4,*A0            ; |154| 
   [ B0]   LDW     .D2T2   *+SP(28),B4       ; |155| 
           MVKL    .S1     _x_i$5,A3         ; |156| 
           MVKL    .S1     _x_p$4,A0         ; |155| 
           MVKH    .S1     _x_p$4,A0         ; |155| 
           MVKH    .S1     _x_i$5,A3         ; |156| 

   [ B0]   STW     .D1T2   B4,*A0            ; |155| 
||         ZERO    .L1     A0                ; |156| 

   [ B0]   STW     .D1T1   A0,*A3            ; |156| 
;** --------------------------------------------------------------------------*
L2:    
           MVKL    .S1     0x3c8efa35,A0     ; |161| 
           MVKL    .S1     _theta_p$6,A7     ; |234| 

           MVKL    .S1     _x_p$4,A8         ; |235| 
||         MVKL    .S2     _mode$10,B4       ; |160| 

           MVKL    .S1     _theta_i$7,A4     ; |228| 
||         MVKL    .S2     _theta_i$7,B9     ; |226| 

           MVKL    .S1     0x3f666666,A6     ; |228| 
||         MVKL    .S2     _fabsf,B10        ; |164| 

           MVKL    .S1     _x_i$5,A5         ; |219| 
||         MVKL    .S2     _cos,B6           ; |162| 

           MVKL    .S1     _theta_speed$1,A10 ; |162| 
||         MVKH    .S2     _mode$10,B4       ; |160| 

           LDW     .D2T2   *B4,B0            ; |160| 
||         MVKL    .S1     _x_i$5,A3         ; |217| 
||         MVKL    .S2     RL4,B3            ; |162| 

           MVKL    .S1     _theta_p$6,A9     ; |228| 
||         MVKL    .S2     _swing_state$11,B11 ; |166| 

           MVKH    .S1     0x3c8efa35,A0     ; |161| 
||         MVKL    .S2     _x_p$4,B1         ; |219| 

           MVKH    .S1     _theta_p$6,A7     ; |234| 
||         MVKH    .S2     _theta_i$7,B9     ; |226| 

           MVKH    .S1     _x_p$4,A8         ; |235| 
||         MVKH    .S2     _fabsf,B10        ; |164| 
||         LDW     .D2T2   *+SP(4),B5        ; |161| 

   [ B0]   B       .S2     L6                ; |160| 
||         MVKH    .S1     _theta_i$7,A4     ; |228| 

           MVKH    .S2     _cos,B6           ; |162| 
||         MVKH    .S1     0x3f666666,A6     ; |228| 

           MVKH    .S2     RL4,B3            ; |162| 
||         MVKH    .S1     _x_i$5,A5         ; |219| 

           MVKH    .S1     _theta_speed$1,A10 ; |162| 
||         MVKH    .S2     _swing_state$11,B11 ; |166| 
||         ZERO    .D2     B7                ; |228| 

           MPYSP   .M2X    A0,B5,B4          ; |161| 
||         MVKH    .S1     _x_i$5,A3         ; |217| 
||         MVKH    .S2     _x_p$4,B1         ; |219| 
||         ZERO    .L2     B2                ; |223| 
||         LDW     .D2T1   *+SP(28),A11      ; |217| 
||         ZERO    .D1     A2                ; |228| 

           ZERO    .D2     B5                ; |219| 
||         ZERO    .D1     A0                ; |219| 
||         MV      .L1X    B9,A1             ; |226| 
||         MVKH    .S1     _theta_p$6,A9     ; |228| 
||         MVKH    .S2     0x41c80000,B7     ; |228| 
||         ZERO    .L2     B8                ; |219| 

           ; BRANCH OCCURS                   ; |160| 
;** --------------------------------------------------------------------------*
           B       .S2     B6                ; |162| 
           NOP             1

           SPDP    .S2     B4,B5:B4          ; |162| 
||         STW     .D2T2   B4,*+SP(16)       ; |161| 

           NOP             1
           MV      .S1X    B5,A5             ; |162| 
           MV      .S1X    B4,A4             ; |162| 
RL4:       ; CALL OCCURS                     ; |162| 
           LDW     .D1T1   *A10,A0           ; |162| 
           NOP             4
           SPDP    .S1     A0,A1:A0          ; |162| 
           NOP             1
           MPYDP   .M1     A5:A4,A1:A0,A1:A0 ; |162| 
           NOP             8
           B       .S2     B10               ; |164| 

           DPSP    .L1     A1:A0,A0          ; |162| 
||         LDW     .D2T1   *+SP(8),A4        ; |164| 

           NOP             2
           MVKL    .S2     RL6,B3            ; |164| 

           STW     .D2T1   A0,*+SP(48)       ; |162| 
||         MVKH    .S2     RL6,B3            ; |164| 

RL6:       ; CALL OCCURS                     ; |164| 
           STW     .D2T1   A4,*+SP(52)       ; |164| 
           LDW     .D2T2   *B11,B1           ; |166| 
           NOP             4
   [ B1]   B       .S1     L3                ; |166| 
           NOP             2
           ZERO    .D2     B5                ; |167| 

           MV      .L2X    A4,B4             ; |164| 
||         MVKH    .S2     0x42200000,B5     ; |167| 

           CMPLTSP .S2     B4,B5,B0          ; |167| 
           ; BRANCH OCCURS                   ; |166| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _swing_state$11,B4 ; |168| 
           MVK     .S2     1,B5              ; |168| 

           MVKH    .S2     _swing_state$11,B4 ; |168| 
||         MVKL    .S1     _swing_hold_cnt$9,A0 ; |169| 

   [ B0]   STW     .D2T2   B5,*B4            ; |168| 
||         MVKH    .S1     _swing_hold_cnt$9,A0 ; |169| 
||         ZERO    .D1     A3                ; |169| 

   [ B0]   STW     .D1T1   A3,*A0            ; |169| 
;** --------------------------------------------------------------------------*
L3:    
           MVKL    .S1     _swing_state$11,A0 ; |173| 
           MVKH    .S1     _swing_state$11,A0 ; |173| 
           LDW     .D1T1   *A0,A1            ; |173| 
           LDW     .D2T2   *+SP(48),B8       ; |190| 
           MVK     .S2     90,B5             ; |175| 
           ZERO    .D2     B6                ; |189| 
           MVKH    .S2     0x41c80000,B6     ; |189| 
   [ A1]   B       .S1     L4                ; |173| 
           ZERO    .D2     B4                ; |174| 
           MVKL    .S1     _swing_hold_cnt$9,A0 ; |177| 
           MVKH    .S2     0x41f00000,B4     ; |174| 
           ZERO    .D2     B7                ; |190| 

           MVKH    .S1     _swing_hold_cnt$9,A0 ; |177| 
||         CMPGTSP .S2     B8,B7,B0          ; |190| 
|| [!A1]   STW     .D2T2   B5,*+SP(60)       ; |175| 

           ; BRANCH OCCURS                   ; |173| 
;** --------------------------------------------------------------------------*
           STW     .D2T2   B4,*+SP(56)       ; |174| 
           LDW     .D1T1   *A0,A3            ; |177| 
           MVKL    .S1     _swing_hold_cnt$9,A0 ; |178| 
           MVKH    .S1     _swing_hold_cnt$9,A0 ; |178| 
           ZERO    .S2     B4                ; |180| 
           NOP             1
           CMPLT   .L2X    A3,B5,B0
   [ B0]   LDW     .D1T1   *A0,A3            ; |178| 
   [ B0]   B       .S1     L5                ; |179| 
           MV      .D2     B8,B5             ; |178| 
           CMPGTSP .S2     B5,B4,B1          ; |180| 
           NOP             1
   [ B0]   ADD     .D1     1,A3,A3           ; |178| 
   [ B0]   STW     .D1T1   A3,*A0            ; |178| 
           ; BRANCH OCCURS                   ; |179| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _swing_direction$8,B5 ; |181| 

           B       .S1     L5                ; |187| 
||         MVKL    .S2     _swing_direction$8,B4 ; |183| 

           MVKH    .S2     _swing_direction$8,B5 ; |181| 
||         ZERO    .D1     A0                ; |181| 

           MVKH    .S2     _swing_direction$8,B4 ; |183| 
||         MVKH    .S1     0x3f800000,A0     ; |181| 
||         ZERO    .D2     B6                ; |183| 

           MVKL    .S1     _swing_hold_cnt$9,A0 ; |185| 
|| [ B1]   STW     .D2T1   A0,*B5            ; |181| 
||         MVKH    .S2     0xbf800000,B6     ; |183| 

           MVKH    .S1     _swing_hold_cnt$9,A0 ; |185| 
|| [!B1]   STW     .D2T2   B6,*B4            ; |183| 
||         ZERO    .D1     A3                ; |185| 

           STW     .D1T1   A3,*A0            ; |185| 
           ; BRANCH OCCURS                   ; |187| 
;** --------------------------------------------------------------------------*
L4:    

           MVKL    .S2     _swing_direction$8,B4 ; |191| 
||         MVKL    .S1     _swing_direction$8,A0 ; |193| 
||         ZERO    .D2     B5                ; |193| 
||         ZERO    .D1     A3                ; |191| 

           MVKH    .S1     0x3f800000,A3     ; |191| 
||         MVKH    .S2     0xbf800000,B5     ; |193| 

           MVKH    .S2     _swing_direction$8,B4 ; |191| 
||         MVKH    .S1     _swing_direction$8,A0 ; |193| 
||         STW     .D2T2   B6,*+SP(56)       ; |189| 

   [ B0]   STW     .D2T1   A3,*B4            ; |191| 
|| [!B0]   STW     .D1T2   B5,*A0            ; |193| 

;** --------------------------------------------------------------------------*
L5:    
           MVKL    .S1     _swing_direction$8,A0 ; |215| 
           MVKH    .S1     _swing_direction$8,A0 ; |215| 

           LDW     .D1T1   *A0,A0            ; |215| 
||         LDW     .D2T2   *+SP(56),B4       ; |215| 

           NOP             3
           B       .S1     L7                ; |216| 
           MPYSP   .M2X    A0,B4,B4          ; |215| 
           NOP             3
           STW     .D2T2   B4,*+SP(40)       ; |215| 
           ; BRANCH OCCURS                   ; |216| 
;** --------------------------------------------------------------------------*
L6:    
           LDW     .D1T1   *A3,A10           ; |217| 
           NOP             4
           ADDSP   .L1     A11,A10,A10       ; |217| 
           NOP             3
           STW     .D1T1   A10,*A3           ; |217| 
           LDW     .D2T2   *B1,B4            ; |219| 
           LDW     .D2T2   *+SP(28),B6       ; |219| 
           LDW     .D1T1   *A5,A3            ; |219| 
           NOP             3
           SUBSP   .L2     B6,B4,B4          ; |219| 
           NOP             2
           MPYSP   .M2     B6,B5,B5
           MPYSP   .M2     B4,B8,B4          ; |219| 
           NOP             3

           MPYSP   .M1     A3,A0,A0          ; |219| 
||         ADDSP   .L2     B4,B5,B4          ; |219| 

           LDW     .D2T2   *+SP(8),B5        ; |225| 
           NOP             2
           ADDSP   .L2X    A0,B4,B4          ; |219| 
           NOP             3

           ADDSP   .L2     B4,B2,B4          ; |223| 
||         STW     .D2T2   B4,*+SP(36)       ; |219| 

           NOP             3

           SUBSP   .L2     B5,B4,B4          ; |225| 
||         STW     .D2T2   B4,*+SP(12)       ; |223| 

           NOP             3
           STW     .D2T2   B4,*+SP(8)        ; |225| 
           LDW     .D1T1   *A1,A0            ; |226| 
           NOP             4
           ADDSP   .L1X    B4,A0,A0          ; |226| 
           NOP             3
           STW     .D1T1   A0,*A1            ; |226| 

           LDW     .D2T2   *+SP(8),B4        ; |228| 
||         LDW     .D1T1   *A9,A0            ; |228| 

           NOP             4
           SUBSP   .L1X    B4,A0,A3          ; |228| 
           LDW     .D1T1   *A4,A0            ; |228| 
           MV      .D2     B4,B5
           NOP             1

           MPYSP   .M2     B4,B7,B4
||         MPYSP   .M1     A3,A6,A3          ; |228| 

           NOP             3

           MPYSP   .M1     A0,A2,A0          ; |228| 
||         ADDSP   .L1X    A3,B4,A3          ; |228| 

           NOP             3
           ADDSP   .L1     A0,A3,A0          ; |228| 
           NOP             3
           MV      .S2X    A0,B4             ; |228| 
           STW     .D2T2   B4,*+SP(40)       ; |232| 

           MV      .S1X    B5,A0             ; |228| 
||         STW     .D2T1   A0,*+SP(32)       ; |228| 

           STW     .D1T1   A0,*A7            ; |234| 
           LDW     .D2T1   *+SP(28),A0       ; |235| 
           NOP             4
           STW     .D1T1   A0,*A8            ; |235| 
;** --------------------------------------------------------------------------*
L7:    
           LDW     .D2T2   *+SP(40),B6       ; |240| 
           ZERO    .D2     B5                ; |240| 
           MVKH    .S2     0x42400000,B5     ; |240| 
           ZERO    .D1     A0                ; |241| 
           MVKH    .S1     0xc2400000,A0     ; |241| 
           CMPGTSP .S2     B6,B5,B0          ; |240| 
   [ B0]   B       .S1     L8                ; |240| 
           ZERO    .D1     A3                ; |240| 
           MVKH    .S1     0x42400000,A3     ; |240| 
           MV      .D2     B6,B4             ; |240| 

   [ B0]   STW     .D2T1   A3,*+SP(44)       ; |240| 
||         CMPLTSP .S2X    B4,A0,B1          ; |241| 

   [!B0]   ZERO    .D1     A0                ; |241| 
|| [ B0]   MVKL    .S2     _PWMOut,B4        ; |244| 

           ; BRANCH OCCURS                   ; |240| 
;** --------------------------------------------------------------------------*

           MVKH    .S1     0xc2400000,A0     ; |241| 
|| [!B1]   STW     .D2T2   B4,*+SP(44)       ; |242| 

   [ B1]   STW     .D2T1   A0,*+SP(44)       ; |241| 
           MVKL    .S2     _PWMOut,B4        ; |244| 
;** --------------------------------------------------------------------------*
L8:    
           MVKH    .S2     _PWMOut,B4        ; |244| 
           B       .S2     B4                ; |244| 
           LDW     .D2T1   *+SP(44),A4       ; |244| 
           MVKL    .S2     RL8,B3            ; |244| 
           MVKH    .S2     RL8,B3            ; |244| 
           NOP             2
RL8:       ; CALL OCCURS                     ; |244| 

           MVKL    .S1     _UMAddData,A0     ; |246| 
||         LDW     .D2T1   *+SP(8),A6        ; |246| 

           MVKH    .S1     _UMAddData,A0     ; |246| 
||         LDW     .D2T2   *+SP(44),B6       ; |246| 

           LDW     .D2T2   *+SP(28),B4       ; |246| 
||         B       .S2X    A0                ; |246| 

           LDW     .D2T1   *+SP(4),A4        ; |246| 
           MVKL    .S2     RL10,B3           ; |246| 
           MVKH    .S2     RL10,B3           ; |246| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |246| 
           LDW     .D2T2   *+SP(160),B11     ; |247| 
           LDW     .D2T2   *+SP(156),B10     ; |247| 
           LDW     .D2T2   *+SP(152),B9      ; |247| 
           LDW     .D2T2   *+SP(148),B8      ; |247| 
           LDW     .D2T2   *+SP(144),B7      ; |247| 
           LDW     .D2T2   *+SP(136),B5      ; |247| 
           LDW     .D2T2   *+SP(124),B2      ; |247| 
           LDW     .D2T2   *+SP(120),B1      ; |247| 
           LDW     .D2T2   *+SP(116),B0      ; |247| 
           LDW     .D2T1   *+SP(112),A11     ; |247| 
           LDW     .D2T1   *+SP(108),A10     ; |247| 
           LDW     .D2T1   *+SP(104),A9      ; |247| 
           LDW     .D2T1   *+SP(100),A8      ; |247| 
           LDW     .D2T1   *+SP(96),A7       ; |247| 
           LDW     .D2T1   *+SP(88),A5       ; |247| 
           LDW     .D2T1   *+SP(80),A3       ; |247| 
           LDW     .D2T1   *+SP(76),A2       ; |247| 
           LDW     .D2T1   *+SP(72),A1       ; |247| 
           LDW     .D2T1   *+SP(68),A0       ; |247| 
           LDW     .D2T2   *+SP(128),B3      ; |247| 
           LDW     .D2T2   *+SP(132),B4      ; |247| 
           LDW     .D2T1   *+SP(92),A6       ; |247| 

           B       .S2     IRP               ; |247| 
||         LDW     .D2T2   *+SP(140),B6      ; |247| 

           LDW     .D2T1   *+SP(84),A4       ; |247| 
           ADDK    .S2     160,SP            ; |247| 
           NOP             3
           ; BRANCH OCCURS                   ; |247| 


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
           B       .S2     IRP               ; |251| 
           NOP             5
           ; BRANCH OCCURS                   ; |251| 


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
           STW     .D2T2   B9,*SP--(88)      ; |254| 
           STW     .D2T1   A0,*+SP(12)       ; |254| 
           STW     .D2T2   B7,*+SP(80)       ; |254| 
           STW     .D2T2   B6,*+SP(76)       ; |254| 
           STW     .D2T2   B5,*+SP(72)       ; |254| 
           STW     .D2T2   B4,*+SP(68)       ; |254| 
           STW     .D2T2   B3,*+SP(64)       ; |254| 
           STW     .D2T2   B2,*+SP(60)       ; |254| 
           STW     .D2T2   B1,*+SP(56)       ; |254| 
           STW     .D2T2   B0,*+SP(52)       ; |254| 
           STW     .D2T1   A9,*+SP(48)       ; |254| 
           STW     .D2T1   A8,*+SP(44)       ; |254| 
           STW     .D2T1   A7,*+SP(40)       ; |254| 
           STW     .D2T1   A6,*+SP(36)       ; |254| 
           STW     .D2T1   A5,*+SP(32)       ; |254| 
           STW     .D2T1   A4,*+SP(28)       ; |254| 
           STW     .D2T1   A3,*+SP(24)       ; |254| 
           STW     .D2T1   A2,*+SP(20)       ; |254| 

           STW     .D2T1   A1,*+SP(16)       ; |254| 
||         MVKL    .S1     0x2000008,A0      ; |257| 

           MVKH    .S1     0x2000008,A0      ; |257| 
||         STW     .D2T2   B8,*+SP(84)       ; |254| 

           LDW     .D1T1   *A0,A0            ; |257| 
           NOP             4
           AND     .S1     15,A0,A0          ; |257| 
           CMPEQ   .L1     A0,1,A1           ; |257| 
   [ A1]   B       .S1     L16               ; |257| 
           STW     .D2T1   A0,*+SP(4)        ; |257| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |291| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |291| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |291| 
   [ A1]   LDW     .D2T2   *+SP(68),B4       ; |291| 
           ; BRANCH OCCURS                   ; |257| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(4),B4        ; |258| 
           NOP             3
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L9
;** --------------------------------------------------------------------------*
L9:    
           NOP             1
           CMPEQ   .L2     B4,4,B0           ; |258| 
   [!B0]   B       .S1     L11               ; |258| 

   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |270| 
|| [ B0]   MVKL    .S1     0x2000014,A0      ; |259| 

   [ B0]   MVKH    .S1     0x2000014,A0      ; |259| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |259| 
           NOP             2
           ; BRANCH OCCURS                   ; |258| 
;** --------------------------------------------------------------------------*
           NOP             2
           AND     .S1     1,A0,A1           ; |259| 
   [!A1]   B       .S1     L15               ; |259| 
   [!A1]   MVKL    .S1     0x2000008,A0      ; |290| 
   [!A1]   MVKH    .S1     0x2000008,A0      ; |290| 

   [ A1]   ZERO    .D2     B4                ; |260| 
|| [ A1]   MVKL    .S2     _compacket+124,B5 ; |260| 
|| [!A1]   LDW     .D1T1   *A0,A0            ; |290| 

   [ A1]   MVKH    .S2     0x2000000,B4      ; |260| 

   [ A1]   MVKH    .S2     _compacket+124,B5 ; |260| 
|| [ A1]   LDW     .D2T2   *B4,B4            ; |260| 

           ; BRANCH OCCURS                   ; |259| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *B5,B5            ; |260| 
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L10:    
           MVKL    .S1     _compacket+124,A0 ; |261| 
           MVKH    .S1     _compacket+124,A0 ; |261| 
           EXTU    .S2     B4,24,24,B4       ; |260| 
           STB     .D2T2   B4,*B5            ; |260| 
           LDW     .D1T1   *A0,A3            ; |261| 
           MVKL    .S1     _SendByte,A0      ; |261| 
           MVKH    .S1     _SendByte,A0      ; |261| 
           MVKL    .S2     RL12,B3           ; |261| 
           B       .S2X    A0                ; |261| 
           LDB     .D1T1   *A3,A4            ; |261| 
           MVKH    .S2     RL12,B3           ; |261| 
           NOP             3
RL12:      ; CALL OCCURS                     ; |261| 
           MVKL    .S2     _compacket+124,B4 ; |262| 
           MVKH    .S2     _compacket+124,B4 ; |262| 
           LDW     .D2T2   *B4,B4            ; |262| 
           MVKL    .S1     _compacket+99,A0  ; |262| 
           MVKH    .S1     _compacket+99,A0  ; |262| 
           NOP             2
           CMPEQ   .L1X    B4,A0,A1          ; |262| 
   [!A1]   MVKL    .S2     _compacket+124,B4 ; |266| 
   [!A1]   MVKH    .S2     _compacket+124,B4 ; |266| 
   [!A1]   LDW     .D2T2   *B4,B5            ; |266| 
   [ A1]   MVKL    .S2     _compacket+124,B4 ; |263| 
   [ A1]   MVKL    .S1     _compacket,A0     ; |263| 
   [ A1]   MVKH    .S2     _compacket+124,B4 ; |263| 
   [ A1]   MVKH    .S1     _compacket,A0     ; |263| 

           MVKL    .S2     0x2000014,B5      ; |268| 
|| [!A1]   ADD     .D2     1,B5,B6           ; |266| 

   [!A1]   STW     .D2T2   B6,*B4            ; |266| 

   [ A1]   STW     .D2T1   A0,*B4            ; |263| 
||         MVKH    .S2     0x2000014,B5      ; |268| 

           LDW     .D2T2   *B5,B4            ; |268| 
           NOP             4
           AND     .S2     1,B4,B0           ; |268| 
   [ B0]   B       .S1     L10               ; |268| 

   [ B0]   ZERO    .D2     B4                ; |260| 
|| [ B0]   MVKL    .S2     _compacket+124,B5 ; |260| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |260| 

   [ B0]   MVKH    .S2     _compacket+124,B5 ; |260| 
|| [ B0]   LDW     .D2T2   *B4,B4            ; |260| 

   [ B0]   LDW     .D2T2   *B5,B5            ; |260| 
           NOP             1
           ; BRANCH OCCURS                   ; |268| 
;** --------------------------------------------------------------------------*
           B       .S1     L15               ; |269| 
           MVKL    .S1     0x2000008,A0      ; |290| 
           MVKH    .S1     0x2000008,A0      ; |290| 
           LDW     .D1T1   *A0,A0            ; |290| 
           NOP             2
           ; BRANCH OCCURS                   ; |269| 
;** --------------------------------------------------------------------------*
L11:    
           CMPEQ   .L2     B4,2,B0           ; |270| 
   [!B0]   B       .S1     L12               ; |270| 
   [ B0]   MVKL    .S2     _respacket+200,B4 ; |271| 
           NOP             3
   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |279| 
           ; BRANCH OCCURS                   ; |270| 
;** --------------------------------------------------------------------------*
           MVKH    .S2     _respacket+200,B4 ; |271| 
           LDW     .D2T2   *B4,B5            ; |271| 
           NOP             4
           CMPGT   .L2     B5,0,B0           ; |271| 

   [ B0]   MVKL    .S1     _respacket+204,A0 ; |272| 
||         SUB     .D2     B5,1,B5           ; |271| 

   [ B0]   MVKH    .S1     _respacket+204,A0 ; |272| 
||         STW     .D2T2   B5,*B4            ; |271| 

   [ B0]   LDW     .D1T1   *A0,A3            ; |272| 
   [ B0]   MVKL    .S1     _respacket,A4     ; |272| 
   [ B0]   MVKH    .S1     _respacket,A4     ; |272| 
   [!B0]   MVKL    .S1     0x2000004,A0      ; |275| 
   [!B0]   MVKL    .S2     _respacket+208,B4 ; |276| 
   [ B0]   ADD     .D1     1,A3,A5           ; |272| 
   [ B0]   STW     .D1T1   A5,*A0            ; |272| 

           B       .S1     L14               ; |278| 
|| [ B0]   LDB     .D1T1   *+A3[A4],A0       ; |272| 

   [!B0]   MVKH    .S1     0x2000004,A0      ; |275| 
   [!B0]   MVK     .S2     1,B5              ; |275| 

   [!B0]   ZERO    .D2     B5                ; |276| 
|| [ B0]   ZERO    .L2     B4                ; |272| 
|| [!B0]   MVKH    .S2     _respacket+208,B4 ; |276| 
|| [!B0]   STW     .D1T2   B5,*A0            ; |275| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |272| 
|| [!B0]   STW     .D2T2   B5,*B4            ; |276| 

   [ B0]   STW     .D2T1   A0,*B4            ; |272| 
           ; BRANCH OCCURS                   ; |278| 
;** --------------------------------------------------------------------------*
L12:    
           NOP             4
           CMPEQ   .L2     B4,12,B0          ; |279| 
   [!B0]   B       .S1     L14               ; |279| 
           NOP             2
   [ B0]   MVKL    .S1     0x2000014,A0      ; |280| 
   [ B0]   MVKH    .S1     0x2000014,A0      ; |280| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |280| 
           ; BRANCH OCCURS                   ; |279| 
;** --------------------------------------------------------------------------*
           NOP             4
           AND     .S1     1,A0,A1           ; |280| 
   [!A1]   B       .S1     L14               ; |280| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |281| 
           ; BRANCH OCCURS                   ; |280| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L13:    

           MVKH    .S2     0x2000000,B4      ; |281| 
||         MVKL    .S1     _compacket+124,A0 ; |281| 

           LDW     .D2T2   *B4,B4            ; |281| 
||         MVKH    .S1     _compacket+124,A0 ; |281| 

           LDW     .D1T1   *A0,A3            ; |281| 
           MVKL    .S1     _compacket+124,A0 ; |282| 
           MVKH    .S1     _compacket+124,A0 ; |282| 
           NOP             1
           EXTU    .S2     B4,24,24,B4       ; |281| 
           STB     .D1T2   B4,*A3            ; |281| 
           LDW     .D1T1   *A0,A0            ; |282| 
           MVKL    .S2     _compacket+99,B4  ; |282| 
           MVKH    .S2     _compacket+99,B4  ; |282| 
           NOP             2
           CMPEQ   .L2X    A0,B4,B0          ; |282| 
   [!B0]   MVKL    .S1     _compacket+124,A0 ; |286| 
   [!B0]   MVKH    .S1     _compacket+124,A0 ; |286| 
   [!B0]   MV      .D1     A0,A4             ; |286| 
   [!B0]   LDW     .D1T1   *A4,A0            ; |286| 
   [ B0]   MVKL    .S1     _compacket+124,A0 ; |283| 
   [ B0]   MVKL    .S2     _compacket,B4     ; |283| 
   [ B0]   MVKH    .S1     _compacket+124,A0 ; |283| 
   [ B0]   MVKH    .S2     _compacket,B4     ; |283| 

           MVKL    .S1     0x2000014,A0      ; |288| 
|| [!B0]   ADD     .L1     1,A0,A3           ; |286| 
|| [ B0]   STW     .D1T2   B4,*A0            ; |283| 

           MVKH    .S1     0x2000014,A0      ; |288| 
|| [!B0]   STW     .D1T1   A3,*A4            ; |286| 

           LDW     .D1T1   *A0,A0            ; |288| 
           NOP             4
           AND     .S1     1,A0,A1           ; |288| 
   [ A1]   B       .S1     L13               ; |288| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |281| 
           ; BRANCH OCCURS                   ; |288| 
;** --------------------------------------------------------------------------*
L14:    
           MVKL    .S1     0x2000008,A0      ; |290| 
           MVKH    .S1     0x2000008,A0      ; |290| 
           LDW     .D1T1   *A0,A0            ; |290| 
           NOP             2
;** --------------------------------------------------------------------------*
L15:    
           NOP             2
           AND     .S1     15,A0,A0          ; |290| 
           CMPEQ   .L1     A0,1,A1           ; |290| 
   [!A1]   B       .S1     L9                ; |290| 
           STW     .D2T1   A0,*+SP(4)        ; |290| 
   [!A1]   LDW     .D2T2   *+SP(4),B4        ; |258| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |291| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |291| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |291| 
           ; BRANCH OCCURS                   ; |290| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(68),B4       ; |291| 
;** --------------------------------------------------------------------------*
L16:    
           LDW     .D2T2   *+SP(64),B3       ; |291| 
           LDW     .D2T2   *+SP(60),B2       ; |291| 
           LDW     .D2T2   *+SP(56),B1       ; |291| 
           LDW     .D2T2   *+SP(52),B0       ; |291| 
           LDW     .D2T1   *+SP(48),A9       ; |291| 
           LDW     .D2T1   *+SP(44),A8       ; |291| 
           LDW     .D2T1   *+SP(40),A7       ; |291| 
           LDW     .D2T1   *+SP(36),A6       ; |291| 
           LDW     .D2T1   *+SP(32),A5       ; |291| 
           LDW     .D2T1   *+SP(28),A4       ; |291| 
           LDW     .D2T1   *+SP(24),A3       ; |291| 
           LDW     .D2T1   *+SP(20),A2       ; |291| 
           LDW     .D2T1   *+SP(16),A1       ; |291| 
           LDW     .D2T1   *+SP(12),A0       ; |291| 

           B       .S2     IRP               ; |291| 
||         LDW     .D2T2   *+SP(84),B8       ; |291| 

           LDW     .D2T2   *++SP(88),B9      ; |291| 
           NOP             4
           ; BRANCH OCCURS                   ; |291| 


;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_cos
	.global	_fabsf
	.global	_PWMOut
	.global	_GetAngle
	.global	_SendByte
	.global	_UMAddData
	.global	_compacket
	.global	_respacket
	.global	_TINTCnt
