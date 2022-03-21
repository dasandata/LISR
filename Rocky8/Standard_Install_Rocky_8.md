# 다산데이타 Rocky 8 설치 표준안 (2022.03)
다산데이터 출고 장비에 설치되는 리눅스 (Rocky 8) 의 설치 표준안 입니다.  
별도의 요청사항이 없는 경우 기본적으로 아래 절차에 따라 설치한 후 출고 하고 있습니다.  
보완이 필요한 점이나 새로운 아이디어를 제보해 주시면 적극 반영하겠습니다 :)  

감사합니다.  

![Dasandata Logo](http://dasandata.co.kr/wp-content/uploads/2019/05/%EB%8B%A4%EC%82%B0%EB%A1%9C%EA%B3%A0_%EC%88%98%EC%A0%951-300x109.jpg)

## #목차
[1. 기본 유틸 설치 / 시간 동기화](Standard_Install_Rocky_8.md#-1-기본-유틸-설치--시간-동기화)  
[2. profile 설정 - Console Color , alias](Standard_Install_Rocky_8.md#-2-profile-설정---console-color--alias)  
[3. ip 및 hostname 정보 / 인터넷 연결 확인](Standard_Install_Rocky_8.md#-3-ip-및-네트워크-구성-정보-확인)   
[4. Desktop (X window) Install, not default](Standard_Install_Rocky_8.md#-4-desktop-x-window-install-not-default)  
[5. ssh 및 방화벽 (Firewall)설정 / 보안강화 / X11 Forwading](Standard_Install_Rocky_8.md#-5-ssh-및-방화벽-firewall설정--보안강화--x11-forwading)  
[6. 새로운 사용자 추가 / sudo 권한 부여](Standard_Install_Rocky_8.md#-6-새로운-사용자-추가--sudo-권한-부여)  
[7. 스토리지, 파티션 마운트 / lvm, UUID, LABEL](Standard_Install_Rocky_8.md#-7-스토리지-파티션-마운트--lvm-or-parted-uuid-label)  
[8. Banner // login wellcome message ](Standard_Install_Rocky_8.md#-8-banner--login-wellcome-message-)  
[9. 부팅 되는 기본 커널 버젼 변경방법](Standard_Install_Rocky_8.md#-9-부팅-되는-기본-커널-버젼-변경방법)  
[10. Disk 속도 측정](Standard_Install_Rocky_8.md#-10-disk-속도-측정)


[===== 장애 모니터링 =====](Standard_Install_Rocky_8.md#--장애-모니터링-)  
[20. SMTP for Email Alert (mailx and postfix)](Standard_Install_Rocky_8.md#-20-smtp-for-email-alert-mailx-and-postfix)  
[21. Dell OpenManage Server Administrator Install (OMSA)](Standard_Install_Rocky_8.md#-21-dell-openmanage-server-administrator-install-omsa)  
[22. Dell OMSA - E-Mail Alert](Standard_Install_Rocky_8.md#-22-dell-omsa---e-mail-alert)  
[23. Dell RAID Controller Management (MSM) + Alert by Email](Standard_Install_Rocky_8.md#-23-dell-raid-controller-management-msm--alert-by-email)  
[24. 온도(temperature) 모니터 링. (ipmitool)](Standard_Install_Rocky_8.md#-24-온도temperature-모니터-링-ipmitool)  

***

## # 범례(변수).
- <내용>: 상황에 따라 변경이 필요한 내용을 표현 합니다.  
- ${변수명} : 반복되어 사용되는 부분이 있을 때 사용되는 변수 입니다.  

## # 팁.
- 명령을 실행시킬때, 명령어 박스 단위로 복사하여 터미널에 붙여 넣으면 됩니다.  
- 박스가 분리되어 있는 경우 분리된 단위로 복사하여 붙여 넣어야 합니다.  

## # 리눅스 설치시 IP 와 HOSTNAME 은 수동으로 미리 설정 한다.
\# 처음 설치 할때부터 고정 IP를 설정하고 HOSTNAME을 정의 하는 것을 권장 합니다.  

### # 터미널을 통해 리눅스가 새로 설치된 장비에 로그인 합니다.

#### # Windows 에서 리눅스 접속 (putty) / X11 Forwading / 파일 송수신 (winscp)
\#  
\# putty (SSH Terminal - X11 Forwarding Enable)  
\# https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html  
\#  
\# Xming (X11 Forward - Windows Application)  
\# https://sourceforge.net/projects/xming/  
\#  
\# 파일 전송 winscp  
\# https://winscp.net/eng/download.php  
\#  
#### # 리눅스 터미널 에서.
```bash
ssh <사용자 계정>@<IP 주소>
```

### # 관리자(root) 로 전환.
```bash
# sudo -i
# 또는
# su -
```
### # sudo -i 와 su - 의 차이점
\# 1. sudo -i 는 sudo 권한이 있는 사용자가, 사용자의 암호를 사용해서 root 권한으로 명령을 실행 하는 것 입니다.  
\# root 의 패스워드를 몰라도 root 권한의 명령을 수행할 수 있습니다.  
\#  
\# 2. su -    는 sudo 권한과 관계 없이 root 의 암호를 사용해서 root 계정으로 전환 하는 것 입니다.    
\# 'su - ' 의 경우 재접속 없이 다른 사용자 계정으로 전환 할 수 있는 명령 이며 아래와 같이 실행 합니다.    
\# ex) su  -  <다른 사용자 계정이름>   

***

### # [1. 기본 유틸 설치 / 시간 동기화](#목차)

#### # 우선 kernel 을 업데이트 와 grub 를 수정하고, 재부팅 한 후 진행 합니다.

##### # kernel Update (yum update)
```bash
yum -y update  >>  dasan_log_yum_update.txt 2>&1

tail dasan_log_yum_update.txt
```

##### # 설정이 까다로운 SELINUX 를 disable 합니다.
```bash
setenforce 0
getenforce

sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
grep 'SELINUX=' /etc/selinux/config
```

#### # 서버 기본 설정에 필요한 유틸리티들 설치

```bash
# 기본 유틸 설치.
# 화면에 로그가 뿌려지지 않도록 하기 위해 파이프라인(>>) 처리를 합니다.
yum -y install \
vim pciutils openssh mlocate nfs-utils xauth firefox nautilus wget tcsh tree \
lshw tmux git kernel-headers kernel-devel ipmitool gcc make gcc-c++ cmake \
dstat perl perl-CPAN perl-core net-tools openssl-devel bash-completion \
smartmontools ethtool bind-utils git-lfs \
  >>  dasan_log_install_centos_default_util.txt 2>&1

tail dasan_log_install_centos_default_util.txt # 설치 결과 확인.

# Development Tools 설치
yum grouplist

yum -y groups install "Development Tools" >> dasan_log_install_centos_developtoosl.txt

tail dasan_log_install_centos_developtoosl.txt

yum grouplist
```
#### # 인터넷 시간에 맞추어 서버의 시간 조정
```bash
# 서버 시간 동기화.
yum -y install chrony

sed -i 's/pool 2.pool.ntp.org iburst/pool kr.pool.ntp.org iburst/' /etc/chrony.conf

systemctl enable chronyd
systemctl start  chronyd

sleep 10

chronyc sources

timedatectl

clock --systohc  
date
hwclock
```

#### # Centos EPEL(Extra Packages for Enterprise Linux) 저장소(Repository) 설치.

```bash
yum repolist # 현재 repolist 확인.

yum -y   install  epel-release   >>   dasan_log_install_epel.txt 2>&1
tail -5  dasan_log_install_epel.txt  

yum repolist  # 설치된 repolist 확인.

# epel 이 활성화 되어야 설치 되는 htop 을 설치하여 검증
rpm -qa | grep htop # htop 이 설치 되어있는지 확인.

yum -y  install htop ntfs-3g >> dasan_log_install_htop,ntfs3g.txt  2>&1
tail -5  dasan_log_install_htop,ntfs3g.txt

rpm -qa | grep htop # htop 이 설치 되었는지 확인.
```


### # [2. profile 설정 - Console Color , alias](#목차)
\# 사용 편의를 위한 alias를 설정, History Size 및 format 변경.  
\# Console 의 가독성을 높이기 위하여 Prompt 색상변경.  
\# [Console Color Codes](https://cdn.vox-cdn.com/thumbor/dzT-GU0W-BypwB8T-a3wvLxGkDE=/0x0:660x440/920x613/filters:focal(278x168:382x272):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/56019981/newcmdline.0.jpg)
![Console Color Codes](https://cdn.vox-cdn.com/thumbor/dzT-GU0W-BypwB8T-a3wvLxGkDE=/0x0:660x440/920x613/filters:focal(278x168:382x272):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/56019981/newcmdline.0.jpg)  

#### # 기본 alias.
```bash
cat << EOF >> /etc/profile.d/alias.sh
# add by dasandata       
alias vi='vim'
alias ll='ls -lh'
EOF
```

#### # 히스토리 사이즈 변경 (1000개 -> 10,000개)
```bash
echo $HISTSIZE
grep HISTSIZE= /etc/profile
sed -i  's/HISTSIZE=1000/HISTSIZE=10000/'  /etc/profile
grep HISTSIZE= /etc/profile
```

#### # 히스토리 출력시 날짜가 표시 되도록 변경
```bash
cat << EOF >> /etc/profile.d/history_format.sh
# Add timestamp to .bash_history
export HISTTIMEFORMAT="20%y/%m/%d %T "
EOF
```

#### # root 와 user 의 프롬프트 색상을 다르게 설정.
```bash
echo "export PS1='\[\e[1;46;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc
tail -1 /root/.bashrc

echo "export PS1='\[\e[1;47;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/sonic/.bashrc
tail -1 /home/sonic/.bashrc
```


#### # 적용확인.
```bash
source  /etc/profile

echo $HISTSIZE

source  .bashrc
```


### # [3. ip 및 네트워크 구성 정보 확인](#목차)
```bash
ip a

EXT_NIC=ens192

echo ${EXT_NIC}
```

```bash
ifconfig  ${EXT_NIC}

# 가독성 향상을 위해, 불 필요한 IPV6 항목 삭제.
sed -i '/IPV6/d' /etc/sysconfig/network-scripts/ifcfg-${EXT_NIC}

cat /etc/sysconfig/network-scripts/ifcfg-${EXT_NIC}

cat /etc/hostname

cat /etc/resolv.conf

ping -c 4 google.com
```

### # [4. Desktop (X window) Install, not default](#목차)
\# Desktop 환경을 설치 하지만, 기본 부팅은 텍스트 모드로 설정해 놓습니다.  
\# 필요한 경우에만 xwindow 를 실행하여 사용 합니다. (서버의 리소스 절약)  
\# Desktop 을 설치하면 불필요한 데몬이 함께 깔립니다. 설치 후 정리가 필요 합니다.  

#### # 기본 부팅 모드 확인.
\# multi-user.target -> 텍스트환경  
\# graphical.target -> GUI 환경  
\# 기본 모드 변경시 -> systemctl set-default multi-user.target  
```bash
systemctl get-default
```

#### # GNOME Desktop 설치.
```bash
yum -y  groups install "Server with GUI"  >> dasan_log_install_gnome-desktop.txt  2>&1

tail dasan_log_install_gnome-desktop.txt
```
\# 콘솔에서 실행하여 윈도우가 잘 뜨는지 확인  
\# [user@hostname:~]# startx  
\#  

#### # 불필요한 Daemon Disable 예.

\# 현재 구동중인 Demon list 확인.
```bash
systemctl list-unit-files  -t service  | grep enable
```

\# Daemon Disable.
```bash
systemctl disable bluetooth.service
systemctl disable iscsi.service
systemctl disable ksm.service
systemctl disable ksmtuned.service
systemctl disable libstoragemgmt.service
systemctl disable libvirtd.service
systemctl disable spice-vdagentd.service
systemctl disable vmtoolsd.service
systemctl disable ModemManager.service
systemctl disable cups.service
systemctl disable cups-browsed.service
```

### # [5. ssh 및 방화벽 (Firewall)설정 / 보안강화 / X11 Forwading](#목차)
\# ssh port 를 7777로 변경하고, ssh를 통한 Root Login을 거부 한 후  
\# 변경된 포트에 맞게 방화벽을 설정 합니다.  

#### # 방화벽 (Firewall) 설정.
```bash
firewall-cmd --get-zones         # 설정가능 한 zone 목록 확인.

firewall-cmd --list-all          # 현재 설정 확인.
firewall-cmd --get-default-zone  # 현재 설정 확인.

firewall-cmd --add-port=7777/tcp  --permanent  # 7777 포트 개방
firewall-cmd --remove-service=ssh  --permanent  # 22 포트 폐쇄
firewall-cmd --reload   # 변경사항 적용
firewall-cmd --list-all  # 변경된 설정내용 확인.
```

#### # sshd 설정.
```bash
grep 'Root\|Port' /etc/ssh/sshd_config  # 변경 전 설정 확인.

sed -i  "s/#Port 22/Port 7777/g" /etc/ssh/sshd_config  # 포트 변경

# root 로그인 거부 설정.
sed -i  "s/#PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config

grep 'Root\|Port' /etc/ssh/sshd_config  # 변경 후 설정 확인.

systemctl restart sshd  # ssh 데몬 재시작.
```

\# 로그아웃 한 뒤 설정이 잘 적용 되었는지 검증 합니다.
```bash
logout
logout

ssh user@192.168.0.?          # 포트가 막혔으므로 접속이 거부되어야 함.
ssh -p7777  user@192.168.0.?  # 접속 가능
logout

ssh -p7777  root@192.168.0.?      # root 접근을 막았으므로 접속이 거부되어야 함.

ssh -XYC -p 7777 user@192.168.0.? # X11 Forwading 이 가능하도록 -XCY 옵션을 추가.

firefox &
nautilus &
```

### # [6. 새로운 사용자 추가 / sudo 권한 부여](#목차)
\# 새로운 사용자를 추가하고, sudo 권한을 부여 합니다.

```bash
NEW_USER=dasan    # 새로운 사용자 명을 변수로 할당 합니다.
echo ${NEW_USER}  # 할당된 변수 확인.

adduser ${NEW_USER}
passwd  ${NEW_USER}
```

\# 새로 생성된 사용자 계정으로 전환
```bash
su - ${NEW_USER}

whoami
pwd
```

\# 관리자로 전환 되는지 확인
```bash
sudo -i
# 아직 권한 설정을 하지 않았기 떄문에 안되는 것을 확인할 수 있습니다.
```

\# 관리자로 전환될 수 있도록, 새 사용자를 wheel 그룹에 포함 시킨 후 다시 시도 합니다.
```bash
logout

grep ${NEW_USER} /etc/group

usermod -G wheel ${NEW_USER}  
grep ${NEW_USER} /etc/group
```

```bash
su - ${NEW_USER}
whoami
pwd

sudo -i
whoami
pwd
```

### # [7. 스토리지, 파티션 마운트 / lvm or Parted, UUID, LABEL](#목차)  
\# /home 디렉토리를 용량이 큰 디스크 or 스토리지 로 변경  
\# 또는 용량이 큰 디스크를 /data 로 마운트 합니다.  
\# lvm 으로 구성하는 방법 (7A) 과 parted 로 구성하는 방법 (7B) 으로 나누어져 있습니다.  

#### # 현재 디스크 설정 확인.
```bash
fdisk -l  |  grep 'Disk /dev' # 디스크 목록 확인 1.

lsblk # 디스크 목록 확인 2.

pvs # lvm 구성 확인 (물리디스크 리스트)
vgs # lvm 구성 확인 (볼륨그룹 리스트)
lvs # lvm 구성 확인 (논리볼륨 리스트)
```

#### # 7A-1. /dev/sdb 를 lvm 으로 구성
\# (home으로 마운트 하기 위해 vg 및 lv 이름을 home 으로 지정.)

```bash
pvcreate /dev/sdb

vgcreate vg_home /dev/sdb

lvcreate -l 100%FREE -n  lv_home   vg_home

lsblk
pvs
vgs
lvs
```

#### # 7A-2. lvm 으로 생성된 볼륨을 포맷 한 후 기존 home 내용 복제
```bash
mkfs.xfs -L HOME  /dev/mapper/vg_home-lv_home

mount  /dev/mapper/vg_home-lv_home   /mnt

cd /home/
find .  | cpio -dump  /mnt

ls -l /mnt/
umount /mnt
cd
```

***

#### # 7B-1. /dev/sdb 를 parted 으로 구성
\# (home으로 마운트 하기 위해 vg 및 lv 이름을 home 으로 지정.)

```bash
parted -s /dev/sdb  "mklabel gpt"
parted -s /dev/sdb  "mkpart  primary  0% 100%"

sleep 10
```

#### # 7B-2. parted로 생성된 볼륨을 포맷 한 후 기존 home 내용 복제
```bash
mkfs.xfs -f -L HOME  /dev/sdb1

mount /dev/sdb1  /mnt


cd /home/
find .  | cpio -dump  /mnt

ls -l /mnt/
umount /mnt
cd
```

***

#### # 생성된 볼륨을 home 으로 마운트 (fstab 에 마운트 내용 추가)
```bash
echo  "LABEL="HOME"      /home     xfs      defaults  0  0 "  >>  /etc/fstab
cat /etc/fstab | grep -v ^#
```

#### # mount 확인.
```bash
mount -a

df -hT | grep -v tmpfs

blkid

lsblk

ls -l /home
```

\# sticky bit 설정에 대한 설명. chmod +t / chmod 1777  
\# http://park1020.tistory.com/57  
\#  
\# ====== disk label 변경  
\#  
\# mount는 UUID 또는 LABEL 로 하는 것 을 권장 합니다.  
\# /etc/fstab 수정.  
\# 아래 링크 참조  
\# http://greenfishblog.tistory.com/170  
\# http://tigerbum.tistory.com/31  
\#  


### # [8. Banner // login wellcome message ](#목차)
\# /etc/ssh/sshd_config 파일의 Banner 옵션을 조정하면  
\# 서버에 ssh 접속시 원하는 텍스트 이미지 를 표시할 수 있습니다.  
\# 텍스트 이미지 는 아래 사이트에서 쉽게 만들 수 있습니다.  
\# http://www.network-science.de/ascii/  

```bash
vi /etc/ssh/banner.sample

cat /etc/ssh/banner.sample

grep Banner /etc/ssh/sshd_config
echo "Banner /etc/ssh/banner.sample" >> /etc/ssh/sshd_config
grep Banner /etc/ssh/sshd_config

systemctl restart sshd
```
\# 재접속 확인


***
### # [9. 부팅 되는 기본 커널 버젼 변경방법](#목차)
\# 업데이트를 통해 커널이 많이 설치 되었을 경우   
\# 이 방법으로 기본 부팅 커널 버젼을 변경할 수 있습니다.  

```bash
grubby --default-kernel

ll /boot/vmlinuz-*

grubby --set-default /boot/vmlinuz-4.18.0-348.12.2.el8_5.x86_64

grubby --default-kernel
```

***

### # [10. Disk 속도 측정](#목차)
\# 읽기 전용 hdparm  
\# 쓰기 전용 dd  

\# hdparm 읽기 테스트
```bash
lsblk

df -hT | grep -v tmpfs

hdparm -tT /dev/sda3

hdparm -tT /dev/sdb1
```

\# dd 쓰기 테스트
```bash
lsblk
df -hT | grep -v tmpfs

cd /tmp
time ; dd if=/dev/zero bs=1G count=1 of=write_test ; rm -f write_test

cd /home
time ; dd if=/dev/zero bs=1G count=1 of=write_test ; rm -f write_test

cd /data
time ; dd if=/dev/zero bs=1G count=1 of=write_test ; rm -f write_test
```

### # [11. Nvidia Driver, CUDA Install](#목차)
\# Reboot 후 진행 합니다.
```bash
reboot

```

#### # kernel / kernel-header / kernel-devel 버젼 일치 확인
```bash
uname -r # 현재 실행중인 커널 버젼 확인

# 실행중인 커널과 동일한 버젼의 커널 패키지 (headers,devel) 가 설치 되어 있는지 확인.
rpm -qa | grep $(uname -r) | grep 'headers\|devel'
```











***

## # [===== 장애 모니터링 =====](#목차)

### # [20. SMTP for Email Alert (mailx and postfix)](#목차)

#### # 이메일 경고에 사용될 메일관리자 이메일 주소 및 로그 타이틀 정보를 생성 파일 작성.

아래 CUSTOMER 값을 고객사 정보에 맞게 변경합니다.  
```bash
CUSTOMER=<고객사 정보>
```

```bash
cat << EOF > /usr/local/sbin/dasan_export_global_variable.sh
#!/bin/bash
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr
# This file location is /usr/local/sbin/

ADMIN_LOG_EMAIL='logdasandata@googlegroups.com'  # 관리자 메일주소 입력 / 여려명일 경우 콤마(,) 로 구분
DASAN_CUSTOMER="${CUSTOMER}" # 고객사 정보를 기입 (회사명, 기관명 등..)

# 발송되는 이메일 제목의 뒷 부분에 기입되는 정보를 생성하는 부분 입니다.
SERVER_MODEL=$(dmidecode --type system | grep 'Product Name:' | cut -d ' ' -f 4)
SERVICE_TAG=$(dmidecode --type system  | grep 'Serial Number:' | cut -d ' ' -f 3)
TITLE_TAIL=\$(hostname)'-'\$DASAN_CUSTOMER'-'\$SERVER_MODEL'-'\$SERVICE_TAG
# file of end.
EOF

cat /usr/local/sbin/dasan_export_global_variable.sh

source /usr/local/sbin/dasan_export_global_variable.sh
echo $TITLE_TAIL
```

#### # 메일 발송 테스트
```bash
yum -y install mailx postfix

sed -i  "s/inet_interfaces = localhost/#inet_interfaces = localhost/" /etc/postfix/main.cf
sed -i  "s/#inet_interfaces = all/inet_interfaces = all/"             /etc/postfix/main.cf

systemctl start  postfix
systemctl enable postfix

echo "Test of SMTP... OK." | mail -s $TITLE_TAIL $ADMIN_LOG_EMAIL
```

***

### # [21. Dell OpenManage Server Administrator Install (OMSA)](#목차)
\# 서버 자체에서 구동되며, 장애가 발생한 경우 상태를 확인하거나   
\# 오류 메세지를 메일로 발송 하는 기능을 구현 할 수 있습니다.   

```bash
# dell linux repo 추가.
wget http://linux.dell.com/repo/hardware/dsu/bootstrap.cgi -O  ./dellomsainstall.sh
sed -i -e "s/enabled=1/enabled=0/g" ./dellomsainstall.sh
bash ./dellomsainstall.sh

rm -f ./dellomsainstall.sh

# 설치 시작
yum -y erase  tog-pegasus-libs  >>  dasan_log_install_dell_OMSA.txt 2>&1
tail -5  dasan_log_install_dell_OMSA.txt

yum -y install --enablerepo=dell-system-update_dependent -y  srvadmin-all openssl-devel \
 >>   dasan_log_install_dell_OMSA.txt 2>&1
tail -5  dasan_log_install_dell_OMSA.txt

# 방화벽 설정 (web base 모니터링)
firewall-cmd   --add-port=1311/tcp  --permanent
firewall-cmd   --reload

# 시스템이 시작될 때 관련 서비스가 실행 되도록 설정 (systemctl enable)
systemctl enable    dsm_om_connsvc
systemctl start     dsm_om_connsvc

# 명령어 테스트
/opt/dell/srvadmin/sbin/racadm getsysinfo | grep "System Model\|Service Tag"
/opt/dell/srvadmin/sbin/omreport system alertlog | head

source  /etc/profile.d/srvadmin-path.sh
```

***
### # [22. Dell OMSA - E-Mail Alert](#목차)

#### # 기존 변수 생성파일 확인.
```bash
cat   /usr/local/sbin/dasan_export_global_variable.sh
```

#### # 경고 메일 내용 생성파일 복사. (dasan_alert_omsa.sh)
```bash
git clone http://github.com/dasandata/LISR

cp /root/LISR/common/usr-local-sbin/dasan_alert_omsa.sh /usr/local/sbin/
chmod 744 /usr/local/sbin/dasan_alert_omsa.sh

tail -20  /usr/local/sbin/dasan_alert_omsa.sh

# os 종류에 맞추어 주석을 해제 합니다.
vi /usr/local/sbin/dasan_alert_omsa.sh
```

#### # 경고 발생시 dasan_alert_omsa.sh 파일이 실행 되도록 설정
```bash
cat   /root/LISR/common/dasan_omconfig_set.sh

bash  /root/LISR/common/dasan_omconfig_set.sh
```

\# 테스트 - 파워케이블 빼기  or  케이스 오픈 후 이메일이 도착 되는지 확인.  

***
### # [23. Dell RAID Controller Management (MSM) + Alert by Email](#목차)
\# RAID 컨트롤러 관리 프로그램을 통해 서버의 전원을 끄지 않고 디스크 장애를 처리하거나  
\# RAID 구성을 변경할 수 있습니다. Megaraid Storage Manager 의 약자로 통상 MSM 이라고 합니다.  
\# LSI 사에서 최초 제작한 컨트롤러 였으나 현재는 Boradcom 제품 입니다.  
\# ** LSI MegaRAID  
\# LSI -> Avago Technologies 에 인수  (2013년 12월 16일)  
\# Avago Technologies 와 Broadcom 합병 (2015년 5월 28일)  
\# https://en.wikipedia.org/wiki/Broadcom_Limited  

```bash
# 다운로드
mkdir /tmp/raid_manager
cd /tmp/raid_manager
wget https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/17.05.00.02_Linux-64_MSM.gz

# 혹시 위 링크로 다운로드 되지 않으면 아래 웹페이지에서 직접 다운로드 합니다..
# https://www.broadcom.com/support/download-search/?pg=Storage+Adapters,+Controllers,+and+ICs&pf=RAID+Controller+Cards&pn=MegaRAID+SAS+9286CV-8e&po=&pa=&dk=

# 압축해제
tar xvzf 17.05.00.02_Linux-64_MSM.gz

# 설치 시작
cd disk/
./install.csh -a

# 기본적으로 변경해야 할 값.
### 228 Temperature sensor    =>> Disable
### 236 Drive is not certified   ==>> Disable

# MSM 실행 (X11 Forwading 구성 필요)
/usr/local/MegaRAID\ Storage\ Manager/startupui.sh  &

```
***
### # [24. 온도(temperature) 모니터 링. (ipmitool)](#목차)
\# 서버에 내장된 관리기능 (ipmi) 를 이용하여 온도를 모니터링 하고 이메일로 받아봅니다.

#### # 파일 복사.
```bash
cp /root/LISR/common/usr-local-sbin/dasan_temperature_check_to_log.sh /usr/local/sbin/
cp /root/LISR/common/usr-local-sbin/dasan_temperature_log_to_mail.sh  /usr/local/sbin/
```

#### # 파일 권한 변경 (실행)
```bash
chmod 744 /usr/local/sbin/dasan_temperature_check_to_log.sh
chmod 744 /usr/local/sbin/dasan_temperature_log_to_mail.sh
```

#### # 테스트
```bash
source /usr/local/sbin/dasan_export_global_variable.sh
TITLE='IPMI_Temperature_log_by_'${TITLE_TAIL}
LOG='/var/log/Dasandata_Temperature.log'

echo  "
##################################################
# This Message from ${TITLE_TAIL}
# Using crontab (/etc/crontab)
# The location of the configuration file is below.
# /usr/local/sbin/dasan_export_global_variable.sh,
# /usr/local/sbin/dasan_temperature_check_to_log.sh,
# /usr/local/sbin/dasan_temperature_log_to_mail.sh
##################################################
" >> ${LOG}

/usr/local/sbin/dasan_temperature_check_to_log.sh
sleep 10
/usr/local/sbin/dasan_temperature_check_to_log.sh
sleep 10
/usr/local/sbin/dasan_temperature_log_to_mail.sh
```

#### # crontab 에 등록
```bash
cat /etc/crontab

echo "
# add by dasandata
# 매시 30분에 온도체크 로그생성
30 * * * * root /usr/local/sbin/dasan_temperature_check_to_log.sh
# 매일 오전 8시에 온도체크 로그 발송
0  8 * * * root /usr/local/sbin/dasan_temperature_log_to_mail.sh
" >>  /etc/crontab

cat /etc/crontab
```

#### # idrac 시간 설정 , Web page 이름
```bash
racadm set iDRAC.Time.Timezone Asia/Seoul

racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}')
```

***


***
## end.
