;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Mon May 25 14:24:39 2026                                *
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
	.field  	_s_error$1+0,32
	.word	000000000h		; _s_error$1 @ 0
	.sect	".text"
_s_error$1:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_p_error$2+0,32
	.word	000000000h		; _p_error$2 @ 0
	.sect	".text"
_p_error$2:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\W10\AppData\Local\Temp\TI11724_2 --template_info_file C:\Users\W10\AppData\Local\Temp\TI11724_3 --object_file interrupt.obj --opt_shell 9 interrupt.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 interrupt.c 
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
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 20 Auto + 84 Save = 104 byte                *
;******************************************************************************
_ISRtimer0:
;** --------------------------------------------------------------------------*
           STW     .D2T2   B9,*SP--(104)     ; |29| 
           STW     .D2T2   B5,*+SP(88)       ; |29| 
           STW     .D2T1   A0,*+SP(28)       ; |29| 
           STW     .D2T2   B4,*+SP(84)       ; |29| 
           STW     .D2T1   A3,*+SP(40)       ; |29| 
           STW     .D2T1   A4,*+SP(44)       ; |29| 
           STW     .D2T1   A5,*+SP(48)       ; |29| 
           STW     .D2T1   A6,*+SP(52)       ; |29| 
           STW     .D2T1   A7,*+SP(56)       ; |29| 
           STW     .D2T1   A8,*+SP(60)       ; |29| 
           STW     .D2T1   A9,*+SP(64)       ; |29| 
           STW     .D2T2   B0,*+SP(68)       ; |29| 
           STW     .D2T2   B1,*+SP(72)       ; |29| 
           STW     .D2T2   B2,*+SP(76)       ; |29| 
           STW     .D2T2   B3,*+SP(80)       ; |29| 
           STW     .D2T2   B6,*+SP(92)       ; |29| 
           STW     .D2T2   B7,*+SP(96)       ; |29| 
           STW     .D2T2   B8,*+SP(100)      ; |29| 

           MVK     .S2     1,B5              ; |43| 
||         MVKL    .S1     _TFlag,A0         ; |43| 
||         STW     .D2T1   A2,*+SP(36)       ; |29| 

           MVKH    .S1     _TFlag,A0         ; |43| 
||         MVKL    .S2     _hall_count,B4    ; |48| 
||         STW     .D2T1   A1,*+SP(32)       ; |29| 

           STW     .D1T2   B5,*A0            ; |43| 
||         MVKH    .S2     _hall_count,B4    ; |48| 

           LDW     .D2T2   *B4,B4            ; |48| 
           MVKL    .S1     _ref_count,A0     ; |48| 
           MVKH    .S1     _ref_count,A0     ; |48| 
           LDW     .D1T1   *A0,A3            ; |48| 
           MVKL    .S2     RL0,B3            ; |81| 
           INTSP   .L1X    B4,A0             ; |48| 
           MVKL    .S2     _s_error$1,B4     ; |50| 
           MVKH    .S2     _s_error$1,B4     ; |50| 
           MVKH    .S2     RL0,B3            ; |81| 
           SUBSP   .L1     A3,A0,A3          ; |48| 
           MV      .S1X    B4,A0             ; |50| 
           NOP             2
           STW     .D2T1   A3,*+SP(4)        ; |48| 
           LDW     .D1T2   *A0,B4            ; |50| 
           NOP             4
           ADDSP   .L1X    A3,B4,A3          ; |50| 
           ZERO    .D2     B4                ; |52| 
           MVKH    .S2     0x3f800000,B4     ; |52| 
           NOP             1
           STW     .D1T1   A3,*A0            ; |50| 
           LDW     .D2T2   *+SP(4),B5        ; |52| 
           MVKL    .S1     _p_error$2,A0     ; |53| 
           MVKH    .S1     _p_error$2,A0     ; |53| 
           NOP             2
           MPYSP   .M2     B5,B4,B4          ; |52| 
           NOP             3
           STW     .D2T2   B4,*+SP(8)        ; |52| 
           LDW     .D1T1   *A0,A0            ; |53| 
           ZERO    .D2     B4                ; |53| 
           NOP             3
           SUBSP   .L2X    B5,A0,B5
           MVKL    .S1     _s_error$1,A0     ; |54| 
           MVKH    .S1     _s_error$1,A0     ; |54| 
           NOP             1
           MPYSP   .M2     B5,B4,B4          ; |53| 
           NOP             3
           STW     .D2T2   B4,*+SP(16)       ; |53| 
           LDW     .D1T1   *A0,A3            ; |54| 
           ZERO    .D1     A0                ; |54| 
           MVKL    .S2     _p_error$2,B4     ; |56| 
           MVKH    .S2     _p_error$2,B4     ; |56| 
           NOP             1

           LDW     .D2T1   *+SP(4),A0        ; |56| 
