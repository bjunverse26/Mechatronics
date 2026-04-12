;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Wed Apr 08 12:03:04 2026                                *
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
	.field  	_traj_cnt+0,32
	.field  	0,32			; _traj_cnt @ 0
	.sect	".text"
	.global	_traj_cnt
_traj_cnt:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_R_lab3+0,32
	.word	042b40000h		; _R_lab3 @ 0
	.sect	".text"
	.global	_R_lab3
_R_lab3:	.usect	.far,4,4
	.global	_u_lab3
_u_lab3:	.usect	.far,4,4
	.global	_u_sat_lab3
_u_sat_lab3:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_use_tracking+0,32
	.field  	1,32			; _use_tracking @ 0
	.sect	".text"
	.global	_use_tracking
_use_tracking:	.usect	.far,4,4
	.global	_ref_mon
_ref_mon:	.usect	.far,4,4
	.global	_u_mon
_u_mon:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_a+0,32
	.word	0463b8000h		; _a @ 0
	.sect	".text"
	.global	_a
_a:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_Vmax+0,32
	.word	044bb8000h		; _Vmax @ 0
	.sect	".text"
	.global	_Vmax
_Vmax:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_Sref+0,32
	.word	044340000h		; _Sref @ 0
	.sect	".text"
	.global	_Sref
_Sref:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_R_lab4+0,32
	.word	000000000h		; _R_lab4 @ 0
	.sect	".text"
	.global	_R_lab4
_R_lab4:	.usect	.far,4,4
	.global	_u_lab4
_u_lab4:	.usect	.far,4,4
	.global	_u_sat_lab4
_u_sat_lab4:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_target_v+0,32
	.word	000000000h		; _target_v @ 0
	.sect	".text"
	.global	_target_v
_target_v:	.usect	.far,4,4
	.global	_t1
_t1:	.usect	.far,4,4
	.global	_t2
_t2:	.usect	.far,4,4
	.global	_t3
_t3:	.usect	.far,4,4
	.global	_S1
_S1:	.usect	.far,4,4
	.global	_S2
_S2:	.usect	.far,4,4
	.global	_traj_mode
_traj_mode:	.usect	.far,4,4
	.global	_y
_y:	.usect	.far,4,4
	.global	_error
_error:	.usect	.far,4,4
_s_error:	.usect	.far,4,4
_p_error:	.usect	.far,4,4
	.global	_P_term
_P_term:	.usect	.far,4,4
	.global	_I_term
_I_term:	.usect	.far,4,4
	.global	_D_term
_D_term:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\W10\AppData\Local\Temp\TI5864_2 --template_info_file C:\Users\W10\AppData\Local\Temp\TI5864_3 --object_file interrupt.obj --opt_shell 9 interrupt.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 interrupt.c 
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
	.global	_InitTrajectory

;******************************************************************************
;* FUNCTION NAME: _InitTrajectory                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP                                           *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP                                           *
;*   Local Frame Size  : 0 Args + 80 Auto + 44 Save = 124 byte                *
;******************************************************************************
_InitTrajectory:
;** --------------------------------------------------------------------------*
           ADDK    .S2     -128,SP           ; |63| 
           STW     .D2T1   A11,*+SP(92)      ; |63| 
           STW     .D2T1   A12,*+SP(96)      ; |63| 
           STW     .D2T1   A13,*+SP(100)     ; |63| 
           STW     .D2T1   A14,*+SP(104)     ; |63| 
           STW     .D2T1   A15,*+SP(108)     ; |63| 
           STW     .D2T2   B3,*+SP(112)      ; |63| 
           STW     .D2T2   B10,*+SP(116)     ; |63| 
           STW     .D2T2   B11,*+SP(120)     ; |63| 

           STW     .D2T2   B12,*+SP(124)     ; |63| 
||         MVKL    .S1     _R_lab4,A0        ; |65| 

           STW     .D2T2   B13,*+SP(128)     ; |63| 
||         MVKL    .S1     _s_error,A3       ; |67| 
||         MVKL    .S2     _traj_cnt,B4      ; |64| 

           MVKL    .S1     _p_error,A4       ; |68| 
||         STW     .D2T1   A10,*+SP(88)      ; |63| 
||         MVKH    .S2     _traj_cnt,B4      ; |64| 
||         ZERO    .L2     B5                ; |64| 

           MVKL    .S2     _target_v,B4      ; |66| 
||         STW     .D2T2   B5,*B4            ; |64| 
||         MVKH    .S1     _R_lab4,A0        ; |65| 

           STW     .D1T2   B5,*A0            ; |65| 
||         MVKH    .S2     _target_v,B4      ; |66| 
||         MVKH    .S1     _s_error,A3       ; |67| 

           STW     .D2T2   B5,*B4            ; |66| 
||         MVKH    .S1     _p_error,A4       ; |68| 
||         ZERO    .D1     A5                ; |67| 

           ZERO    .L1     A3                ; |68| 
||         STW     .D1T1   A5,*A3            ; |67| 
||         MVKL    .S2     _Vmax,B4          ; |70| 
||         MVKL    .S1     _Vmax,A0          ; |70| 

           STW     .D1T1   A3,*A4            ; |68| 
||         MVKH    .S2     _Vmax,B4          ; |70| 
||         MVKH    .S1     _Vmax,A0          ; |70| 

           LDW     .D2T2   *B4,B4            ; |70| 
||         LDW     .D1T1   *A0,A0            ; |70| 
||         MVKL    .S2     _a,B6             ; |70| 

           MVKH    .S2     _a,B6             ; |70| 
           MVKL    .S2     __divf,B5         ; |70| 
           MVKH    .S2     __divf,B5         ; |70| 
           B       .S2     B5                ; |70| 

           LDW     .D2T2   *B6,B4            ; |70| 
||         MPYSP   .M1X    B4,A0,A4          ; |70| 

           MVKL    .S2     RL0,B3            ; |70| 
           MVKH    .S2     RL0,B3            ; |70| 
           NOP             2
RL0:       ; CALL OCCURS                     ; |70| 
           MVKL    .S1     _t3,A0            ; |87| 

           MVKL    .S1     _t1,A0            ; |85| 
||         STW     .D2T1   A0,*+SP(4)        ; |87| 

           STW     .D2T1   A0,*+SP(16)       ; |85| 
           LDW     .D2T1   *+SP(4),A0        ; |83| 
           MVKL    .S2     _S1,B4            ; |78| 
           STW     .D2T2   B4,*+SP(8)        ; |86| 
           MVKL    .S2     _t1,B4            ; |78| 
           STW     .D2T2   B4,*+SP(12)       ; |85| 
           MVKH    .S1     _t3,A0            ; |87| 

           MVKL    .S1     _S2,A0            ; |79| 
||         STW     .D2T1   A0,*+SP(4)        ; |76| 

           ZERO    .D1     A0                ; |87| 
||         STW     .D2T1   A0,*+SP(32)       ; |79| 

           MVKH    .S1     0x40000000,A0     ; |87| 
||         STW     .D2T1   A0,*+SP(40)       ; |70| 

           MVKL    .S1     _Sref,A0          ; |79| 
||         STW     .D2T1   A0,*+SP(40)       ; |75| 

           MVKL    .S1     _a,A0             ; |78| 
||         STW     .D2T1   A0,*+SP(48)       ; |79| 

           STW     .D2T1   A0,*+SP(56)       ; |78| 
           LDW     .D2T1   *+SP(16),A0       ; |89| 
           MVKL    .S2     _t1,B4            ; |78| 

           MVKL    .S2     _t3,B4            ; |76| 
||         STW     .D2T2   B4,*+SP(20)       ; |85| 

           MVKL    .S2     _t1,B4            ; |76| 
||         STW     .D2T2   B4,*+SP(24)       ; |76| 

           MVKL    .S2     _t2,B4            ; |76| 
||         STW     .D2T2   B4,*+SP(28)       ; |76| 

           STW     .D2T2   B4,*+SP(36)       ; |76| 
||         MVKH    .S1     _t1,A0            ; |85| 

           MVKL    .S1     _t2,A0            ; |75| 
||         STW     .D2T1   A0,*+SP(16)       ; |74| 

           MVKL    .S2     __divf,B4         ; |75| 
||         STW     .D2T1   A0,*+SP(64)       ; |75| 

           STW     .D2T2   B4,*+SP(44)       ; |75| 

           MVKL    .S1     _Sref,A0          ; |75| 
||         LDW     .D2T2   *+SP(8),B4        ; |75| 

           STW     .D2T1   A0,*+SP(68)       ; |75| 
           LDW     .D2T1   *+SP(32),A0       ; |75| 
           LDW     .D2T2   *+SP(36),B8       ; |74| 
           MVKL    .S1     _Sref,A9          ; |70| 
           MVKH    .S2     _S1,B4            ; |78| 
           STW     .D2T2   B4,*+SP(8)        ; |79| 
           MVKH    .S1     _S2,A0            ; |79| 

           STW     .D2T1   A0,*+SP(32)       ; |74| 
