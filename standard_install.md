# 다산데이타 리눅스 설치 표준안 (2017.12.28)

<p align="left"><img src="http://www.dasandata.co.kr/dasanlogo.jpg" alt="dasandata logo" ></p>

-----
## 범례 및 변수 / 팁.
- ${???} : 상황에 따라 변경이 필요한 변수들을 표현 합니다.
- ${USERNAME} : 설치시 생성한 기본 사용자 명 입니다.
- ${DEFAULT_NIC} : 인터넷에 연결되는 기본 네트워크 인터페이스 명칭 입니다.
- ${IP_ADDRESS} : 인터넷 연결시 사용하는 IP 주소 입니다.
- #centos7 #ubuntu14 ... : 각 운영체제 별 명령어를 분리하여 표시 하였습니다.

- 명령을 실행시킬때, 명령어 박스 단위로 복사하여 터미널에 붙여넣으면 됩니다.  
- 같은 운영체제 단위라도 박스가 분리되어 있는 경우 분리된 단위로 복사하여 붙여넣습니다.


## 리눅스 설치시 IP 와 HOSTNAME 은 수동으로 미리 설정 한다.
 리눅스를 처음 설치 할때부터 고정 IP를 설정하고 HOSTNAME을 정의 하는 것을 권장 합니다.  
 그 이유는...

## 터미널을 통해 리눅스가 새로 설치된 장비에 로그인 합니다.

```
ssh ${USERNAME}@${IP_ADDRESS}
```

## 목차
1. [기본 유틸 설치 / 시간 동기화](#1-%EA%B8%B0%EB%B3%B8-%EC%9C%A0%ED%8B%B8-%EC%84%A4%EC%B9%98--%EC%8B%9C%EA%B0%84-%EB%8F%99%EA%B8%B0%ED%99%94)
2. [profile 설정 - Console Color , alias](#2-profile-%EC%84%A4%EC%A0%95---console-color--alias)
3. [하드웨어 사양 / 기본 환경 확인 (os 버젼 등)](#3-%ED%95%98%EB%93%9C%EC%9B%A8%EC%96%B4-%EC%82%AC%EC%96%91--%EA%B8%B0%EB%B3%B8-%ED%99%98%EA%B2%BD-%ED%99%95%EC%9D%B8-os-%EB%B2%84%EC%A0%BC-%EB%93%B1)
4. [ip 및 hostname 정보 / 인터넷 연결 확인](#4-ip-%EB%B0%8F-hostname-%EC%A0%95%EB%B3%B4--%EC%9D%B8%ED%84%B0%EB%84%B7-%EC%97%B0%EA%B2%B0-%ED%99%95%EC%9D%B8)
5.
6. 

***

### 1. 기본 유틸 설치 / 시간 동기화  
서버 기본 설정에 필요한 유틸리티들을 설치 한 후, 인터넷 시간에 맞추어 서버의 시간을 조정 합니다.
#### #centos7  

```
# 기본 유틸 설치.
# 화면에 로그가 뿌려지지 않도록 하기 위해 파이프라인(>) 처리를 합니다.
yum install -y  \
vim pciutils perl openssh mlocate nfs-utils rdate xauth firefox nautilus wget tcsh \
tree lshw tmux git kernel-headers kernel-devel ipmitool gcc make gcc-c++ cmake \
python-devel ntfs-3g   >  dasan_log_install_centos_default_util.txt

# 설치된 결과를 확인할 수 있습니다.  
tail dasan_log_install_centos_default_util.txt

# 시간 동기화.
rdate  -s  time.bora.net
clock --systohc  
date
hwclock
```
#### #ubunutu 14 & 16
ubuntu 의 경우 빠른 설치를 위해 기본 저장소(repository) 주소를  
kr.archive.ubuntu.com 에서 ftp.daumkakao.com 으로 변경합니다.  

```
# 기존 저장소 주소 확인.
tail /etc/apt/sources.list  |  grep -v "#"

# 저장소 주소 일괄 변경.
perl -pi -e 's/kr.archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list
perl -pi -e 's/security.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list

# 변경된 저장소 주소 확인.
tail /etc/apt/sources.list  |  grep -v "#"

# 변경된 저장소 (repository) 의 정보를 업데이트 합니다.
# 화면에 로그가 뿌려지지 않도록 하기 위해 파이프라인(>) 처리를 합니다.
apt-get update    >> dasan_log_ubuntu_repo_update.txt

# 업데이트 결과를 확인할 수 있습니다.
tail -5 dasan_log_ubuntu_repo_update.txt
```



```
# 기본 유틸 설치.
apt-get -y install  \
vim nfs-common rdate xauth firefox gcc make locate htop tmux git wget ipmitool \
xfsprogs ntfs-3g aptitude lvm2  >  dasan_log_install_ubuntu_default_util.txt
```

```
# 마찬가지로 설치된 결과를 따로 확인할 수 있습니다.
tail -5 dasan_log_install_ubuntu_default_util.txt

# aptitude 를 이용하여 python-dev 를 따로 설치 합니다.
aptitude -y install  python-dev  > dasan_log_ubuntu_python-dev_install.txt
```

### 2. profile 설정 - Console Color , alias


### 3. 하드웨어 사양 / 기본 환경 확인 (os 버젼 등)


### 4. ip 및 hostname 정보 / 인터넷 연결 확인







***
## end.
