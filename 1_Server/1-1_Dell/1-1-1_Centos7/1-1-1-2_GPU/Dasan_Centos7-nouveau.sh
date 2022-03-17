#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

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
echo -e  "\033[1;34m${PROMPT} dracut  -f  \033[0m" >> /root/dasan_install_log.txt
dracut  -f

sleep 15

echo ""
echo -e  "\033[1;34m${PROMPT} grub2-mkconfig -o /boot/grub2/grub.cfg   boot kernel 에 설정 적용 \033[0m" >> /root/dasan_install_log.txt
grub2-mkconfig -o /boot/grub2/grub.cfg

echo ""
echo -e  "\033[1;34m${PROMPT} grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg   boot kernel 에 설정 적용 \033[0m" >> /root/dasan_install_log.txt
grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg


echo ""
echo ""

echo "  rc.local 등록 "
echo -e  "\033[1;34m${PROMPT} sed -i '13s/Dasan_Centos7-nouveau.sh/Dasan_Centos7-CUDA10_1-install.sh/g' /etc/rc.d/rc.local    \033[0m" >> /root/dasan_install_log.txt
sed -i '13s/Dasan_Centos7-nouveau.sh/Dasan_Centos7-CUDA10_1-install.sh/g' /etc/rc.d/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.d/rc.local  | sed -n 13p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 13p

echo " 재 부팅 "
echo -e  "\033[1;34m${PROMPT} reboot  재 부팅 \033[0m" >> /root/dasan_install_log.txt
reboot
