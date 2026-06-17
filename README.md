# Mechatronics Motor Control

## 프로젝트 개요

Mechatronics는 MATLAB/Simulink 기반 제어 모델링과 TI C6701 DSP 보드 기반 실시간 모터 제어를 정리한 프로젝트입니다. 한 학기 동안 DC Motor, STEP Motor, BLDC Motor, Inverted Pendulum 제어를 구현하며 센서 입력, PWM 출력, 타이머 인터럽트, USB Monitor 기반 상태 관측 흐름을 실습했습니다.

## 주요 특징

- TI C6701 DSP 보드에서 `TIMER_FRQ = 1000 Hz` 타이머 인터럽트 기반 제어 루프를 구현했습니다.
- 엔코더, Hall sensor, PWM, FPGA register map을 이용해 실제 모터 구동 흐름을 구성했습니다.
- DC 모터의 PID 위치 제어, trajectory tracking, feedforward 제어를 구현했습니다.
- STEP 모터의 full-step phase sequence, constant velocity 구동, velocity profile 기반 가감속 제어를 구현했습니다.
- BLDC 모터의 Hall sensor 기반 6-step commutation과 count 기반 위치 제어를 구현했습니다.
- 텀프로젝트로 DC 모터 플랫폼 기반 inverted pendulum의 swing-up 및 balancing 제어를 구현했습니다.

## 진행 현황

| 항목 | 상태 | 내용 |
| --- | --- | --- |
| DC Motor | 완료 | 위치 PID, trajectory tracking, feedforward |
| STEP Motor | 완료 | full-step 구동, constant velocity, velocity profile |
| BLDC Motor | 완료 | Hall sensor 기반 6-step commutation, 위치 제어 |
| Term Project | 완료 | inverted pendulum swing-up 및 balancing 제어 |

## 상세 스펙

| 항목 | 내용 |
| --- | --- |
| 제어 대상 | DC Motor, STEP Motor, BLDC Motor, Inverted Pendulum |
| 실습 보드 | TI C6701 DSP 기반 Mechatronics 실습 보드 |
| 시뮬레이션 | MATLAB/Simulink |
| 구현 언어 | C, ASM, MATLAB |
| 주요 입출력 | Encoder input, Hall sensor, PWM output, USB Monitor |
| 제어 주기 | `TIMER_FRQ = 1000 Hz`, `Ts = 1 / TIMER_FRQ` |
| 출력 제한 | DC/Inverted Pendulum `-48` ~ `48`, BLDC `-50` ~ `50` |

## 핵심 구현

### DC Motor

DC 모터 프로젝트는 `01_MeTR_DC/interrupt.c`의 `ISRtimer0()`에서 제어 루프를 수행합니다. 타이머 인터럽트마다 엔코더 카운트를 각도로 변환하고, 기준 위치와 현재 위치의 오차를 이용해 PID 제어 입력을 계산한 뒤 PWM 출력으로 전달했습니다.

- 기본 위치 제어에서는 `R_lab3` 기준 위치를 추종하는 PID 제어를 적용했습니다.
- 궤적 추종 제어에서는 `R_lab4`, `target_v` 기반 trapezoidal 또는 triangular velocity profile을 적용했습니다.
- 2DOF 구조에서는 feedback PID와 `Kff * target_v` feedforward 항을 함께 사용했습니다.
- USB Monitor로 기준 위치, 목표 속도, 오차와 제어 입력을 확인했습니다.

### STEP Motor

STEP 모터 프로젝트는 `02_MeTR_STEP/main.c`에서 phase sequence 기반 구동 함수와 속도 프로파일을 구현했습니다. `OneStepMove()`로 4상 full-step sequence를 출력하고, `StepMoveCV()`와 `StepMoveVP()`로 각각 constant velocity 구동과 가감속 구동을 수행했습니다.

- `full_step_phase` 배열을 이용해 A, B, /A, /B 순서의 step phase를 제어했습니다.
- 입력 각도를 step 수로 변환하고, 목표 속도에 따라 step delay를 계산했습니다.
- `MakeVelProfile()`에서 가속도와 최대 속도를 바탕으로 delay profile을 생성했습니다.
- USB Monitor로 누적 각도와 속도 추정값을 확인했습니다.

### BLDC Motor

BLDC 모터 프로젝트는 `03_MeTR_BLDC/main.c`의 `BLDCDrive()`에서 Hall sensor 상태를 읽고 6-step commutation을 수행합니다. Hall 상태 변화 순서를 이용해 `hall_count`를 증가 또는 감소시키고, `03_MeTR_BLDC/interrupt.c`에서 기준 count와 현재 count의 오차를 이용해 duty를 계산했습니다.

- Hall sensor 상태 `2, 3, 1, 5, 4, 6` 순서에 맞춰 세 상의 PWM 출력을 전환했습니다.
- duty 입력을 `-50` ~ `50` 범위로 제한하고 12-bit PWM 출력 범위에 맞게 변환했습니다.
- Hall 상태 전이를 이용해 회전 방향과 위치 count를 추정했습니다.
- 기준 count 추종을 위한 단순 PID 구조를 적용하고 USB Monitor로 기준 count, 현재 count, 오차, duty를 확인했습니다.

### Term Project: Inverted Pendulum

텀프로젝트는 `04_Termproj`에서 DC 모터 플랫폼을 이용한 inverted pendulum 제어를 구현했습니다. `GetAngle()`로 진자 엔코더 count를 각도로 변환하고, `PWMOut()`으로 제어 입력을 PWM 출력으로 변환했습니다. 제어 루프는 timer interrupt 내부에서 swing-up 모드와 balancing 모드를 나누어 수행했습니다.

- Swing-up 제어에서는 진자 각속도와 각도 정보를 이용해 고정 PWM의 방향을 결정하고 진자의 에너지를 증가시켰습니다.
- 진자가 위쪽 평형점 근처에 접근하면 balancing 모드로 전환했습니다.
- Balancing 제어에서는 진자 각도 PID와 cart 위치 보정 항을 함께 사용했습니다.
- 발표자료에서 swing-up과 balancing 제어의 구현 흐름, 튜닝 결과, 위치 복귀 한계를 함께 정리했습니다.

## 검증 및 결과

- DC 모터 위치 제어와 궤적 추종 제어를 DSP 보드에서 구현하고 USB Monitor로 응답을 확인했습니다.
- STEP 모터는 constant velocity와 velocity profile 기반 구동을 구현해 각도 명령에 따른 step sequence를 확인했습니다.
- BLDC 모터는 Hall sensor 기반 commutation과 count 기반 위치 제어 흐름을 구현했습니다.
- Inverted pendulum은 swing-up에서 balancing으로 이어지는 제어 구조를 구현했으며, cascade 구조에서 cart 위치 복귀가 상대적으로 약한 한계까지 분석했습니다.
