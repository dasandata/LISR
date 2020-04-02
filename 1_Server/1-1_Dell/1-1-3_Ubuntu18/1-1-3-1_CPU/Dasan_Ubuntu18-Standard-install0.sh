#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo -e  "==================== Repository ===================="

echo ""
echo -e  "${PROMPT} cat /etc/apt/sources.list | grep -v \"#\|^$\" " >> /root/dasan_install_log.txt
cat /etc/apt/sources.list  |  grep -v "#\|^$"
echo "  기본 저장소 확인 "

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list \033[0m" >> /root/dasan_install_log.txt
perl -pi -e 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

echo ""
echo ""

echo -e  "${PROMPT} perl -pi -e 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list " >> /root/dasan_install_log.txt
perl -pi -e 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
echo "  Security 부분 변경 "

echo ""
echo ""

echo -e  "${PROMPT} cat /etc/apt/sources.list | grep -v \"#\|^$\" " >> /root/dasan_install_log.txt
cat /etc/apt/sources.list  |  grep -v "#\|^$"
echo "  변경 내용 확인 "

echo ""
echo ""

echo -e  "${PROMPT} apt-get update " >> /root/dasan_install_log.txt
apt-get update  >> /root/log.txt

tail -5 /root/log.txt

echo "  적용 하기 "

echo ""
echo ""

sleep 10

echo ""

echo -e  "${PROMPT} apt-get install -y python-dev python3-dev " >> /root/dasan_install_log.txt
apt-get install -y python-dev python3-dev >> /root/log.txt

tail -5 /root/log.txt

echo ""
echo ""

echo "  서버 시간 동기화. "
echo -e  "${PROMPT} rdate  -s  time.bora.net " >> /root/dasan_install_log.txt
rdate  -s  time.bora.net
echo ""

echo -e  "${PROMPT} hwclock --systohc " >> /root/dasan_install_log.txt
hwclock --systohc
echo ""

echo -e  "${PROMPT} date " >> /root/dasan_install_log.txt
date
echo ""

echo -e  "${PROMPT} hwclock " >> /root/dasan_install_log.txt
hwclock
echo ""

echo ""
echo ""


sleep 10

echo ""

echo -e  "==================== Profile Settings ===================="

echo ""
echo "  기본 alias "

echo ""
echo -e  "${PROMPT} echo " "  >> /etc/profile " >> /root/dasan_install_log.txt
echo " "  >> /etc/profile

echo ""
echo -e  "${PROMPT} echo "add by dasandata"             >>   /etc/profile " >> /root/dasan_install_log.txt
echo "# add by dasandata"             >>   /etc/profile

echo ""
echo -e  "${PROMPT} echo "alias vi='vim' "                        >>   /etc/profile " >> /root/dasan_install_log.txt
echo "alias vi='vim' "                        >>   /etc/profile

echo ""
echo -e  "${PROMPT} echo "alias ls='ls --color=auto' "       >>   /etc/profile " >> /root/dasan_install_log.txt
echo "alias ls='ls --color=auto' "       >>   /etc/profile

echo ""
echo -e  "${PROMPT} echo "alias ll='ls -lh' "                        >>   /etc/profile " >> /root/dasan_install_log.txt
echo "alias ll='ls -lh' "                        >>   /etc/profile

echo ""
echo -e  "${PROMPT} echo "alias grep='grep --color=auto' "   >>   /etc/profile " >> /root/dasan_install_log.txt
echo "alias grep='grep --color=auto' "   >>   /etc/profile

echo ""
echo ""

echo " 히스토리 출력 날짜가 표시 되도록 변경 "
echo ""
echo -e  "${PROMPT} echo " "  >> /etc/profile " >> /root/dasan_install_log.txt
echo " "  >> /etc/profile

echo ""
echo -e  "${PROMPT} echo " Add timestamp to .bash_history "  >> /etc/profile " >> /root/dasan_install_log.txt
echo "# Add timestamp to .bash_history "  >> /etc/profile

echo ""
echo -e  "${PROMPT} echo 'export HISTTIMEFORMAT="20%y/%m/%d %T "' >> /etc/profile " >> /root/dasan_install_log.txt
echo 'export HISTTIMEFORMAT="20%y/%m/%d %T "' >> /etc/profile

echo ""
echo -e  "${PROMPT} echo " "  >> /etc/profile " >> /root/dasan_install_log.txt
echo " "  >> /etc/profile

echo ""
echo ""

echo " root 와 user 의 프롬프트 색상을 다르게 설정. "
echo ""
echo -e  "${PROMPT} echo "export PS1='\[\e[1;46;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc " >> /root/dasan_install_log.txt
echo "export PS1='\[\e[1;46;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc

echo ""
echo -e  "${PROMPT} tail -1 /root/.bashrc " >> /root/dasan_install_log.txt
tail -1 /root/.bashrc

echo ""
echo ""
echo -e  "${PROMPT} echo "export PS1='\[\e[1;47;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/sonic/.bashrc " >> /root/dasan_install_log.txt
echo "export PS1='\[\e[1;47;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/sonic/.bashrc

echo ""
echo -e  "${PROMPT} tail -1 /home/sonic/.bashrc " >> /root/dasan_install_log.txt
tail -1 /home/sonic/.bashrc

echo ""
echo ""

echo "  적용확인. "
echo -e  "${PROMPT} tail -10 /etc/profile " >> /root/dasan_install_log.txt
tail -10 /etc/profile

echo ""
echo -e  "${PROMPT} source  /etc/profile " >> /root/dasan_install_log.txt
source  /etc/profile

echo ""
echo -e  "${PROMPT} source  .bashrc " >> /root/dasan_install_log.txt
source  .bashrc

echo ""
echo -e  "${PROMPT} echo $HISTSIZE " >> /root/dasan_install_log.txt
echo $HISTSIZE

echo ""


sleep 10

echo -e  "==================== Hardware Spec ===================="

echo ""

echo -e "### Start to Check Hardware Spec.... "
echo " "
echo -e  "=== System ==="
echo -e  "${PROMPT} dmidecode --type system | grep -v \"^$\|#\|SMBIOS\|Handle\|Not\" "
dmidecode --type system | grep -v "^$\|#\|SMBIOS\|Handle\|Not"

echo " "
echo -e  "=== CPU ==="
echo -e  "${PROMPT} lscpu | grep -v \"Flags\|NUMA\"  "
lscpu | grep -v "Flags\|NUMA"

echo " "
echo -e  "${PROMPT} cat /proc/cpuinfo | head "
cat /proc/cpuinfo | head

echo " "
echo -e  "=== Memory Device ==="
echo -e "${PROMPT} dmidecode --type 16 | grep -v \"dmidecode\|SMBIOS\|Handle\" "
dmidecode --type 16 | grep -v "dmidecode\|SMBIOS\|Handle"

echo " "
echo -e "${PROMPT} dmidecode --type memory | grep \"Number Of Devices\|Size\|Locator\|Clock\|DDR\|Rank\" | grep -v \"No\|Unknown\"  "
dmidecode --type memory | grep "Number Of Devices\|Size\|Locator\|Clock\|DDR\|Rank" | grep -v "No\|Unknown"

echo " "
echo -e "${PROMPT} dmidecode --type memory  | grep Size | grep -v No | wc -l "
dmidecode --type memory  | grep Size | grep -v No | wc -l

echo " "
echo -e "${PROMPT} dmidecode --type memory  | grep Size | grep -v No | grep -c MB "
dmidecode --type memory  | grep Size | grep -v No | grep -c MB

echo " "
echo -e "${PROMPT} cat /proc/meminfo | grep MemTotal "
cat /proc/meminfo | grep MemTotal

echo " "
echo -e "${PROMPT} free -m "
free -m

echo " "
echo -e "${PROMPT} free -h "
free -h

echo " "
echo -e  "=== Pci Device ==="
echo -e "${PROMPT} lspci \| grep -i vga "
lspci | grep -i vga

echo " "
echo -e "${PROMPT} lspci \| grep -i nvidia "
lspci | grep -i nvidia

echo " "
echo -e "${PROMPT} lspci \| grep -i raid "
lspci | grep -i raid

echo " "
echo -e "${PROMPT} dmidecode \| grep NIC "
dmidecode | grep NIC

echo " "
echo -e "${PROMPT} lspci \| grep -i communication "
lspci | grep -i communication

echo " "
echo -e "${PROMPT} dmesg \| grep NIC "
dmesg | grep NIC

echo " "
echo -e  "=== Power Supply ==="
echo -e "${PROMPT} dmidecode --type 39  \| grep \"System\|Name:\|Capacity\"  "
dmidecode --type 39  | grep "System\|Name:\|Capacity"

echo " "
echo -e  "=== Disk "&" Partition ==="
echo -e "${PROMPT} lsblk "
lsblk

echo " "
echo -e "${PROMPT} blkid "
blkid

echo " "
echo -e "${PROMPT} cat /etc/fstab \| grep -v \"#\|^$\" "
cat /etc/fstab | grep -v "#\|^$"

echo " "
echo -e "${PROMPT} df -hT \| grep -v tmpfs "
df -hT | grep -v tmpfs

echo " "
echo -e  "=== O/S ==="
echo -e "${PROMPT} cat /etc/*-release "
cat /etc/*-release

echo " "
echo -e "${PROMPT} uname -a "
uname -a

echo " "
echo -e  "=== END / 하드웨어 사양 확인 끝 ==="
echo " "

# End of file.

echo ""


sleep 10

echo ""

echo -e  "==================== Network info ===================="

echo ""

echo -e  "${PROMPT} ip a " >> /root/dasan_install_log.txt
ip a
echo ""
echo -e  "${PROMPT} EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2 |tr -d ' ') " >> /root/dasan_install_log.txt
EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2 |tr -d ' ')
echo ""
echo -e  "${PROMPT} echo ${EXT_NIC}  # 추출된 인터페이스 명이 맞는지 확인 필요. " >> /root/dasan_install_log.txt
echo ${EXT_NIC}

echo ""
echo ""

echo -e  "${PROMPT} cat /etc/netplan/01-netcfg.yaml " >> /root/dasan_install_log.txt
cat /etc/netplan/01-netcfg.yaml
echo ""
echo -e  "${PROMPT} cat /etc/hostname " >> /root/dasan_install_log.txt
cat /etc/hostname
echo ""
echo -e  "${PROMPT} cat /etc/resolv.conf " >> /root/dasan_install_log.txt
cat /etc/resolv.conf
echo ""
echo -e  "${PROMPT} ping -c 4 google.com " >> /root/dasan_install_log.txt
ping -c 4 google.com
echo ""


sleep 10

echo ""

echo -e  "==================== Desktop install ===================="

echo ""

echo " 데스크탑 GUI Disable "
echo ""
echo -e  "${PROMPT} systemctl get-default # 부팅시 정보 확인 " >> /root/dasan_install_log.txt
systemctl get-default

echo ""
echo -e  "${PROMPT} systemctl set-default multi-user.target # 부팅시 터미널 모드 변경 " >> /root/dasan_install_log.txt
systemctl set-default multi-user.target

echo ""
echo -e  "${PROMPT} systemctl get-default # 변경 정보 확인 " >> /root/dasan_install_log.txt
systemctl get-default

echo " ubuntu desktop 설치 "
echo ""
echo -e  "${PROMPT} apt-get -y install ubuntu-desktop dconf-editor gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal " >> /root/dasan_install_log.txt
apt-get -y install ubuntu-desktop dconf-editor gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal >> /root/log.txt

tail  /root/log.txt

echo ""
echo -e  "${PROMPT} bash /root/LISR/common/dasan_daemon_disable.sh " >> /root/dasan_install_log.txt
bash /root/LISR/common/dasan_daemon_disable.sh

echo ""
echo ""


sleep 10

echo ""

echo -e  "==================== Ssh Firewall Settings ===================="

echo ""

echo " ssh port 를 7777로 변경하고, ssh를 통한 Root Login을 거부 한 후 "
echo " 변경된 포트에 맞게 방화벽을 설정한 합니다. "
echo " X11 Forwading 에 필요한 설정을 추가 합니다. "

echo ""
echo -e  "${PROMPT} systemctl status ufw " >> /root/dasan_install_log.txt
systemctl status ufw

echo ""
echo -e  "${PROMPT} ufw status " >> /root/dasan_install_log.txt
ufw status

echo ""
echo -e  "${PROMPT} yes | ufw enable " >> /root/dasan_install_log.txt
yes | ufw enable

echo ""

echo " 기본 정책을 차단 (deny) 로 변경한 후 필요한 포트 (또는 서비스) 만 허용. "

echo ""
echo -e  "${PROMPT} ufw status " >> /root/dasan_install_log.txt
ufw status

echo ""
echo -e  "${PROMPT} ufw default deny " >> /root/dasan_install_log.txt
ufw default deny

echo ""
echo -e  "${PROMPT} ufw allow 22/tcp " >> /root/dasan_install_log.txt
ufw allow 22/tcp

echo ""
echo -e  "${PROMPT} ufw allow 7777/tcp " >> /root/dasan_install_log.txt
ufw allow 7777/tcp

echo ""
echo -e  "${PROMPT} ufw status numbered " >> /root/dasan_install_log.txt
ufw status numbered

echo ""
echo " sshd 설정. (기본 포트인 22번을 7777로 변경) "
echo ""

echo " Ubuntu18 sshd_config "
echo ""
echo -e  "${PROMPT} grep 'Root\|Port' /etc/ssh/sshd_config " >> /root/dasan_install_log.txt
grep 'Root\|Port' /etc/ssh/sshd_config

echo ""
echo -e  "${PROMPT} perl -pi -e "s/Port 22/Port 7777/g" /etc/ssh/sshd_config " >> /root/dasan_install_log.txt
perl -pi -e "s/#Port 22/Port 7777/g" /etc/ssh/sshd_config

echo ""
echo -e  "${PROMPT} perl -pi -e "s/PermitRootLogin prohibit-password/PermitRootLogin no/g" /etc/ssh/sshd_config " >> /root/dasan_install_log.txt
perl -pi -e "s/PermitRootLogin prohibit-password/PermitRootLogin no/g" /etc/ssh/sshd_config

echo ""
echo -e  "${PROMPT} grep 'Root\|Port' /etc/ssh/sshd_config " >> /root/dasan_install_log.txt
grep 'Root\|Port' /etc/ssh/sshd_config

echo ""
echo ""

echo " X11Forwarding 을 위해 AddressFamily inet 을 추가 합니다. "

echo ""
echo -e  "${PROMPT} echo "AddressFamily inet" >> /etc/ssh/sshd_config " >> /root/dasan_install_log.txt
echo "AddressFamily inet" >> /etc/ssh/sshd_config

echo ""
echo -e  "${PROMPT} grep AddressFamily /etc/ssh/sshd_config " >> /root/dasan_install_log.txt
grep AddressFamily /etc/ssh/sshd_config
echo ""

echo -e  "${PROMPT} systemctl restart sshd " >> /root/dasan_install_log.txt
systemctl restart sshd

echo ""


sleep 10

echo ""

echo -e  "==================== Useradd ===================="

echo ""

echo " 새로운 사용자를 추가하고, sudo 권한을 부여 합니다. "

echo ""
echo ""

echo -e  "${PROMPT} NEW_USER=dasan " >> /root/dasan_install_log.txt
NEW_USER=dasan

echo ""
echo -e  "${PROMPT} echo ${NEW_USER}" >> /root/dasan_install_log.txt
echo ${NEW_USER}

echo ""
echo -e  "${PROMPT} adduser --disabled-login --gecos "" ${NEW_USER} " >> /root/dasan_install_log.txt
adduser --disabled-login --gecos "" ${NEW_USER}
echo ""

echo " 관리자로 전환될 수 있도록, 새 사용자를 wheel 그룹에 포함. "

echo ""
echo -e  "${PROMPT} grep ${NEW_USER} /etc/group " >> /root/dasan_install_log.txt
grep ${NEW_USER} /etc/group

echo ""
echo -e  "${PROMPT} usermod -G sudo ${NEW_USER} " >> /root/dasan_install_log.txt
usermod -G sudo ${NEW_USER}

echo ""
echo -e  "${PROMPT} grep ${NEW_USER} /etc/group " >> /root/dasan_install_log.txt
grep ${NEW_USER} /etc/group

echo ""

echo " passwd dasan 입력하여 패스워드 설정 후 su - dasan 접속하여 테스트 "

echo ""

sleep 10

echo ""

echo -e  "==================== Grub Settings ===================="

echo ""

echo "  부팅시 화면에 부팅로그 표시되도록 grub 수정 , 불필요한 ipv6를 비활성화 "
echo -e  "${PROMPT} ip a | grep inet6 " >> /root/dasan_install_log.txt
ip a | grep inet6

echo ""
echo ""

echo "  설정 변경 "
echo -e  "${PROMPT} cat /etc/default/grub | grep -v #\|^$ " >> /root/dasan_install_log.txt
cat /etc/default/grub | grep -v "#\|^$"

echo ""
echo ""

echo "  부팅시 화면에 부팅로그가 표시 되도록 rhgb 항목 지움 "
echo -e  "${PROMPT} perl -pi -e 's/splash//' /etc/default/grub " >> /root/dasan_install_log.txt
perl -pi -e 's/splash//' /etc/default/grub

echo ""
echo "  부팅시 화면에 부팅로그가 표시 되도록 quiet 항목 지움 "
echo -e  "${PROMPT} perl -pi -e 's/quiet//'  /etc/default/grub " >> /root/dasan_install_log.txt
perl -pi -e 's/quiet//'  /etc/default/grub

echo ""
echo ""

echo "  ipv6 비활성 "
echo -e  "${PROMPT} perl -pi -e  's/^GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /'  /etc/default/grub " >> /root/dasan_install_log.txt
perl -pi -e  's/^GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /'  /etc/default/grub

echo ""

echo "  timeout 옵션 해제 "
echo -e  "${PROMPT} perl -pi -e  's/^GRUB_HIDDEN_TIMEOUT=/#GRUB_HIDDEN_TIMEOUT=/'  /etc/default/grub " >> /root/dasan_install_log.txt
perl -pi -e  's/^GRUB_HIDDEN_TIMEOUT=/#GRUB_HIDDEN_TIMEOUT=/'  /etc/default/grub

echo ""

echo "  변경 사항 확인 "
echo -e  "${PROMPT} cat /etc/default/grub | grep -v #\|^$ " >> /root/dasan_install_log.txt
cat /etc/default/grub | grep -v "#\|^$"

echo ""

echo "  boot kernel 에 설정 적용 "
echo -e  "${PROMPT} update-initramfs -u && update-grub2 " >> /root/dasan_install_log.txt
update-initramfs -u && update-grub2

echo ""
echo ""

echo "  rc.local 등록 "

echo ""
echo ""

echo -e  "${PROMPT} sed -i '2s/Dasan_Ubuntu18-Standard-install0.sh/Dasan_Ubuntu18-dell-package-Install.sh/g' /etc/rc.local    " >> /root/dasan_install_log.txt
sed -i '2s/Dasan_Ubuntu18-Standard-install0.sh/Dasan_Ubuntu18-dell-package-Install.sh/g' /etc/rc.local

echo -e  "${PROMPT} cat /etc/rc.local | sed -n 2p " >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 2p

echo ""

echo "  재부팅 "
echo -e  "${PROMPT} reboot " >> /root/dasan_install_log.txt
reboot