||         MPYSP   .M1     A3,A0,A3          ; |54| 

           NOP             3
           STW     .D2T1   A3,*+SP(12)       ; |54| 
           STW     .D2T1   A0,*B4            ; |56| 
           LDW     .D2T2   *+SP(12),B4       ; |58| 
           LDW     .D2T2   *+SP(8),B5        ; |58| 
           LDW     .D2T2   *+SP(16),B6       ; |58| 
           ZERO    .D1     A0                ; |60| 
           NOP             2
           ADDSP   .L2     B4,B5,B4          ; |58| 
           NOP             3
           ADDSP   .L2     B6,B4,B4          ; |58| 
           ZERO    .D1     A3                ; |60| 
           MVKH    .S1     0x42480000,A3     ; |60| 
           MVKH    .S1     0x42480000,A0     ; |60| 

           CMPGTSP .S1X    B4,A3,A1          ; |60| 
||         STW     .D2T2   B4,*+SP(20)       ; |58| 

   [ A1]   STW     .D2T1   A0,*+SP(20)       ; |60| 
           LDW     .D2T2   *+SP(20),B5       ; |61| 
           ZERO    .D2     B4                ; |61| 
           ZERO    .D1     A0                ; |61| 
           MVKH    .S2     0xc2480000,B4     ; |61| 
           MVKH    .S1     0xc2480000,A0     ; |61| 
           CMPLTSP .S2     B5,B4,B0          ; |61| 
   [ B0]   STW     .D2T1   A0,*+SP(20)       ; |61| 
           LDW     .D2T1   *+SP(20),A4       ; |63| 
           MVKL    .S1     _duty,A0          ; |63| 
           MVKH    .S1     _duty,A0          ; |63| 
           MVKL    .S1     _hall_count,A3    ; |81| 
           MVKH    .S1     _hall_count,A3    ; |81| 
           STW     .D1T1   A4,*A0            ; |63| 
           LDW     .D1T1   *A3,A0            ; |81| 
           MVKL    .S2     _duty,B6          ; |81| 
           MVKL    .S2     _UMAddData,B5     ; |81| 
           MVKH    .S2     _duty,B6          ; |81| 
           MVKH    .S2     _UMAddData,B5     ; |81| 

           INTSP   .L2X    A0,B4             ; |81| 
||         MVKL    .S1     _ref_count,A0     ; |81| 

           B       .S2     B5                ; |81| 
||         MVKH    .S1     _ref_count,A0     ; |81| 
||         LDW     .D2T1   *+SP(4),A6        ; |81| 

           LDW     .D2T2   *B6,B6            ; |81| 
||         LDW     .D1T1   *A0,A4            ; |81| 

           NOP             4
