#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " 원격 접속을 위한 VNC Server를 구성 합니다. "
echo ""
echo -e  "\033[1;34m${PROMPT} rpm -qa | grep vnc # 현재 설치된 vnc 패키지 확인 \033[0m"
rpm -qa | grep vnc
echo ""
echo -e  "\033[1;34m${PROMPT} yum -y install  tigervnc-server  vnc \033[0m"
yum -y install  tigervnc-server  vnc   >>  dasan_log_install_vnc.txt
tail dasan_log_install_vnc.txt
echo ""

echo ""
echo ""

echo " VNC 연결을 위한 방화벽 (firewall 설정) "
echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --list-all | grep services \033[0m"
firewall-cmd --list-all | grep services
echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --permanent --zone=external --add-service  vnc-server \033[0m"
firewall-cmd --permanent --zone=external --add-service  vnc-server
echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --reload \033[0m"
firewall-cmd --reload
echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --list-all | grep services \033[0m"
firewall-cmd --list-all | grep services
echo ""

echo " VNC 암호 설정 (일반 사용자 계정으로 전환한 후 진 ) "
echo ""
echo -e  "\033[1;34m${PROMPT} su - sonic \033[0m"
su - sonic
echo ""
