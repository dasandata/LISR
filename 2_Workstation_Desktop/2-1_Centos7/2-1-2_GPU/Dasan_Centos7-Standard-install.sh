#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo " 재부팅 후 확인. "
echo ""
echo -e  "${PROMPT} getenforce       SELINUX 상태 확인. " >> /root/dasan_install_log.txt
getenforce

echo ""

echo -e  "${PROMPT} ip a | grep inet6       아무 결과가 없는 것이  ipv6 disable 이 잘 적용 된것 입니다. " >> /root/dasan_install_log.txt
ip a | grep inet6

echo ""
echo ""

echo -e  "==================== Utility Install ===================="
echo ""

echo -e  "${PROMPT} yum install -y vim pciutils openssh mlocate nfs-utils rdate xauth firefox nautilus wget ifconfig " >> /root/dasan_install_log.txt
echo -e  "${PROMPT} yum install -y tcsh tree lshw tmux git kernel-headers kernel-devel gcc make gcc-c++ " >> /root/dasan_install_log.txt
echo -e  "${PROMPT} yum install -y cmake python-devel ntfs-3g dstat perl perl-CPAN perl-core net-tools openssl-devel git-lfs " >> /root/dasan_install_log.txt
yum install -y vim pciutils openssh mlocate nfs-utils rdate xauth firefox nautilus wget ifconfig >> /root/log.txt

sleep 10

yum install -y tcsh tree lshw tmux git kernel-headers kernel-devel gcc make gcc-c++ figlet >> /root/log.txt

sleep 10

yum install -y cmake python-devel ntfs-3g dstat perl perl-CPAN perl-core net-tools openssl-devel git-lfs >> /root/log.txt

echo ""

echo " Development Tools 설치 "
echo ""
echo -e  "${PROMPT} yum grouplist " >> /root/dasan_install_log.txt
yum grouplist >> /root/log.txt

echo ""
echo -e  "${PROMPT} yum -y groups install "Development Tools" " >> /root/dasan_install_log.txt
yum -y groups install "Development Tools" >> /root/log.txt

echo ""
echo -e  "${PROMPT} yum -y install  glibc-static glibc-devel glibc-static libstdc++ libstdc++-devel " >> /root/dasan_install_log.txt
yum -y install  glibc-static glibc-devel glibc-static libstdc++ libstdc++-devel >> /root/log.txt

echo ""
echo -e  "${PROMPT} yum grouplist " >> /root/dasan_install_log.txt
yum grouplist >> /root/log.txt

echo ""
echo ""

echo " 인터넷 시간에 맞추어 서버의 시간 조정 "
echo ""
echo -e  "${PROMPT} rdate  -s  time.bora.net " >> /root/dasan_install_log.txt
rdate  -s  time.bora.net

echo ""
echo -e  "${PROMPT} clock --systohc " >> /root/dasan_install_log.txt
clock --systohc

echo ""
echo -e  "${PROMPT} date " >> /root/dasan_install_log.txt
date

echo ""
echo -e  "${PROMPT} hwclock " >> /root/dasan_install_log.txt
hwclock

echo ""
echo ""



echo " Centos EPEL(Extra Packages for Enterprise Linux) 저장소(Repository) 설치. "
echo ""
echo -e  "${PROMPT} yum repolist " >> /root/dasan_install_log.txt
yum repolist >> /root/log.txt

echo ""
echo -e  "${PROMPT} yum -y  install epel-release  " >> /root/dasan_install_log.txt
yum -y  install epel-release   >> /root/log.txt

echo ""
echo -e  "${PROMPT} sed -i -e "s/\]$/\]\npriority=5/g" /etc/yum.repos.d/epel.repo  " >> /root/dasan_install_log.txt
sed -i -e "s/\]$/\]\npriority=5/g" /etc/yum.repos.d/epel.repo

echo ""
echo -e  "${PROMPT} yum -y  install yum-plugin-priorities   " >> /root/dasan_install_log.txt
yum -y  install yum-plugin-priorities   >> /root/log.txt

echo ""
echo -e  "${PROMPT} sed -i -e "s/\]$/\]\npriority=1/g" /etc/yum.repos.d/CentOS-Base.repo " >> /root/dasan_install_log.txt
sed -i -e "s/\]$/\]\npriority=1/g" /etc/yum.repos.d/CentOS-Base.repo

echo ""
echo -e  "${PROMPT} yum repolist " >> /root/dasan_install_log.txt
yum repolist

