# Mechatronics DC Motor Control

DC 모터의 위치 PID 제어와 궤적 추종 제어를 실습한 메카트로닉스 프로젝트입니다. MATLAB/Simulink 모델로 제어 구조를 먼저 확인하고, TI C6701 기반 실습 보드에서 엔코더 입력과 PWM 출력을 이용해 실제 DC 모터를 제어하는 C 코드를 포함합니다.

## 프로젝트 개요

이 저장소는 DC 모터 제어 실습 자료를 다음 두 흐름으로 구성합니다.

- `01.Sim01_mdl2018`: MATLAB/Simulink 기반 시뮬레이션 모델
- `01_MeTR_DC`: C6701 DSP 보드에서 실행하는 DC 모터 제어 코드
- `docs`: 강의 자료, 실습 매뉴얼, 모터/드라이버/FPGA/USB Monitor 문서

실기 코드의 핵심 제어 루프는 `01_MeTR_DC/interrupt.c`의 `ISRtimer0()`에 구현되어 있습니다. 타이머 인터럽트 주기마다 엔코더 각도를 읽고, 기준값과 현재 각도의 오차로 PID 제어 입력을 계산한 뒤 PWM 듀티로 출력합니다.

## 주요 기능

| 구분 | 내용 |
| --- | --- |
| 제어 대상 | DC motor position control |
| 시뮬레이션 | MATLAB/Simulink `.mdl`, MATLAB script |
| 실기 구현 | TI C6701 DSP용 C/ASM 프로젝트 |
| 샘플링 | `TIMER_FRQ = 1000 Hz`, `Ts = 1 / TIMER_FRQ` |
| 센서 입력 | 엔코더 카운트 기반 각도 계산 |
| 구동 출력 | PWM duty command, `-48` ~ `48` 제한 |
| 모니터링 | USB Monitor로 기준값, 목표 속도, 오차, 포화 제어 입력 전송 |

## 제어 구조

### 1. 기본 PID 위치 제어

`use_tracking = 0`일 때는 Lab3 형태의 기본 위치 PID 제어를 수행합니다.

- 기준 위치: `R_lab3 = 90.0f`
- 현재 위치: `GetAngle()`에서 엔코더 카운트를 각도로 변환
- 오차: `error = R_lab3 - y`
- PID 항:
  - `P_term = Kp * error`
  - `D_term = Kd * (error - p_error)`
  - `I_term = Ki * s_error`
- 제어 입력: `u_lab3 = P_term + I_term + D_term`
- PWM 출력 전 포화: `-48` ~ `48`

현재 실기 코드의 기본 게인은 다음과 같습니다.

```c
#define Kp 1.0f
#define Kd 16.0f
#define Ki 0.0f
```

### 2. 궤적 추종 및 2DOF 제어 구조

`use_tracking = 1`일 때는 Lab4 형태의 궤적 추종 제어를 수행합니다. `InitTrajectory()`에서 이동거리, 최대 속도, 가속도 조건에 따라 사다리꼴 또는 삼각형 속도 프로파일을 선택하고, 인터럽트마다 기준 위치 `R_lab4`와 목표 속도 `target_v`를 갱신합니다.

- 궤적 파라미터:
  - `a = 12000.0f`
  - `Vmax = 1500.0f`
  - `Sref = 720.0f`
- 프로파일 선택:
  - `Sref > (Vmax * Vmax) / a`: 사다리꼴 속도 프로파일
  - 그 외: 삼각형 속도 프로파일
- 피드백 입력: `P_term + I_term + D_term`
- 피드포워드 입력: `Kff * target_v`
- 전체 입력: `u_lab4 = P_term + I_term + D_term + Kff * target_v`

이 구조는 기준 위치를 직접 추종하는 피드백 루프에 목표 속도 기반 피드포워드를 더한 형태입니다. 프로젝트 README에서는 이를 2DOF 제어 구조로 정리했습니다.