||         MVKL    .S2     _Vmax,B4          ; |75| 

           STW     .D2T2   B4,*+SP(52)       ; |75| 

           LDW     .D2T2   *+SP(12),B4       ; |75| 
||         MVKL    .S1     _t1,A0            ; |74| 

           STW     .D2T1   A0,*+SP(72)       ; |74| 

           LDW     .D2T1   *+SP(48),A0       ; |74| 
||         MVKH    .S2     _t2,B8            ; |76| 

           STW     .D2T2   B8,*+SP(36)       ; |70| 
           LDW     .D2T2   *+SP(44),B8       ; |70| 
           MVKH    .S2     _t1,B4            ; |78| 
           STW     .D2T2   B4,*+SP(12)       ; |79| 
           LDW     .D2T2   *+SP(20),B4       ; |79| 
           MVKH    .S1     _Sref,A0          ; |79| 

           STW     .D2T1   A0,*+SP(48)       ; |90| 
||         MVKH    .S2     __divf,B8         ; |75| 

           STW     .D2T2   B8,*+SP(44)       ; |74| 
           LDW     .D2T1   *+SP(56),A0       ; |90| 

           LDW     .D2T2   *+SP(52),B8       ; |90| 
||         MVKH    .S2     _t1,B4            ; |78| 

           MVKL    .S2     _t1,B4            ; |89| 
||         STW     .D2T2   B4,*+SP(20)       ; |78| 

           STW     .D2T2   B4,*+SP(60)       ; |89| 
           LDW     .D2T2   *+SP(24),B4       ; |89| 
           MVKH    .S1     _a,A0             ; |78| 

           MVKH    .S2     _Vmax,B8          ; |75| 
||         STW     .D2T1   A0,*+SP(56)       ; |89| 

           STW     .D2T2   B8,*+SP(52)       ; |74| 
||         ZERO    .D1     A0                ; |78| 

           STW     .D2T1   A0,*+SP(80)       ; |72| 
||         MVKL    .S2     _S2,B8            ; |90| 

           STW     .D2T2   B8,*+SP(76)       ; |90| 
||         MVKH    .S2     _t3,B4            ; |76| 

           STW     .D2T2   B4,*+SP(24)       ; |75| 
||         MVKH    .S1     0x3f000000,A0     ; |78| 

           STW     .D2T1   A0,*+SP(80)       ; |89| 
           LDW     .D2T2   *+SP(60),B8       ; |90| 
           LDW     .D2T2   *+SP(28),B4       ; |89| 
           LDW     .D2T1   *+SP(64),A0       ; |89| 
           MVKH    .S1     _Sref,A9          ; |70| 
           MVKL    .S1     _Sref,A6          ; |85| 
           MVKH    .S2     _t1,B8            ; |89| 

           STW     .D2T2   B8,*+SP(60)       ; |89| 
||         MVKH    .S2     _t1,B4            ; |76| 

           MVKH    .S1     _t2,A0            ; |75| 
||         STW     .D2T2   B4,*+SP(28)       ; |75| 

           STW     .D2T1   A0,*+SP(64)       ; |89| 
           LDW     .D2T1   *+SP(68),A0       ; |89| 
           LDW     .D1T1   *A9,A9            ; |70| 
           MVKL    .S2     _a,B4             ; |74| 
           LDW     .D2T2   *+SP(76),B8       ; |90| 
           MVKL    .S1     _traj_mode,A7     ; |72| 
           MVKH    .S1     _Sref,A0          ; |75| 

           STW     .D2T1   A0,*+SP(68)       ; |70| 
||         CMPGTSP .S1     A9,A4,A1          ; |70| 

           LDW     .D2T1   *+SP(72),A0       ; |70| 
           MVKH    .S2     _a,B4             ; |74| 
           MVKL    .S1     _t1,A10           ; |87| 

           MVKL    .S2     __divf,B6         ; |85| 
||         MVKL    .S1     _t2,A12           ; |86| 

           MVKH    .S2     __divf,B6         ; |85| 
||         MVKL    .S1     _t1,A14           ; |86| 

           MVKL    .S2     RL2,B3            ; |74| 
||         MVKH    .S1     _t1,A0            ; |74| 

           MVKL    .S1     _S1,A15           ; |79| 
||         MVKH    .S2     _S2,B8            ; |90| 

           MVKL    .S1     _a,A11            ; |89| 
||         MVKH    .S2     RL2,B3            ; |74| 

           MVKL    .S2     _a,B7             ; |85| 
||         MVK     .S1     1,A8              ; |83| 

           MVKH    .S2     _a,B7             ; |85| 
||         MVKH    .S1     _Sref,A6          ; |85| 

           MVKL    .S2     _sqrtf,B12        ; |85| 
||         MVKH    .S1     _traj_mode,A7     ; |72| 

           MVKL    .S2     _t1,B11           ; |89| 
||         MVKH    .S1     _t1,A10           ; |87| 

           MVKL    .S2     _S1,B10           ; |89| 
||         MVKH    .S1     _t2,A12           ; |86| 

           MVKL    .S2     _S1,B13           ; |90| 
||         MVKH    .S1     _t1,A14           ; |86| 

           ZERO    .D1     A13               ; |89| 
||         MVKH    .S2     _sqrtf,B12        ; |85| 
||         MVKH    .S1     _S1,A15           ; |79| 

           MVKH    .S1     0x3f000000,A13    ; |89| 
|| [!A1]   B       .S2     L1                ; |70| 

           MVKH    .S1     _a,A11            ; |89| 
||         MVKH    .S2     _t1,B11           ; |89| 

           MVKL    .S1     _traj_mode,A5     ; |83| 
||         MVKH    .S2     _S1,B10           ; |89| 

           MVKL    .S1     _Vmax,A3          ; |74| 
||         MVKH    .S2     _S1,B13           ; |90| 

           STW     .D2T1   A0,*+SP(72)       ; |90| 
||         MVKL    .S2     __divf,B5         ; |74| 
||         MVKH    .S1     _traj_mode,A5     ; |83| 

           STW     .D2T2   B8,*+SP(76)       ; |90| 
||         ZERO    .D1     A0                ; |72| 
||         MVKH    .S2     __divf,B5         ; |74| 
||         MVKH    .S1     _Vmax,A3          ; |74| 

           ; BRANCH OCCURS                   ; |70| 
;** --------------------------------------------------------------------------*

           B       .S2     B5                ; |74| 
||         STW     .D1T1   A0,*A7            ; |72| 

           LDW     .D1T1   *A3,A4            ; |74| 
||         LDW     .D2T2   *B4,B4            ; |74| 

           NOP             4
RL2:       ; CALL OCCURS                     ; |74| 
           LDW     .D2T1   *+SP(72),A0       ; |74| 
           MVKL    .S2     RL4,B3            ; |75| 
           MVKH    .S2     RL4,B3            ; |75| 
           NOP             2
           STW     .D1T1   A4,*A0            ; |74| 
           LDW     .D2T2   *+SP(44),B5       ; |75| 
           LDW     .D2T2   *+SP(52),B4       ; |74| 
           LDW     .D2T1   *+SP(68),A0       ; |74| 
           NOP             3
           B       .S2     B5                ; |75| 

           LDW     .D2T2   *B4,B4            ; |75| 
||         LDW     .D1T1   *A0,A4            ; |75| 

           NOP             4
RL4:       ; CALL OCCURS                     ; |75| 
           LDW     .D2T1   *+SP(64),A0       ; |75| 
           NOP             4
           STW     .D1T1   A4,*A0            ; |75| 
           LDW     .D2T2   *+SP(28),B5       ; |76| 
           LDW     .D2T2   *+SP(36),B4       ; |75| 
           NOP             3
           LDW     .D2T2   *B5,B5            ; |76| 
           LDW     .D2T2   *B4,B4            ; |76| 
           NOP             4

           LDW     .D2T2   *+SP(24),B5
||         ADDSP   .L2     B5,B4,B4          ; |76| 

           NOP             4
           STW     .D2T2   B4,*B5            ; |76| 
           LDW     .D2T1   *+SP(56),A0       ; |76| 
           LDW     .D2T2   *+SP(20),B4
           LDW     .D2T1   *+SP(80),A3       ; |78| 
           LDW     .D2T2   *+SP(12),B5
           NOP             1
           LDW     .D1T1   *A0,A0            ; |78| 
           LDW     .D2T2   *B4,B4            ; |78| 
           NOP             3
           MPYSP   .M1     A0,A3,A0          ; |78| 
           LDW     .D2T2   *B5,B5            ; |78| 
           NOP             2
           MPYSP   .M2X    B4,A0,B4          ; |78| 
           NOP             3

           LDW     .D2T2   *+SP(8),B5
||         MPYSP   .M2     B5,B4,B4          ; |78| 

           NOP             4
           STW     .D2T2   B4,*B5            ; |78| 
           LDW     .D2T1   *+SP(48),A3       ; |79| 
           LDW     .D1T1   *A15,A0           ; |79| 
           NOP             3
           LDW     .D1T1   *A3,A3            ; |79| 
           NOP             4
           SUBSP   .L1     A3,A0,A0          ; |79| 

           LDW     .D2T1   *+SP(32),A3
