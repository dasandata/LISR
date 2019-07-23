#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} sed -i '12a bash /root/LISR/CentOS7/Dasan_Centos7-yumupdate-install.sh >> /root/dasan_install_log.txt' /etc/rc.local  \033[0m" >> /root/Dasan_command.txt
sed -i '12a bash /root/LISR/CentOS7/Dasan_Centos7-yumupdate-install.sh >> /root/dasan_install_log.txt' /etc/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.local | sed -n 13p \033[0m" >> /root/Dasan_command.txt
cat /etc/rc.local | sed -n 13p

echo "  재부팅 "
echo -e  "\033[1;34m${PROMPT} reboot \033[0m" >> /root/Dasan_command.txt
reboot
