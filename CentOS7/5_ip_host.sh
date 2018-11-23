#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"


echo " ip 및 hostname 정보 / 인터넷 연결 확인 "

echo ""
echo -e  "\033[1;34m${PROMPT} ip a \033[0m"
ip a

echo ""
echo -e  "\033[1;34m${PROMPT} EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2) \033[0m"
EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2)

echo ""
echo -e  "\033[1;34m${PROMPT} echo ${EXT_NIC} \033[0m"
echo ${EXT_NIC}

echo ""
echo -e  "\033[1;34m${PROMPT} ifconfig  ${EXT_NIC} \033[0m"
ifconfig  ${EXT_NIC}

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/sysconfig/network-scripts/ifcfg-${EXT_NIC} \033[0m"
cat /etc/sysconfig/network-scripts/ifcfg-${EXT_NIC}