||         B       .S1     L2                ; |80| 

           NOP             4
           STW     .D1T1   A0,*A3            ; |79| 
           ; BRANCH OCCURS                   ; |80| 
;** --------------------------------------------------------------------------*
L1:    

           B       .S2     B6                ; |85| 
||         STW     .D1T1   A8,*A5            ; |83| 

           LDW     .D2T2   *B7,B4            ; |85| 
||         LDW     .D1T1   *A6,A4            ; |85| 

           MVKL    .S2     RL6,B3            ; |85| 
           MVKH    .S2     RL6,B3            ; |85| 
           NOP             2
RL6:       ; CALL OCCURS                     ; |85| 
           B       .S2     B12               ; |85| 
           MVKL    .S2     RL8,B3            ; |85| 
           MVKH    .S2     RL8,B3            ; |85| 
           NOP             3
RL8:       ; CALL OCCURS                     ; |85| 
           LDW     .D2T1   *+SP(16),A0       ; |85| 
           NOP             4
           STW     .D1T1   A4,*A0            ; |85| 
           LDW     .D1T1   *A14,A0           ; |86| 
           NOP             4
           STW     .D1T1   A0,*A12           ; |86| 
           LDW     .D2T1   *+SP(40),A0
           LDW     .D1T1   *A10,A3           ; |87| 
           NOP             4

           LDW     .D2T1   *+SP(4),A0
||         MPYSP   .M1     A3,A0,A3          ; |87| 

           NOP             4
           STW     .D1T1   A3,*A0            ; |87| 
           LDW     .D2T2   *+SP(60),B4
           LDW     .D1T1   *A11,A0           ; |89| 
           LDW     .D2T2   *B11,B5           ; |89| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |89| 
           MPYSP   .M1     A0,A13,A0         ; |89| 
           NOP             3
           MPYSP   .M2X    B4,A0,B4          ; |89| 
           NOP             3
           MPYSP   .M2     B5,B4,B4          ; |89| 
           NOP             3
           STW     .D2T2   B4,*B10           ; |89| 
           LDW     .D2T2   *B13,B5           ; |90| 
           LDW     .D2T2   *+SP(76),B4
           NOP             4
           STW     .D2T2   B5,*B4            ; |90| 
;** --------------------------------------------------------------------------*
L2:    
           LDW     .D2T2   *+SP(112),B3      ; |92| 
           LDW     .D2T2   *+SP(124),B12     ; |92| 
           LDW     .D2T2   *+SP(120),B11     ; |92| 
           LDW     .D2T2   *+SP(116),B10     ; |92| 
           LDW     .D2T1   *+SP(108),A15     ; |92| 
           LDW     .D2T1   *+SP(104),A14     ; |92| 
           LDW     .D2T1   *+SP(100),A13     ; |92| 
           LDW     .D2T1   *+SP(96),A12      ; |92| 
           LDW     .D2T1   *+SP(92),A11      ; |92| 

           B       .S2     B3                ; |92| 
||         LDW     .D2T2   *+SP(128),B13     ; |92| 

           LDW     .D2T1   *+SP(88),A10      ; |92| 
           ADDK    .S2     128,SP            ; |92| 
           NOP             3
           ; BRANCH OCCURS                   ; |92| 


	.sect	".text"
	.global	_ISRtimer0

;******************************************************************************
;* FUNCTION NAME: _ISRtimer0                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,B0,B1, *
;*                           B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,SP       *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,B0,B1, *
;*                           B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,SP       *
;*   Local Frame Size  : 0 Args + 12 Auto + 116 Save = 128 byte               *
;******************************************************************************
_ISRtimer0:
;** --------------------------------------------------------------------------*
           ADDK    .S2     -128,SP           ; |95| 
           STW     .D2T2   B4,*+SP(92)       ; |95| 
           STW     .D2T2   B5,*+SP(96)       ; |95| 
           STW     .D2T1   A0,*+SP(20)       ; |95| 
           STW     .D2T1   A3,*+SP(32)       ; |95| 
           STW     .D2T1   A4,*+SP(36)       ; |95| 
           STW     .D2T1   A5,*+SP(40)       ; |95| 
           STW     .D2T1   A6,*+SP(44)       ; |95| 
           STW     .D2T1   A7,*+SP(48)       ; |95| 
           STW     .D2T1   A8,*+SP(52)       ; |95| 
           STW     .D2T1   A9,*+SP(56)       ; |95| 
           STW     .D2T1   A10,*+SP(60)      ; |95| 
           STW     .D2T1   A11,*+SP(64)      ; |95| 
           STW     .D2T1   A12,*+SP(68)      ; |95| 
           STW     .D2T1   A13,*+SP(72)      ; |95| 
           STW     .D2T2   B0,*+SP(76)       ; |95| 
           STW     .D2T2   B1,*+SP(80)       ; |95| 
           STW     .D2T2   B2,*+SP(84)       ; |95| 
           STW     .D2T2   B3,*+SP(88)       ; |95| 
           STW     .D2T2   B6,*+SP(100)      ; |95| 
           STW     .D2T2   B7,*+SP(104)      ; |95| 
           STW     .D2T2   B8,*+SP(108)      ; |95| 
           STW     .D2T2   B9,*+SP(112)      ; |95| 
           STW     .D2T2   B10,*+SP(116)     ; |95| 
           STW     .D2T2   B11,*+SP(120)     ; |95| 
           STW     .D2T2   B12,*+SP(124)     ; |95| 

           STW     .D2T2   B13,*+SP(128)     ; |95| 
||         MVKL    .S2     _TFlag,B4         ; |101| 

           MVK     .S2     1,B5              ; |101| 
||         STW     .D2T1   A2,*+SP(28)       ; |95| 

           MVKH    .S2     _TFlag,B4         ; |101| 
||         MVKL    .S1     _use_tracking,A0  ; |103| 
||         STW     .D2T1   A1,*+SP(24)       ; |95| 

           STW     .D2T2   B5,*B4            ; |101| 
||         MVKH    .S1     _use_tracking,A0  ; |103| 

           LDW     .D1T1   *A0,A1            ; |103| 
           MVKL    .S1     _target_v,A4      ; |148| 
           MVKL    .S2     _R_lab4,B5        ; |147| 
           MVKL    .S2     _traj_mode,B4     ; |106| 
           MVKH    .S2     _R_lab4,B5        ; |147| 
   [!A1]   B       .S2     L11               ; |103| 
           MVKL    .S1     0x3a83126f,A3     ; |104| 
           MVKH    .S1     _target_v,A4      ; |148| 
           MVKH    .S1     0x3a83126f,A3     ; |104| 
           MVKL    .S1     _traj_cnt,A0      ; |104| 

           MVKH    .S1     _traj_cnt,A0      ; |104| 
||         MVKH    .S2     _traj_mode,B4     ; |106| 
||         ZERO    .D2     B6                ; |147| 
||         ZERO    .D1     A5                ; |148| 

           ; BRANCH OCCURS                   ; |103| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A0,A0            ; |104| 
           NOP             4
           INTSPU  .L1     A0,A0             ; |104| 
           NOP             3
           MPYSP   .M1     A3,A0,A0          ; |104| 
           MVKL    .S1     _t1,A3            ; |128| 
           NOP             2
           STW     .D2T1   A0,*+SP(4)        ; |104| 
           LDW     .D2T2   *B4,B0            ; |106| 
           LDW     .D2T1   *+SP(4),A6        ; |108| 
           MVKL    .S1     _t1,A0            ; |108| 
           MVKH    .S1     _t1,A3            ; |128| 
           MVKH    .S1     _t1,A0            ; |108| 
   [ B0]   B       .S1     L6                ; |106| 
           MV      .L1     A6,A5             ; |128| 
   [ B0]   LDW     .D1T1   *A3,A6            ; |128| 
           NOP             3
           ; BRANCH OCCURS                   ; |106| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A0,A7            ; |108| 
           MVKL    .S1     _a,A5             ; |109| 
           MVKL    .S1     _t2,A3            ; |112| 
           MVKH    .S1     _a,A5             ; |109| 
           MVKL    .S2     _a,B4             ; |110| 
           CMPGTSP .S1     A6,A7,A1          ; |108| 
   [ A1]   B       .S2     L3                ; |108| 
           MVKL    .S1     _R_lab4,A0        ; |109| 
           MVKH    .S1     _t2,A3            ; |112| 

           MVKL    .S2     _target_v,B5      ; |110| 
||         ZERO    .D1     A4                ; |109| 

           MVKH    .S2     _a,B4             ; |110| 
||         MVKH    .S1     0x3f000000,A4     ; |109| 

           MV      .D1     A6,A7             ; |108| 
