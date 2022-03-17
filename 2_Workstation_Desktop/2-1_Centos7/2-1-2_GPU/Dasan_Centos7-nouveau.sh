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
echo -e  "${PROMPT} dracut  -f  " >> /root/dasan_install_log.txt
dracut  -f

sleep 15

echo ""
echo -e  "${PROMPT} grub2-mkconfig -o /boot/grub2/grub.cfg   boot kernel 에 설정 적용 " >> /root/dasan_install_log.txt
grub2-mkconfig -o /boot/grub2/grub.cfg

echo ""
echo -e  "${PROMPT} grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg   boot kernel 에 설정 적용 " >> /root/dasan_install_log.txt
grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg


echo ""
echo ""

echo "  rc.local 등록 "
echo -e  "${PROMPT} sed -i '13s/Dasan_Centos7-nouveau.sh/Dasan_Centos7-CUDA10_1-install.sh/g' /etc/rc.d/rc.local    " >> /root/dasan_install_log.txt
sed -i '13s/Dasan_Centos7-nouveau.sh/Dasan_Centos7-CUDA10_1-install.sh/g' /etc/rc.d/rc.local

echo -e  "${PROMPT} cat /etc/rc.d/rc.local  | sed -n 13p " >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 13p

echo " 재 부팅 "
echo -e  "${PROMPT} reboot  재 부팅 " >> /root/dasan_install_log.txt
reboot
