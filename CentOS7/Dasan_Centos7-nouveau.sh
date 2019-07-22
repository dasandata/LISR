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
echo -e  "\033[1;34m${PROMPT} dracut  -f  \033[0m" >> /root/Dasan_command.txt
dracut  -f

echo ""
echo -e  "\033[1;34m${PROMPT} grub2-mkconfig -o /boot/grub2/grub.cfg   boot kernel 에 설정 적용 \033[0m"
grub2-mkconfig -o /boot/grub2/grub.cfg

echo ""
echo -e  "\033[1;34m${PROMPT} grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg   boot kernel 에 설정 적용 \033[0m"
grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg


echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.local | sed -n 13p \033[0m" >> /root/Dasan_command.txt
cat /etc/rc.local | sed -n 13p

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} reboot  \033[0m" >> /root/Dasan_command.txt
reboot
