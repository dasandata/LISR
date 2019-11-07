#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"



echo ""
echo -e  "${PROMPT} racadm set iDRAC.Time.Timezone Asia/Seoul  " >> /root/dasan_install_log.txt
racadm set iDRAC.Time.Timezone Asia/Seoul

echo ""
echo -e  "${PROMPT} racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}') " >> /root/dasan_install_log.txt
racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}')


echo "  rc.local 등록 "

echo -e  "${PROMPT} sed -i '/root/d' /etc/rc.d/rc.local   " >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.d/rc.local

echo " 재 부팅 "
echo -e  "${PROMPT} reboot  재 부팅 " >> /root/dasan_install_log.txt
reboot
