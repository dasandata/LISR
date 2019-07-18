#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;32m"==================== rc-local file add ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} printf '%s\n' '#!/bin/sh -e' 'exit 0' | tee -a /etc/rc.local \033[0m" >> /root/Dasan_command.txt
printf '%s\n' '#!/bin/sh -e' 'exit 0' | tee -a /etc/rc.local

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} chmod +x /etc/rc.local  \033[0m" >> /root/Dasan_command.txt
chmod +x /etc/rc.local

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} systemctl restart rc-local.service  \033[0m" >> /root/Dasan_command.txt
systemctl restart rc-local.service

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} systemctl status rc-local.service  \033[0m" >> /root/Dasan_command.txt
systemctl status rc-local.service

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} sed -i '1a bash /root/LISR/Ubuntu18/test10.sh >> /root/dasan_install_log.txt' /etc/rc.local   \033[0m" >> /root/Dasan_command.txt
sed -i '1a bash /root/LISR/Ubuntu18/Dasan_Ubuntu18-Standard-install.sh >> /root/dasan_install_log.txt' /etc/rc.local

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.local | sed -n 2p \033[0m" >> /root/Dasan_command.txt
cat /etc/rc.local | sed -n 2p

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} reboot \033[0m" >> /root/Dasan_command.txt
reboot
