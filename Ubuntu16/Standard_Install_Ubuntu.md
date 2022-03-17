# 다산데이타 Ubuntu 14.04 / 16.04 / 18.04  설치 표준안 (2018.06)
다산데이터 출고 장비에 설치되는 리눅스 (Ubuntu) 의 설치 표준안 입니다.  
별도의 요청사항이 없는 경우 기본적으로 아래 절차에 따라 설치한 후 출고 하고 있습니다.  
보완이 필요한 점이나 새로운 아이디어를 제보해 주시면 적극 반영하겠습니다 :)  

감사합니다.  

![Dasandata Logo](http://dasandata.co.kr/wp-content/uploads/2019/05/%EB%8B%A4%EC%82%B0%EB%A1%9C%EA%B3%A0_%EC%88%98%EC%A0%951-300x109.jpg)

## #목차
[1. 기본 유틸 설치 / 시간 동기화](Standard_Install_Ubuntu.md#-1-%EA%B8%B0%EB%B3%B8-%EC%9C%A0%ED%8B%B8-%EC%84%A4%EC%B9%98--%EC%8B%9C%EA%B0%84-%EB%8F%99%EA%B8%B0%ED%99%94)  
[2. profile 설정 - Console Color , alias](Standard_Install_Ubuntu.md#-2-profile-%EC%84%A4%EC%A0%95---console-color--alias)  
[3. 하드웨어 사양 / 기본 환경 확인 (os 버젼 등)](Standard_Install_Ubuntu.md#-3-%ED%95%98%EB%93%9C%EC%9B%A8%EC%96%B4-%EC%82%AC%EC%96%91--%EA%B8%B0%EB%B3%B8-%ED%99%98%EA%B2%BD-%ED%99%95%EC%9D%B8-os-%EB%B2%84%EC%A0%BC-%EB%93%B1)  
[4. ip 및 hostname 정보 / 인터넷 연결 확인](Standard_Install_Ubuntu.md#-4-ip-%EB%B0%8F-hostname-%EC%A0%95%EB%B3%B4--%EC%9D%B8%ED%84%B0%EB%84%B7-%EC%97%B0%EA%B2%B0-%ED%99%95%EC%9D%B8)   
[5. Desktop (X window) Install, not default](Standard_Install_Ubuntu.md#-5-desktop-x-window-install-not-default)  
[6. ssh 및 방화벽 (Firewall)설정 / 보안강화 / X11 Forwading](Standard_Install_Ubuntu.md#-6-ssh-%EB%B0%8F-%EB%B0%A9%ED%99%94%EB%B2%BD-firewall%EC%84%A4%EC%A0%95--%EB%B3%B4%EC%95%88%EA%B0%95%ED%99%94--x11-forwading)  
[7. 새로운 사용자 추가 / sudo 권한 부여](Standard_Install_Ubuntu.md#-7-%EC%83%88%EB%A1%9C%EC%9A%B4-%EC%82%AC%EC%9A%A9%EC%9E%90-%EC%B6%94%EA%B0%80--sudo-%EA%B6%8C%ED%95%9C-%EB%B6%80%EC%97%AC)
[8. 스토리지, 파티션 마운트 / lvm, UUID, LABEL](Standard_Install_Ubuntu.md#-8-%EC%8A%A4%ED%86%A0%EB%A6%AC%EC%A7%80-%ED%8C%8C%ED%8B%B0%EC%85%98-%EB%A7%88%EC%9A%B4%ED%8A%B8--lvm-or-parted-uuid-label)  
[9. Banner // login wellcome message ](Standard_Install_Ubuntu.md#-9-banner--login-wellcome-message-)  
[10. VNC Server 설정](Standard_Install_Ubuntu.md#-10-vnc-server-%EC%84%A4%EC%A0%95)  
[11. TeamViewer 설치](Standard_Install_Ubuntu.md#-11-teamviewer-%EC%84%A4%EC%B9%98)  
[12. 부팅 되는 기본 커널 버젼 변경방법](Standard_Install_Ubuntu.md#-12-%EB%B6%80%ED%8C%85-%EB%90%98%EB%8A%94-%EA%B8%B0%EB%B3%B8-%EC%BB%A4%EB%84%90-%EB%B2%84%EC%A0%BC-%EB%B3%80%EA%B2%BD%EB%B0%A9%EB%B2%95)  
[13. Disk 속도 측정](Standard_Install_Ubuntu.md#-13-disk-%EC%86%8D%EB%8F%84-%EC%B8%A1%EC%A0%95)


[===== 장애 모니터링 =====](Standard_Install_Ubuntu.md#--%EC%9E%A5%EC%95%A0-%EB%AA%A8%EB%8B%88%ED%84%B0%EB%A7%81-)  
[20. SMTP for Email Alert (mailutils or mailx)](Standard_Install_Ubuntu.md#-20-smtp-for-email-alert-mailutils-or-mailx)  
[21. SMTP for Email Alert (postfix for Dell RAID Manager)](Standard_Install_Ubuntu.md#-21-smtp-for-email-alert-postfix-for-dell-raid-manager)  
[22. Dell OpenManage Server Administrator Install (OMSA)](Standard_Install_Ubuntu.md#-22-dell-openmanage-server-administrator-install-omsa)  
[23. Dell OMSA - E-Mail Alert](Standard_Install_Ubuntu.md#-23-dell-omsa---e-mail-alert)  
[24. Dell RAID Controller Management (MSM) + Alert by Email](Standard_Install_Ubuntu.md#-24-dell-raid-controller-management-msm--alert-by-email)  
[25. 온도(temperature) 모니터 링. (ipmitool)](Standard_Install_Ubuntu.md#-25-%EC%98%A8%EB%8F%84temperature-%EB%AA%A8%EB%8B%88%ED%84%B0-%EB%A7%81-ipmitool)  


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

#### # 빠른 설치를 위해 기본 저장소(repository) 를 mirror.daumkakao.com 으로 변경 합니다.

##### # Repository Update
```bash
cat /etc/apt/sources.list  |  grep -v "#\|^$"

perl -pi -e 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
perl -pi -e 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

cat  /etc/apt/sources.list  |  grep -v "#\|^$"
```

```bash
apt-get update  >>  dasan_log_ubuntu_repo_update.txt

tail -5 dasan_log_ubuntu_repo_update.txt
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
# 기존 설정 내용 확인.
cat /etc/default/grub | grep -v "#\|^$"

perl -pi -e 's/splash//' /etc/default/grub # 부팅시 화면에 부팅로그가 표시 되도록 rhgb 항목 지움
perl -pi -e 's/quiet//'  /etc/default/grub # 부팅시 화면에 부팅로그가 표시 되도록 quiet 항목 지움

# ipv6 비활성.
perl -pi -e  's/^GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /'  /etc/default/grub

# timeout 옵션 해제.
perl -pi -e  's/^GRUB_HIDDEN_TIMEOUT=/#GRUB_HIDDEN_TIMEOUT=/'  /etc/default/grub

# 변경사항 확인.
cat /etc/default/grub | grep -v "#\|^$"  

# boot kernel 에 설정 적용
update-initramfs -u && update-grub2

reboot  # 재부팅
```

***

\# 재부팅 후 확인.
```bash
ip a | grep inet6
# 아무 결과가 없는 것이  ipv6 disable 이 잘 적용 된것 입니다.
```
*output example>*
```
[root@hostname:~]#
[root@hostname:~]# ip a | grep inet6
[root@hostname:~]# # 아무 결과가 없는 것이  ipv6 disable 이 잘 적용 된것 입니다.
[root@hostname:~]#
```

#### # 서버 기본 설정에 필요한 유틸리티들 설치

```bash
# 기본 유틸 설치.
# 화면에 로그가 뿌려지지 않도록 하기 위해 파이프라인(>>) 처리를 합니다.
apt-get install -y  \
vim nfs-common rdate xauth firefox gcc make locate htop tmux git wget ipmitool ifconfig \
xfsprogs ntfs-3g aptitude lvm2 dstat curl libssl1.0.0 libssl-dev smartmontools >> dasan_log_install_ubuntu_default_util.txt 2>&1
```

```bash
tail -5 dasan_log_install_ubuntu_default_util.txt # 설치 결과 확인.

apt-get install -y  python-pip python3-pip  python3-tk  >> dasan_log_ubuntu_python-dev_install.txt
```

```bash
tail -5 dasan_log_ubuntu_python-dev_install.txt # 설치 결과 확인.
```

#### # 인터넷 시간에 맞추어 서버의 시간 조정
```bash
# 서버 시간 동기화.
rdate  -s  time.bora.net
hwclock --systohc  
date
hwclock
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

#### # 히스토리 사이즈 변경 (1000개 -> 10,000개)
```bash
echo $HISTSIZE
grep HISTSIZE /etc/skel/.bashrc
perl -pi -e 's/HISTSIZE=1000/HISTSIZE=10000/'   /etc/skel/.bashrc
grep HISTSIZE /etc/skel/.bashrc

grep HISTSIZE .bashrc
perl -pi -e 's/HISTSIZE=1000/HISTSIZE=10000/'   ~/.bashrc
grep HISTSIZE .bashrc
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
echo "export PS1='\[\e[1;46;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc
tail -1 /root/.bashrc

echo "export PS1='\[\e[1;47;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/sonic/.bashrc
tail -1 /home/sonic/.bashrc
```

#### # 적용확인.
```bash
tail -10 /etc/profile

source  /etc/profile

source  .bashrc

echo $HISTSIZE
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

EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2 |tr -d ' ')
echo ${EXT_NIC}  # 추출된 인터페이스 명이 맞는지 확인 필요.
```

```bash
ifconfig  ${EXT_NIC}

cat /etc/network/interfaces

cat /etc/hostname

cat /etc/resolv.conf

ping -c 4 google.com
```

### # [5. Desktop (X window) Install, not default](#목차)
\# Desktop 환경을 설치 하지만, 기본 부팅은 텍스트 모드로 설정해 놓습니다.  
\# 필요한 경우에만 xwindow 를 실행하여 사용 합니다. (서버의 리소스 절약)  
\# Desktop 을 설치하면 불필요한 데몬이 함께 깔립니다. 설치 후 정리가 필요 합니다.  

#### # (Ubuntu16,18)기본 부팅 모드 확인.
\# multi-user.target -> 텍스트환경  
\# graphical.target -> GUI 환경  
\# 기본 모드 변경시 -> systemctl set-default multi-user.target  
```bash
systemctl get-default

systemctl set-default multi-user.target

systemctl get-default
```

#### # (Ubuntu14)기본 부팅 모드 변경.
```bash
perl -pi -e  's/GRUB_CMDLINE_LINUX_DEFAULT="/GRUB_CMDLINE_LINUX_DEFAULT="text /g'  /etc/default/grub
grep  "GRUB_CMDLINE_LINUX_DEFAULT="  /etc/default/grub

update-initramfs -u && update-grub2
```

#### # ubuntu Desktop 설치.
```bash
apt-get -y install ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal >> dasan_log_install_ubuntu-desktop.txt  2>&1
```

```bash  
tail  dasan_log_install_ubuntu-desktop.txt
```

\# (Ubuntu 16.18)콘솔에서 실행하여 ubuntu desktop 이 잘 실행 되는지 확인  
\# [user@hostname:~]# sudo systemctl start lightdm
\# ubuntu desktop 종료하기
\# [user@hostname:~]# sudo systemctl start lightdm

\# (Ubuntu 14)콘솔에서 실행하여 ubuntu desktop 이 잘 실행 되는지 확인  
\# [user@hostname:~]# sudo /etc/init.d/lightdm start
\# ubuntu desktop 종료하기
\# [user@hostname:~]# sudo /etc/init.d/lightdm stop

#### # (Ubuntu16,18)불필요한 Daemon Disable 예.

\# 현재 구동중인 Demon list 확인.
```bash
systemctl list-unit-files  -t service  | grep enable
```

\# Daemon Disable 스크립트 실행.
```bash
cat /root/LISR/common/dasan_ubuntu_daemon_disable.sh

bash /root/LISR/common/dasan_ubuntu_daemon_disable.sh
```
*output example>*
```
[root@ubuntu:~]# cat /root/LISR/common/dasan_ubuntu_daemon_disable.sh
#!/bin/bash
# disable Daemon list
systemctl disable bluetooth.service
systemctl disable NetworkManager.service
systemctl stop      NetworkManager.service
systemctl disable NetworkManager-dispatcher.service
systemctl disable NetworkManager-wait-online.service
systemctl disable whoopsie.service
systemctl disable cups-browsed.service
systemctl disable cups.service

# End of file.

[root@ubuntu:~]# bash /root/LISR/common/dasan_ubuntu_daemon_disable.sh
Synchronizing state of bluetooth.service with SysV init with /lib/systemd/systemd-sysv-install...
Executing /lib/systemd/systemd-sysv-install disable bluetooth
insserv: warning: current start runlevel(s) (empty) of script `bluetooth' overrides LSB defaults (2 3 4 5).
insserv: warning: current stop runlevel(s) (0 1 2 3 4 5 6) of script `bluetooth' overrides LSB defaults (0 1 6).
Removed symlink /etc/systemd/system/dbus-org.bluez.service.
Removed symlink /etc/systemd/system/multi-user.target.wants/NetworkManager.service.
Removed symlink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service.
Removed symlink /etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service.
Synchronizing state of whoopsie.service with SysV init with /lib/systemd/systemd-sysv-install...
Executing /lib/systemd/systemd-sysv-install disable whoopsie
insserv: warning: current start runlevel(s) (empty) of script `whoopsie' overrides LSB defaults (2 3 4 5).
insserv: warning: current stop runlevel(s) (1 2 3 4 5) of script `whoopsie' overrides LSB defaults (1).
Synchronizing state of cups-browsed.service with SysV init with /lib/systemd/systemd-sysv-install...
Executing /lib/systemd/systemd-sysv-install disable cups-browsed
insserv: warning: current start runlevel(s) (empty) of script `cups-browsed' overrides LSB defaults (2 3 4 5).
insserv: warning: current stop runlevel(s) (0 1 2 3 4 5 6) of script `cups-browsed' overrides LSB defaults (0 1 6).
Synchronizing state of cups.service with SysV init with /lib/systemd/systemd-sysv-install...
Executing /lib/systemd/systemd-sysv-install disable cups
insserv: warning: current start runlevel(s) (empty) of script `cups' overrides LSB defaults (2 3 4 5).
insserv: warning: current stop runlevel(s) (1 2 3 4 5) of script `cups' overrides LSB defaults (1).
Removed symlink /etc/systemd/system/sockets.target.wants/cups.socket.
Removed symlink /etc/systemd/system/multi-user.target.wants/cups.path.
```

\# network-manager 제거
```bash
apt-get -y purge network-manager
```

```bash
apt-get -y autoremove
```

#### # (Ubuntu14)불필요한 Daemon Disable 예.
\# https://askubuntu.com/questions/19320/how-to-enable-or-disable-services
```bash
apt-get -y  install sysv-rc-conf
sysv-rc-conf

apt-get -y  install rcconf
rcconf

update-rc.d

ll /etc/init/network-manager.conf
mv /etc/init/network-manager.conf /etc/init/network-manager.conf.disable
```


### # [6. ssh 및 방화벽 (Firewall)설정 / 보안강화 / X11 Forwading](#목차)
\# ssh port 를 7777로 변경하고, ssh를 통한 Root Login을 거부 한 후  
\# 변경된 포트에 맞게 방화벽을 설정한 합니다.  
\# X11 Forwading 에 필요한 설정을 추가 합니다.  

#### # 방화벽 (Firewall) 설정.

\# 현재 상태 확인 및 활성 화
```bash
systemctl status ufw
# If Ubuntu 14 - service ufw status

ufw status

ufw enable
```

\# 기본 정책을 차단 (deny) 로 변경한 후 필요한 포트 (또는 서비스) 만 허용.
```bash
ufw status
ufw default deny
ufw allow 22/tcp
ufw allow 7777/tcp
ufw status numbered
```


#### # sshd 설정. (기본 포트인 22번을 7777로 변경)

```bash
#Ubuntu18 sshd_config
grep 'Root\|Port' /etc/ssh/sshd_config
perl -pi -e "s/Port 22/Port 7777/g" /etc/ssh/sshd_config
perl -pi -e "s/#PermitRootLogin prohibit-password/PermitRootLogin no/g" /etc/ssh/sshd_config
grep 'Root\|Port' /etc/ssh/sshd_config

#Ubuntu16 sshd_config
grep 'Root\|Port' /etc/ssh/sshd_config
perl -pi -e "s/Port 22/Port 7777/g" /etc/ssh/sshd_config
perl -pi -e "s/PermitRootLogin prohibit-password/PermitRootLogin no/g" /etc/ssh/sshd_config
grep 'Root\|Port' /etc/ssh/sshd_config

# Ubuntu14 sshd_config
grep 'Root\|Port' /etc/ssh/sshd_config
perl -pi -e "s/Port 22/Port 7777/g" /etc/ssh/sshd_config
perl -pi -e "s/PermitRootLogin without-password/PermitRootLogin no/g" /etc/ssh/sshd_config
grep 'Root\|Port' /etc/ssh/sshd_config
```


#### # X11Forwarding 을 위해 AddressFamily inet 을 추가 합니다.
```bash
echo "AddressFamily inet" >> /etc/ssh/sshd_config
grep AddressFamily /etc/ssh/sshd_config

systemctl restart sshd
```

\# 로그아웃 한 뒤 설정이 잘 적용 되었는지 검증 합니다.
```bash
logout
logout

ssh  user@192.168.0.?
ssh -p7777 user@192.168.0.?
logout

ssh -p7777  root@192.168.0.?
ssh -XYC -p 7777  user@192.168.0.?

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

usermod -G sudo ${NEW_USER}  
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
[root@hostname:~]# NEW_USER=dasan
[root@hostname:~]# echo ${NEW_USER}  # 할당된 변수 확인.
dasan
[root@hostname:~]#
[root@hostname:~]# adduser ${NEW_USER}
Adding user `dasan' ...
Adding new group `dasan' (1001) ...
Adding new user `dasan' (1001) with group `dasan' ...
Creating home directory `/home/dasan' ...
Copying files from `/etc/skel' ...
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
Changing the user information for dasan
Enter the new value, or press ENTER for the default
	Full Name []:
	Room Number []:
	Work Phone []:
	Home Phone []:
	Other []:
Is the information correct? [Y/n]
[root@hostname:~]#
[root@hostname:~]#
[root@hostname:~]# su - ${NEW_USER}
[dasan@hostname ~]$
[dasan@hostname ~]$ whoami
dasan
[dasan@hostname ~]$ pwd
/home/sonic
[dasan@hostname ~]$
[dasan@hostname ~]$ sudo -i
[sudo] password for dasan:
user is not in the sudoers file.  This incident will be reported.
[dasan@hostname ~]$
[dasan@hostname ~]$ logout
[root@hostname:~]#
[root@hostname:~]# grep ${NEW_USER} /etc/group
dasan:x:1001:
[root@hostname:~]#
[root@hostname:~]# usermod -G sudo ${NEW_USER}
[root@hostname:~]# grep ${NEW_USER} /etc/group
sudo:x:27:sonic,dasan
dasan:x:1001:
[root@hostname:~]# su - ${NEW_USER}
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

[dasan@hostname ~]$ whoami
dasan
[dasan@hostname ~]$ pwd
/home/dasan
[dasan@hostname ~]$
[dasan@hostname ~]$ sudo -i
[sudo] password for dasan:
[dasan@hostname:~]#
```

### # [8. 스토리지, 파티션 마운트 / lvm or Parted, UUID, LABEL](#목차)
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

#### # 8a-1. /dev/sdb 를 lvm 으로 구성
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

#### # 8a-2. lvm 으로 생성된 볼륨을 포맷 한 후 기존 home 내용 복제
```bash
mkfs.xfs -L HOME  /dev/mapper/vg_home-lv_home

mount /dev/mapper/vg_home-lv_home /mnt

cd /home/
find .  | cpio -dump  /mnt

ls -l /mnt/
umount /mnt
cd
```


***


#### # 8b-1. /dev/sdb 를 parted 으로 구성
\# (home으로 마운트 하기 위해 vg 및 lv 이름을 home 으로 지정.)

```bash
parted -s /dev/sdb  "mklabel gpt"
parted -s /dev/sdb  "mkpart  primary  0% 100%"

sleep 10
```

#### # 8b-2. parted로 생성된 볼륨을 포맷 한 후 기존 home 내용 복제
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
dpkg --list | grep vnc  # 현재 설치된 vnc 패키지 확인

# vnc server(tigervnc-server) 와 vnc viewer 를 설치 합니다.
apt-get install -y vnc4server  >>  dasan_log_install_vnc.txt 2>&1

tail dasan_log_install_vnc.txt
```

\# VNC 연결을 위한 방화벽 (firewall 설정)
```bash
ufw status

ufw allow 5901/tcp
ufw allow 5902/tcp

ufw status
```

\# VNC 암호 설정 (일반 사용자 계정으로 전환한 후 진 )
```bash
su - sonic
vncserver # vnc접속용 암호를 지정합니다. (8자)
```

\# VNC 실행 및 연결
```bash
vncserver -kill :1

cat .vnc/xstartup

cp .vnc/xstartup .vnc/xstartup.bak
echo 'gnome-panel &  ' >> .vnc/xstartup
echo 'gnome-settings-daemon & ' >> .vnc/xstartup
echo 'metacity &  ' >> .vnc/xstartup
echo 'nautilus &  ' >> .vnc/xstartup

cat .vnc/xstartup
chmod +x .vnc/xstartup

vncserver
```

\# vnc viewer program Download = https://www.realvnc.com/en/connect/download/viewer/
\# vnc viewer 에서 접속  (접속주소 -> ipaddress:1)  
```bash
vncserver -kill :1

logout
```


***
### # [11. TeamViewer 설치](#목차)
\# https://www.teamviewer.com/ko/download/linux/

#### # 설치.

```bash
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb

apt-get -y install ./teamviewer_amd64.deb  >>  dasan_log_install_teamviewer.txt 2>&1
```

```bash
tail -5 dasan_log_install_teamviewer.txt
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
awk -F\' '$1=="menuentry " {print i++ " : " $2}' /boot/grub/grub.cfg
```

*output example>*
```
[root@hostname:~]# awk -F\' '$1=="menuentry " {print i++ " : " $2}' /boot/grub/grub.cfg
0 : Ubuntu
1 : Memory test (memtest86+)
2 : Memory test (memtest86+, serial console 115200)
3 : Windows 10 (loader) (on /dev/sda1)
[root@hostname:~]#
```

```bash
grep GRUB_DEFAULT /etc/default/grub

perl -pi -e 's/GRUB_DEFAULT=0/GRUB_DEFAULT=saved/' /etc/default/grub

grep GRUB_DEFAULT /etc/default/grub

update-grub

grub-set-default  0   # 또는 다른 번호

grub-editenv list
```

***
### # [13. Disk 속도 측정](#목차)
\# 읽기 전용 hdparm  
\# 쓰기 전용 dd  

\# 13-1 hdparm 읽기 전용
```bash
lsblk
df -hT | grep -v tmpfs

hdparm -tT /dev/sd*
```

*output example>*
```
[root@ubuntu:~]# lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda      8:0    0   32G  0 disk
├─sda1   8:1    0  953M  0 part /boot
├─sda2   8:2    0  3.7G  0 part [SWAP]
└─sda3   8:3    0 27.4G  0 part /
sdb      8:16   0   20G  0 disk
└─sdb1   8:17   0   20G  0 part /data
sdc      8:32   0   16G  0 disk
└─sdc1   8:33   0   16G  0 part /data1
sr0     11:0    1 1024M  0 rom  
[root@ubuntu:~]#

[root@ubuntu:~]# hdparm -tT /dev/sda3

/dev/sda3:
 Timing cached reads:   11772 MB in  1.99 seconds = 5926.32 MB/sec
 Timing buffered disk reads: 290 MB in  3.02 seconds =  96.07 MB/sec
[root@ubuntu:~]#

[root@ubuntu:~]# hdparm -tT /dev/sdb1

/dev/sdb1:
 Timing cached reads:   11386 MB in  1.99 seconds = 5730.22 MB/sec
 Timing buffered disk reads: 4580 MB in  3.00 seconds = 1526.64 MB/sec
[root@ubuntu:~]#
[root@ubuntu:~]# hdparm -tT /dev/sdc1

/dev/sdc1:
 Timing cached reads:   11890 MB in  1.99 seconds = 5985.80 MB/sec
 Timing buffered disk reads: 4756 MB in  3.00 seconds = 1585.08 MB/sec
[root@ubuntu:~]#
```

\# 13-2 dd 쓰기 전용
```bash
lsblk
df -hT | grep -v tmpfs

cd /tmp
date ; dd if=/dev/zero bs=1G count=1 of=write_1GB_test ; rm write_1GB_test

cd /home
date ; dd if=/dev/zero bs=1G count=1 of=write_1GB_test ; rm write_1GB_test

cd /data
date ; dd if=/dev/zero bs=1G count=1 of=write_1GB_test ; rm write_1GB_test
```

*output example>*
```
[root@ubuntu:~]# lsblk

NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda      8:0    0   32G  0 disk
├─sda1   8:1    0  953M  0 part /boot
├─sda2   8:2    0  3.7G  0 part [SWAP]
└─sda3   8:3    0 27.4G  0 part /
sdb      8:16   0   20G  0 disk
└─sdb1   8:17   0   20G  0 part /data
sdc      8:32   0   16G  0 disk
└─sdc1   8:33   0   16G  0 part /data1
sr0     11:0    1 1024M  0 rom  
[root@ubuntu:~]#

[root@ubuntu:~]# df -hT | grep -v tmpfs
Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/sda3      ext4       27G  4.1G   22G  16% /
/dev/sda1      ext4      922M   61M  799M   8% /boot
/dev/sdb1      ext4       20G   44M   19G   1% /data
/dev/sdc1      ext4       16G   44M   15G   1% /data1
[root@ubuntu:~]#

[root@ubuntu:~]# cd /tmp
[root@ubuntu:tmp]# date ; dd if=/dev/zero bs=1G count=1 of=write_1GB_test ; rm write_1GB_test
Fri Nov 30 20:41:52 KST 2018
1+0 records in
1+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 2.26254 s, 475 MB/s
[root@ubuntu:tmp]#
[root@ubuntu:tmp]# cd /data
[root@ubuntu:data]# date ; dd if=/dev/zero bs=1G count=1 of=write_1GB_test ; rm write_1GB_test
Fri Nov 30 20:41:59 KST 2018
1+0 records in
1+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 7.18194 s, 150 MB/s
[root@ubuntu:data]#
[root@ubuntu:data]# cd /data1
[root@ubuntu:data1]# date ; dd if=/dev/zero bs=1G count=1 of=write_1GB_test ; rm write_1GB_test
Fri Nov 30 20:42:23 KST 2018
1+0 records in
1+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 4.57022 s, 235 MB/s
[root@ubuntu:data1]#


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

#### # (Ubuntu 16)메일 발송 테스트
```bash
apt-get  -y  install mailutils  

source /usr/local/sbin/dasan_export_global_variable.sh
echo $TITLE_TAIL

echo "Test of SMTP... OK. " >  test_message.txt  
cat test_message.txt

mail -s   $TITLE_TAIL   -t   $ADMIN_LOG_EMAIL   <   test_message.txt
```

#### # (Ubuntu 18,17)메일 발송 테스트
```bash
apt-get   -y   install mailutils

source /usr/local/sbin/dasan_export_global_variable.sh
echo $TITLE_TAIL

echo "Test of SMTP... OK. " >  test_message.txt  
cat test_message.txt

echo "Test of SMTP... OK." | mail -s $TITLE_TAIL $ADMIN_LOG_EMAIL
```

***


### # [21. SMTP for Email Alert (postfix for Dell RAID Manager)](#목차)
#### # Dell Server RAID Controller Management (MSM) 의 알림 메일 발송을 위해 postifx를 구성 합니다 .

\# Ubuntu16 check ( interface = all / protocols ipv4)
```bash
grep "inet_interfaces\|inet_protocols" /etc/postfix/main.cf
inet_interfaces = all
inet_protocols = all

perl -pi -e 's/^inet_protocols = all/inet_protocols = ipv4/'  /etc/postfix/main.cf

grep inet_protocols  /etc/postfix/main.cf
inet_interfaces = all
inet_protocols = ipv4
```

\# 메일 발송에 문제가 있을 경우 ?
\# /etc/postfix/main.cf 의 mynetworks 주석처리
\# mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
```bash
grep 'mynetworks = '   /etc/postfix/main.cf

perl -pi -e 's/^mynetworks/#mynetworks/'   /etc/postfix/main.cf

grep  'mynetworks = '   /etc/postfix/main.cf

systemctl restart postfix
```

\# Ubuntu14 check
```bash
grep mynetworks /etc/postfix/main.cf
perl -pi -e 's/^mynetworks/#mynetworks/' /etc/postfix/main.cf
grep mynetworks /etc/postfix/main.cf

grep inet_protocols  /etc/postfix/main.cf
perl -pi -e "s/inet_protocols = all/inet_protocols = ipv4/" /etc/postfix/main.cf
grep inet_protocols  /etc/postfix/main.cf

/etc/init.d/postfix restart
```

***
### # [22. Dell OpenManage Server Administrator Install (OMSA)](#목차)
\# 서버 자체에서 구동되며, 장애가 발생한 경우 상태를 확인하거나   
\# 오류 메세지를 메일로 발송 하는 기능을 구현 할 수 있습니다.   

#### # (Ubuntu16) dell repository 등록
\# Ubuntu (17.10 = artful // 16.04 = xenial // 14.04 = trusty)
\# http://linux.dell.com/repo/community/ubuntu/
\# Ubuntu 17 과 18 은 아직 linux.dell.com/repo  에 등록되어 있지 않으므로 16.04 와 동일하게 진행 합니다. (xenial)

```bash
cat LISR/Ubuntu16/Install_Dell_OMSA_Ubuntu.sh

bash LISR/Ubuntu16/Install_Dell_OMSA_Ubuntu.sh
```

```bash

# 과거 내용 입니다.
echo 'deb http://linux.dell.com/repo/community/ubuntu xenial openmanage'  >  \
 /etc/apt/sources.list.d/linux.dell.com.sources.list

gpg --keyserver pool.sks-keyservers.net --recv-key 1285491434D8786F
# ** 혹시 여기에서 오류가 발생하고 진행되지 않는 경우 nameserver 주소를 1.1.1.1 이나 8.8.8.8 로 바꾸고 재시도 합니다.

gpg -a --export 1285491434D8786F |  sudo apt-key add -


==================================== 최 신 =============================================

wget http://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc
# ** 최신 gpg key 발급 다운로드

apt-key add 0x1285491434D8786F.asc
# ** GPG Key 등록
```

#### # (Ubuntu) OMSA (srvadmin) 설치
```bash
apt-get  -y update    >>   dasan_log_update_dell_repo.txt  2>&1
```

```bash
tail dasan_log_update_dell_repo.txt

apt-get  -y  install srvadmin-all >> dasan_log_install_dell_OMSA.txt 2>&1
```

```bash
tail dasan_log_install_dell_OMSA.txt
```

#### # (Ubuntu 16, 18) Firewall 설정 (OMSA Web Access Port 개방)
```bash
ufw status numbered
ufw allow 1311/tcp  #1311 이 기본값 입니다.
ufw status numbered
```

#### # 잘 설치 되었는지 확인
```bash
systemctl start dataeng
systemctl start dsm_om_connsvc

/opt/dell/srvadmin/sbin/racadm getsysinfo | grep "System Model\|Service Tag"
/opt/dell/srvadmin/sbin/omreport system alertlog | head
```

#### # 시스템이 시작될 때 관련 서비스가 실행 되도록 설정 (systemctl enable)
```bash
systemctl enable dataeng
systemctl enable dsm_om_connsvc
```

\# 참조 omconfig  Manual   
\# http://topics-cdn.dell.com/pdf/dell-openmanage-server-administrator-v8.3_user%27s%20guide_en-us.pdf


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

#### # For Ubuntu 16.04
```bash
cat /root/LISR/Ubuntu16/Install_Dell_MSM_Ubuntu.sh

bash /root/LISR/Ubuntu16/Install_Dell_MSM_Ubuntu.sh
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

#### # idrac 시간 설정 , Web page 이름
```bash
racadm set iDRAC.Time.Timezone Asia/Seoul

racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}')

```

***


***
## end.
