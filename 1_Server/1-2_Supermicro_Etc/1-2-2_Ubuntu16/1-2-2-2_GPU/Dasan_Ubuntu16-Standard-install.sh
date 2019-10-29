#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;32m"==================== Repository ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/apt/sources.list | grep -v \"#\|^$\" \033[0m" >> /root/dasan_install_log.txt
cat /etc/apt/sources.list  |  grep -v "#\|^$"
echo "  기본 저장소 확인 "

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list \033[0m" >> /root/dasan_install_log.txt
perl -pi -e 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
echo "  Security 부분 변경 "

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} cat /etc/apt/sources.list | grep -v \"#\|^$\" \033[0m" >> /root/dasan_install_log.txt
cat /etc/apt/sources.list  |  grep -v "#\|^$"
echo "  변경 내용 확인 "

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} apt-get update \033[0m" >> /root/dasan_install_log.txt
apt-get update  >>  dasan_log_ubuntu_repo_update.txt

tail -5 dasan_log_ubuntu_repo_update.txt

echo "  적용 하기 "

echo ""
echo ""

echo -e  "\033[1;32m"==================== Utility Install ===================="\033[0m"

echo ""

echo "  기본 유틸 설치. "
echo -e  "\033[1;34m${PROMPT} apt-get install -y vim nfs-common rdate xauth firefox gcc make ipmitool \033[0m" >> /root/dasan_install_log.txt
echo -e  "\033[1;34m${PROMPT} apt-get install -y locate htop tmux git wget \033[0m" >> /root/dasan_install_log.txt
echo -e  "\033[1;34m${PROMPT} apt-get install -y xfsprogs ntfs-3g aptitude lvm2 dstat curl smartmontools \033[0m" >> /root/dasan_install_log.txt
apt-get install -y vim nfs-common rdate xauth firefox gcc make locate htop tmux git wget ipmitool >> /root/dasan_install_log.txt 2>&1
apt-get install -y xfsprogs ntfs-3g aptitude lvm2 dstat curl smartmontools >> /root/dasan_install_log.txt 2>&1

echo ""
echo ""

sleep 10

echo ""

echo -e  "\033[1;34m${PROMPT} apt-get install -y  python-pip python3-pip  python3-tk \033[0m" >> /root/dasan_install_log.txt
apt-get install -y  python-pip python3-pip  python3-tk  >> /root/dasan_install_log.txt 2>&1

echo ""
echo ""

echo "  서버 시간 동기화. "
echo -e  "\033[1;34m${PROMPT} rdate  -s  time.bora.net \033[0m" >> /root/dasan_install_log.txt
rdate  -s  time.bora.net
echo ""

echo -e  "\033[1;34m${PROMPT} hwclock --systohc \033[0m" >> /root/dasan_install_log.txt
hwclock --systohc
echo ""

echo -e  "\033[1;34m${PROMPT} date \033[0m" >> /root/dasan_install_log.txt
date
echo ""

echo -e  "\033[1;34m${PROMPT} hwclock \033[0m" >> /root/dasan_install_log.txt
hwclock
echo ""

echo ""
echo ""


sleep 10

echo ""

echo -e  "\033[1;32m"==================== Profile Settings ===================="\033[0m"

echo ""
echo "  기본 alias "

echo ""
echo -e  "\033[1;34m${PROMPT} echo " "  >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo " "  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo "add by dasandata"             >>   /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo "# add by dasandata"             >>   /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo "alias vi='vim' "                        >>   /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo "alias vi='vim' "                        >>   /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo "alias ls='ls --color=auto' "       >>   /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo "alias ls='ls --color=auto' "       >>   /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo "alias ll='ls -lh' "                        >>   /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo "alias ll='ls -lh' "                        >>   /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo "alias grep='grep --color=auto' "   >>   /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo "alias grep='grep --color=auto' "   >>   /etc/profile

echo ""
echo ""

echo " 히스토리 출력 날짜가 표시 되도록 변경 "
echo ""
echo -e  "\033[1;34m${PROMPT} echo " "  >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo " "  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " Add timestamp to .bash_history "  >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo "# Add timestamp to .bash_history "  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo 'export HISTTIMEFORMAT="20%y/%m/%d %T "' >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo 'export HISTTIMEFORMAT="20%y/%m/%d %T "' >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " "  >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo " "  >> /etc/profile

echo ""
echo ""

echo " root 와 user 의 프롬프트 색상을 다르게 설정. "
echo ""
echo -e  "\033[1;34m${PROMPT} echo "export PS1='\[\e[1;46;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc \033[0m" >> /root/dasan_install_log.txt
echo "export PS1='\[\e[1;46;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc

echo ""
echo -e  "\033[1;34m${PROMPT} tail -1 /root/.bashrc \033[0m" >> /root/dasan_install_log.txt
tail -1 /root/.bashrc

echo ""
echo ""
echo -e  "\033[1;34m${PROMPT} echo "export PS1='\[\e[1;47;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/sonic/.bashrc \033[0m" >> /root/dasan_install_log.txt
echo "export PS1='\[\e[1;47;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/sonic/.bashrc

echo ""
echo -e  "\033[1;34m${PROMPT} tail -1 /home/sonic/.bashrc \033[0m" >> /root/dasan_install_log.txt
tail -1 /home/sonic/.bashrc

echo ""
echo ""

echo "  적용확인. "
echo -e  "\033[1;34m${PROMPT} tail -10 /etc/profile \033[0m" >> /root/dasan_install_log.txt
tail -10 /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} source  /etc/profile \033[0m" >> /root/dasan_install_log.txt
source  /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} source  .bashrc \033[0m" >> /root/dasan_install_log.txt
source  .bashrc

echo ""
echo -e  "\033[1;34m${PROMPT} echo $HISTSIZE \033[0m" >> /root/dasan_install_log.txt
echo $HISTSIZE

echo ""


sleep 10

echo -e  "\033[1;32m"==================== Hardware Spec ===================="\033[0m"

echo ""

echo -e "\033[1;32m"### Start to Check Hardware Spec.... "\033[0m"
echo " "
echo -e  "\033[1;32m"=== System ==="\033[0m"
echo -e  "\033[1;34m${PROMPT} dmidecode --type system | grep -v \"^$\|#\|SMBIOS\|Handle\|Not\" \033[0m"
dmidecode --type system | grep -v "^$\|#\|SMBIOS\|Handle\|Not"

echo " "
echo -e  "\033[1;32m"=== CPU ==="\033[0m"
echo -e  "\033[1;34m${PROMPT} lscpu | grep -v \"Flags\|NUMA\"  \033[0m"
lscpu | grep -v "Flags\|NUMA"

echo " "
echo -e  "\033[1;34m${PROMPT} cat /proc/cpuinfo | head \033[0m"
cat /proc/cpuinfo | head

echo " "
echo -e  "\033[1;32m"=== Memory Device ==="\033[0m"
echo -e "\033[1;34m${PROMPT} dmidecode --type 16 | grep -v \"dmidecode\|SMBIOS\|Handle\" \033[0m"
dmidecode --type 16 | grep -v "dmidecode\|SMBIOS\|Handle"

echo " "
echo -e "\033[1;34m${PROMPT} dmidecode --type memory | grep \"Number Of Devices\|Size\|Locator\|Clock\|DDR\|Rank\" | grep -v \"No\|Unknown\"  \033[0m"
dmidecode --type memory | grep "Number Of Devices\|Size\|Locator\|Clock\|DDR\|Rank" | grep -v "No\|Unknown"

echo " "
echo -e "\033[1;34m${PROMPT} dmidecode --type memory  | grep Size | grep -v No | wc -l \033[0m"
dmidecode --type memory  | grep Size | grep -v No | wc -l

echo " "
echo -e "\033[1;34m${PROMPT} dmidecode --type memory  | grep Size | grep -v No | grep -c MB \033[0m"
dmidecode --type memory  | grep Size | grep -v No | grep -c MB

echo " "
echo -e "\033[1;34m${PROMPT} cat /proc/meminfo | grep MemTotal \033[0m"
cat /proc/meminfo | grep MemTotal

echo " "
echo -e "\033[1;34m"${PROMPT} free -m "\033[0m"
free -m

echo " "
echo -e "\033[1;34m"${PROMPT} free -h "\033[0m"
free -h

echo " "
echo -e  "\033[1;32m"=== Pci Device ==="\033[0m"
echo -e "\033[1;34m"${PROMPT} lspci \| grep -i vga "\033[0m"
lspci | grep -i vga

echo " "
echo -e "\033[1;34m"${PROMPT} lspci \| grep -i nvidia "\033[0m"
lspci | grep -i nvidia

echo " "
echo -e "\033[1;34m"${PROMPT} lspci \| grep -i raid "\033[0m"
lspci | grep -i raid

echo " "
echo -e "\033[1;34m"${PROMPT} dmidecode \| grep NIC "\033[0m"
dmidecode | grep NIC

echo " "
echo -e "\033[1;34m"${PROMPT} lspci \| grep -i communication "\033[0m"
lspci | grep -i communication

echo " "
echo -e "\033[1;34m"${PROMPT} dmesg \| grep NIC "\033[0m"
dmesg | grep NIC

echo " "
echo -e  "\033[1;32m"=== Power Supply ==="\033[0m"
echo -e "\033[1;34m"${PROMPT} dmidecode --type 39  \| grep \"System\|Name:\|Capacity\"  "\033[0m"
dmidecode --type 39  | grep "System\|Name:\|Capacity"

echo " "
echo -e  "\033[1;32m"=== Disk "&" Partition ==="\033[0m"
echo -e "\033[1;34m"${PROMPT} lsblk "\033[0m"
lsblk

echo " "
echo -e "\033[1;34m"${PROMPT} blkid "\033[0m"
blkid

echo " "
echo -e "\033[1;34m"${PROMPT} cat /etc/fstab \| grep -v \"#\|^$\" "\033[0m"
cat /etc/fstab | grep -v "#\|^$"

echo " "
echo -e "\033[1;34m"${PROMPT} df -hT \| grep -v tmpfs "\033[0m"
df -hT | grep -v tmpfs

echo " "
echo -e  "\033[1;32m"=== O/S ==="\033[0m"
echo -e "\033[1;34m"${PROMPT} cat /etc/*-release "\033[0m"
cat /etc/*-release

echo " "
echo -e "\033[1;34m"${PROMPT} uname -a "\033[0m"
uname -a

echo " "
echo -e  "\033[1;32m"=== END / 하드웨어 사양 확인 끝 ==="\033[0m"
echo " "

# End of file.

echo ""


sleep 10

echo ""

echo -e  "\033[1;32m"==================== Network info ===================="\033[0m"

echo ""

echo -e  "\033[1;34m${PROMPT} ip a \033[0m" >> /root/dasan_install_log.txt
ip a
echo ""
echo -e  "\033[1;34m${PROMPT} EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2 |tr -d ' ') \033[0m" >> /root/dasan_install_log.txt
EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2 |tr -d ' ')
echo ""
echo -e  "\033[1;34m${PROMPT} echo ${EXT_NIC}  # 추출된 인터페이스 명이 맞는지 확인 필요. \033[0m" >> /root/dasan_install_log.txt
echo ${EXT_NIC}

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} ifconfig  ${EXT_NIC} \033[0m" >> /root/dasan_install_log.txt
ifconfig  ${EXT_NIC}
echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/network/interfaces \033[0m" >> /root/dasan_install_log.txt
cat /etc/network/interfaces
echo ""

echo -e  "\033[1;34m${PROMPT} cat /etc/hostname \033[0m" >> /root/dasan_install_log.txt
cat /etc/hostname
echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/resolv.conf \033[0m" >> /root/dasan_install_log.txt
cat /etc/resolv.conf
echo ""
echo -e  "\033[1;34m${PROMPT} ping -c 4 google.com \033[0m" >> /root/dasan_install_log.txt
ping -c 4 google.com
echo ""


sleep 10

echo ""

echo -e  "\033[1;32m"==================== Desktop install ===================="\033[0m"

echo ""

echo " 데스크탑 GUI Disable "
echo ""
echo -e  "\033[1;34m${PROMPT} systemctl get-default # 부팅시 정보 확인 \033[0m" >> /root/dasan_install_log.txt
systemctl get-default

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl set-default multi-user.target # 부팅시 터미널 모드 변경 \033[0m" >> /root/dasan_install_log.txt
systemctl set-default multi-user.target

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl get-default # 변경 정보 확인 \033[0m" >> /root/dasan_install_log.txt
systemctl get-default

echo " ubuntu desktop 설치 "
echo ""
echo -e  "\033[1;34m${PROMPT} apt-get -y install ubuntu-desktop gnome-panel gnome-settings-daemon  \033[0m" >> /root/dasan_install_log.txt
echo -e  "\033[1;34m${PROMPT} apt-get -y install metacity nautilus gnome-terminal \033[0m" >> /root/dasan_install_log.txt
apt-get -y install ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal  >> dasan_log_install_ubuntu-desktop.txt  2>&1

tail  dasan_log_install_ubuntu-desktop.txt

echo ""
echo " 현재 구동중인 Demon list 확인. "
echo -e  "\033[1;34m${PROMPT} systemctl list-unit-files  -t service  | grep enable \033[0m" >> /root/dasan_install_log.txt
systemctl list-unit-files  -t service  | grep enable

echo ""
echo " Daemon Disable 스크립트 실행. "
echo -e  "\033[1;34m${PROMPT} cat /root/LISR/common/dasan_ubuntu_daemon_disable.sh \033[0m" >> /root/dasan_install_log.txt
cat /root/LISR/common/dasan_ubuntu_daemon_disable.sh

echo ""
echo -e  "\033[1;34m${PROMPT} bash /root/LISR/common/dasan_ubuntu_daemon_disable.sh  \033[0m" >> /root/dasan_install_log.txt
bash /root/LISR/common/dasan_ubuntu_daemon_disable.sh

echo ""

sleep 10

echo ""

echo -e  "\033[1;32m"==================== Ssh Firewall Settings ===================="\033[0m"

echo ""

echo " ssh port 를 7777로 변경하고, ssh를 통한 Root Login을 거부 한 후 "
echo " 변경된 포트에 맞게 방화벽을 설정한 합니다. "
echo " X11 Forwading 에 필요한 설정을 추가 합니다. "

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl status ufw \033[0m" >> /root/dasan_install_log.txt
systemctl status ufw

echo ""
echo -e  "\033[1;34m${PROMPT} ufw status \033[0m" >> /root/dasan_install_log.txt
ufw status

echo ""
echo -e  "\033[1;34m${PROMPT} yes | ufw enable \033[0m" >> /root/dasan_install_log.txt
yes | ufw enable

echo ""

echo " 기본 정책을 차단 (deny) 로 변경한 후 필요한 포트 (또는 서비스) 만 허용. "

echo ""
echo -e  "\033[1;34m${PROMPT} ufw status \033[0m" >> /root/dasan_install_log.txt
ufw status

echo ""
echo -e  "\033[1;34m${PROMPT} ufw default deny \033[0m" >> /root/dasan_install_log.txt
ufw default deny

echo ""
echo -e  "\033[1;34m${PROMPT} ufw allow 22/tcp \033[0m" >> /root/dasan_install_log.txt
ufw allow 22/tcp

echo ""
echo -e  "\033[1;34m${PROMPT} ufw allow 7777/tcp \033[0m" >> /root/dasan_install_log.txt
ufw allow 7777/tcp

echo ""
echo -e  "\033[1;34m${PROMPT} ufw status numbered \033[0m" >> /root/dasan_install_log.txt
ufw status numbered

echo ""
echo " sshd 설정. (기본 포트인 22번을 7777로 변경) "
echo ""

echo " Ubuntu16 sshd_config "
echo ""
echo -e  "\033[1;34m${PROMPT} grep 'Root\|Port' /etc/ssh/sshd_config \033[0m" >> /root/dasan_install_log.txt
grep 'Root\|Port' /etc/ssh/sshd_config

echo ""
echo -e  "\033[1;34m${PROMPT} perl -pi -e "s/Port 22/Port 7777/g" /etc/ssh/sshd_config \033[0m" >> /root/dasan_install_log.txt
perl -pi -e "s/Port 22/Port 7777/g" /etc/ssh/sshd_config

echo ""
echo -e  "\033[1;34m${PROMPT} perl -pi -e "s/PermitRootLogin prohibit-password/PermitRootLogin no/g" /etc/ssh/sshd_config \033[0m" >> /root/dasan_install_log.txt
perl -pi -e "s/PermitRootLogin prohibit-password/PermitRootLogin no/g" /etc/ssh/sshd_config

echo ""
echo -e  "\033[1;34m${PROMPT} grep 'Root\|Port' /etc/ssh/sshd_config \033[0m" >> /root/dasan_install_log.txt
grep 'Root\|Port' /etc/ssh/sshd_config

echo ""
echo ""

echo " X11Forwarding 을 위해 AddressFamily inet 을 추가 합니다. "

echo ""
echo -e  "\033[1;34m${PROMPT} echo "AddressFamily inet" >> /etc/ssh/sshd_config \033[0m" >> /root/dasan_install_log.txt
echo "AddressFamily inet" >> /etc/ssh/sshd_config

echo ""
echo -e  "\033[1;34m${PROMPT} grep AddressFamily /etc/ssh/sshd_config \033[0m" >> /root/dasan_install_log.txt
grep AddressFamily /etc/ssh/sshd_config
echo ""

echo -e  "\033[1;34m${PROMPT} systemctl restart sshd \033[0m" >> /root/dasan_install_log.txt
systemctl restart sshd

echo ""


sleep 10

echo ""

echo -e  "\033[1;32m"==================== Useradd ===================="\033[0m"

echo ""

echo " 새로운 사용자를 추가하고, sudo 권한을 부여 합니다. "

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} NEW_USER=dasan \033[0m" >> /root/dasan_install_log.txt
NEW_USER=dasan

echo ""
echo -e  "\033[1;34m${PROMPT} echo ${NEW_USER}\033[0m" >> /root/dasan_install_log.txt
echo ${NEW_USER}

echo ""
echo -e  "\033[1;34m${PROMPT} adduser --disabled-login --gecos "" ${NEW_USER} \033[0m" >> /root/dasan_install_log.txt
adduser --disabled-login --gecos "" ${NEW_USER}
echo ""

echo " 관리자로 전환될 수 있도록, 새 사용자를 wheel 그룹에 포함. "

echo ""
echo -e  "\033[1;34m${PROMPT} grep ${NEW_USER} /etc/group \033[0m" >> /root/dasan_install_log.txt
grep ${NEW_USER} /etc/group

echo ""
echo -e  "\033[1;34m${PROMPT} usermod -G sudo ${NEW_USER} \033[0m" >> /root/dasan_install_log.txt
usermod -G sudo ${NEW_USER}

echo ""
echo -e  "\033[1;34m${PROMPT} grep ${NEW_USER} /etc/group \033[0m" >> /root/dasan_install_log.txt
grep ${NEW_USER} /etc/group

echo ""

echo " passwd dasan 입력하여 패스워드 설정 후 su - dasan 접속하여 테스트 "

echo ""

sleep 10

echo ""

echo -e  "\033[1;32m"==================== Grub Settings ===================="\033[0m"

echo ""

echo "  부팅시 화면에 부팅로그 표시되도록 grub 수정 , 불필요한 ipv6를 비활성화 "
echo -e  "\033[1;34m${PROMPT} ip a | grep inet6 \033[0m" >> /root/dasan_install_log.txt
ip a | grep inet6

echo ""
echo ""

echo "  설정 변경 "
echo -e  "\033[1;34m${PROMPT} cat /etc/default/grub | grep -v #\|^$ \033[0m" >> /root/dasan_install_log.txt
cat /etc/default/grub | grep -v "#\|^$"

echo ""
echo ""

echo "  부팅시 화면에 부팅로그가 표시 되도록 rhgb 항목 지움 "
echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/splash//' /etc/default/grub \033[0m" >> /root/dasan_install_log.txt
perl -pi -e 's/splash//' /etc/default/grub

echo ""
echo "  부팅시 화면에 부팅로그가 표시 되도록 quiet 항목 지움 "
echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/quiet//'  /etc/default/grub \033[0m" >> /root/dasan_install_log.txt
perl -pi -e 's/quiet//'  /etc/default/grub

echo ""
echo ""

echo "  ipv6 비활성 "
echo -e  "\033[1;34m${PROMPT} perl -pi -e  's/^GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /'  /etc/default/grub \033[0m" >> /root/dasan_install_log.txt
perl -pi -e  's/^GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /'  /etc/default/grub

echo ""

echo "  timeout 옵션 해제 "
echo -e  "\033[1;34m${PROMPT} perl -pi -e  's/^GRUB_HIDDEN_TIMEOUT=/#GRUB_HIDDEN_TIMEOUT=/'  /etc/default/grub \033[0m" >> /root/dasan_install_log.txt
perl -pi -e  's/^GRUB_HIDDEN_TIMEOUT=/#GRUB_HIDDEN_TIMEOUT=/'  /etc/default/grub

echo ""

echo "  변경 사항 확인 "
echo -e  "\033[1;34m${PROMPT} cat /etc/default/grub | grep -v #\|^$ \033[0m" >> /root/dasan_install_log.txt
cat /etc/default/grub | grep -v "#\|^$"

echo ""

echo "  boot kernel 에 설정 적용 "
echo -e  "\033[1;34m${PROMPT} update-initramfs -u && update-grub2 \033[0m" >> /root/dasan_install_log.txt
update-initramfs -u && update-grub2

echo ""
echo ""

echo "  rc.local 등록 "
echo -e  "\033[1;34m${PROMPT} sed -i '14s/Dasan_Ubuntu16-Standard-install.sh/Dasan_Ubuntu16-nouveau.sh/g' /etc/rc.local   \033[0m" >> /root/dasan_install_log.txt
sed -i '14s/Dasan_Ubuntu16-Standard-install.sh/Dasan_Ubuntu16-nouveau.sh/g' /etc/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.local | sed -n 14p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 14p

echo "  재부팅 "
echo -e  "\033[1;34m${PROMPT} reboot \033[0m" >> /root/dasan_install_log.txt
reboot