RL0:       ; CALL OCCURS                     ; |81| 
           LDW     .D2T2   *+SP(68),B0       ; |82| 
           LDW     .D2T2   *+SP(88),B5       ; |82| 
           LDW     .D2T2   *+SP(80),B3       ; |82| 
           LDW     .D2T2   *+SP(92),B6       ; |82| 
           LDW     .D2T2   *+SP(84),B4       ; |82| 
           LDW     .D2T1   *+SP(52),A6       ; |82| 
           LDW     .D2T1   *+SP(44),A4       ; |82| 
           LDW     .D2T2   *+SP(100),B8      ; |82| 
           LDW     .D2T2   *+SP(96),B7       ; |82| 
           LDW     .D2T2   *+SP(76),B2       ; |82| 
           LDW     .D2T2   *+SP(72),B1       ; |82| 
           LDW     .D2T1   *+SP(64),A9       ; |82| 
           LDW     .D2T1   *+SP(60),A8       ; |82| 
           LDW     .D2T1   *+SP(56),A7       ; |82| 
           LDW     .D2T1   *+SP(48),A5       ; |82| 
           LDW     .D2T1   *+SP(36),A2       ; |82| 
           LDW     .D2T1   *+SP(28),A0       ; |82| 
           LDW     .D2T1   *+SP(40),A3       ; |82| 

           LDW     .D2T1   *+SP(32),A1       ; |82| 
||         B       .S2     IRP               ; |82| 

           LDW     .D2T2   *++SP(104),B9     ; |82| 
           NOP             4
           ; BRANCH OCCURS                   ; |82| 


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
           B       .S2     IRP               ; |86| 
           NOP             5
           ; BRANCH OCCURS                   ; |86| 


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
           STW     .D2T2   B9,*SP--(88)      ; |89| 
           STW     .D2T1   A0,*+SP(12)       ; |89| 
           STW     .D2T2   B7,*+SP(80)       ; |89| 
           STW     .D2T2   B6,*+SP(76)       ; |89| 
           STW     .D2T2   B5,*+SP(72)       ; |89| 
           STW     .D2T2   B4,*+SP(68)       ; |89| 
           STW     .D2T2   B3,*+SP(64)       ; |89| 
           STW     .D2T2   B2,*+SP(60)       ; |89| 
           STW     .D2T2   B1,*+SP(56)       ; |89| 
           STW     .D2T2   B0,*+SP(52)       ; |89| 
           STW     .D2T1   A9,*+SP(48)       ; |89| 
           STW     .D2T1   A8,*+SP(44)       ; |89| 
           STW     .D2T1   A7,*+SP(40)       ; |89| 
           STW     .D2T1   A6,*+SP(36)       ; |89| 
           STW     .D2T1   A5,*+SP(32)       ; |89| 
           STW     .D2T1   A4,*+SP(28)       ; |89| 
           STW     .D2T1   A3,*+SP(24)       ; |89| 
           STW     .D2T1   A2,*+SP(20)       ; |89| 

           STW     .D2T1   A1,*+SP(16)       ; |89| 
||         MVKL    .S1     0x2000008,A0      ; |92| 

           MVKH    .S1     0x2000008,A0      ; |92| 
||         STW     .D2T2   B8,*+SP(84)       ; |89| 

           LDW     .D1T1   *A0,A0            ; |92| 
           NOP             4
           AND     .S1     15,A0,A0          ; |92| 
           CMPEQ   .L1     A0,1,A1           ; |92| 
   [ A1]   B       .S1     L8                ; |92| 
           STW     .D2T1   A0,*+SP(4)        ; |92| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |126| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |126| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |126| 
   [ A1]   LDW     .D2T2   *+SP(68),B4       ; |126| 
           ; BRANCH OCCURS                   ; |92| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(4),B4        ; |93| 
           NOP             3
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L1
;** --------------------------------------------------------------------------*
L1:    
           NOP             1
           CMPEQ   .L2     B4,4,B0           ; |93| 
   [!B0]   B       .S1     L3                ; |93| 

   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |105| 
