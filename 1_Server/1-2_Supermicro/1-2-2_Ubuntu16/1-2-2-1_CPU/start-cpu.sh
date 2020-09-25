#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo -e  "\033[1;32m"==================== rc-local file add ===================="\033[0m"

echo ""
echo ""

HISTFILE=~/.bash_history
set -o history

echo -e  "\033[1;34m${PROMPT} sed -i '13a bash /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-2_Ubuntu16/1-2-2-1_CPU/Dasan_Ubuntu16-Standard-install0.sh >> /root/dasan_install_log.txt' /etc/rc.local  \033[0m" >> /root/dasan_install_log.txt
sed -i '13a bash /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-2_Ubuntu16/1-2-2-1_CPU/Dasan_Ubuntu16-Standard-install0.sh >> /root/dasan_install_log.txt' /etc/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.local | sed -n 14p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 14p

echo "  재부팅 "
echo -e  "\033[1;34m${PROMPT} reboot \033[0m" >> /root/dasan_install_log.txt
reboot
