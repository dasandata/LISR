#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo ""
echo ""


echo " 패키지 로그 파일 추가 "
touch /root/log.txt

echo ""
echo ""

echo -e  "==================== rc-local file add ===================="

echo ""
echo -e  "${PROMPT} printf '%s\n' '#!/bin/sh -e' 'exit 0' | tee -a /etc/rc.local " >> /root/dasan_install_log.txt
printf '%s\n' '#!/bin/sh -e' 'exit 0' | tee -a /etc/rc.local

echo ""
echo ""

echo -e  "${PROMPT} chmod +x /etc/rc.local  " >> /root/dasan_install_log.txt
chmod +x /etc/rc.local

echo ""
echo ""

echo -e  "${PROMPT} systemctl restart rc-local.service  " >> /root/dasan_install_log.txt
systemctl restart rc-local.service

echo ""
echo ""

echo -e  "${PROMPT} systemctl status rc-local.service  " >> /root/dasan_install_log.txt
systemctl status rc-local.service


echo -e  "==================== Utility Install ===================="

echo ""

echo "  기본 유틸 설치. "
echo -e  "${PROMPT} apt-get install -y vim nfs-common rdate xauth firefox gcc make net-tools ipmitool " >> /root/dasan_install_log.txt
echo -e  "${PROMPT} apt-get install -y locate htop tmux git wget git-lfs " >> /root/dasan_install_log.txt
echo -e  "${PROMPT} apt-get install -y xfsprogs ntfs-3g aptitude lvm2 dstat curl " >> /root/dasan_install_log.txt

apt-get install -y vim nfs-common rdate xauth firefox gcc make locate htop tmux git wget net-tools ipmitool git-lfs >> /root/log.txt

sleep 10

apt-get install -y xfsprogs ntfs-3g aptitude lvm2 dstat curl >> /root/log.txt

tail -5 /root/log.txt

echo ""
echo ""

echo -e  "${PROMPT} sed -i '1a bash /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-3_Ubuntu18/1-2-3-2_GPU/Dasan_Ubuntu18-Standard-install.sh >> /root/dasan_install_log.txt' /etc/rc.local   " >> /root/dasan_install_log.txt
sed -i '1a bash /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-3_Ubuntu18/1-2-3-2_GPU/Dasan_Ubuntu18-Standard-install.sh >> /root/dasan_install_log.txt' /etc/rc.local

echo ""
echo ""

echo -e  "${PROMPT} cat /etc/rc.local | sed -n 2p " >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 2p

echo ""
echo ""

echo -e  "${PROMPT} reboot " >> /root/dasan_install_log.txt
reboot
