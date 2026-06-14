;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Wed May 06 12:04:41 2026                                *
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
	.field  	_cnt1K$1+0,32
	.field  	0,32			; _cnt1K$1 @ 0
	.sect	".text"
_cnt1K$1:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_cnt$2+0,32
	.field  	0,32			; _cnt$2 @ 0
	.sect	".text"
_cnt$2:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_mmag$3+0,32
	.word	03e4ccccdh		; _mmag$3 @ 0
	.sect	".text"
_mmag$3:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\W10\AppData\Local\Temp\TI2656_2 --template_info_file C:\Users\W10\AppData\Local\Temp\TI2656_3 --object_file interrupt.obj --opt_shell 9 interrupt.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 interrupt.c 
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
;*   Local Frame Size  : 0 Args + 0 Auto + 84 Save = 84 byte                  *
;******************************************************************************
_ISRtimer0:
;** --------------------------------------------------------------------------*
           STW     .D2T2   B9,*SP--(88)      ; |19| 
           STW     .D2T2   B5,*+SP(72)       ; |19| 
           STW     .D2T1   A0,*+SP(12)       ; |19| 
           STW     .D2T2   B4,*+SP(68)       ; |19| 
           STW     .D2T1   A3,*+SP(24)       ; |19| 
           STW     .D2T1   A4,*+SP(28)       ; |19| 
           STW     .D2T1   A5,*+SP(32)       ; |19| 
           STW     .D2T1   A6,*+SP(36)       ; |19| 
           STW     .D2T1   A7,*+SP(40)       ; |19| 
           STW     .D2T1   A8,*+SP(44)       ; |19| 
           STW     .D2T1   A9,*+SP(48)       ; |19| 
           STW     .D2T2   B0,*+SP(52)       ; |19| 
           STW     .D2T2   B1,*+SP(56)       ; |19| 
           STW     .D2T2   B2,*+SP(60)       ; |19| 
           STW     .D2T2   B3,*+SP(64)       ; |19| 
           STW     .D2T2   B6,*+SP(76)       ; |19| 
           STW     .D2T2   B7,*+SP(80)       ; |19| 
           STW     .D2T2   B8,*+SP(84)       ; |19| 

           MVK     .S2     1,B5              ; |26| 
||         MVKL    .S1     _TFlag,A0         ; |26| 
||         STW     .D2T1   A2,*+SP(20)       ; |19| 

           MVKH    .S1     _TFlag,A0         ; |26| 
||         MVKL    .S2     0x2000040,B4      ; |28| 
||         STW     .D2T1   A1,*+SP(16)       ; |19| 

           STW     .D1T2   B5,*A0            ; |26| 
||         MVKH    .S2     0x2000040,B4      ; |28| 

           LDW     .D2T2   *B4,B5            ; |28| 
           MVKL    .S2     0x2000040,B4      ; |28| 
           MVKH    .S2     0x2000040,B4      ; |28| 
           MVKL    .S1     _cnt1K$1,A0       ; |31| 
           MVKH    .S1     _cnt1K$1,A0       ; |31| 
           NOT     .L2     B5,B5             ; |28| 
           STW     .D2T2   B5,*B4            ; |28| 
           LDW     .D1T1   *A0,A3            ; |31| 
           MVKL    .S2     __remu,B6         ; |44| 
           MVKL    .S2     RL0,B3            ; |44| 
           MVKH    .S2     RL0,B3            ; |44| 
           MVKL    .S1     _cnt$2,A5         ; |44| 

           MVKL    .S1     _cnt1K$1,A3       ; |32| 
||         ADD     .D1     1,A3,A4           ; |31| 

           MVKH    .S1     _cnt1K$1,A3       ; |32| 
