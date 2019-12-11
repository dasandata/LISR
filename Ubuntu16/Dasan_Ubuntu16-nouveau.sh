#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo ""

echo -e  "\033[1;32m"==================== Nouveau Disable ===================="\033[0m"

echo ""

echo -e  "\033[1;34m${PROMPT} systemctl  get-default \033[0m" >> /root/dasan_install_log.txt
systemctl  get-default

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl  set-default  multi-user.target \033[0m" >> /root/dasan_install_log.txt
systemctl  set-default  multi-user.target

echo ""
echo -e  "\033[1;34m${PROMPT} lsmod  | grep  nouveau \033[0m" >> /root/dasan_install_log.txt
lsmod  | grep  nouveau

echo ""
echo -e  "\033[1;34m${PROMPT} echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf  \033[0m" >> /root/dasan_install_log.txt
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf

echo ""
echo -e  "\033[1;34m${PROMPT} echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist.conf  \033[0m" >> /root/dasan_install_log.txt
echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist.conf

echo ""
echo -e  "\033[1;34m${PROMPT} tail /etc/modprobe.d/blacklist.conf \033[0m" >> /root/dasan_install_log.txt
tail /etc/modprobe.d/blacklist.conf

echo ""
echo -e  "\033[1;34m${PROMPT} update-initramfs -u \033[0m" >> /root/dasan_install_log.txt
update-initramfs -u

echo ""
echo -e  "\033[1;34m${PROMPT} update-grub2  \033[0m" >> /root/dasan_install_log.txt
update-grub2

echo ""
echo ""

echo "  rc.local 등록 "
echo -e  "\033[1;34m${PROMPT} sed -i '14s/Dasan_Ubuntu16-nouveau.sh/Dasan_Ubuntu16-GPU-LG-install.sh/g' /etc/rc.local  \033[0m" >> /root/dasan_install_log.txt
sed -i '14s/Dasan_Ubuntu16-nouveau.sh/Dasan_Ubuntu16-GPU-LG-install.sh/g' /etc/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.local | sed -n 14p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 14p

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} reboot  \033[0m" >> /root/dasan_install_log.txt
reboot
