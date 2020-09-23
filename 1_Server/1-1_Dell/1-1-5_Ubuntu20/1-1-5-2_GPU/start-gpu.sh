#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo ""
echo ""

echo " 패키지 로그 파일 추가 "
touch /root/log.txt

echo ""
echo ""

echo -e  "==================== rc-local file add ===================="

echo ""
echo -e  "${PROMPT} printf '%s\n' '#!/bin/sh -e' 'exit 0' | tee -a /etc/rc.local " >> /root/dasan_install_log.txt
printf '%s\n' '#!/bin/sh -e' 'exit 0' | tee -a /etc/rc.local

echo ""
echo ""

echo -e  "${PROMPT} chmod +x /etc/rc.local  " >> /root/dasan_install_log.txt
chmod +x /etc/rc.local

echo ""
echo ""

echo -e  "${PROMPT} systemctl restart rc-local.service  " >> /root/dasan_install_log.txt
systemctl restart rc-local.service

echo ""
echo ""

echo -e  "${PROMPT} systemctl status rc-local.service  " >> /root/dasan_install_log.txt
systemctl status rc-local.service

echo

echo -e  "\033[1;34m${PROMPT} sed -i '13a bash /root/LISR/1_Server/1-1_Dell/1-1-4_Centos8/1-1-4-2_GPU/Dasan_Centos8-yumupdate-install.sh >> /root/dasan_install_log.txt' /etc/rc.d/rc.local   \033[0m" >> /root/dasan_install_log.txt
sed -i '13a bash /root/LISR/1_Server/1-1_Dell/1-1-4_Centos8/1-1-4-2_GPU/Dasan_Centos8-yumupdate-install.sh >> /root/dasan_install_log.txt' /etc/rc.d/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.d/rc.local  | sed -n 14p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 14p

echo "  재부팅 "
echo -e  "\033[1;34m${PROMPT} reboot \033[0m" >> /root/dasan_install_log.txt
reboot