||         STW     .D1T1   A4,*A0            ; |31| 

           LDW     .D1T1   *A3,A4            ; |32| 
           MVK     .S1     100,A3            ; |32| 
           MVKH    .S2     __remu,B6         ; |44| 
           MVKL    .S2     _cnt$2,B5         ; |43| 
           MVKH    .S1     _cnt$2,A5         ; |44| 
           CMPLTU  .L1     A4,A3,A1          ; |32| 
   [ A1]   B       .S1     L2                ; |32| 
           MVKL    .S1     _cnt1K$1,A0       ; |35| 
           MVKH    .S2     _cnt$2,B5         ; |43| 
           ZERO    .D1     A3                ; |35| 
           MVKH    .S1     _cnt1K$1,A0       ; |35| 

           MVK     .S2     0x1388,B4         ; |44| 
|| [ A1]   LDW     .D2T2   *+SP(80),B7       ; |54| 

           ; BRANCH OCCURS                   ; |32| 
;** --------------------------------------------------------------------------*
           STW     .D1T1   A3,*A0            ; |35| 
           LDW     .D2T2   *B5,B7            ; |43| 
           NOP             4
           ADD     .D2     1,B7,B7           ; |43| 

           STW     .D2T2   B7,*B5            ; |43| 
||         B       .S2     B6                ; |44| 

           LDW     .D1T1   *A5,A4            ; |44| 
           NOP             4
RL0:       ; CALL OCCURS                     ; |44| 
           MV      .D1     A4,A1             ; |44| 
   [ A1]   B       .S1     L1                ; |44| 

           ZERO    .D2     B5                ; |46| 
||         MVKL    .S1     0x3c23d70a,A3     ; |45| 

           MVKH    .S2     0x40000000,B5     ; |46| 
||         MVKL    .S1     _mmag$3,A0        ; |45| 

           MVKL    .S2     _mmag$3,B4        ; |46| 
||         MVKH    .S1     0x3c23d70a,A3     ; |45| 

           MVKH    .S2     _mmag$3,B4        ; |46| 
||         MVKH    .S1     _mmag$3,A0        ; |45| 

   [!A1]   LDW     .D1T1   *A0,A4            ; |45| 
|| [ A1]   MVKL    .S1     _UMAddData,A0     ; |53| 

           ; BRANCH OCCURS                   ; |44| 
;** --------------------------------------------------------------------------*
           NOP             4
           ADDSP   .L1     A3,A4,A3          ; |45| 
           NOP             3
           STW     .D1T1   A3,*A0            ; |45| 
           LDW     .D2T2   *B4,B6            ; |46| 
           MVKL    .S2     _mmag$3,B4        ; |47| 
           MVKH    .S2     _mmag$3,B4        ; |47| 
           MVKL    .S1     0x3e4ccccd,A0     ; |47| 
           MVKH    .S1     0x3e4ccccd,A0     ; |47| 
           CMPGTSP .S2     B6,B5,B0          ; |46| 
   [ B0]   STW     .D2T1   A0,*B4            ; |47| 
           MVKL    .S1     _UMAddData,A0     ; |53| 
;** --------------------------------------------------------------------------*
L1:    

           MVKL    .S1     _mon_vel,A3       ; |53| 
||         MVKL    .S2     _mon_angle,B4     ; |53| 

           MVKH    .S2     _mon_angle,B4     ; |53| 
||         MVKH    .S1     _UMAddData,A0     ; |53| 

           B       .S2X    A0                ; |53| 
||         MVKH    .S1     _mon_vel,A3       ; |53| 

           LDW     .D1T2   *A3,B4            ; |53| 
||         LDW     .D2T1   *B4,A4            ; |53| 

           MVKL    .S2     RL2,B3            ; |53| 
           MVKH    .S2     RL2,B3            ; |53| 
           ZERO    .D2     B6                ; |53| 
           ZERO    .D1     A6                ; |53| 
RL2:       ; CALL OCCURS                     ; |53| 
           LDW     .D2T2   *+SP(80),B7       ; |54| 