||         MVKH    .S1     _R_lab4,A0        ; |109| 
||         MVKH    .S2     _target_v,B5      ; |110| 
||         MV      .L1     A6,A8             ; |109| 

           ; BRANCH OCCURS                   ; |108| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A5,A3            ; |109| 
           NOP             4
           MPYSP   .M1     A3,A4,A3          ; |109| 
           NOP             3
           MPYSP   .M1     A6,A3,A3          ; |109| 
           NOP             3
           MPYSP   .M1     A7,A3,A3          ; |109| 
           NOP             3
           STW     .D1T1   A3,*A0            ; |109| 
           LDW     .D2T2   *B4,B6            ; |110| 
           LDW     .D2T2   *+SP(4),B4        ; |110| 
           MVKL    .S1     _traj_cnt,A0      ; |144| 
           NOP             2
           B       .S1     L10               ; |111| 
           MPYSP   .M2     B4,B6,B4          ; |110| 
           NOP             3
           STW     .D2T2   B4,*B5            ; |110| 
           ; BRANCH OCCURS                   ; |111| 
;** --------------------------------------------------------------------------*
L3:    
           LDW     .D1T1   *A3,A3            ; |112| 
           MVKL    .S1     _target_v,A4      ; |114| 
           MVKL    .S1     _t3,A6            ; |116| 
           MVKL    .S2     _S1,B6            ; |113| 
           MVKL    .S1     _Vmax,A5          ; |114| 
           CMPGTSP .S1     A8,A3,A1          ; |112| 
   [ A1]   B       .S2     L4                ; |112| 

           MVKL    .S1     _t1,A0            ; |113| 
||         MVKL    .S2     _Vmax,B5          ; |113| 

           MVKH    .S1     _target_v,A4      ; |114| 
||         MVKL    .S2     _R_lab4,B4        ; |113| 

           MVKH    .S1     _t3,A6            ; |116| 
||         MVKH    .S2     _S1,B6            ; |113| 

           MVKH    .S2     _Vmax,B5          ; |113| 
||         MVKH    .S1     _Vmax,A5          ; |114| 

           MV      .D1     A7,A3             ; |113| 
||         MVKH    .S1     _t1,A0            ; |113| 
||         MVKH    .S2     _R_lab4,B4        ; |113| 

           ; BRANCH OCCURS                   ; |112| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A0,A0            ; |113| 
           LDW     .D2T2   *B5,B5            ; |113| 
           LDW     .D2T2   *B6,B6            ; |113| 
           NOP             2
           SUBSP   .L1     A3,A0,A0          ; |113| 
           NOP             3
           MPYSP   .M2X    A0,B5,B5          ; |113| 
           NOP             3
           ADDSP   .L2     B5,B6,B5          ; |113| 
           NOP             3
           STW     .D2T2   B5,*B4            ; |113| 

           B       .S1     L9                ; |115| 
||         LDW     .D1T1   *A5,A0            ; |114| 

           NOP             4
           STW     .D1T1   A0,*A4            ; |114| 
           ; BRANCH OCCURS                   ; |115| 
;** --------------------------------------------------------------------------*
L4:    
           MVKL    .S1     _S2,A2            ; |118| 
           MVKL    .S1     _Vmax,A8          ; |119| 
           MVKL    .S1     _target_v,A10     ; |119| 

           MVKL    .S1     _Vmax,A0          ; |118| 
||         LDW     .D1T1   *A6,A6            ; |116| 

           MVKL    .S1     _Sref,A3          ; |122| 
           MVKL    .S1     _R_lab4,A5        ; |122| 
           MVKL    .S1     _a,A4             ; |118| 
           MVKL    .S1     _t2,A11           ; |117| 
           CMPGTSP .S1     A7,A6,A1          ; |116| 
           MVKH    .S1     _S2,A2            ; |118| 
           MVKH    .S1     _Vmax,A8          ; |119| 

           MVKH    .S1     _target_v,A10     ; |119| 
||         MVKL    .S2     _R_lab4,B5        ; |118| 

   [ A1]   B       .S2     L5                ; |116| 
||         MVKH    .S1     _Vmax,A0          ; |118| 

           MVKH    .S1     _Sref,A3          ; |122| 
||         MVKL    .S2     _target_v,B4      ; |123| 

           MVKH    .S1     _R_lab4,A5        ; |122| 
||         MVKL    .S2     _a,B6             ; |119| 

           MVKH    .S2     _R_lab4,B5        ; |118| 
||         MVKH    .S1     _a,A4             ; |118| 
||         ZERO    .D1     A9                ; |118| 

           MVKH    .S2     _target_v,B4      ; |123| 
||         MVKH    .S1     0x3f000000,A9     ; |118| 

           MV      .L1     A7,A6             ; |116| 
||         MVKH    .S1     _t2,A11           ; |117| 
||         MVKH    .S2     _a,B6             ; |119| 
||         ZERO    .D2     B7                ; |123| 
|| [ A1]   LDW     .D1T1   *A3,A0            ; |122| 

           ; BRANCH OCCURS                   ; |116| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A11,A3           ; |117| 
           NOP             4
           SUBSP   .L1     A6,A3,A3          ; |117| 
           NOP             3
           STW     .D2T1   A3,*+SP(8)        ; |117| 
           LDW     .D1T1   *A4,A3            ; |118| 
           LDW     .D1T1   *A0,A0            ; |118| 
           LDW     .D2T2   *+SP(8),B8        ; |118| 
           LDW     .D1T1   *A2,A4            ; |118| 
           NOP             1
           MPYSP   .M1     A3,A9,A3          ; |118| 
           NOP             3

           MPYSP   .M2X    B8,A3,B4
||         MPYSP   .M1X    B8,A0,A0          ; |118| 

           NOP             3

           MPYSP   .M2     B8,B4,B4
||         ADDSP   .L1     A0,A4,A0          ; |118| 

           NOP             3
           SUBSP   .L2X    A0,B4,B4          ; |118| 
           NOP             3
           STW     .D2T2   B4,*B5            ; |118| 
           LDW     .D2T2   *+SP(8),B5        ; |119| 
           LDW     .D2T2   *B6,B4            ; |119| 
           LDW     .D1T1   *A8,A0            ; |119| 
           NOP             3
           MPYSP   .M2     B5,B4,B4          ; |119| 
           NOP             2
           B       .S1     L9                ; |120| 
           SUBSP   .L1X    A0,B4,A0          ; |119| 
           NOP             3
           STW     .D1T1   A0,*A10           ; |119| 
           ; BRANCH OCCURS                   ; |120| 
;** --------------------------------------------------------------------------*
L5:    
           B       .S1     L10               ; |125| 
           NOP             3
           STW     .D1T1   A0,*A5            ; |122| 

           MVKL    .S1     _traj_cnt,A0      ; |144| 
||         STW     .D2T2   B7,*B4            ; |123| 

           ; BRANCH OCCURS                   ; |125| 
;** --------------------------------------------------------------------------*
L6:    
           MVKL    .S1     _a,A0             ; |129| 
           MVKH    .S1     _a,A0             ; |129| 
           ZERO    .D1     A3                ; |129| 
           MVKH    .S1     0x3f000000,A3     ; |129| 
           CMPGTSP .S1     A5,A6,A1          ; |128| 
   [!A1]   LDW     .D1T1   *A0,A0            ; |129| 
           MV      .D1     A5,A6             ; |130| 
           MVKL    .S1     _R_lab4,A4        ; |129| 
           MVKH    .S1     _R_lab4,A4        ; |129| 
           MVKL    .S2     _a,B5             ; |130| 
   [!A1]   MPYSP   .M1     A0,A3,A0          ; |129| 
           MVKH    .S2     _a,B5             ; |130| 
           MVKL    .S1     _t3,A9            ; |132| 
           MVKL    .S2     _target_v,B4      ; |130| 
   [!A1]   MPYSP   .M1     A6,A0,A0          ; |129| 
           MVKH    .S1     _t3,A9            ; |132| 
           MVKH    .S2     _target_v,B4      ; |130| 
           MV      .D1     A5,A12            ; |129| 
   [!A1]   MPYSP   .M1     A5,A0,A0          ; |129| 
   [ A1]   MVKL    .S1     _a,A7             ; |135| 
           NOP             2
   [!A1]   STW     .D1T1   A0,*A4            ; |129| 
   [!A1]   LDW     .D2T2   *B5,B6            ; |130| 
   [!A1]   LDW     .D2T2   *+SP(4),B5        ; |130| 
           NOP             2
   [!A1]   B       .S1     L8                ; |131| 
           NOP             1
   [!A1]   MPYSP   .M2     B5,B6,B5          ; |130| 
           NOP             3
           ; BRANCH OCCURS                   ; |131| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _S1,A4            ; |135| 
           MVKL    .S1     _a,A3             ; |136| 
           MVKL    .S1     _t1,A10           ; |134| 

           MVKL    .S1     _target_v,A5      ; |136| 
||         LDW     .D1T1   *A9,A9            ; |132| 

           MVKL    .S1     _Sref,A0          ; |139| 
           MVKL    .S1     _R_lab4,A8        ; |139| 
           MVKL    .S1     _a,A2             ; |134| 
           MVKL    .S1     _t1,A6            ; |133| 

           CMPGTSP .S1     A12,A9,A1         ; |132| 