```c
#define Kff 0.013f
```

## 주요 파일

| 경로 | 설명 |
| --- | --- |
| `01_MeTR_DC/main.c` | 보드 초기화, 타이머/UART/USB Monitor 초기화, PWM 출력 함수, 엔코더 각도 변환 함수 |
| `01_MeTR_DC/interrupt.c` | 타이머 인터럽트 기반 PID/궤적 추종 제어 루프 |
| `01_MeTR_DC/constant.h` | 패킷 크기, CPU 주파수, 타이머 주파수 정의 |
| `01_MeTR_DC/Makefile` | `cl6x`, `lnk6x`, `hex6x` 기반 RAM/Flash 빌드 규칙 |
| `01.Sim01_mdl2018/PIDSim.m` | 전달함수 기반 PID 응답 확인용 MATLAB 스크립트 |
| `01.Sim01_mdl2018/DC_PosPID.mdl` | DC 모터 위치 PID 제어 Simulink 모델 |
| `01.Sim01_mdl2018/DC_VelPID.mdl` | DC 모터 속도 PID 제어 Simulink 모델 |
| `01.Sim01_mdl2018/DC_Track.mdl` | 궤적 추종 제어 Simulink 모델 |

## 프로젝트 구조

```text
Mechatronics/
+-- 01.Sim01_mdl2018/
|   +-- DC_PosPID.mdl
|   +-- DC_PosPID.mdl.r2018b
|   +-- DC_Track.mdl
|   +-- DC_Track.mdl.r2018b
|   +-- DC_VelPID.mdl
|   +-- DC_VelPID.mdl.r2018b
|   +-- PIDSim.m
+-- 01_MeTR_DC/
|   +-- main.c
|   +-- interrupt.c
|   +-- serial.c
|   +-- USBMon.c
|   +-- *.h
|   +-- *.asm
|   +-- Makefile
|   +-- RAM_lnk.cmd
|   +-- FLASH_lnk.cmd
+-- docs/
|   +-- MeTR_Lab01_r2.0.pdf
|   +-- MeTr_Lecture01.pdf
|   +-- MeTr_Lecture02.pdf
|   +-- MeTr_Lecture02_Supplement_Feedforward 효과.pdf
|   +-- MeTR_Sim01.pdf
|   +-- 00_Doc/
+-- LICENSE
+-- README.md
```

## 실행 및 확인 방법

### MATLAB/Simulink 시뮬레이션

1. MATLAB에서 `01.Sim01_mdl2018` 폴더를 작업 경로로 설정합니다.
2. `PIDSim.m`을 실행해 PID 전달함수 기반 step response를 확인합니다.
3. `DC_PosPID.mdl`, `DC_VelPID.mdl`, `DC_Track.mdl`을 열어 위치/속도/궤적 추종 모델을 확인합니다.

### DSP 실기 코드

1. `01_MeTR_DC` 폴더에서 TI C6000 툴체인 환경을 준비합니다.
2. `make ram` 또는 `make flash`로 빌드합니다.
3. 보드 실행 후 USB Monitor에서 다음 4개 데이터를 확인합니다.
   - 기준 위치: `ref_mon`
   - 목표 속도: `target_v`
   - 위치 오차: `error`
   - 포화 후 제어 입력: `u_mon`

## 구현 요약

- 엔코더 카운트는 `GetAngle()`에서 `360 / 3840` 스케일로 각도값으로 변환합니다.
- `PWMOut()`은 제어 입력을 `-48` ~ `48` 범위로 제한하고, 이를 `0x000` ~ `0xFFF` PWM 레지스터 값으로 변환합니다.
- 타이머 인터럽트는 1 kHz 기준으로 동작하며, PID 계산과 궤적 기준값 갱신이 같은 루프 안에서 수행됩니다.
- 현재 기본 설정은 `use_tracking = 1`이므로 궤적 추종 및 피드포워드가 포함된 제어가 실행됩니다.