echo ""
echo ""

echo " epel 이 활성화 되어야 설치 되는 htop 을 설치하여 검증 "
echo ""
echo -e  "${PROMPT} rpm -qa | grep htop ntfs-3g 설치되었는지 확인 " >> /root/dasan_install_log.txt
rpm -qa | grep htop

echo ""
echo -e  "${PROMPT} yum -y  install htop ntfs-3g " >> /root/dasan_install_log.txt
yum -y  install htop ntfs-3g >> /root/log.txt

echo ""
echo ""

echo " kernel / kernel-header / kernel-devel 버젼 일치 확인 "
echo ""
echo -e  "${PROMPT} uname -r  현재 실행중인 커널 버젼 확인 " >> /root/dasan_install_log.txt
uname -r

echo ""

echo " 실행중인 커널과 동일한 버젼의 커널 패키지 (headers,devel) 가 설치 되어 있는지 확인. "
echo ""
echo -e  "${PROMPT} rpm -qa | grep $(uname -r) | grep 'headers\|devel' " >> /root/dasan_install_log.txt
rpm -qa | grep $(uname -r) | grep 'headers\|devel'

echo ""
echo ""

echo -e  "==================== Profile Settings ===================="
echo ""
echo ""

echo " 기본 alias. "
echo ""
echo -e  "${PROMPT} echo " "  >> /etc/profile " >> /root/dasan_install_log.txt
echo " "  >> /etc/profile

echo ""
echo -e  "${PROMPT} echo " add by dasandata"             >>   /etc/profile " >> /root/dasan_install_log.txt
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

echo ""
echo "  히스토리 출력시 날짜가 표시 되도록 변경 "

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

echo ""
echo "  root 와 user 의 프롬프트 색상을 다르게 설정. "

echo ""
echo -e  "${PROMPT} echo "export PS1='\[\e[1;46;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc " >> /root/dasan_install_log.txt
echo "export PS1='\[\e[1;46;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc

echo ""
echo -e  "${PROMPT} tail -1 /root/.bashrc " >> /root/dasan_install_log.txt
tail -1 /root/.bashrc

echo ""
echo -e  "${PROMPT} echo "export PS1='\[\e[1;47;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/sonic/.bashrc " >> /root/dasan_install_log.txt
echo "export PS1='\[\e[1;47;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/sonic/.bashrc

echo ""
echo -e  "${PROMPT} tail -1 /home/sonic/.bashrc " >> /root/dasan_install_log.txt
tail -1 /home/sonic/.bashrc

echo ""
echo ""

echo ""
echo "  적용확인. "

echo ""
echo -e  "${PROMPT} tail -10 /etc/profile " >> /root/dasan_install_log.txt
tail -10 /etc/profile

echo ""
echo -e  "${PROMPT} source  /etc/profile " >> /root/dasan_install_log.txt
source  /etc/profile

echo ""
echo -e  "${PROMPT} echo $HISTSIZE " >> /root/dasan_install_log.txt
echo $HISTSIZE

echo ""
echo -e  "${PROMPT} source  /root/.bashrc " >> /root/dasan_install_log.txt
source  /root/.bashrc

echo ""
echo ""

sleep 10

echo -e  "==================== Hardware Spec ===================="

echo ""

echo -e "### Start to Check Hardware Spec.... "
echo " "
echo -e  "=== System ==="
echo -e  "${PROMPT} dmidecode --type system | grep -v \"^$\|#\|SMBIOS\|Handle\|Not\""
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
echo -e "${PROMPT} dmidecode --type memory  | grep Size | grep -v No | grep -c GB "
dmidecode --type memory  | grep Size | grep -v No | grep -c GB

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
echo -e  "=== Disk & Partition ==="
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
echo ""

echo -e  "==================== Network info ===================="

echo ""
echo -e  "${PROMPT} ip a " >> /root/dasan_install_log.txt
ip a

echo ""
echo -e  "${PROMPT} EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2 |tr -d ' ') " >> /root/dasan_install_log.txt
EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2 |tr -d ' ')

echo ""
echo -e  "${PROMPT} echo ${EXT_NIC} " >> /root/dasan_install_log.txt
echo ${EXT_NIC}

echo ""
echo -e  "${PROMPT} ifconfig  ${EXT_NIC} " >> /root/dasan_install_log.txt
ifconfig  ${EXT_NIC}