||         ZERO    .D1     A11               ; |135| 

           MVKH    .S1     0x3f000000,A11    ; |135| 
           MVKH    .S1     _a,A7             ; |135| 
           MVKH    .S1     _S1,A4            ; |135| 
           MVKH    .S1     _a,A3             ; |136| 

   [ A1]   B       .S2     L7                ; |132| 
||         MVKH    .S1     _t1,A10           ; |134| 

           MVKH    .S1     _target_v,A5      ; |136| 

           MVKH    .S1     _Sref,A0          ; |139| 
||         MVKL    .S2     _target_v,B4      ; |140| 

           MVKH    .S1     _R_lab4,A8        ; |139| 
||         MVKL    .S2     _R_lab4,B7        ; |135| 

           MVKH    .S2     _target_v,B4      ; |140| 
||         MVKH    .S1     _a,A2             ; |134| 

           MV      .L1     A12,A9            ; |132| 
||         MVKH    .S1     _t1,A6            ; |133| 
||         MVKH    .S2     _R_lab4,B7        ; |135| 
||         ZERO    .D2     B5                ; |140| 
|| [ A1]   LDW     .D1T1   *A0,A0            ; |139| 

           ; BRANCH OCCURS                   ; |132| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A6,A0            ; |133| 
           NOP             4
           SUBSP   .L1     A9,A0,A0          ; |133| 
           NOP             3
           STW     .D2T1   A0,*+SP(8)        ; |133| 
           LDW     .D1T1   *A2,A6            ; |134| 
           LDW     .D1T1   *A10,A0           ; |134| 
           LDW     .D2T2   *+SP(8),B6        ; |135| 
           NOP             3
           MPYSP   .M1     A0,A6,A0          ; |134| 
           MV      .D2     B6,B5             ; |135| 
           NOP             2
           STW     .D2T1   A0,*+SP(12)       ; |134| 
           LDW     .D1T1   *A7,A0            ; |135| 
           LDW     .D2T2   *+SP(12),B4       ; |135| 
           LDW     .D1T1   *A4,A4            ; |135| 
           NOP             2
           MPYSP   .M1     A0,A11,A0         ; |135| 
           NOP             2
           MPYSP   .M2     B6,B4,B6          ; |135| 

           MPYSP   .M2X    B5,A0,B5          ; |135| 
||         MV      .D2     B5,B4             ; |135| 

           NOP             3

           ADDSP   .L2X    B6,A4,B5          ; |135| 
||         MPYSP   .M2     B4,B5,B4          ; |135| 

           NOP             3
           SUBSP   .L2     B5,B4,B4          ; |135| 
           NOP             3
           STW     .D2T2   B4,*B7            ; |135| 

           LDW     .D1T1   *A3,A0            ; |136| 
||         LDW     .D2T2   *+SP(8),B5        ; |136| 

           LDW     .D2T2   *+SP(12),B4       ; |136| 
           NOP             3
           MPYSP   .M1X    B5,A0,A0          ; |136| 
           NOP             2
           B       .S1     L9                ; |137| 
           SUBSP   .L1X    B4,A0,A0          ; |136| 
           NOP             3
           STW     .D1T1   A0,*A5            ; |136| 
           ; BRANCH OCCURS                   ; |137| 
;** --------------------------------------------------------------------------*
L7:    
           NOP             4
           STW     .D1T1   A0,*A8            ; |139| 
;** --------------------------------------------------------------------------*
L8:    
           STW     .D2T2   B5,*B4            ; |140| 
;** --------------------------------------------------------------------------*
L9:    
           MVKL    .S1     _traj_cnt,A0      ; |144| 
;** --------------------------------------------------------------------------*
L10:    
           MVKH    .S1     _traj_cnt,A0      ; |144| 
           LDW     .D1T1   *A0,A3            ; |144| 
           B       .S1     L12               ; |145| 
           MVKL    .S2     _GetAngle,B4      ; |156| 
           NOP             2
           ADD     .D1     1,A3,A3           ; |144| 
           STW     .D1T1   A3,*A0            ; |144| 
           ; BRANCH OCCURS                   ; |145| 
;** --------------------------------------------------------------------------*
L11:    
           STW     .D2T2   B6,*B5            ; |147| 
           STW     .D1T1   A5,*A4            ; |148| 
           MVKL    .S2     _GetAngle,B4      ; |156| 
;** --------------------------------------------------------------------------*
L12:    
           MVKH    .S2     _GetAngle,B4      ; |156| 
           B       .S2     B4                ; |156| 
           MVKL    .S2     RL10,B3           ; |156| 
           MVKH    .S2     RL10,B3           ; |156| 
           NOP             3
RL10:      ; CALL OCCURS                     ; |156| 
           MVKL    .S1     _y,A0             ; |156| 

           MVKH    .S1     _y,A0             ; |156| 
||         MVKL    .S2     _use_tracking,B4  ; |158| 

           MVKH    .S2     _use_tracking,B4  ; |158| 
||         STW     .D1T1   A4,*A0            ; |156| 

           LDW     .D2T2   *B4,B0            ; |158| 
           MVKL    .S1     _y,A3             ; |162| 
           MVKL    .S2     _R_lab3,B5        ; |162| 
           MVKH    .S1     _y,A3             ; |162| 

           MVKH    .S2     _R_lab3,B5        ; |162| 
||         MVKL    .S1     _R_lab4,A0        ; |159| 

           MVKH    .S1     _R_lab4,A0        ; |159| 
||         MVKL    .S2     _y,B4             ; |159| 
|| [!B0]   LDW     .D1T1   *A3,A3            ; |162| 

           MVKH    .S2     _y,B4             ; |159| 
|| [ B0]   LDW     .D1T1   *A0,A3            ; |159| 
|| [!B0]   LDW     .D2T2   *B5,B5            ; |162| 

   [ B0]   LDW     .D2T1   *B4,A0            ; |159| 
           MVKL    .S2     _s_error,B4       ; |165| 
           MVKH    .S2     _s_error,B4       ; |165| 
           MVKL    .S2     _ref_mon,B12      ; |189| 
   [!B0]   SUBSP   .L1X    B5,A3,A3          ; |162| 
   [ B0]   SUBSP   .L1     A3,A0,A3          ; |159| 
           MVKL    .S1     _error,A0         ; |162| 

           MVKH    .S1     _error,A0         ; |162| 
||         MVKL    .S2     _error,B5         ; |159| 

           MVKL    .S1     _error,A0         ; |165| 
|| [!B0]   STW     .D1T1   A3,*A0            ; |162| 
||         MVKH    .S2     _error,B5         ; |159| 

           MVKH    .S1     _error,A0         ; |165| 
|| [ B0]   STW     .D2T1   A3,*B5            ; |159| 

           LDW     .D1T1   *A0,A0            ; |165| 
||         LDW     .D2T2   *B4,B5            ; |165| 

           MVKL    .S2     _R_lab4,B11       ; |189| 
           MVKL    .S2     _R_lab3,B13       ; |194| 
           MVKL    .S1     _u_sat_lab4,A5    ; |185| 
           MVKL    .S1     _u_mon,A12        ; |195| 
           ADDSP   .L1X    A0,B5,A0          ; |165| 
           MVKL    .S2     _error,B5         ; |167| 
           MVKH    .S2     _error,B5         ; |167| 
           MVKH    .S1     _u_sat_lab4,A5    ; |185| 
           STW     .D2T1   A0,*B4            ; |165| 
           LDW     .D2T2   *B5,B4            ; |167| 
           ZERO    .D1     A0                ; |167| 
           MVKH    .S1     0x3f800000,A0     ; |167| 
           MVKL    .S1     _u_sat_lab4,A10   ; |190| 
           MVKL    .S2     _ref_mon,B10      ; |194| 
           MPYSP   .M1X    B4,A0,A3          ; |167| 
           MVKL    .S2     _P_term,B5        ; |167| 
           MVKH    .S2     _P_term,B5        ; |167| 

           MVKL    .S1     _error,A0         ; |168| 
||         MVKL    .S2     _p_error,B4       ; |168| 

           MVKH    .S1     _error,A0         ; |168| 
||         MVKH    .S2     _p_error,B4       ; |168| 
||         STW     .D2T1   A3,*B5            ; |167| 

           LDW     .D1T1   *A0,A0            ; |168| 
||         LDW     .D2T2   *B4,B4            ; |168| 

           MVKL    .S1     _I_term,A3        ; |174| 
           MVKH    .S1     _I_term,A3        ; |174| 
           MVKL    .S1     _u_sat_lab3,A11   ; |195| 
           MVKL    .S1     _u_mon,A13        ; |190| 
           SUBSP   .L1X    A0,B4,A0          ; |168| 
           ZERO    .D2     B4                ; |168| 
           MVKH    .S2     0x41800000,B4     ; |168| 
           MVKH    .S2     _ref_mon,B12      ; |189| 
           MPYSP   .M2X    A0,B4,B5          ; |168| 
           MVKL    .S1     _D_term,A0        ; |168| 
           MVKH    .S1     _D_term,A0        ; |168| 
           MVKL    .S2     _s_error,B4       ; |169| 

           STW     .D1T2   B5,*A0            ; |168| 
