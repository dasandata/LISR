#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo -e  "==================== rc-local file add ===================="

echo ""
echo ""

echo " 패키지 로그 파일 추가 "
touch /root/log.txt

echo " rc.local 서비스 추가 "

echo ""
echo ""

echo -e  "${PROMPT} sed -i '13a bash /root/LISR/2_Workstation_Desktop/2-2_Ubuntu16/2-2-2_GPU/Dasan_Ubuntu16-Standard-install.sh >> /root/dasan_install_log.txt' /etc/rc.local  " >> /root/dasan_install_log.txt
sed -i '13a bash /root/LISR/2_Workstation_Desktop/2-2_Ubuntu16/2-2-2_GPU/Dasan_Ubuntu16-Standard-install.sh >> /root/dasan_install_log.txt' /etc/rc.local

echo -e  "${PROMPT} cat /etc/rc.local | sed -n 14p " >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 14p >> /root/dasan_install_log.txt

echo "  재부팅 "
echo -e  "${PROMPT} reboot " >> /root/dasan_install_log.txt
reboot >> /root/dasan_install_log.txt