|| [ B0]   MVKL    .S1     0x2000014,A0      ; |94| 

   [ B0]   MVKH    .S1     0x2000014,A0      ; |94| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |94| 
           NOP             2
           ; BRANCH OCCURS                   ; |93| 
;** --------------------------------------------------------------------------*
           NOP             2
           AND     .S1     1,A0,A1           ; |94| 
   [!A1]   B       .S1     L7                ; |94| 
   [!A1]   MVKL    .S1     0x2000008,A0      ; |125| 
   [!A1]   MVKH    .S1     0x2000008,A0      ; |125| 

   [ A1]   ZERO    .D2     B4                ; |95| 
|| [ A1]   MVKL    .S2     _compacket+124,B5 ; |95| 
|| [!A1]   LDW     .D1T1   *A0,A0            ; |125| 

   [ A1]   MVKH    .S2     0x2000000,B4      ; |95| 

   [ A1]   MVKH    .S2     _compacket+124,B5 ; |95| 
|| [ A1]   LDW     .D2T2   *B4,B4            ; |95| 

           ; BRANCH OCCURS                   ; |94| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *B5,B5            ; |95| 
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L2:    
           MVKL    .S1     _compacket+124,A0 ; |96| 
           MVKH    .S1     _compacket+124,A0 ; |96| 
           EXTU    .S2     B4,24,24,B4       ; |95| 
           STB     .D2T2   B4,*B5            ; |95| 
           LDW     .D1T1   *A0,A3            ; |96| 
           MVKL    .S1     _SendByte,A0      ; |96| 
           MVKH    .S1     _SendByte,A0      ; |96| 
           MVKL    .S2     RL2,B3            ; |96| 
           B       .S2X    A0                ; |96| 
           LDB     .D1T1   *A3,A4            ; |96| 
           MVKH    .S2     RL2,B3            ; |96| 
           NOP             3
RL2:       ; CALL OCCURS                     ; |96| 
           MVKL    .S2     _compacket+124,B4 ; |97| 
           MVKH    .S2     _compacket+124,B4 ; |97| 
           LDW     .D2T2   *B4,B4            ; |97| 
           MVKL    .S1     _compacket+99,A0  ; |97| 
           MVKH    .S1     _compacket+99,A0  ; |97| 
           NOP             2
           CMPEQ   .L1X    B4,A0,A1          ; |97| 
   [!A1]   MVKL    .S2     _compacket+124,B4 ; |101| 
   [!A1]   MVKH    .S2     _compacket+124,B4 ; |101| 
   [!A1]   LDW     .D2T2   *B4,B5            ; |101| 
   [ A1]   MVKL    .S2     _compacket+124,B4 ; |98| 
   [ A1]   MVKL    .S1     _compacket,A0     ; |98| 
   [ A1]   MVKH    .S2     _compacket+124,B4 ; |98| 
   [ A1]   MVKH    .S1     _compacket,A0     ; |98| 

           MVKL    .S2     0x2000014,B5      ; |103| 
|| [!A1]   ADD     .D2     1,B5,B6           ; |101| 

   [!A1]   STW     .D2T2   B6,*B4            ; |101| 

   [ A1]   STW     .D2T1   A0,*B4            ; |98| 
||         MVKH    .S2     0x2000014,B5      ; |103| 

           LDW     .D2T2   *B5,B4            ; |103| 
           NOP             4
           AND     .S2     1,B4,B0           ; |103| 
   [ B0]   B       .S1     L2                ; |103| 

   [ B0]   ZERO    .D2     B4                ; |95| 
|| [ B0]   MVKL    .S2     _compacket+124,B5 ; |95| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |95| 

   [ B0]   MVKH    .S2     _compacket+124,B5 ; |95| 
|| [ B0]   LDW     .D2T2   *B4,B4            ; |95| 

   [ B0]   LDW     .D2T2   *B5,B5            ; |95| 
           NOP             1
           ; BRANCH OCCURS                   ; |103| 
