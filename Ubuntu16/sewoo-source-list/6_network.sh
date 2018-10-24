#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;34m${PROMPT} ip a \033[0m"
ip a
echo ""
echo -e  "\033[1;34m${PROMPT} EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2) \033[0m"
EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2)
echo ""
echo -e  "\033[1;34m${PROMPT} echo ${EXT_NIC}  # 추출된 인터페이스 명이 맞는지 확인 필요. \033[0m"
echo ${EXT_NIC}

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} ifconfig  ${EXT_NIC} \033[0m"
ifconfig  ${EXT_NIC}
echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/network/interfaces \033[0m"
cat /etc/network/interfaces
echo ""

echo -e  "\033[1;34m${PROMPT} cat /etc/hostname \033[0m"
cat /etc/hostname
echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/resolv.conf \033[0m"
cat /etc/resolv.conf
echo ""
echo -e  "\033[1;34m${PROMPT} ping -c 4 google.com \033[0m"
ping -c 4 google.com
echo ""
