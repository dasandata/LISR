#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo " HDD Mount /home "

echo ""
echo ""
echo -e  "${PROMPT} parted -s /dev/sda "mklabel gpt" " >> /root/dasan_install_log.txt
parted -s /dev/sda "mklabel gpt"  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} parted -s /dev/sda "mkpart primary 0% 100%"   " >> /root/dasan_install_log.txt
parted -s /dev/sda "mkpart primary 0% 100%"  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} yes | mkfs.ext4 -L HOME /dev/sda1  " >> /root/dasan_install_log.txt
yes | mkfs.ext4 -L HOME /dev/sda1  >> /root/log.txt

sleep 10

echo ""
echo ""
echo -e  "${PROMPT} mount /dev/sda1  /mnt  " >> /root/dasan_install_log.txt
mount /dev/sda1  /mnt   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT}  cd /home/  " >> /root/dasan_install_log.txt
cd /home/  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} find .  | cpio -dump  /mnt   " >> /root/dasan_install_log.txt
find .  | cpio -dump  /mnt  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} ls -l /mnt/  " >> /root/dasan_install_log.txt
ls -l /mnt/  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} umount /mnt  " >> /root/dasan_install_log.txt
umount /mnt  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cd " >> /root/dasan_install_log.txt
cd  >> /root/log.txt


echo "fstab add line"


echo ""
echo ""
echo -e  "${PROMPT} echo  "LABEL="HOME"  /home   ext4  defaults  0  0 "    >>   /etc/fstab  " >> /root/dasan_install_log.txt
echo  "LABEL="HOME"  /home   ext4   defaults  0  0 "    >>   /etc/fstab

echo ""
echo ""
echo -e  "${PROMPT} cat /etc/fstab | grep -v ^#  " >> /root/dasan_install_log.txt
cat /etc/fstab | grep -v ^#  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} mount -a  " >> /root/dasan_install_log.txt
mount -a  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} lsblk  " >> /root/dasan_install_log.txt
lsblk  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} ls -l /home  " >> /root/dasan_install_log.txt
ls -l /home  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cp /root/LISR/cuk-gpu-install/copy_launcher.py /tmp/ " >> /root/dasan_install_log.txt
cp /root/LISR/cuk-gpu-install/copy_launcher.py /tmp/  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cp /root/LISR/cuk-gpu-install/saved_launcher.txt /tmp/  " >> /root/dasan_install_log.txt
cp /root/LISR/cuk-gpu-install/saved_launcher.txt /tmp/  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cp /root/LISR/cuk-gpu-install/sharing.sh /tmp/  " >> /root/dasan_install_log.txt
cp /root/LISR/cuk-gpu-install/sharing.sh /tmp/  >> /root/log.txt