;** --------------------------------------------------------------------------*
           B       .S1     L7                ; |104| 
           MVKL    .S1     0x2000008,A0      ; |125| 
           MVKH    .S1     0x2000008,A0      ; |125| 
           LDW     .D1T1   *A0,A0            ; |125| 
           NOP             2
           ; BRANCH OCCURS                   ; |104| 
;** --------------------------------------------------------------------------*
L3:    
           CMPEQ   .L2     B4,2,B0           ; |105| 
   [!B0]   B       .S1     L4                ; |105| 
   [ B0]   MVKL    .S2     _respacket+200,B4 ; |106| 
           NOP             3
   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |114| 
           ; BRANCH OCCURS                   ; |105| 
;** --------------------------------------------------------------------------*
           MVKH    .S2     _respacket+200,B4 ; |106| 
           LDW     .D2T2   *B4,B5            ; |106| 
           NOP             4
           CMPGT   .L2     B5,0,B0           ; |106| 

   [ B0]   MVKL    .S1     _respacket+204,A0 ; |107| 
||         SUB     .D2     B5,1,B5           ; |106| 

   [ B0]   MVKH    .S1     _respacket+204,A0 ; |107| 
||         STW     .D2T2   B5,*B4            ; |106| 

   [ B0]   LDW     .D1T1   *A0,A3            ; |107| 
   [ B0]   MVKL    .S1     _respacket,A4     ; |107| 
   [ B0]   MVKH    .S1     _respacket,A4     ; |107| 
   [!B0]   MVKL    .S1     0x2000004,A0      ; |110| 
   [!B0]   MVKL    .S2     _respacket+208,B4 ; |111| 
   [ B0]   ADD     .D1     1,A3,A5           ; |107| 
   [ B0]   STW     .D1T1   A5,*A0            ; |107| 

           B       .S1     L6                ; |113| 
|| [ B0]   LDB     .D1T1   *+A3[A4],A0       ; |107| 

   [!B0]   MVKH    .S1     0x2000004,A0      ; |110| 
   [!B0]   MVK     .S2     1,B5              ; |110| 

   [!B0]   ZERO    .D2     B5                ; |111| 
|| [ B0]   ZERO    .L2     B4                ; |107| 
|| [!B0]   MVKH    .S2     _respacket+208,B4 ; |111| 
|| [!B0]   STW     .D1T2   B5,*A0            ; |110| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |107| 
|| [!B0]   STW     .D2T2   B5,*B4            ; |111| 

   [ B0]   STW     .D2T1   A0,*B4            ; |107| 
           ; BRANCH OCCURS                   ; |113| 
;** --------------------------------------------------------------------------*
L4:    
           NOP             4
           CMPEQ   .L2     B4,12,B0          ; |114| 
   [!B0]   B       .S1     L6                ; |114| 
           NOP             2
   [ B0]   MVKL    .S1     0x2000014,A0      ; |115| 
   [ B0]   MVKH    .S1     0x2000014,A0      ; |115| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |115| 
           ; BRANCH OCCURS                   ; |114| 
;** --------------------------------------------------------------------------*
           NOP             4
           AND     .S1     1,A0,A1           ; |115| 
   [!A1]   B       .S1     L6                ; |115| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |116| 
           ; BRANCH OCCURS                   ; |115| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L5:    

           MVKH    .S2     0x2000000,B4      ; |116| 
||         MVKL    .S1     _compacket+124,A0 ; |116| 

           LDW     .D2T2   *B4,B4            ; |116| 