;** --------------------------------------------------------------------------*
L2:    
           LDW     .D2T2   *+SP(76),B6       ; |54| 
           LDW     .D2T2   *+SP(72),B5       ; |54| 
           LDW     .D2T2   *+SP(68),B4       ; |54| 
           LDW     .D2T2   *+SP(64),B3       ; |54| 
           LDW     .D2T2   *+SP(60),B2       ; |54| 
           LDW     .D2T2   *+SP(56),B1       ; |54| 
           LDW     .D2T2   *+SP(52),B0       ; |54| 
           LDW     .D2T1   *+SP(48),A9       ; |54| 
           LDW     .D2T1   *+SP(44),A8       ; |54| 
           LDW     .D2T1   *+SP(40),A7       ; |54| 
           LDW     .D2T1   *+SP(36),A6       ; |54| 
           LDW     .D2T1   *+SP(32),A5       ; |54| 
           LDW     .D2T1   *+SP(28),A4       ; |54| 
           LDW     .D2T1   *+SP(24),A3       ; |54| 
           LDW     .D2T1   *+SP(20),A2       ; |54| 
           LDW     .D2T1   *+SP(16),A1       ; |54| 
           LDW     .D2T1   *+SP(12),A0       ; |54| 

           B       .S2     IRP               ; |54| 
||         LDW     .D2T2   *+SP(84),B8       ; |54| 

           LDW     .D2T2   *++SP(88),B9      ; |54| 
           NOP             4
           ; BRANCH OCCURS                   ; |54| 


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
           B       .S2     IRP               ; |58| 
           NOP             5
           ; BRANCH OCCURS                   ; |58| 


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
           STW     .D2T2   B9,*SP--(88)      ; |61| 
           STW     .D2T1   A0,*+SP(12)       ; |61| 
           STW     .D2T2   B7,*+SP(80)       ; |61| 
           STW     .D2T2   B6,*+SP(76)       ; |61| 
           STW     .D2T2   B5,*+SP(72)       ; |61| 
           STW     .D2T2   B4,*+SP(68)       ; |61| 
           STW     .D2T2   B3,*+SP(64)       ; |61| 
           STW     .D2T2   B2,*+SP(60)       ; |61| 
           STW     .D2T2   B1,*+SP(56)       ; |61| 
           STW     .D2T2   B0,*+SP(52)       ; |61| 
           STW     .D2T1   A9,*+SP(48)       ; |61| 
           STW     .D2T1   A8,*+SP(44)       ; |61| 
           STW     .D2T1   A7,*+SP(40)       ; |61| 
           STW     .D2T1   A6,*+SP(36)       ; |61| 
           STW     .D2T1   A5,*+SP(32)       ; |61| 
           STW     .D2T1   A4,*+SP(28)       ; |61| 
           STW     .D2T1   A3,*+SP(24)       ; |61| 
           STW     .D2T1   A2,*+SP(20)       ; |61| 

           STW     .D2T1   A1,*+SP(16)       ; |61| 
||         MVKL    .S1     0x2000008,A0      ; |64| 

           MVKH    .S1     0x2000008,A0      ; |64| 
||         STW     .D2T2   B8,*+SP(84)       ; |61| 

           LDW     .D1T1   *A0,A0            ; |64| 
           NOP             4
           AND     .S1     15,A0,A0          ; |64| 
           CMPEQ   .L1     A0,1,A1           ; |64| 
   [ A1]   B       .S1     L10               ; |64| 
           STW     .D2T1   A0,*+SP(4)        ; |64| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |98| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |98| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |98| 
   [ A1]   LDW     .D2T2   *+SP(68),B4       ; |98| 
           ; BRANCH OCCURS                   ; |64| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(4),B4        ; |65| 
           NOP             3
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L3
;** --------------------------------------------------------------------------*
L3:    
           NOP             1
           CMPEQ   .L2     B4,4,B0           ; |65| 
   [!B0]   B       .S1     L5                ; |65| 

   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |77| 
