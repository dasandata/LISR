#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " 데스크탑 GUI Disable "
echo ""
echo -e  "\033[1;34m${PROMPT} systemctl get-default # 부팅시 정보 확인 \033[0m"
systemctl get-default
echo ""
echo -e  "\033[1;34m${PROMPT} systemctl set-default multi-user.target # 부팅시 터미널 모드 변경 \033[0m"
systemctl set-default multi-user.target
echo ""
echo -e  "\033[1;34m${PROMPT} systemctl get-default # 변경 정보 확인 \033[0m"
systemctl get-default

echo " ubuntu desktop 설치 "
echo ""
echo -e  "\033[1;34m${PROMPT} apt-get -y install ubuntu-desktop gnome-panel gnome-settings-daemon  \033[0m"
echo -e  "\033[1;34m${PROMPT} apt-get -y install metacity nautilus gnome-terminal \033[0m"
apt-get -y install ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal
