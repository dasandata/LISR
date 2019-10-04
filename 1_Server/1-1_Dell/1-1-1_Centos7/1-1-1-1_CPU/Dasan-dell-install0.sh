#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"



echo ""
echo -e  "\033[1;34m${PROMPT} racadm set iDRAC.Time.Timezone Asia/Seoul  \033[0m"
racadm set iDRAC.Time.Timezone Asia/Seoul

echo ""
echo -e  "\033[1;34m${PROMPT} racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}') \033[0m"
racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}')


echo "  rc.local 등록 "

echo -e  "\033[1;34m${PROMPT} sed -i '/root/d' /etc/rc.d/rc.local   \033[0m" >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.d/rc.local

echo " 재 부팅 "
echo -e  "\033[1;34m${PROMPT} reboot  재 부팅 \033[0m" >> /root/dasan_install_log.txt
reboot
