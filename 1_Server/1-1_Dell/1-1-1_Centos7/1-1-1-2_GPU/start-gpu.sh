#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} chmod +x /etc/rc.d/rc.local  \033[0m" >> /root/dasan_install_log.txt
chmod +x /etc/rc.d/rc.local

echo -e  "\033[1;34m${PROMPT} sed -i '12a bash /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Dasan_Centos7-yumupdate-install.sh >> /root/dasan_install_log.txt' /etc/rc.d/rc.local   \033[0m" >> /root/dasan_install_log.txt
sed -i '12a bash /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Dasan_Centos7-yumupdate-install.sh >> /root/dasan_install_log.txt' /etc/rc.d/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.d/rc.local  | sed -n 13p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 13p

echo "  재부팅 "
echo -e  "\033[1;34m${PROMPT} reboot \033[0m" >> /root/dasan_install_log.txt
reboot