echo ""
echo -e  "${PROMPT} sed -i '/IPV6/d' /etc/sysconfig/network-scripts/ifcfg-${EXT_NIC} " >> /root/dasan_install_log.txt
sed -i '/IPV6/d' /etc/sysconfig/network-scripts/ifcfg-${EXT_NIC}

echo ""
echo -e  "${PROMPT} cat /etc/sysconfig/network-scripts/ifcfg-${EXT_NIC} " >> /root/dasan_install_log.txt
cat /etc/sysconfig/network-scripts/ifcfg-${EXT_NIC}

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
echo ""

echo -e  "==================== Desktop install ===================="

echo " 기본 부팅 모드 확인 "
echo ""
echo -e  "${PROMPT} systemctl get-default " >> /root/dasan_install_log.txt
systemctl get-default

echo ""
echo ""

echo " GNOME Desktop 설치 "
echo ""
echo -e  "${PROMPT} yum -y  groups install "GNOME Desktop" " >> /root/dasan_install_log.txt
yum -y  groups install "GNOME Desktop"  >> /root/log.txt

echo ""
echo ""

echo " 현재 구동중인 Demon list 확인 "
echo ""
echo -e  "${PROMPT} systemctl list-unit-files  -t service  | grep enable " >> /root/dasan_install_log.txt
systemctl list-unit-files  -t service  | grep enable

echo ""
echo ""

echo " Daemon Disable 스크립트 실행. "
echo ""
echo -e  "${PROMPT} cat /root/LISR/common/dasan_daemon_disable.sh " >> /root/dasan_install_log.txt
cat /root/LISR/common/dasan_daemon_disable.sh

echo ""
echo ""

echo ""
echo -e  "${PROMPT} bash /root/LISR/common/dasan_daemon_disable.sh " >> /root/dasan_install_log.txt
bash /root/LISR/common/dasan_daemon_disable.sh

echo ""


echo ""
echo ""
echo -e  "==================== Ssh Firewall Settings ===================="

echo " ssh port 를 7777로 변경하고, ssh를 통한 Root Login을 거부 한 후 "
echo " 변경된 포트에 맞게 방화벽을 설정한 합니다. "
echo " X11 Forwading 에 필요한 설정을 추가 합니다. "

echo " 방화벽 (Firewall) 설정. "

echo ""
echo -e  "${PROMPT} ip a " >> /root/dasan_install_log.txt
ip a

echo ""
echo -e  "${PROMPT} EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2 |tr -d ' ') " >> /root/dasan_install_log.txt
EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2 |tr -d ' ')

echo ""
echo -e  "${PROMPT} echo ${EXT_NIC} " >> /root/dasan_install_log.txt
echo ${EXT_NIC}

echo ""
echo -e  "${PROMPT} ifconfig ${EXT_NIC} " >> /root/dasan_install_log.txt
ifconfig ${EXT_NIC}

echo ""
echo -e  "${PROMPT} firewall-cmd --get-zones 설정가능 한 zone 목록 확인 " >> /root/dasan_install_log.txt
firewall-cmd --get-zones

echo ""
echo -e  "${PROMPT} firewall-cmd --list-all 현재 설정 확인 " >> /root/dasan_install_log.txt
firewall-cmd --list-all

echo ""
echo -e  "${PROMPT} firewall-cmd --get-default-zone 현재 설정 확인 " >> /root/dasan_install_log.txt
firewall-cmd --get-default-zone

echo ""
echo ""

echo " 외부 인터페이스를 external 존 으로 변경. "

echo ""

echo ""
echo -e  "${PROMPT} firewall-cmd --change-interface=${EXT_NIC} --zone=external --permanent " >> /root/dasan_install_log.txt
firewall-cmd --change-interface=${EXT_NIC} --zone=external --permanent

echo ""
echo ""

echo ""
echo -e  "${PROMPT} firewall-cmd --set-default-zone=external 기본 zone 을 external 로 변경 " >> /root/dasan_install_log.txt
firewall-cmd --set-default-zone=external

echo ""
echo -e  "${PROMPT} firewall-cmd --reload  변경 사항 적용 " >> /root/dasan_install_log.txt
firewall-cmd --reload

echo ""
echo -e  "${PROMPT} firewall-cmd --add-port=7777/tcp  --permanent  7777 포트 개방 " >> /root/dasan_install_log.txt
firewall-cmd --add-port=7777/tcp  --permanent

