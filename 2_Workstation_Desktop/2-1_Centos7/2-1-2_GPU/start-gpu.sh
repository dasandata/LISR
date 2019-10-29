#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo ""
echo ""

echo " 패키지 로그 파일 추가 "
touch /root/log.txt

echo " rc.local 서비스 추가 "

echo ""
echo ""
echo -e  "${PROMPT} chmod +x /etc/rc.d/rc.local  " >> /root/dasan_install_log.txt
chmod +x /etc/rc.d/rc.local

echo -e  "${PROMPT} sed -i '12a bash /root/LISR/2_Workstation_Desktop/2-1_Centos7/2-1-2_GPU/Dasan_Centos7-yumupdate-install.sh >> /root/dasan_install_log.txt' /etc/rc.d/rc.local   " >> /root/dasan_install_log.txt
sed -i '12a bash /root/LISR/2_Workstation_Desktop/2-1_Centos7/2-1-2_GPU/Dasan_Centos7-yumupdate-install.sh >> /root/dasan_install_log.txt' /etc/rc.d/rc.local

echo -e  "${PROMPT} cat /etc/rc.d/rc.local  | sed -n 13p " >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 13p

echo "  재부팅 "
echo -e  "${PROMPT} reboot " >> /root/dasan_install_log.txt
reboot
