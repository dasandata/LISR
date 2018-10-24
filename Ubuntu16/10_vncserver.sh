#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " 원격 접속을 위한 VNC Server를 구성 합니다. "
echo ""
echo -e  "\033[1;34m${PROMPT} dpkg --list | grep   vnc 현재 설치된 vnc 패키지 확인 \033[0m"
dpkg --list | grep vnc
echo ""
echo -e  "\033[1;34m${PROMPT} apt-get install -y vnc4server \033[0m"
apt-get install -y vnc4server
echo ""

echo ""
echo ""

echo " VNC 연결을 위한 방화벽 (firewall 설정) "
echo ""
echo -e  "\033[1;34m${PROMPT} ufw status \033[0m"
ufw status
echo ""
echo -e  "\033[1;34m${PROMPT} ufw allow 5901/tcp \033[0m"
ufw allow 5901/tcp
echo ""
echo -e  "\033[1;34m${PROMPT} ufw allow 5902/tcp \033[0m"
ufw allow 5902/tcp
echo ""
echo -e  "\033[1;34m${PROMPT} ufw status \033[0m"
ufw status
echo ""

echo " VNC 암호 설정 (일반 사용자 계정으로 전환한 후 진 ) "
echo ""
echo -e  "\033[1;34m${PROMPT} su - sonic \033[0m"
su - sonic
echo ""
echo -e  "\033[1;34m${PROMPT} vnc4server \033[0m"
vnc4server