|| [ B0]   MVKL    .S1     0x2000014,A0      ; |66| 

   [ B0]   MVKH    .S1     0x2000014,A0      ; |66| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |66| 
           NOP             2
           ; BRANCH OCCURS                   ; |65| 
;** --------------------------------------------------------------------------*
           NOP             2
           AND     .S1     1,A0,A1           ; |66| 
   [!A1]   B       .S1     L9                ; |66| 
   [!A1]   MVKL    .S1     0x2000008,A0      ; |97| 
   [!A1]   MVKH    .S1     0x2000008,A0      ; |97| 

   [ A1]   ZERO    .D2     B4                ; |67| 
|| [ A1]   MVKL    .S2     _compacket+124,B5 ; |67| 
|| [!A1]   LDW     .D1T1   *A0,A0            ; |97| 

   [ A1]   MVKH    .S2     0x2000000,B4      ; |67| 

   [ A1]   MVKH    .S2     _compacket+124,B5 ; |67| 
|| [ A1]   LDW     .D2T2   *B4,B4            ; |67| 

           ; BRANCH OCCURS                   ; |66| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *B5,B5            ; |67| 
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L4:    
           MVKL    .S1     _compacket+124,A0 ; |68| 
           MVKH    .S1     _compacket+124,A0 ; |68| 
           EXTU    .S2     B4,24,24,B4       ; |67| 
           STB     .D2T2   B4,*B5            ; |67| 
           LDW     .D1T1   *A0,A3            ; |68| 
           MVKL    .S1     _SendByte,A0      ; |68| 
           MVKH    .S1     _SendByte,A0      ; |68| 
           MVKL    .S2     RL4,B3            ; |68| 
           B       .S2X    A0                ; |68| 
           LDB     .D1T1   *A3,A4            ; |68| 
           MVKH    .S2     RL4,B3            ; |68| 
           NOP             3
RL4:       ; CALL OCCURS                     ; |68| 
           MVKL    .S2     _compacket+124,B4 ; |69| 
           MVKH    .S2     _compacket+124,B4 ; |69| 
           LDW     .D2T2   *B4,B4            ; |69| 
           MVKL    .S1     _compacket+99,A0  ; |69| 
           MVKH    .S1     _compacket+99,A0  ; |69| 
           NOP             2
           CMPEQ   .L1X    B4,A0,A1          ; |69| 
   [!A1]   MVKL    .S2     _compacket+124,B4 ; |73| 
   [!A1]   MVKH    .S2     _compacket+124,B4 ; |73| 
   [!A1]   LDW     .D2T2   *B4,B5            ; |73| 
   [ A1]   MVKL    .S2     _compacket+124,B4 ; |70| 
   [ A1]   MVKL    .S1     _compacket,A0     ; |70| 
   [ A1]   MVKH    .S2     _compacket+124,B4 ; |70| 
   [ A1]   MVKH    .S1     _compacket,A0     ; |70| 

           MVKL    .S2     0x2000014,B5      ; |75| 
|| [!A1]   ADD     .D2     1,B5,B6           ; |73| 

   [!A1]   STW     .D2T2   B6,*B4            ; |73| 

   [ A1]   STW     .D2T1   A0,*B4            ; |70| 
||         MVKH    .S2     0x2000014,B5      ; |75| 

           LDW     .D2T2   *B5,B4            ; |75| 
           NOP             4
           AND     .S2     1,B4,B0           ; |75| 
   [ B0]   B       .S1     L4                ; |75| 

   [ B0]   ZERO    .D2     B4                ; |67| 
|| [ B0]   MVKL    .S2     _compacket+124,B5 ; |67| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |67| 

   [ B0]   MVKH    .S2     _compacket+124,B5 ; |67| 
|| [ B0]   LDW     .D2T2   *B4,B4            ; |67| 

   [ B0]   LDW     .D2T2   *B5,B5            ; |67| 
           NOP             1
           ; BRANCH OCCURS                   ; |75| 