echo ""
echo -e  "${PROMPT} firewall-cmd --remove-service=ssh  --permanent  포트 폐쇄 " >> /root/dasan_install_log.txt
firewall-cmd --remove-service=ssh  --permanent

echo ""
echo -e  "${PROMPT} firewall-cmd --reload  변경 사항 적용 " >> /root/dasan_install_log.txt
firewall-cmd --reload

echo ""
echo -e  "${PROMPT} firewall-cmd --list-all  변경된 설정 내용 확인 " >> /root/dasan_install_log.txt
firewall-cmd --list-all


echo ""
echo ""

echo " sshd 설정 "

echo ""
echo ""

echo ""
echo -e  "${PROMPT} grep 'Root\|Port' /etc/ssh/sshd_config   변경 전 설정 확인. " >> /root/dasan_install_log.txt
grep 'Root\|Port' /etc/ssh/sshd_config

echo ""
echo -e  "${PROMPT} sed -i  "s/Port 22/Port 7777/g" /etc/ssh/sshd_config   포트 변경 " >> /root/dasan_install_log.txt
sed -i  "s/#Port 22/Port 7777/g" /etc/ssh/sshd_config

echo ""
echo ""

echo " Root 로그인 거부 설정 "

echo ""
echo ""

echo ""
echo -e  "${PROMPT} sed -i  "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config " >> /root/dasan_install_log.txt
sed -i  "s/#PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config

echo ""
echo -e  "${PROMPT} grep 'Root\|Port' /etc/ssh/sshd_config  # 변경 후 설정 확인. " >> /root/dasan_install_log.txt
grep 'Root\|Port' /etc/ssh/sshd_config

echo ""
echo -e  "${PROMPT} echo "AddressFamily inet" >> /etc/ssh/sshd_config  # X11 Forwading 관련 설정 추가. " >> /root/dasan_install_log.txt
echo "AddressFamily inet" >> /etc/ssh/sshd_config

echo ""
echo -e  "${PROMPT} grep AddressFamily /etc/ssh/sshd_config " >> /root/dasan_install_log.txt
grep AddressFamily /etc/ssh/sshd_config

echo ""
echo -e  "${PROMPT} systemctl restart sshd  # ssh 데몬 재시작. " >> /root/dasan_install_log.txt
systemctl restart sshd

echo ""


sleep 10

echo ""
echo ""

echo -e  "==================== Useradd ===================="

echo " 새로운 사용자를 추가하고, sudo 권한을 부여 합니다. "

echo ""
echo ""

echo -e  "${PROMPT} NEW_USER=dasan " >> /root/dasan_install_log.txt
NEW_USER=dasan

echo ""
echo -e  "${PROMPT} echo ${NEW_USER}" >> /root/dasan_install_log.txt
echo ${NEW_USER}

echo ""
echo -e  "${PROMPT} useradd ${NEW_USER} " >> /root/dasan_install_log.txt
useradd ${NEW_USER}
echo ""

echo " 관리자로 전환될 수 있도록, 새 사용자를 wheel 그룹에 포함. "

echo ""
echo -e  "${PROMPT} grep ${NEW_USER} /etc/group " >> /root/dasan_install_log.txt
grep ${NEW_USER} /etc/group

echo ""
echo -e  "${PROMPT} usermod -aG wheel ${NEW_USER} " >> /root/dasan_install_log.txt
usermod -aG wheel ${NEW_USER}

echo ""
echo -e  "${PROMPT} grep ${NEW_USER} /etc/group " >> /root/dasan_install_log.txt
grep ${NEW_USER} /etc/group

echo ""

echo " passwd dasan 입력하여 패스워드 설정 후 su - dasan 접속하여 테스트 "

sleep 10

echo ""
echo ""

echo "  rc.local 등록 "
echo -e  "${PROMPT} sed -i '13s/Dasan_Centos7-Standard-install.sh/Dasan_Centos7-nouveau.sh/g' /etc/rc.d/rc.local    " >> /root/dasan_install_log.txt
sed -i '13s/Dasan_Centos7-Standard-install.sh/Dasan_Centos7-nouveau.sh/g' /etc/rc.d/rc.local

echo -e  "${PROMPT} cat /etc/rc.d/rc.local  | sed -n 13p " >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 13p

echo " 재 부팅 "
echo -e  "${PROMPT} reboot  재 부팅 " >> /root/dasan_install_log.txt
reboot