||         MVKH    .S1     _compacket+124,A0 ; |116| 

           LDW     .D1T1   *A0,A3            ; |116| 
           MVKL    .S1     _compacket+124,A0 ; |117| 
           MVKH    .S1     _compacket+124,A0 ; |117| 
           NOP             1
           EXTU    .S2     B4,24,24,B4       ; |116| 
           STB     .D1T2   B4,*A3            ; |116| 
           LDW     .D1T1   *A0,A0            ; |117| 
           MVKL    .S2     _compacket+99,B4  ; |117| 
           MVKH    .S2     _compacket+99,B4  ; |117| 
           NOP             2
           CMPEQ   .L2X    A0,B4,B0          ; |117| 
   [!B0]   MVKL    .S1     _compacket+124,A0 ; |121| 
   [!B0]   MVKH    .S1     _compacket+124,A0 ; |121| 
   [!B0]   MV      .D1     A0,A4             ; |121| 
   [!B0]   LDW     .D1T1   *A4,A0            ; |121| 
   [ B0]   MVKL    .S1     _compacket+124,A0 ; |118| 
   [ B0]   MVKL    .S2     _compacket,B4     ; |118| 
   [ B0]   MVKH    .S1     _compacket+124,A0 ; |118| 
   [ B0]   MVKH    .S2     _compacket,B4     ; |118| 

           MVKL    .S1     0x2000014,A0      ; |123| 
|| [!B0]   ADD     .L1     1,A0,A3           ; |121| 
|| [ B0]   STW     .D1T2   B4,*A0            ; |118| 

           MVKH    .S1     0x2000014,A0      ; |123| 
|| [!B0]   STW     .D1T1   A3,*A4            ; |121| 

           LDW     .D1T1   *A0,A0            ; |123| 
           NOP             4
           AND     .S1     1,A0,A1           ; |123| 
   [ A1]   B       .S1     L5                ; |123| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |116| 
           ; BRANCH OCCURS                   ; |123| 
;** --------------------------------------------------------------------------*
L6:    
           MVKL    .S1     0x2000008,A0      ; |125| 
           MVKH    .S1     0x2000008,A0      ; |125| 
           LDW     .D1T1   *A0,A0            ; |125| 
           NOP             2
;** --------------------------------------------------------------------------*
L7:    
           NOP             2
           AND     .S1     15,A0,A0          ; |125| 
           CMPEQ   .L1     A0,1,A1           ; |125| 
   [!A1]   B       .S1     L1                ; |125| 
           STW     .D2T1   A0,*+SP(4)        ; |125| 
   [!A1]   LDW     .D2T2   *+SP(4),B4        ; |93| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |126| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |126| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |126| 
           ; BRANCH OCCURS                   ; |125| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(68),B4       ; |126| 
;** --------------------------------------------------------------------------*
L8:    
           LDW     .D2T2   *+SP(64),B3       ; |126| 
           LDW     .D2T2   *+SP(60),B2       ; |126| 
           LDW     .D2T2   *+SP(56),B1       ; |126| 
           LDW     .D2T2   *+SP(52),B0       ; |126| 
           LDW     .D2T1   *+SP(48),A9       ; |126| 
           LDW     .D2T1   *+SP(44),A8       ; |126| 
           LDW     .D2T1   *+SP(40),A7       ; |126| 
           LDW     .D2T1   *+SP(36),A6       ; |126| 
           LDW     .D2T1   *+SP(32),A5       ; |126| 
           LDW     .D2T1   *+SP(28),A4       ; |126| 
           LDW     .D2T1   *+SP(24),A3       ; |126| 
           LDW     .D2T1   *+SP(20),A2       ; |126| 
           LDW     .D2T1   *+SP(16),A1       ; |126| 
           LDW     .D2T1   *+SP(12),A0       ; |126| 

           B       .S2     IRP               ; |126| 
||         LDW     .D2T2   *+SP(84),B8       ; |126| 

           LDW     .D2T2   *++SP(88),B9      ; |126| 
           NOP             4
           ; BRANCH OCCURS                   ; |126| 


;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_SendByte
	.global	_UMAddData
	.global	_compacket
	.global	_respacket
	.global	_hall_count
	.global	_ref_count
	.global	_duty
