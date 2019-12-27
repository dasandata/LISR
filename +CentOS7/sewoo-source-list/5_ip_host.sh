#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"


echo " ip 및 hostname 정보 / 인터넷 연결 확인 "

echo ""
echo -e  "\033[1;34m${PROMPT} ip a \033[0m"
ip a

echo ""
echo -e  "\033[1;34m${PROMPT} EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2 |tr -d ' ') \033[0m"
EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2 |tr -d ' ')

echo ""
echo -e  "\033[1;34m${PROMPT} echo ${EXT_NIC} \033[0m"
echo ${EXT_NIC}

echo ""
echo -e  "\033[1;34m${PROMPT} ifconfig  ${EXT_NIC} \033[0m"
ifconfig  ${EXT_NIC}

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i '/IPV6/d' /etc/sysconfig/network-scripts/ifcfg-${EXT_NIC} \033[0m"
sed -i '/IPV6/d' /etc/sysconfig/network-scripts/ifcfg-${EXT_NIC}

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/sysconfig/network-scripts/ifcfg-${EXT_NIC} \033[0m"
cat /etc/sysconfig/network-scripts/ifcfg-${EXT_NIC}

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/hostname \033[0m"
cat /etc/hostname

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/resolv.conf \033[0m"
cat /etc/resolv.conf

echo ""
echo -e  "\033[1;34m${PROMPT} ping -c 4 google.com \033[0m"
ping -c 4 google.com
