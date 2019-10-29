#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} chmod +x /etc/rc.d/rc.local  \033[0m" >> /root/dasan_install_log.txt
chmod +x /etc/rc.d/rc.local

echo -e  "\033[1;34m${PROMPT} sed -i '12a bash /root/LISR/2_Workstation_Desktop/2-1_Centos7/2-1-1_CPU/Dasan_Centos7-yumupdate-install0.sh >> /root/dasan_install_log.txt' /etc/rc.d/rc.local   \033[0m" >> /root/dasan_install_log.txt
sed -i '12a bash /root/LISR/2_Workstation_Desktop/2-1_Centos7/2-1-1_CPU/Dasan_Centos7-yumupdate-install0.sh >> /root/dasan_install_log.txt' /etc/rc.d/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.d/rc.local  | sed -n 13p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 13p

echo "  재부팅 "
echo -e  "\033[1;34m${PROMPT} reboot \033[0m" >> /root/dasan_install_log.txt
reboot