||         MVKH    .S2     _s_error,B4       ; |169| 

           LDW     .D2T2   *B4,B5            ; |169| 
           ZERO    .D2     B4                ; |169| 
           MVKL    .S1     _I_term,A0        ; |169| 
           MVKH    .S1     _I_term,A0        ; |169| 
           MVKL    .S1     _u_sat_lab3,A6    ; |193| 
           MPYSP   .M2     B5,B4,B5          ; |169| 
           MVKL    .S2     _error,B4         ; |171| 
           MVKH    .S2     _error,B4         ; |171| 
           MVKH    .S2     _R_lab4,B11       ; |189| 
           STW     .D1T2   B5,*A0            ; |169| 
           LDW     .D2T2   *B4,B4            ; |171| 
           MVKL    .S1     _p_error,A0       ; |171| 
           MVKH    .S1     _p_error,A0       ; |171| 
           MVKL    .S2     _P_term,B5        ; |174| 
           MVKH    .S2     _P_term,B5        ; |174| 
           STW     .D1T2   B4,*A0            ; |171| 

           LDW     .D2T2   *B5,B5            ; |174| 
||         LDW     .D1T1   *A3,A0            ; |174| 

           MVKL    .S2     _D_term,B4        ; |174| 
           MVKH    .S2     _D_term,B4        ; |174| 
           LDW     .D2T2   *B4,B4            ; |174| 
           MVKL    .S1     _P_term,A3        ; |176| 
           ADDSP   .L2X    A0,B5,B5          ; |174| 
           MVKH    .S1     _P_term,A3        ; |176| 
           MVKH    .S2     _R_lab3,B13       ; |194| 
           MVKH    .S1     _u_mon,A12        ; |195| 
           ADDSP   .L2     B4,B5,B5          ; |174| 
           MVKL    .S1     _u_lab3,A0        ; |174| 
           MVKH    .S1     _u_lab3,A0        ; |174| 
           MVKL    .S2     _I_term,B4        ; |176| 

           MVKH    .S2     _I_term,B4        ; |176| 
||         STW     .D1T2   B5,*A0            ; |174| 

           LDW     .D2T2   *B4,B6            ; |176| 
||         LDW     .D1T1   *A3,A3            ; |176| 

           MVKL    .S2     _D_term,B4        ; |176| 
           MVKH    .S2     _D_term,B4        ; |176| 
           MVKL    .S1     _target_v,A0      ; |176| 

           LDW     .D2T2   *B4,B5            ; |176| 
||         MVKH    .S1     _target_v,A0      ; |176| 

           ADDSP   .L1X    B6,A3,A3          ; |176| 
||         LDW     .D1T1   *A0,A0            ; |176| 

           MVKL    .S2     0x3c54fdf4,B4     ; |176| 
           MVKH    .S2     0x3c54fdf4,B4     ; |176| 
           MVKH    .S2     _ref_mon,B10      ; |194| 
           ADDSP   .L1X    B5,A3,A3          ; |176| 
           MPYSP   .M1X    A0,B4,A0          ; |176| 
           MVKL    .S2     _u_lab3,B4        ; |179| 
           MVKH    .S2     _u_lab3,B4        ; |179| 
           ZERO    .D2     B5                ; |180| 
           ADDSP   .L1     A0,A3,A3          ; |176| 
           MVKL    .S1     _u_lab4,A0        ; |176| 
           MVKH    .S1     _u_lab4,A0        ; |176| 
           MVKH    .S2     0x42400000,B5     ; |180| 
           STW     .D1T1   A3,*A0            ; |176| 
           LDW     .D2T2   *B4,B4            ; |179| 
           MVKL    .S1     _u_sat_lab3,A3    ; |180| 
           MVKL    .S1     _u_sat_lab3,A0    ; |179| 
           MVKH    .S1     _u_sat_lab3,A0    ; |179| 
           MVKH    .S1     _u_sat_lab3,A3    ; |180| 
           STW     .D1T2   B4,*A0            ; |179| 
           LDW     .D1T1   *A3,A4            ; |180| 
           MVKL    .S1     _u_sat_lab3,A0    ; |180| 
           MVKH    .S1     _u_sat_lab3,A0    ; |180| 
           ZERO    .D1     A3                ; |180| 

           MVKL    .S2     _u_sat_lab3,B4    ; |181| 
||         MVKH    .S1     0x42400000,A3     ; |180| 

           CMPGTSP .S1     A4,A3,A1          ; |180| 

           MVKH    .S2     _u_sat_lab3,B4    ; |181| 
|| [ A1]   STW     .D1T2   B5,*A0            ; |180| 

           LDW     .D2T2   *B4,B6            ; |181| 
           ZERO    .D1     A3                ; |181| 
           MVKH    .S1     0xc2400000,A3     ; |181| 
           MVKL    .S2     _u_sat_lab3,B5    ; |181| 
           ZERO    .D1     A0                ; |181| 
           CMPLTSP .S2X    B6,A3,B0          ; |181| 
           MVKH    .S2     _u_sat_lab3,B5    ; |181| 

           MVKL    .S2     _u_lab4,B4        ; |183| 
||         MVKH    .S1     0xc2400000,A0     ; |181| 

   [ B0]   STW     .D2T1   A0,*B5            ; |181| 
||         MVKH    .S2     _u_lab4,B4        ; |183| 

           LDW     .D2T2   *B4,B5            ; |183| 
           MVKL    .S1     _u_sat_lab4,A0    ; |183| 
           MVKL    .S2     _u_sat_lab4,B4    ; |184| 
           MVKH    .S1     _u_sat_lab4,A0    ; |183| 
           MVKH    .S2     _u_sat_lab4,B4    ; |184| 
           STW     .D1T2   B5,*A0            ; |183| 
           LDW     .D2T2   *B4,B7            ; |184| 
           MVKL    .S1     _u_sat_lab4,A3    ; |184| 
           ZERO    .D1     A4                ; |184| 
           MVKH    .S1     0x42400000,A4     ; |184| 
           ZERO    .D2     B4                ; |184| 

           CMPGTSP .S2X    B7,A4,B0          ; |184| 
||         MVKH    .S1     _u_sat_lab4,A3    ; |184| 

           MVKH    .S2     0x42400000,B4     ; |184| 
||         MVKL    .S1     _u_sat_lab4,A0    ; |185| 

   [ B0]   STW     .D1T2   B4,*A3            ; |184| 
||         MVKH    .S1     _u_sat_lab4,A0    ; |185| 

           LDW     .D1T2   *A0,B8            ; |185| 
           ZERO    .D1     A3                ; |185| 
           MVKH    .S1     0xc2400000,A3     ; |185| 
           ZERO    .D2     B7                ; |185| 
           MVKH    .S2     0xc2400000,B7     ; |185| 
           CMPLTSP .S2X    B8,A3,B0          ; |185| 
           MVKL    .S2     _use_tracking,B6  ; |187| 

           MVKH    .S2     _use_tracking,B6  ; |187| 
|| [ B0]   STW     .D1T2   B7,*A5            ; |185| 

           LDW     .D2T1   *B6,A1            ; |187| 
           MVKH    .S1     _u_sat_lab4,A10   ; |190| 
           MVKL    .S2     RL12,B3           ; |188| 
           MVKH    .S1     _u_sat_lab3,A11   ; |195| 
           MVKH    .S2     RL12,B3           ; |188| 
   [!A1]   B       .S1     L13               ; |187| 
           MVKH    .S1     _u_mon,A13        ; |190| 
           MVKL    .S2     _PWMOut,B5        ; |193| 

           MVKH    .S1     _u_sat_lab3,A6    ; |193| 
||         MVKL    .S2     _PWMOut,B4        ; |188| 

           MVKL    .S1     _u_sat_lab4,A0    ; |188| 
||         MVKH    .S2     _PWMOut,B5        ; |193| 

           MVKH    .S1     _u_sat_lab4,A0    ; |188| 
||         MVKH    .S2     _PWMOut,B4        ; |188| 

           ; BRANCH OCCURS                   ; |187| 
;** --------------------------------------------------------------------------*
           B       .S2     B4                ; |188| 
           LDW     .D1T1   *A0,A4            ; |188| 
           NOP             4
RL12:      ; CALL OCCURS                     ; |188| 
           LDW     .D2T2   *B11,B4           ; |189| 
           NOP             4
           STW     .D2T2   B4,*B12           ; |189| 

           B       .S1     L14               ; |191| 
||         LDW     .D1T1   *A10,A0           ; |190| 

           NOP             4
           STW     .D1T1   A0,*A13           ; |190| 
           ; BRANCH OCCURS                   ; |191| 
;** --------------------------------------------------------------------------*
L13:    
           B       .S2     B5                ; |193| 
           LDW     .D1T1   *A6,A4            ; |193| 
           MVKL    .S2     RL14,B3           ; |193| 
           MVKH    .S2     RL14,B3           ; |193| 
           NOP             2
