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

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i '1a bash /root/LISR/1_Server/1-1_Dell/1-1-5_Ubuntu20/1-1-5-1_CPU/Dasan_Ubuntu20-Standard-install.sh >> /root/dasan_install_log.txt' /etc/rc.local   \033[0m" >> /root/dasan_install_log.txt
sed -i '1a bash /root/LISR/1_Server/1-1_Dell/1-1-5_Ubuntu20/1-1-5-1_CPU/Dasan_Ubuntu20-Standard-install.sh >> /root/dasan_install_log.txt' /etc/rc.local

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/rc.local  | sed -n 2p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.local  | sed -n 2p

echo "  재부팅 "
echo -e  "\033[1;34m${PROMPT} reboot \033[0m" >> /root/dasan_install_log.txt
reboot
