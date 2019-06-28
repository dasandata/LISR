#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo ""

echo -e  "\033[1;32m"==================== Nouveau Disable ===================="\033[0m"

echo ""

echo -e  "\033[1;34m${PROMPT} systemctl  get-default \033[0m"
systemctl  get-default

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl  set-default  multi-user.target \033[0m"
systemctl  set-default  multi-user.target

echo ""
echo -e  "\033[1;34m${PROMPT} lsmod  | grep  nouveau \033[0m"
lsmod  | grep  nouveau

echo ""
echo -e  "\033[1;34m${PROMPT} echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf  \033[0m"
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf

echo ""
echo -e  "\033[1;34m${PROMPT} echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist.conf  \033[0m"
echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist.conf

echo ""
echo -e  "\033[1;34m${PROMPT} tail /etc/modprobe.d/blacklist.conf \033[0m"
tail /etc/modprobe.d/blacklist.conf

echo ""
echo -e  "\033[1;34m${PROMPT} update-initramfs -u \033[0m"
update-initramfs -u

echo ""
echo -e  "\033[1;34m${PROMPT} update-grub2  \033[0m"
update-grub2

echo ""
echo -e  "\033[1;34m${PROMPT} reboot  \033[0m"
reboot
