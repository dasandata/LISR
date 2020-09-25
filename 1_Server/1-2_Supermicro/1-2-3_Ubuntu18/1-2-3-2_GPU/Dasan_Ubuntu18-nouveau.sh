#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo ""

echo -e  "==================== Nouveau Disable ===================="

echo ""

echo -e  "${PROMPT} systemctl  get-default " >> /root/dasan_install_log.txt
systemctl  get-default

echo ""
echo -e  "${PROMPT} systemctl  set-default  multi-user.target " >> /root/dasan_install_log.txt
systemctl  set-default  multi-user.target

echo ""
echo -e  "${PROMPT} lsmod  | grep  nouveau " >> /root/dasan_install_log.txt
lsmod  | grep  nouveau

echo ""
echo -e  "${PROMPT} echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf  " >> /root/dasan_install_log.txt
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf

echo ""
echo -e  "${PROMPT} echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist.conf  " >> /root/dasan_install_log.txt
echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist.conf

echo ""
echo -e  "${PROMPT} tail /etc/modprobe.d/blacklist.conf " >> /root/dasan_install_log.txt
tail /etc/modprobe.d/blacklist.conf

echo ""
echo -e  "${PROMPT} update-initramfs -u " >> /root/dasan_install_log.txt
update-initramfs -u

echo ""
echo -e  "${PROMPT} update-grub2  " >> /root/dasan_install_log.txt
update-grub2

echo ""
echo ""

echo "  rc.local 등록 "
echo -e  "${PROMPT} sed -i '2s/Dasan_Ubuntu18-nouveau.sh/Dasan_Ubuntu18-CUDA10_1-install.sh/g' /etc/rc.local  " >> /root/dasan_install_log.txt
sed -i '2s/Dasan_Ubuntu18-nouveau.sh/Dasan_Ubuntu18-CUDA10_1-install.sh/g' /etc/rc.local

echo -e  "${PROMPT} cat /etc/rc.local | sed -n 2p " >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 2p

echo ""
echo -e  "${PROMPT} reboot  " >> /root/dasan_install_log.txt
reboot
