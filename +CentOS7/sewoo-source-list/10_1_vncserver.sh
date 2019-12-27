#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " VNC 접속용 암호를 지정합니다 "
echo -e  "\033[1;34m${PROMPT} vncpasswd \033[0m"
vncpasswd

echo ""
echo ""

echo " VNC 실행 및 연결 "

echo ""
echo -e  "\033[1;34m${PROMPT} vncserver \033[0m"
vncserver
echo ""
echo -e  "\033[1;34m${PROMPT} vncserver -list \033[0m"
vncserver -list
echo ""
echo -e  "\033[1;34m${PROMPT} ps aux | grep -i vnc \033[0m"
ps aux | grep -i vnc
echo ""
echo -e  "\033[1;34m${PROMPT} vncserver -kill :1 \033[0m"
vncserver -kill :1
echo ""