;** --------------------------------------------------------------------------*
           B       .S1     L9                ; |76| 
           MVKL    .S1     0x2000008,A0      ; |97| 
           MVKH    .S1     0x2000008,A0      ; |97| 
           LDW     .D1T1   *A0,A0            ; |97| 
           NOP             2
           ; BRANCH OCCURS                   ; |76| 
;** --------------------------------------------------------------------------*
L5:    
           CMPEQ   .L2     B4,2,B0           ; |77| 
   [!B0]   B       .S1     L6                ; |77| 
   [ B0]   MVKL    .S2     _respacket+200,B4 ; |78| 
           NOP             3
   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |86| 
           ; BRANCH OCCURS                   ; |77| 
;** --------------------------------------------------------------------------*
           MVKH    .S2     _respacket+200,B4 ; |78| 
           LDW     .D2T2   *B4,B5            ; |78| 
           NOP             4
           CMPGT   .L2     B5,0,B0           ; |78| 

   [ B0]   MVKL    .S1     _respacket+204,A0 ; |79| 
||         SUB     .D2     B5,1,B5           ; |78| 

   [ B0]   MVKH    .S1     _respacket+204,A0 ; |79| 
||         STW     .D2T2   B5,*B4            ; |78| 

   [ B0]   LDW     .D1T1   *A0,A3            ; |79| 
   [ B0]   MVKL    .S1     _respacket,A4     ; |79| 
   [ B0]   MVKH    .S1     _respacket,A4     ; |79| 
   [!B0]   MVKL    .S1     0x2000004,A0      ; |82| 
   [!B0]   MVKL    .S2     _respacket+208,B4 ; |83| 
   [ B0]   ADD     .D1     1,A3,A5           ; |79| 
   [ B0]   STW     .D1T1   A5,*A0            ; |79| 

           B       .S1     L8                ; |85| 
|| [ B0]   LDB     .D1T1   *+A3[A4],A0       ; |79| 

   [!B0]   MVKH    .S1     0x2000004,A0      ; |82| 
   [!B0]   MVK     .S2     1,B5              ; |82| 

   [!B0]   ZERO    .D2     B5                ; |83| 
|| [ B0]   ZERO    .L2     B4                ; |79| 
|| [!B0]   MVKH    .S2     _respacket+208,B4 ; |83| 
|| [!B0]   STW     .D1T2   B5,*A0            ; |82| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |79| 
|| [!B0]   STW     .D2T2   B5,*B4            ; |83| 

   [ B0]   STW     .D2T1   A0,*B4            ; |79| 
           ; BRANCH OCCURS                   ; |85| 
;** --------------------------------------------------------------------------*
L6:    
           NOP             4
           CMPEQ   .L2     B4,12,B0          ; |86| 
   [!B0]   B       .S1     L8                ; |86| 
           NOP             2
   [ B0]   MVKL    .S1     0x2000014,A0      ; |87| 
   [ B0]   MVKH    .S1     0x2000014,A0      ; |87| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |87| 
           ; BRANCH OCCURS                   ; |86| 
;** --------------------------------------------------------------------------*
           NOP             4
           AND     .S1     1,A0,A1           ; |87| 
   [!A1]   B       .S1     L8                ; |87| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |88| 
           ; BRANCH OCCURS                   ; |87| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L7:    

           MVKH    .S2     0x2000000,B4      ; |88| 
||         MVKL    .S1     _compacket+124,A0 ; |88| 

           LDW     .D2T2   *B4,B4            ; |88| 
||         MVKH    .S1     _compacket+124,A0 ; |88| 

           LDW     .D1T1   *A0,A3            ; |88| 
           MVKL    .S1     _compacket+124,A0 ; |89| 
           MVKH    .S1     _compacket+124,A0 ; |89| 
           NOP             1
           EXTU    .S2     B4,24,24,B4       ; |88| 
           STB     .D1T2   B4,*A3            ; |88| 
           LDW     .D1T1   *A0,A0            ; |89| 
           MVKL    .S2     _compacket+99,B4  ; |89| 
           MVKH    .S2     _compacket+99,B4  ; |89| 
           NOP             2
           CMPEQ   .L2X    A0,B4,B0          ; |89| 
   [!B0]   MVKL    .S1     _compacket+124,A0 ; |93| 
   [!B0]   MVKH    .S1     _compacket+124,A0 ; |93| 
   [!B0]   MV      .D1     A0,A4             ; |93| 
   [!B0]   LDW     .D1T1   *A4,A0            ; |93| 
   [ B0]   MVKL    .S1     _compacket+124,A0 ; |90| 
   [ B0]   MVKL    .S2     _compacket,B4     ; |90| 
   [ B0]   MVKH    .S1     _compacket+124,A0 ; |90| 
   [ B0]   MVKH    .S2     _compacket,B4     ; |90| 

           MVKL    .S1     0x2000014,A0      ; |95| 
|| [!B0]   ADD     .L1     1,A0,A3           ; |93| 
|| [ B0]   STW     .D1T2   B4,*A0            ; |90| 

           MVKH    .S1     0x2000014,A0      ; |95| 
|| [!B0]   STW     .D1T1   A3,*A4            ; |93| 

           LDW     .D1T1   *A0,A0            ; |95| 
           NOP             4
           AND     .S1     1,A0,A1           ; |95| 
   [ A1]   B       .S1     L7                ; |95| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |88| 
           ; BRANCH OCCURS                   ; |95| 
;** --------------------------------------------------------------------------*
L8:    
           MVKL    .S1     0x2000008,A0      ; |97| 
           MVKH    .S1     0x2000008,A0      ; |97| 
           LDW     .D1T1   *A0,A0            ; |97| 
           NOP             2
;** --------------------------------------------------------------------------*
L9:    
           NOP             2
           AND     .S1     15,A0,A0          ; |97| 
           CMPEQ   .L1     A0,1,A1           ; |97| 
   [!A1]   B       .S1     L3                ; |97| 
           STW     .D2T1   A0,*+SP(4)        ; |97| 
   [!A1]   LDW     .D2T2   *+SP(4),B4        ; |65| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |98| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |98| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |98| 
           ; BRANCH OCCURS                   ; |97| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(68),B4       ; |98| 
;** --------------------------------------------------------------------------*
L10:    
           LDW     .D2T2   *+SP(64),B3       ; |98| 
           LDW     .D2T2   *+SP(60),B2       ; |98| 
           LDW     .D2T2   *+SP(56),B1       ; |98| 
           LDW     .D2T2   *+SP(52),B0       ; |98| 
           LDW     .D2T1   *+SP(48),A9       ; |98| 
           LDW     .D2T1   *+SP(44),A8       ; |98| 
           LDW     .D2T1   *+SP(40),A7       ; |98| 
           LDW     .D2T1   *+SP(36),A6       ; |98| 
           LDW     .D2T1   *+SP(32),A5       ; |98| 
           LDW     .D2T1   *+SP(28),A4       ; |98| 
           LDW     .D2T1   *+SP(24),A3       ; |98| 
           LDW     .D2T1   *+SP(20),A2       ; |98| 
           LDW     .D2T1   *+SP(16),A1       ; |98| 
           LDW     .D2T1   *+SP(12),A0       ; |98| 

           B       .S2     IRP               ; |98| 
||         LDW     .D2T2   *+SP(84),B8       ; |98| 

           LDW     .D2T2   *++SP(88),B9      ; |98| 
           NOP             4
           ; BRANCH OCCURS                   ; |98| 


;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_SendByte
	.global	_UMAddData
	.global	_compacket
	.global	_respacket
	.global	_mon_angle
	.global	_mon_vel
	.global	__remu
