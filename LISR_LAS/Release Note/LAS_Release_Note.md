# Linux Automatic Sript(LAS) Release Note

## 2111 LAS Release Note

## 수정된 사항
```
Ubuntu, CentOS rc.local 서비스 재시작 기능 추가
Ubuntu 16에서 R, R-Server 버전 업그레이드로 인해 설치시 필요한 패키지 추가
(libssl-dev build-essential libffi-dev)
CentOS 7 에서 JupyterHub 설치시 필요한 Nodejs 버전 업그레이드로 인한 Nodejs 버전 업
Nodejs14 -> 16 으로 버전 업
설치 가능한 CUDA 버전 추가
Jupyterhub GPU 없는 버전에서 설치 안되게 변경
```

## 2108 LAS Release Note

## 수정된 사항
```
Ubuntu 20.04에서 Mirror 주소 변경 방법 변경
각 OS별 패키지 설치 종류 변경
CUDA 설치시 체크 방법 변경
설치 후 Check 시스템 이름 변경 LAS_Install_Log -> Auto_Install_Log
mailutils 기능 삭제
```


## 2107 LAS Release Note

## 새로운 기능
```
여러번 스크립트가 실행 되어도 동일한 결과값을 내는 멱등성 지원
Server, Workstation, PC 등 H/W 종류에 따른 설치 지원
OS 종류에 상관없이 진행 되는 기능 지원
CUDA 버전을 미리 선택하여 원하는 버전 설치 가능
종료 후 스스로 체크리스트 실행하여 결과값 도출까지 진행
```

## 기존 기능 강화
```
여러 갈래로 나눠진 스크립트 통합
스크립트 내의 변동사항 발생시 적용하기 용이하게 변경
설치 순서 변화로 재부팅 횟수를 줄여 속도 개선
```
## 버그 수정
```
Python3 라이브러리가 정수값을 로드하는 방식 변경으로 Warring 발생 아래 2개의 파일의 값 변경
/usr/lib/python3/dist-packages/secretstorage/dhcrypto.py : 15번째 줄
/usr/lib/python3/dist-packages/secretstorage/util.py : 19번째 줄
mailutils 설정 중 테스트 메일로 가득차서 초기화 진행
```

## 디버깅 예정
```
Python2의 warrning 메시지 표시 (오래되서 곧 지원 종료 메시지)
```

## H/W에 따른 스크립트 진행 순서
```
PC, Workstation (No GPU) = 1 ~ 12 진행
PC, Workstation (GPU) = 1 ~ 16 진행
Dell Server (No GPU) = 1 ~ 12, 17,18 진행
Etc  Server (No GPU) = 1 ~ 12, 17 진행
Dell Server (GPU) = 1 ~ 18 진행
Etc  Server (GPU) =  1 ~ 17 진행
```
## Feedback
```
오류 발생 및 요청사항에 대한 피드백은 Teams로 안내 부탁드립니다.
다산데이타 권문주 대리
```

## 스크립트 진행 순서도
### 1. 변수 선언

### 2. rc.local 생성 및 변경

### 3. nouveau 끄기 및 grub 설정

### 4. selinux 제거 및 저장소 변경

### 5. 기본 패키지 설치

### 6. 프로필 설정

### 7. 서버 시간 동기화

### 8. 파이썬 설치

### 9. 파이썬 패키지 설치

### 10. 방화벽 설정

### 11. 사용자 생성 테스트

### 12. H/W 사양 체크

### 13. CUDA,CUDNN Repo 설치

### 14. CUDA 설치 및 PATH 설정

### 15. CUDNN 설치 및 PATH 설정

### 16. 딥러닝 패키지 설치

### 17. 서버 전용 MSM 설치

### 18. Dell 전용 OMSA설치

