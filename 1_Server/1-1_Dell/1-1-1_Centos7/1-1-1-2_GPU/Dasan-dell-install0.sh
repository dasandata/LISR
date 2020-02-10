#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"



echo ""
echo -e  "\033[1;34m${PROMPT} racadm set iDRAC.Time.Timezone Asia/Seoul  \033[0m" >> /root/dasan_install_log.txt
racadm set iDRAC.Time.Timezone Asia/Seoul

echo ""
echo -e  "\033[1;34m${PROMPT} racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}') \033[0m" >> /root/dasan_install_log.txt
racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}')

echo ""
echo ""

echo "  rc.local 등록 "

echo -e  "\033[1;34m${PROMPT} sed -i '13s/Dasan-dell-install0.sh/Dasan_Centos7-R_install.sh/g' /etc/rc.d/rc.local    \033[0m" >> /root/dasan_install_log.txt
sed -i '13s/Dasan-dell-install0.sh/Dasan_Centos7-R_install.sh/g' /etc/rc.d/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.d/rc.local  | sed -n 13p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 13p


echo " 재 부팅 "
echo -e  "\033[1;34m${PROMPT} reboot  재 부팅 \033[0m" >> /root/dasan_install_log.txt
reboot
