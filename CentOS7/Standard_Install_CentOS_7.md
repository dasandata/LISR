# 다산데이타 CentOS 7.4 설치 표준안 (2018.03)
다산데이터 출고 장비에 설치되는 리눅스 (CenOS 7.4) 의 설치 표준안 입니다.  
별도의 요청사항이 없는 경우 기본적으로 아래 절차에 따라 설치한 후 출고 하고 있습니다.  
보완이 필요한 점이나 새로운 아이디어를 제보해 주시면 적극 반영하겠습니다 :)  

감사합니다.  

![Dasandata Logo](http://www.dasandata.co.kr/dasanlogo.jpg)

## #목차
[1. 기본 유틸 설치 / 시간 동기화](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-1-%EA%B8%B0%EB%B3%B8-%EC%9C%A0%ED%8B%B8-%EC%84%A4%EC%B9%98--%EC%8B%9C%EA%B0%84-%EB%8F%99%EA%B8%B0%ED%99%94)  
[2. profile 설정 - Console Color , alias](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-2-profile-%EC%84%A4%EC%A0%95---console-color--alias)  
[3. 하드웨어 사양 / 기본 환경 확인 (os 버젼 등)](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-3-%ED%95%98%EB%93%9C%EC%9B%A8%EC%96%B4-%EC%82%AC%EC%96%91--%EA%B8%B0%EB%B3%B8-%ED%99%98%EA%B2%BD-%ED%99%95%EC%9D%B8-os-%EB%B2%84%EC%A0%BC-%EB%93%B1)  
[4. ip 및 hostname 정보 / 인터넷 연결 확인](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-4-ip-%EB%B0%8F-hostname-%EC%A0%95%EB%B3%B4--%EC%9D%B8%ED%84%B0%EB%84%B7-%EC%97%B0%EA%B2%B0-%ED%99%95%EC%9D%B8)   
[5. Desktop (X window) Install, not default](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-5-desktop-x-window-install-not-default)  
[6. ssh 및 방화벽 (Firewall)설정 / 보안강화 / X11 Forwading](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-6-ssh-%EB%B0%8F-%EB%B0%A9%ED%99%94%EB%B2%BD-firewall%EC%84%A4%EC%A0%95--%EB%B3%B4%EC%95%88%EA%B0%95%ED%99%94--x11-forwading)  
[7. 새로운 사용자 추가 / sudo 권한 부여](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-7-%EC%83%88%EB%A1%9C%EC%9A%B4-%EC%82%AC%EC%9A%A9%EC%9E%90-%EC%B6%94%EA%B0%80--sudo-%EA%B6%8C%ED%95%9C-%EB%B6%80%EC%97%AC)  
[8. 스토리지, 파티션 마운트 / lvm, UUID, LABEL](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-8-%EC%8A%A4%ED%86%A0%EB%A6%AC%EC%A7%80-%ED%8C%8C%ED%8B%B0%EC%85%98-%EB%A7%88%EC%9A%B4%ED%8A%B8--lvm-uuid-label)  
[9. Banner // login wellcome message ](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-9-banner--login-wellcome-message-)  
[10. VNC Server 설정](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-10-vnc-server-%EC%84%A4%EC%A0%95)  
[11. TeamViewer 설치](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-11-teamviewer-%EC%84%A4%EC%B9%98)  
[12. 부팅 되는 기본 커널 버젼 변경방법](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-12-%EB%B6%80%ED%8C%85-%EB%90%98%EB%8A%94-%EA%B8%B0%EB%B3%B8-%EC%BB%A4%EB%84%90-%EB%B2%84%EC%A0%BC-%EB%B3%80%EA%B2%BD%EB%B0%A9%EB%B2%95)  

[===== 장애 모니터링 =====](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#--%EC%9E%A5%EC%95%A0-%EB%AA%A8%EB%8B%88%ED%84%B0%EB%A7%81-)  
[20. SMTP for Email Alert (mailutils or mailx)](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-20-smtp-for-email-alert-mailutils-or-mailx)  
[21. SMTP for Email Alert (postfix for Dell RAID Manager)](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-21-smtp-for-email-alert-postfix-for-dell-raid-manager)  
[22. Dell OpenManage Server Administrator Install (OMSA)](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-22-dell-openmanage-server-administrator-install-omsa)  
[23. Dell OMSA - E-Mail Alert](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-23-dell-omsa---e-mail-alert)  
[24. Dell RAID Controller Management (MSM) + Alert by Email](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-24-dell-raid-controller-management-msm--alert-by-email)  
[25. 온도(temperature) 모니터 링. (ipmitool)](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-25-%EC%98%A8%EB%8F%84temperature-%EB%AA%A8%EB%8B%88%ED%84%B0-%EB%A7%81-ipmitool)  

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
grep 'SELINUX=' /etc/sysconfig/selinux  
```

##### # grub 수정.
\# 부팅시 화면에 부팅로그가 표시되도록 grub 를 수정하고,
\# 불필요한 ipv6를 비활성화 하여 ip 정보 가독성을 높입니다.
```bash
ip a | grep inet6
```
*output example>*
```
[root@hostname:~]#
[root@hostname:~]# ip a | grep inet6
    inet6 ::1/128 scope host
    inet6 fe80::4393:77e0:7563:ff25/64 scope link
    inet6 fe80::c39b:9d5:b27d:a8a4/64 scope link
[root@hostname:~]#
# ipv6 값이 표시되고 있습니다.
```
\# 설정 변경.
```bash

cat /etc/default/grub  # 기존 설정 내용 확인.
sed -i  's/rhgb//'   /etc/default/grub   # 부팅시 화면에 부팅로그가 표시 되도록 rhgb 항목 지움
sed -i  's/quiet//'  /etc/default/grub   # 부팅시 화면에 부팅로그가 표시 되도록 quiet 항목 지움

# ipv6 비활성
sed -i  's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /' /etc/default/grub

cat /etc/default/grub  # 변경사항 확인.

grub2-mkconfig -o /boot/grub2/grub.cfg  # boot kernel 에 설정 적용

reboot  # 재부팅
```

***

\# 재부팅 후 확인.
```bash
getenforce  # SELINUX 상태 확인.

ip a | grep inet6
# 아무 결과가 없는 것이  ipv6 disable 이 잘 적용 된것 입니다.
```
*output example>*
```
[root@hostname:~]#
[root@hostname:~]# getenforce  # SELINUX 상태 확인.
Disabled
[root@hostname:~]#
[root@hostname:~]# ip a | grep inet6
[root@hostname:~]# # 아무 결과가 없는 것이  ipv6 disable 이 잘 적용 된것 입니다.
[root@hostname:~]#
```

#### # 서버 기본 설정에 필요한 유틸리티들 설치

```bash
# 기본 유틸 설치.
# 화면에 로그가 뿌려지지 않도록 하기 위해 파이프라인(>>) 처리를 합니다.
yum -y install \
vim pciutils openssh mlocate nfs-utils rdate xauth firefox nautilus wget \
tcsh tree lshw tmux git kernel-headers kernel-devel ipmitool gcc make gcc-c++ \
cmake python-devel ntfs-3g perl >>  dasan_log_install_centos_default_util.txt

tail dasan_log_install_centos_default_util.txt # 설치 결과 확인.

# Development Tools 설치
yum grouplist

yum -y groups install "Development Tools" >> dasan_log_install_centos_developtoosl.txt
yum -y install  glibc-static glibc-devel glibc-static libstdc++ libstdc++-devel \
 >> dasan_log_install_centos_developtoosl.txt

tail dasan_log_install_centos_developtoosl.txt

yum grouplist
```
#### # 인터넷 시간에 맞추어 서버의 시간 조정
```bash
# 서버 시간 동기화.
rdate  -s  time.bora.net
clock --systohc  
date
hwclock
```

#### # Centos EPEL(Extra Packages for Enterprise Linux) 저장소(Repository) 설치.

```bash
yum repolist # 현재 repolist 확인.

yum -y  install epel-release   >>    dasan_log_install_epel.txt
tail -5   dasan_log_install_epel.txt  
sed -i -e "s/\]$/\]\npriority=5/g" /etc/yum.repos.d/epel.repo  

yum -y  install yum-plugin-priorities   >>   dasan_log_install_epel.txt
tail -5   dasan_log_install_epel.txt  
sed -i -e "s/\]$/\]\npriority=1/g" /etc/yum.repos.d/CentOS-Base.repo

yum repolist  # 설치된 repolist 확인.


# epel 이 활성화 되어야 설치 되는 htop 을 설치하여 검증
rpm -qa | grep htop # htop 이 설치 되어있는지 확인.

yum -y  install htop  > dasan_log_install_htop.txt  
tail -5  dasan_log_install_htop.txt
```

#### # kernel / kernel-header / kernel-devel 버젼 일치 확인
```bash
uname -r # 현재 실행중인 커널 버젼 확인

# 실행중인 커널과 동일한 버젼의 커널 패키지 (headers,devel) 가 설치 되어 있는지 확인.
rpm -qa | grep $(uname -r) | grep 'headers\|devel'
```
*output example>*
```
[root@hostname ~]# # kernel / kernel-header / kernel-devel 버젼 일치 확인
[root@hostname ~]# uname -r # 현재 실행중인 커널 버젼 확인
3.10.0-693.17.1.el7.x86_64
[root@hostname ~]#
[root@hostname ~]# # 실행중인 커널과 동일한 버젼의 커널 패키지 (headers,devel) 가 설치 되어 있는지 확인.
[root@hostname ~]# rpm -qa | grep $(uname -r) | grep 'headers\|devel'
kernel-devel-3.10.0-693.17.1.el7.x86_64
kernel-headers-3.10.0-693.17.1.el7.x86_64
[root@hostname ~]#
```



### # [2. profile 설정 - Console Color , alias](#목차)
\# 사용 편의를 위한 alias를 설정, History Size 및 format 변경.  
\# Console 의 가독성을 높이기 위하여 Prompt 색상변경.  
\# Console Color Codes : http://bitmote.com/public/ansi_4bit_color_table.png  
![Console Color Codes](http://bitmote.com/public/ansi_4bit_color_table.png)  

#### # 기본 alias.
```bash
echo " "  >> /etc/profile
echo "# add by dasandata"             >>   /etc/profile
echo "alias vi='vim' "                        >>   /etc/profile
echo "alias ls='ls --color=auto' "       >>   /etc/profile
echo "alias ll='ls -lh' "                        >>   /etc/profile
echo "alias grep='grep --color=auto' "   >>   /etc/profile
```

#### # 히스토리 사이즈 변경 (1000개 -> 100,000개)
```bash
echo $HISTSIZE
grep HISTSIZE= /etc/profile
sed -i  's/HISTSIZE=1000/HISTSIZE=100000/'  /etc/profile
grep HISTSIZE= /etc/profile
```
#### # 히스토리 출력시 날짜가 표시 되도록 변경
```bash
echo " "  >> /etc/profile
echo "# Add timestamp to .bash_history "  >> /etc/profile
echo 'export HISTTIMEFORMAT="20%y/%m/%d %T "' >> /etc/profile
echo " "  >> /etc/profile
```

#### # root 와 user 의 프롬프트 색상을 다르게 설정.
```bash
echo "export PS1='\[\e[1;30;41m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc
tail -1 /root/.bashrc

echo "export PS1='\[\e[1;31;40m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/user/.bashrc
tail -1 /home/user/.bashrc
```

#### # 적용확인.
```bash
tail -10 /etc/profile

source  /etc/profile

echo $HISTSIZE

source  .bashrc
```

### # [3. 하드웨어 사양 / 기본 환경 확인 (os 버젼 등)](#목차)

```bash
cd ~
pwd

git clone https://github.com/dasandata/LISR

bash /root/LISR/common/dasan_check_to_hardware_spec.sh
```

### # [4. ip 및 hostname 정보 / 인터넷 연결 확인](#목차)
```bash
ip a

EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2)
echo ${EXT_NIC}  # 추출된 인터페이스 명이 맞는지 확인 필요.
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

### # [5. Desktop (X window) Install, not default](#목차)
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
yum -y  groups install "GNOME Desktop"  >> dasan_log_install_gnome-desktop.txt

tail dasan_log_install_gnome-desktop.txt
```
\# 콘솔에서 실행하여 윈도우가 잘 뜨는지 확인  
\#[user@hostname:~]# startx  
\#  
\# 기본 부팅모드 (그래픽 모드 vs 텍스트 모드) 변경 방법 입니다. (런레벨 / runlevel)  
\# - CentOS 6.x 계열  
\# http://egloos.zum.com/conniezzang/v/3313282  
\# - CentOS 7.x 계열  
\# https://www.server-world.info/en/note?os=CentOS_7&p=runlevel  

#### # 불필요한 Daemon Disable 예.

\# 현재 구동중인 Demon list 확인.
```bash
systemctl list-unit-files  -t service  | grep enable
```

\# Daemon Disable 스크립트 실행.
```bash
cat /root/LISR/common/dasan_daemon_disable.sh

bash /root/LISR/common/dasan_daemon_disable.sh
```
*output example>*
```
[root@hostname:~]#
[root@hostname:~]# cat /root/LISR/common/dasan_daemon_disable.sh
#!/bin/bash
# disable Daemon list
systemctl disable bluetooth.service
systemctl disable iscsi.service
systemctl disable ksm.service
systemctl disable ksmtuned.service
systemctl disable libstoragemgmt.service
systemctl disable libvirtd.service
systemctl disable NetworkManager.service
systemctl stop      NetworkManager.service
systemctl disable NetworkManager-dispatcher.service
systemctl disable NetworkManager-wait-online.service
systemctl disable spice-vdagentd.service
systemctl disable vmtoolsd.service
systemctl disable ModemManager.service

# End of file.
[root@hostname:~]#
[root@hostname:~]# bash /root/LISR/common/dasan_daemon_disable.sh
Removed symlink /etc/systemd/system/dbus-org.bluez.service.
Removed symlink /etc/systemd/system/bluetooth.target.wants/bluetooth.service.
Removed symlink /etc/systemd/system/sysinit.target.wants/iscsi.service.
Removed symlink /etc/systemd/system/multi-user.target.wants/ksm.service.
Removed symlink /etc/systemd/system/multi-user.target.wants/ksmtuned.service.
Removed symlink /etc/systemd/system/multi-user.target.wants/libstoragemgmt.service.
Removed symlink /etc/systemd/system/multi-user.target.wants/libvirtd.service.
Removed symlink /etc/systemd/system/sockets.target.wants/virtlogd.socket.
Removed symlink /etc/systemd/system/sockets.target.wants/virtlockd.socket.
Removed symlink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service.
Removed symlink /etc/systemd/system/dbus-org.freedesktop.NetworkManager.service.
Removed symlink /etc/systemd/system/multi-user.target.wants/NetworkManager.service.
Removed symlink /etc/systemd/system/spice-vdagentd.target.wants/spice-vdagentd.service.
Removed symlink /etc/systemd/system/vmtoolsd.service.requires/vgauthd.service.
Removed symlink /etc/systemd/system/multi-user.target.wants/vmtoolsd.service.
Removed symlink /etc/systemd/system/dbus-org.freedesktop.ModemManager1.service.
Removed symlink /etc/systemd/system/multi-user.target.wants/ModemManager.service.
[root@hostname:~]#
[root@hostname:~]#
```

### # [6. ssh 및 방화벽 (Firewall)설정 / 보안강화 / X11 Forwading](#목차)
\# ssh port 를 7777로 변경하고, ssh를 통한 Root Login을 거부 한 후  
\# 변경된 포트에 맞게 방화벽을 설정한 합니다.  
\# X11 Forwading 에 필요한 설정을 추가 합니다.  

#### # 방화벽 (Firewall) 설정.
```bash
ip a

EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2)
echo ${EXT_NIC}  # 추출된 인터페이스 명이 맞는지 확인 필요.
```

```bash
ifconfig ${EXT_NIC}

firewall-cmd --get-zones         # 설정가능 한 zone 목록 확인.

firewall-cmd --list-all          # 현재 설정 확인.
firewall-cmd --get-default-zone  # 현재 설정 확인.

# 외부 인터페이스를 external 존 으로 변경.
firewall-cmd --change-interface=${EXT_NIC} --zone=external --permanent  

firewall-cmd --set-default-zone=external # 기본 zone 을 external 로 변경.
firewall-cmd --reload   # 변경사항 적용

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


echo "AddressFamily inet" >> /etc/ssh/sshd_config  # X11 Forwading 관련 설정 추가.
grep AddressFamily /etc/ssh/sshd_config

systemctl restart sshd  # ssh 데몬 재시작.

```

\# 로그아웃 한 뒤 설정이 잘 적용 되었는지 검증 합니다.
```bash
logout
logout

ssh user@192.168.0.?
ssh -p7777  user@192.168.0.?
logout

ssh -p7777  root@192.168.0.?
ssh -XYC -p 7777 user@192.168.0.?

firefox & nautilus &

```
*output example>*
```
[root@hostname:~]#
[root@hostname:~]# logout
Connection to 192.168.0.xxx closed.
[user@dasandata:~]$
[user@dasandata:~]$ ssh root@192.168.0.173
ssh: connect to host 192.168.0.xxx port 22: No route to host
[user@dasandata:~]$
[user@dasandata:~]$ ssh -p7777 root@192.168.0.xxx
root@192.168.0.xxx's password:
Permission denied, please try again.
root@192.168.0.xxx's password:

[user@dasandata:~]$ ssh -p7777 dasan@192.168.0.xxx
dasan@192.168.0.xxx's password:
Last login: Tue Mar  6 09:16:15 2018 from 192.168.0.xx
[dasan@hostname:~]$
[dasan@hostname:~]$ logout
Connection to 192.168.0.xxx closed.
[user@dasandata:~]$
[user@dasandata:~]$ ssh -p7777 -XCY dasan@192.168.0.xxx
dasan@192.168.0.xxx's password:
Last login: Tue Mar  6 13:13:31 2018 from 192.168.0.xx
[dasan@hostname:~]$
```

### # [7. 새로운 사용자 추가 / sudo 권한 부여](#목차)
\# 새로운 사용자를 추가하고, sudo 권한을 부여 합니다.

```bash
NEW_USER=dasan  # 새로운 사용자 명을 변수로 할당 합니다.
echo ${NEW_USER}  # 할당된 변수 확인.

adduser ${NEW_USER}
passwd ${NEW_USER}
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

*output example>*
```
[root@hostname:~]#
[root@hostname:~]# NEW_USER=user
[root@hostname:~]# echo ${NEW_USER}  # 할당된 변수 확인.
user
[root@hostname:~]#
[root@hostname:~]# adduser ${NEW_USER}
[root@hostname:~]# passwd ${NEW_USER}
Changing password for user user.
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
[root@hostname:~]#
[root@hostname:~]#
[root@hostname:~]# su - ${NEW_USER}
[user@hostname ~]$
[user@hostname ~]$ whoami
user
[user@hostname ~]$ pwd
/home/user
[user@hostname ~]$
[user@hostname ~]$ sudo -i
[sudo] password for user:
user is not in the sudoers file.  This incident will be reported.
[user@hostname ~]$
[user@hostname ~]$ logout
[root@hostname:~]#
[root@hostname:~]# grep ${NEW_USER} /etc/group
users:x:100:
rpcuser:x:29:
user:x:1001:
[root@hostname:~]#
[root@hostname:~]# usermod -G wheel ${NEW_USER}  
[root@hostname:~]# grep ${NEW_USER} /etc/group
wheel:x:10:user
users:x:100:
rpcuser:x:29:
user:x:1001:
[root@hostname:~]# su - ${NEW_USER}
Last login: Tue Mar  6 13:19:14 KST 2018 on pts/0
[user@hostname ~]$ whoami
user
[user@hostname ~]$ pwd
/home/user
[user@hostname ~]$
[user@hostname ~]$ sudo -i
[sudo] password for user:
[root@hostname:~]#
```

### # [8. 스토리지, 파티션 마운트 / lvm, UUID, LABEL](#목차)
\# /home 디렉토리를 용량이 큰 디스크 or 스토리지 로 변경
\# 또는 용량이 큰 디스크를 /data 로 마운트 합니다.

#### # 현재 디스크 설정 확인.
```bash
fdisk -l  |  grep 'Disk /dev' # 디스크 목록 확인 1.

lsblk # 디스크 목록 확인 2.

pvs # lvm 구성 확인 (물리디스크 리스트)
vgs # lvm 구성 확인 (볼륨그룹 리스트)
lvs # lvm 구성 확인 (논리볼륨 리스트)
```

#### # /dev/sdb 를 lvm 으로 구성
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

#### # 생성된 볼륨을 포맷 한 후 기존 home 내용 복제
```bash
mkfs.xfs -L HOME  /dev/mapper/vg_home-lv_home

mount /dev/mapper/vg_home-lv_home /mnt

cd /home/
find .  | cpio -dump  /mnt

ls -l /mnt/
umount /mnt
cd
```

#### # 생성된 볼륨을 home 으로 마운트 (fstab 에 마운트 내용 추가)
```bash
echo  "LABEL="HOME"  /home   xfs  defaults  0  0 "    >>   /etc/fstab
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


### # [9. Banner // login wellcome message ](#목차)
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


### # [10. VNC Server 설정](#목차)
\# 원격 접속을 위한 VNC Server를 구성 합니다.

```bash
rpm -qa | grep vnc # 현재 설치된 vnc 패키지 확인

# vnc server(tigervnc-server) 와 vnc viewer 를 설치 합니다.
yum -y install  tigervnc-server  vnc  >>  dasan_log_install_vnc.txt
tail dasan_log_install_vnc.txt
```

\# VNC 연결을 위한 방화벽 (firewall 설정)
```bash

firewall-cmd --list-all | grep services

firewall-cmd --permanent --zone=external --add-service  vnc-server
firewall-cmd --reload

firewall-cmd --list-all | grep services
```

\# VNC 암호 설정
```bash
vncpasswd # vnc접속용 암호를 지정합니다. (8자)
```

\# VNC 실행 및 연결
```bash
vncserver # vnc 서버를 실행 합니다.

vncserver -list # 현재 실행중인 vnc 서버 목록을 확인합니다.

ps aux | grep -i vnc # 실행중인 vnc 프로세스 확인

vncserver -kill :1 # 실행중인 vnc 서비스 끝내기

vncserver # vnc 서비스 실행

vncviewer localhost:1 &  # vnc viewer 로 접속 테스트  (X11Forwading 이 구성 되어 있어야 합니다.)
```
***
### # [11. TeamViewer 설치](#목차)
\# https://www.teamviewer.com/ko/download/linux/

#### # 설치.
```bash
yum install  epel-release   # epel 저장소가 설치 되어 있는지 확인.


yum -y install qt5-*  >> dasan_log_install_qt5_teamviewer_.txt # teamviewer 설치에 필요한 라이브러리 설치.
tail  dasan_log_install_qt5_teamviewer_.txt

# teamvierew 설치
yum -y install https://download.teamviewer.com/download/teamviewer.i686.rpm \
>> dasan_log_install_teamviewer.txt
tail  dasan_log_install_teamviewer.txt
```

#### # 패스워드 설정.
```bash
teamviewer passwd # <비밀번호 입력>
```

#### # 실행.
```bash
teamviewer daemon enable
sleep 5
teamviewer --daemon restart
sleep 10
teamviewer info
```
\# 여기서 ID 가 확인 되지 않으면, X-Windows 로 들어가서 teamviewer 를 실행,  
\# 라이선스에 동의 한 후 확인 합니다.  
\# TeamViewer ID 를 확인 한 후 로그인 합니다.  

***
### # [12. 부팅 되는 기본 커널 버젼 변경방법](#목차)
\# 업데이트를 통해 커널이 많이 설치 되었을 경우   
\# 이 방법으로 기본 부팅 커널 버젼을 변경할 수 있습니다.  

\# 설치된 커널 버젼 리스트 와 entry 값 확인.  
```bash
awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg
```
*output example>*
```
[root@hostname:~]# awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg
0 : CentOS Linux (3.10.0-693.17.1.el7.x86_64) 7 (Core)
1 : CentOS Linux (3.10.0-693.el7.x86_64) 7 (Core)
2 : CentOS Linux (0-rescue-17e63eb3bb5b4727a508fc4c31a5ab5b) 7 (Core)
[root@hostname:~]#
```

```bash
grub2-editenv list
# 현재 저장되어 있는 entry 값 확인 (숫자로 지정되어 있지 않음).

grub2-set-default 1 # 기본값을 위에서 확인된 번호로 변경.

grub2-editenv list # 변경된 값 확인.

grub2-set-default 0 # 다시 원래대로 변경.
grub2-editenv list

```
***

## # [===== 장애 모니터링 =====](#목차)

### # [20. SMTP for Email Alert (mailutils or mailx)](#목차)

#### # 이메일 경고에 사용될 메일관리자 이메일 주소 및 로그 타이틀 정보를 생성 파일 작성.

```bash
cp /root/LISR/common/usr-local-sbin/dasan_export_global_variable.sh  /usr/local/sbin/dasan_export_global_variable.sh
```
아래 CUSTOMER 값을 고객사 정보에 맞게 변경합니다.
```bash
CUSTOMER=<고객사 정보>
```
```bash
sed -i  "s/ABCDEFG/${CUSTOMER}/" /usr/local/sbin/dasan_export_global_variable.sh

cat /usr/local/sbin/dasan_export_global_variable.sh
source /usr/local/sbin/dasan_export_global_variable.sh
echo $TITLE_TAIL
```

#### # 메일 발송 테스트
```bash
yum -y install mailx

grep inet_protocols   /etc/postfix/main.cf
sed -i  's/inet_protocols = all/inet_protocols = ipv4/' /etc/postfix/main.cf
grep inet_protocols   /etc/postfix/main.cf

systemctl restart postfix

echo "Test of SMTP... OK." | mail -s $TITLE_TAIL $ADMIN_LOG_EMAIL
```

***

### # [21. SMTP for Email Alert (postfix for Dell RAID Manager)](#목차)
#### # Dell Server RAID Controller Management (MSM) 의 알림 메일 발송을 위해 postifx를 구성 합니다 .

```bash
yum -y install postfix

systemctl status postfix | grep Active:

grep 'inet_interfaces =' /etc/postfix/main.cf


sed -i  "s/inet_interfaces = localhost/#inet_interfaces = localhost/" /etc/postfix/main.cf
sed -i  "s/#inet_interfaces = all/inet_interfaces = all/" /etc/postfix/main.cf
grep 'inet_interfaces =' /etc/postfix/main.cf

systemctl  restart postfix
```
***
### # [22. Dell OpenManage Server Administrator Install (OMSA)](#목차)
\# 서버 자체에서 구동되며, 장애가 발생한 경우 상태를 확인하거나   
\# 오류 메세지를 메일로 발송 하는 기능을 구현 할 수 있습니다.   

```bash
cat /root/LISR/CentOS7/Install_Dell_OMSA_CentOS7.sh
bash /root/LISR/CentOS7/Install_Dell_OMSA_CentOS7.sh
```
*output example>*
```
Executing /sbin/chkconfig dsm_om_connsvc on
System Model            = PowerEdge R710
Service Tag             = AAAAAAA
Alert Log

Alert Log contains...

Severity      : Ok
ID            : 1000
Date and Time : Tue Mar  6 14:41:32 2018
Category      : Instrumentation Service
Description   : Server Administrator starting

[root@hostname:~]#
```
***
### # [23. Dell OMSA - E-Mail Alert](#목차)

#### # 기존 변수 생성파일 확인.
```bash
cat   /usr/local/sbin/dasan_export_global_variable.sh
```

#### # 경고 메일 내용 생성파일 복사. (dasan_alert_omsa.sh)
```bash
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
\#    
\# 수신된 이메일 예시  

<이미지 추가 예정.>  

\# 참조 omconfig  Manual   
\# http://topics-cdn.dell.com/pdf/dell-openmanage-server-administrator-v8.3_user%27s%20guide_en-us.pdf  

***
### # [24. Dell RAID Controller Management (MSM) + Alert by Email](#목차)
\# RAID 컨트롤러 관리 프로그램을 통해 서버의 전원을 끄지 않고 디스크 장애를 처리하거나  
\# RAID 구성을 변경할 수 있습니다. Megaraid Storage Manager 의 약자로 통상 MSM 이라고 합니다.  
\# LSI 사에서 최초 제작한 컨트롤러 였으나 현재는 Boradcom 제품 입니다.  
\# ** LSI MegaRAID  
\# LSI -> Avago Technologies 에 인수  (2013년 12월 16일)  
\# Avago Technologies 와 Broadcom 합병 (2015년 5월 28일)  
\# https://en.wikipedia.org/wiki/Broadcom_Limited  

```bash
cat /root/LISR/CentOS7/Install_Dell_MSM_CentOS7.sh

bash /root/LISR/CentOS7/Install_Dell_MSM_CentOS7.sh
```
***
### # [25. 온도(temperature) 모니터 링. (ipmitool)](#목차)
\# 서버에 내장된 관리기능 (ipmi) 를 이용하여 온도를 모니터링 하고 이메일로 받아봅니다.

#### # 파일 복사.
```bash
cp /root/LISR/common/usr-local-sbin/dasan_temperature_check_to_log.sh /usr/local/sbin/
cp /root/LISR/common/usr-local-sbin/dasan_temperature_log_to_mail.sh /usr/local/sbin/
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
***


***
## end.
