#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " 원격 접속을 위한 VNC Server를 구성 합니다. "

echo ""
echo -e  "\033[1;34m${PROMPT} cp LISR/Ubuntu18/Dasan_Ubuntu18-VNC-user-install.sh /home/sonic \033[0m" >> Dasan_command.txt
cp LISR/Ubuntu18/Dasan_Ubuntu18-VNC-user-install.sh /home/sonic

echo ""
echo -e  "\033[1;34m${PROMPT} dpkg --list | grep   vnc 현재 설치된 vnc 패키지 확인 \033[0m" >> Dasan_command.txt
dpkg --list | grep vnc
echo ""
echo -e  "\033[1;34m${PROMPT} apt-get install -y vnc4server xfce4 xfce4-goodies \033[0m" >> Dasan_command.txt
apt-get install -y vnc4server xfce4 xfce4-goodies   >>  dasan_log_install_vnc.txt 2>&1
tail dasan_log_install_vnc.txt
echo ""

echo ""
echo ""

echo " VNC 연결을 위한 방화벽 (firewall 설정) "
echo ""
echo -e  "\033[1;34m${PROMPT} ufw status \033[0m" >> Dasan_command.txt
ufw status
echo ""
echo -e  "\033[1;34m${PROMPT} ufw allow 5900:5910/tcp \033[0m" >> Dasan_command.txt
ufw allow 5900:5910/tcp
echo ""
echo ""
echo -e  "\033[1;34m${PROMPT} ufw status \033[0m" >> Dasan_command.txt
ufw status
echo ""

echo " VNC 암호 설정 (일반 사용자 계정으로 전환한 후 진 ) "
echo ""
echo -e  "\033[1;34m${PROMPT} su - sonic \033[0m" >> Dasan_command.txt
su - sonic
echo ""
