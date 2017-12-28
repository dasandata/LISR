# 다산데이타 리눅스 설치 표준안 (2017.12)

<p align="left"><img src="http://www.dasandata.co.kr/dasanlogo.jpg" alt="dasandata logo" ></p>

-----
## 범례 및 변수.
- ${???} : 상황에 따라 변경이 필요한 변수들을 표현 합니다.
- ${USERNAME} : 설치시 생성한 기본 사용자 명 입니다.
- ${DEFAULT_NIC} : 인터넷에 연결되는 기본 네트워크 인터페이스 명칭 입니다.
- ${IP_ADDRESS} : 인터넷 연결시 사용하는 IP 주소 입니다.


## 리눅스 설치시 IP 와 HOSTNAME 은 수동으로 미리 설정 한다.
 리눅스를 처음 설치 할때부터 고정 IP를 설정하고 HOSTNAME을 정의 하는 것을 권장 합니다.
 그 이유는...

## 터미널을 통해 새로 설치된 장비에 로그인 합니다.

```
ssh ${USERNAME}@${IP_ADDRESS}
```

## 목차
1. 기본 유틸 설치 / 시간 동기화
2. profile 설정 - Console Color , alias
3. 하드웨어 사양 / 기본 환경 확인 (os 버젼 등)
4. ip 및 hostname 정보 / 인터넷 연결 확인
5.

***

### 1. 기본 유틸 설치 / 시간 동기화  
서버 기본 설정에 필요한 유틸리티들을 설치 한 후, 인터넷 시간에 맞추어 서버의 시간을 조정 합니다.

#### #centos7  

```
yum install -y  \
vim pciutils perl openssh mlocate nfs-utils rdate xauth firefox nautilus wget tcsh \
tree lshw tmux git kernel-headers kernel-devel ipmitool gcc make gcc-c++ cmake \
python-devel ntfs-3g   >> dasan_log_install_centos_default_util.txt

tail dasan_log_install_centos_default_util.txt

rdate  -s  time.bora.net
clock --systohc  
date
hwclock

```








## end.