RL14:      ; CALL OCCURS                     ; |193| 
           LDW     .D2T2   *B13,B4           ; |194| 
           NOP             4
           STW     .D2T2   B4,*B10           ; |194| 
           LDW     .D1T1   *A11,A0           ; |195| 
           NOP             4
           STW     .D1T1   A0,*A12           ; |195| 
;** --------------------------------------------------------------------------*
L14:    
           MVKL    .S1     _TINTCnt,A0       ; |198| 
           MVKH    .S1     _TINTCnt,A0       ; |198| 
           MV      .D1     A0,A5             ; |198| 
           LDW     .D1T1   *A5,A3            ; |198| 
           MVKL    .S2     _UMAddData,B5     ; |215| 
           MVKL    .S2     _target_v,B4      ; |215| 
           MVKL    .S2     _u_mon,B6         ; |215| 

           MVKL    .S1     _error,A0         ; |215| 
||         MVKH    .S2     _UMAddData,B5     ; |215| 

           MVKH    .S1     _error,A0         ; |215| 
||         ADD     .D1     1,A3,A4           ; |198| 
||         MVKH    .S2     _target_v,B4      ; |215| 

           STW     .D1T1   A4,*A5            ; |198| 
||         MVKL    .S1     _ref_mon,A3       ; |215| 
||         MVKH    .S2     _u_mon,B6         ; |215| 

           B       .S2     B5                ; |215| 
||         LDW     .D1T1   *A0,A6            ; |215| 
||         LDW     .D2T2   *B4,B4            ; |215| 
||         MVKH    .S1     _ref_mon,A3       ; |215| 

           LDW     .D1T1   *A3,A4            ; |215| 
||         LDW     .D2T2   *B6,B6            ; |215| 

           MVKL    .S2     RL16,B3           ; |215| 
           MVKH    .S2     RL16,B3           ; |215| 
           NOP             2
RL16:      ; CALL OCCURS                     ; |215| 
           LDW     .D2T2   *+SP(128),B13     ; |216| 
           LDW     .D2T2   *+SP(124),B12     ; |216| 
           LDW     .D2T2   *+SP(120),B11     ; |216| 
           LDW     .D2T2   *+SP(116),B10     ; |216| 
           LDW     .D2T2   *+SP(112),B9      ; |216| 
           LDW     .D2T2   *+SP(108),B8      ; |216| 
           LDW     .D2T2   *+SP(104),B7      ; |216| 
           LDW     .D2T2   *+SP(84),B2       ; |216| 
           LDW     .D2T2   *+SP(80),B1       ; |216| 
           LDW     .D2T2   *+SP(76),B0       ; |216| 
           LDW     .D2T1   *+SP(72),A13      ; |216| 
           LDW     .D2T1   *+SP(68),A12      ; |216| 
           LDW     .D2T1   *+SP(64),A11      ; |216| 
           LDW     .D2T1   *+SP(60),A10      ; |216| 
           LDW     .D2T1   *+SP(56),A9       ; |216| 
           LDW     .D2T1   *+SP(52),A8       ; |216| 
           LDW     .D2T1   *+SP(48),A7       ; |216| 
           LDW     .D2T1   *+SP(28),A2       ; |216| 
           LDW     .D2T1   *+SP(24),A1       ; |216| 
           LDW     .D2T2   *+SP(96),B5       ; |216| 
           LDW     .D2T1   *+SP(40),A5       ; |216| 
           LDW     .D2T1   *+SP(20),A0       ; |216| 
           LDW     .D2T1   *+SP(32),A3       ; |216| 
           LDW     .D2T2   *+SP(88),B3       ; |216| 
           LDW     .D2T2   *+SP(92),B4       ; |216| 
           LDW     .D2T1   *+SP(44),A6       ; |216| 

           LDW     .D2T2   *+SP(100),B6      ; |216| 
||         B       .S2     IRP               ; |216| 

           LDW     .D2T1   *+SP(36),A4       ; |216| 
           ADDK    .S2     128,SP            ; |216| 
           NOP             3
           ; BRANCH OCCURS                   ; |216| 


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
           B       .S2     IRP               ; |220| 
           NOP             5
           ; BRANCH OCCURS                   ; |220| 


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
           STW     .D2T2   B9,*SP--(88)      ; |223| 
           STW     .D2T1   A0,*+SP(12)       ; |223| 
           STW     .D2T2   B7,*+SP(80)       ; |223| 
           STW     .D2T2   B6,*+SP(76)       ; |223| 
           STW     .D2T2   B5,*+SP(72)       ; |223| 
           STW     .D2T2   B4,*+SP(68)       ; |223| 
           STW     .D2T2   B3,*+SP(64)       ; |223| 
           STW     .D2T2   B2,*+SP(60)       ; |223| 
           STW     .D2T2   B1,*+SP(56)       ; |223| 
           STW     .D2T2   B0,*+SP(52)       ; |223| 
           STW     .D2T1   A9,*+SP(48)       ; |223| 
           STW     .D2T1   A8,*+SP(44)       ; |223| 
           STW     .D2T1   A7,*+SP(40)       ; |223| 
           STW     .D2T1   A6,*+SP(36)       ; |223| 
           STW     .D2T1   A5,*+SP(32)       ; |223| 
           STW     .D2T1   A4,*+SP(28)       ; |223| 
           STW     .D2T1   A3,*+SP(24)       ; |223| 
           STW     .D2T1   A2,*+SP(20)       ; |223| 

           STW     .D2T1   A1,*+SP(16)       ; |223| 
||         MVKL    .S1     0x2000008,A0      ; |226| 

           MVKH    .S1     0x2000008,A0      ; |226| 
||         STW     .D2T2   B8,*+SP(84)       ; |223| 

           LDW     .D1T1   *A0,A0            ; |226| 
           NOP             4
           AND     .S1     15,A0,A0          ; |226| 
           CMPEQ   .L1     A0,1,A1           ; |226| 
   [ A1]   B       .S1     L22               ; |226| 
           STW     .D2T1   A0,*+SP(4)        ; |226| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |260| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |260| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |260| 
   [ A1]   LDW     .D2T2   *+SP(68),B4       ; |260| 
           ; BRANCH OCCURS                   ; |226| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(4),B4        ; |227| 
           NOP             3
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L15
;** --------------------------------------------------------------------------*
L15:    
           NOP             1
           CMPEQ   .L2     B4,4,B0           ; |227| 
   [!B0]   B       .S1     L17               ; |227| 

   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |239| 
|| [ B0]   MVKL    .S1     0x2000014,A0      ; |228| 

   [ B0]   MVKH    .S1     0x2000014,A0      ; |228| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |228| 
           NOP             2
           ; BRANCH OCCURS                   ; |227| 
;** --------------------------------------------------------------------------*
           NOP             2
           AND     .S1     1,A0,A1           ; |228| 
   [!A1]   B       .S1     L21               ; |228| 
   [!A1]   MVKL    .S1     0x2000008,A0      ; |259| 
   [!A1]   MVKH    .S1     0x2000008,A0      ; |259| 

   [ A1]   ZERO    .D2     B4                ; |229| 
|| [ A1]   MVKL    .S2     _compacket+124,B5 ; |229| 
|| [!A1]   LDW     .D1T1   *A0,A0            ; |259| 

   [ A1]   MVKH    .S2     0x2000000,B4      ; |229| 

   [ A1]   MVKH    .S2     _compacket+124,B5 ; |229| 
|| [ A1]   LDW     .D2T2   *B4,B4            ; |229| 

           ; BRANCH OCCURS                   ; |228| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *B5,B5            ; |229| 
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L16:    
           MVKL    .S1     _compacket+124,A0 ; |230| 
           MVKH    .S1     _compacket+124,A0 ; |230| 
           EXTU    .S2     B4,24,24,B4       ; |229| 
           STB     .D2T2   B4,*B5            ; |229| 
           LDW     .D1T1   *A0,A3            ; |230| 
           MVKL    .S1     _SendByte,A0      ; |230| 
           MVKH    .S1     _SendByte,A0      ; |230| 
           MVKL    .S2     RL18,B3           ; |230| 
           B       .S2X    A0                ; |230| 
           LDB     .D1T1   *A3,A4            ; |230| 
           MVKH    .S2     RL18,B3           ; |230| 
           NOP             3
RL18:      ; CALL OCCURS                     ; |230| 
           MVKL    .S2     _compacket+124,B4 ; |231| 
           MVKH    .S2     _compacket+124,B4 ; |231| 
           LDW     .D2T2   *B4,B4            ; |231| 
           MVKL    .S1     _compacket+99,A0  ; |231| 
           MVKH    .S1     _compacket+99,A0  ; |231| 
           NOP             2
           CMPEQ   .L1X    B4,A0,A1          ; |231| 
   [!A1]   MVKL    .S2     _compacket+124,B4 ; |235| 
   [!A1]   MVKH    .S2     _compacket+124,B4 ; |235| 
   [!A1]   LDW     .D2T2   *B4,B5            ; |235| 
   [ A1]   MVKL    .S2     _compacket+124,B4 ; |232| 
   [ A1]   MVKL    .S1     _compacket,A0     ; |232| 
   [ A1]   MVKH    .S2     _compacket+124,B4 ; |232| 
   [ A1]   MVKH    .S1     _compacket,A0     ; |232| 

           MVKL    .S2     0x2000014,B5      ; |237| 
