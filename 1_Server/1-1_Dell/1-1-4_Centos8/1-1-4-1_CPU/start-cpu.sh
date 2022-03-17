#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} chmod +x /etc/rc.d/rc.local  \033[0m" >> /root/dasan_install_log.txt
chmod +x /etc/rc.d/rc.local

echo -e  "\033[1;34m${PROMPT} sed -i '13a bash /root/LISR/1_Server/1-1_Dell/1-1-4_Centos8/1-1-4-1_CPU/Dasan_Centos8-yumupdate-install.sh >> /root/dasan_install_log.txt' /etc/rc.d/rc.local   \033[0m" >> /root/dasan_install_log.txt
sed -i '13a bash /root/LISR/1_Server/1-1_Dell/1-1-4_Centos8/1-1-4-1_CPU/Dasan_Centos8-yumupdate-install.sh >> /root/dasan_install_log.txt' /etc/rc.d/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.d/rc.local  | sed -n 14p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 14p

echo "  재부팅 "
echo -e  "\033[1;34m${PROMPT} reboot \033[0m" >> /root/dasan_install_log.txt
reboot
