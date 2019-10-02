#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo ""

echo -e  "\033[1;32m"==================== Nouveau Disable ===================="\033[0m"

echo ""

echo -e  "\033[1;34m${PROMPT} systemctl  get-default \033[0m" >> /root/Dasan_command.txt
systemctl  get-default

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl  set-default  multi-user.target \033[0m" >> /root/Dasan_command.txt
systemctl  set-default  multi-user.target

echo ""
echo -e  "\033[1;34m${PROMPT} lsmod  | grep  nouveau \033[0m" >> /root/Dasan_command.txt
lsmod  | grep  nouveau

echo ""
echo -e  "\033[1;34m${PROMPT} echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf  \033[0m" >> /root/Dasan_command.txt
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf

echo ""
echo -e  "\033[1;34m${PROMPT} echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist.conf  \033[0m" >> /root/Dasan_command.txt
echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist.conf

echo ""
echo -e  "\033[1;34m${PROMPT} tail /etc/modprobe.d/blacklist.conf \033[0m" >> /root/Dasan_command.txt
tail /etc/modprobe.d/blacklist.conf

echo ""
echo -e  "\033[1;34m${PROMPT} update-initramfs -u \033[0m" >> /root/Dasan_command.txt
update-initramfs -u

echo ""
echo -e  "\033[1;34m${PROMPT} update-grub2  \033[0m" >> /root/Dasan_command.txt
update-grub2

echo ""
echo ""

echo "  rc.local 등록 "
echo -e  "\033[1;34m${PROMPT} sed -i '2s/Dasan_Ubuntu18-nouveau.sh/Dasan_Ubuntu18-CUDA10_1-install.sh/g' /etc/rc.local  \033[0m" >> /root//root/Dasan_command.txt
sed -i '2s/Dasan_Ubuntu18-nouveau.sh/Dasan_Ubuntu18-CUDA10_1-install.sh/g' /etc/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.local | sed -n 2p \033[0m" >> /root//root/Dasan_command.txt
cat /etc/rc.local | sed -n 2p

echo ""
echo -e  "\033[1;34m${PROMPT} reboot  \033[0m" >> /root/Dasan_command.txt
reboot
