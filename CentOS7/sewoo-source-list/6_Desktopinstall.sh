#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " Desktop install  "

echo ""
echo ""

echo " 기본 부팅 모드 확인 "
echo ""
echo -e  "\033[1;34m${PROMPT} systemctl get-default \033[0m"
systemctl get-default

echo ""
echo ""

echo " GNOME Desktop 설치 "
echo ""
echo -e  "\033[1;34m${PROMPT} yum -y  groups install "GNOME Desktop" \033[0m"
yum -y  groups install "GNOME Desktop"  >> dasan_log_install_gnome-desktop.txt  2>&1

echo ""
echo ""

echo " 현재 구동중인 Demon list 확인 "
echo ""
echo -e  "\033[1;34m${PROMPT} systemctl list-unit-files  -t service  | grep enable \033[0m"
systemctl list-unit-files  -t service  | grep enable

echo ""
echo ""

echo " Daemon Disable 스크립트 실행. "
echo ""
echo -e  "\033[1;34m${PROMPT} cat /root/LISR/common/dasan_daemon_disable.sh \033[0m"
cat /root/LISR/common/dasan_daemon_disable.sh

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} bash /root/LISR/common/dasan_daemon_disable.sh \033[0m"
bash /root/LISR/common/dasan_daemon_disable.sh