|| [!A1]   ADD     .D2     1,B5,B6           ; |235| 

   [!A1]   STW     .D2T2   B6,*B4            ; |235| 

   [ A1]   STW     .D2T1   A0,*B4            ; |232| 
||         MVKH    .S2     0x2000014,B5      ; |237| 

           LDW     .D2T2   *B5,B4            ; |237| 
           NOP             4
           AND     .S2     1,B4,B0           ; |237| 
   [ B0]   B       .S1     L16               ; |237| 

   [ B0]   ZERO    .D2     B4                ; |229| 
|| [ B0]   MVKL    .S2     _compacket+124,B5 ; |229| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |229| 

   [ B0]   MVKH    .S2     _compacket+124,B5 ; |229| 
|| [ B0]   LDW     .D2T2   *B4,B4            ; |229| 

   [ B0]   LDW     .D2T2   *B5,B5            ; |229| 
           NOP             1
           ; BRANCH OCCURS                   ; |237| 
;** --------------------------------------------------------------------------*
           B       .S1     L21               ; |238| 
           MVKL    .S1     0x2000008,A0      ; |259| 
           MVKH    .S1     0x2000008,A0      ; |259| 
           LDW     .D1T1   *A0,A0            ; |259| 
           NOP             2
           ; BRANCH OCCURS                   ; |238| 
;** --------------------------------------------------------------------------*
L17:    
           CMPEQ   .L2     B4,2,B0           ; |239| 
   [!B0]   B       .S1     L18               ; |239| 
   [ B0]   MVKL    .S2     _respacket+200,B4 ; |240| 
           NOP             3
   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |248| 
           ; BRANCH OCCURS                   ; |239| 
;** --------------------------------------------------------------------------*
           MVKH    .S2     _respacket+200,B4 ; |240| 
           LDW     .D2T2   *B4,B5            ; |240| 
           NOP             4
           CMPGT   .L2     B5,0,B0           ; |240| 

   [ B0]   MVKL    .S1     _respacket+204,A0 ; |241| 
||         SUB     .D2     B5,1,B5           ; |240| 

   [ B0]   MVKH    .S1     _respacket+204,A0 ; |241| 
||         STW     .D2T2   B5,*B4            ; |240| 

   [ B0]   LDW     .D1T1   *A0,A3            ; |241| 
   [ B0]   MVKL    .S1     _respacket,A4     ; |241| 
   [ B0]   MVKH    .S1     _respacket,A4     ; |241| 
   [!B0]   MVKL    .S1     0x2000004,A0      ; |244| 
   [!B0]   MVKL    .S2     _respacket+208,B4 ; |245| 
   [ B0]   ADD     .D1     1,A3,A5           ; |241| 
   [ B0]   STW     .D1T1   A5,*A0            ; |241| 

           B       .S1     L20               ; |247| 
|| [ B0]   LDB     .D1T1   *+A3[A4],A0       ; |241| 

   [!B0]   MVKH    .S1     0x2000004,A0      ; |244| 
   [!B0]   MVK     .S2     1,B5              ; |244| 

   [!B0]   ZERO    .D2     B5                ; |245| 
|| [ B0]   ZERO    .L2     B4                ; |241| 
|| [!B0]   MVKH    .S2     _respacket+208,B4 ; |245| 
|| [!B0]   STW     .D1T2   B5,*A0            ; |244| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |241| 
|| [!B0]   STW     .D2T2   B5,*B4            ; |245| 

   [ B0]   STW     .D2T1   A0,*B4            ; |241| 
           ; BRANCH OCCURS                   ; |247| 
;** --------------------------------------------------------------------------*
L18:    
           NOP             4
           CMPEQ   .L2     B4,12,B0          ; |248| 
   [!B0]   B       .S1     L20               ; |248| 
           NOP             2
   [ B0]   MVKL    .S1     0x2000014,A0      ; |249| 
   [ B0]   MVKH    .S1     0x2000014,A0      ; |249| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |249| 
           ; BRANCH OCCURS                   ; |248| 
;** --------------------------------------------------------------------------*
           NOP             4
           AND     .S1     1,A0,A1           ; |249| 
   [!A1]   B       .S1     L20               ; |249| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |250| 
           ; BRANCH OCCURS                   ; |249| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L19:    

           MVKH    .S2     0x2000000,B4      ; |250| 
||         MVKL    .S1     _compacket+124,A0 ; |250| 

           LDW     .D2T2   *B4,B4            ; |250| 
||         MVKH    .S1     _compacket+124,A0 ; |250| 

           LDW     .D1T1   *A0,A3            ; |250| 
           MVKL    .S1     _compacket+124,A0 ; |251| 
           MVKH    .S1     _compacket+124,A0 ; |251| 
           NOP             1
           EXTU    .S2     B4,24,24,B4       ; |250| 
           STB     .D1T2   B4,*A3            ; |250| 
           LDW     .D1T1   *A0,A0            ; |251| 
           MVKL    .S2     _compacket+99,B4  ; |251| 
           MVKH    .S2     _compacket+99,B4  ; |251| 
           NOP             2
           CMPEQ   .L2X    A0,B4,B0          ; |251| 
   [!B0]   MVKL    .S1     _compacket+124,A0 ; |255| 
   [!B0]   MVKH    .S1     _compacket+124,A0 ; |255| 
   [!B0]   MV      .D1     A0,A4             ; |255| 
   [!B0]   LDW     .D1T1   *A4,A0            ; |255| 
   [ B0]   MVKL    .S1     _compacket+124,A0 ; |252| 
   [ B0]   MVKL    .S2     _compacket,B4     ; |252| 
   [ B0]   MVKH    .S1     _compacket+124,A0 ; |252| 
   [ B0]   MVKH    .S2     _compacket,B4     ; |252| 

           MVKL    .S1     0x2000014,A0      ; |257| 
|| [!B0]   ADD     .L1     1,A0,A3           ; |255| 
|| [ B0]   STW     .D1T2   B4,*A0            ; |252| 

           MVKH    .S1     0x2000014,A0      ; |257| 
|| [!B0]   STW     .D1T1   A3,*A4            ; |255| 

           LDW     .D1T1   *A0,A0            ; |257| 
           NOP             4
           AND     .S1     1,A0,A1           ; |257| 
   [ A1]   B       .S1     L19               ; |257| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |250| 
           ; BRANCH OCCURS                   ; |257| 
;** --------------------------------------------------------------------------*
L20:    
           MVKL    .S1     0x2000008,A0      ; |259| 
           MVKH    .S1     0x2000008,A0      ; |259| 
           LDW     .D1T1   *A0,A0            ; |259| 
           NOP             2
;** --------------------------------------------------------------------------*
L21:    
           NOP             2
           AND     .S1     15,A0,A0          ; |259| 
           CMPEQ   .L1     A0,1,A1           ; |259| 
   [!A1]   B       .S1     L15               ; |259| 
           STW     .D2T1   A0,*+SP(4)        ; |259| 
   [!A1]   LDW     .D2T2   *+SP(4),B4        ; |227| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |260| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |260| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |260| 
           ; BRANCH OCCURS                   ; |259| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(68),B4       ; |260| 
;** --------------------------------------------------------------------------*
L22:    
           LDW     .D2T2   *+SP(64),B3       ; |260| 
           LDW     .D2T2   *+SP(60),B2       ; |260| 
           LDW     .D2T2   *+SP(56),B1       ; |260| 
           LDW     .D2T2   *+SP(52),B0       ; |260| 
           LDW     .D2T1   *+SP(48),A9       ; |260| 
           LDW     .D2T1   *+SP(44),A8       ; |260| 
           LDW     .D2T1   *+SP(40),A7       ; |260| 
           LDW     .D2T1   *+SP(36),A6       ; |260| 
           LDW     .D2T1   *+SP(32),A5       ; |260| 
           LDW     .D2T1   *+SP(28),A4       ; |260| 
           LDW     .D2T1   *+SP(24),A3       ; |260| 
           LDW     .D2T1   *+SP(20),A2       ; |260| 
           LDW     .D2T1   *+SP(16),A1       ; |260| 
           LDW     .D2T1   *+SP(12),A0       ; |260| 

           B       .S2     IRP               ; |260| 
||         LDW     .D2T2   *+SP(84),B8       ; |260| 

           LDW     .D2T2   *++SP(88),B9      ; |260| 
           NOP             4
           ; BRANCH OCCURS                   ; |260| 


;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_sqrtf
	.global	_SendByte
	.global	_PWMOut
	.global	_GetAngle
	.global	_UMAddData
	.global	_compacket
	.global	_respacket
	.global	_TINTCnt
	.global	__divf
