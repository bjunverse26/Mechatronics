# Mechatronics Motor Control

## 프로젝트 개요

Mechatronics는 MATLAB/Simulink 기반 제어 모델링과 TI C6701 DSP 보드 기반 모터 제어 실습을 정리한 프로젝트입니다. 현재 DC 모터 위치 제어를 완료했으며, STEP 모터 제어와 이후 프로젝트를 순차적으로 정리하고 있습니다.

## 주요 특징

- DC 모터 위치 PID 제어와 궤적 추종 제어를 구현했습니다.
- MATLAB/Simulink 모델로 제어 구조를 사전 검증했습니다.
- TI C6701 DSP 보드에서 타이머 인터럽트 기반 실시간 제어 루프를 실행했습니다.
- 엔코더 입력, PWM 출력, USB Monitor 기반 상태 관측 흐름을 구성했습니다.
- STEP 모터 제어 실습 코드와 문서를 정리하고 있습니다.

## 진행 현황

| 항목 | 상태 | 내용 |
| --- | --- | --- |
| DC Motor | 완료 | 위치 PID, trajectory tracking, feedforward |
| STEP Motor | 진행 중 | STEP 모터 구동 코드와 실습 문서 정리 중 |
| BLDC Motor | 예정 | 추후 실습 및 코드 정리 예정 |
| Final Project | 예정 | 통합 제어 프로젝트 진행 예정 |

## 상세 스펙

| 항목 | 내용 |
| --- | --- |
| 제어 대상 | DC Motor, STEP Motor, BLDC Motor |
| 실습 보드 | TI C6701 DSP 기반 Mechatronics 실습 보드 |
| 시뮬레이션 | MATLAB/Simulink |
| 구현 언어 | C, ASM, MATLAB |
| 주요 입출력 | Encoder input, PWM output, USB Monitor |
| DC 제어 주기 | `TIMER_FRQ = 1000 Hz`, `Ts = 1 / TIMER_FRQ` |
| DC 출력 제한 | PWM command `-48` ~ `48` |

## 핵심 구현

### DC Motor

DC 모터 프로젝트는 `01_MeTR_DC/interrupt.c`의 `ISRtimer0()`에서 제어 루프를 수행합니다. 타이머 인터럽트마다 엔코더 카운트를 각도로 변환하고, 기준 위치와 현재 위치의 오차를 이용해 PID 제어 입력을 계산한 뒤 PWM 출력으로 전달합니다.

- 기본 위치 제어에서는 `R_lab3` 기준 위치를 추종하는 PID 제어를 적용했습니다.
- 궤적 추종 제어에서는 `R_lab4`, `target_v` 기반 trapezoidal 또는 triangular velocity profile을 적용했습니다.
- 2DOF 구조에서는 feedback PID와 `Kff * target_v` feedforward 항을 함께 사용했습니다.
- USB Monitor로 기준 위치, 목표 속도, 오차와 제어 입력을 확인했습니다.

### STEP Motor

STEP 모터 프로젝트는 `02_MeTR_STEP`에 정리 중입니다. DC 모터 실습과 같은 보드/빌드 흐름을 유지하면서 STEP 모터 구동을 위한 인터럽트, 입출력, 제어 코드를 확장하는 단계입니다.

## 검증 및 결과

- DC 모터 위치 제어와 궤적 추종 제어를 DSP 보드에서 구현했습니다.
- MATLAB/Simulink 모델과 DSP 실습 코드를 분리하여 제어 구조와 실제 구현을 함께 확인할 수 있도록 구성했습니다.
- STEP 모터 프로젝트를 진행 중이며, BLDC와 Term Project 결과도 같은 형식으로 추가할 예정입니다.
