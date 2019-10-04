#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;32m"==================== rc-local file add ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} printf '%s\n' '#!/bin/sh -e' 'exit 0' | tee -a /etc/rc.local \033[0m" >> /root/dasan_install_log.txt
printf '%s\n' '#!/bin/sh -e' 'exit 0' | tee -a /etc/rc.local

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} chmod +x /etc/rc.local  \033[0m" >> /root/dasan_install_log.txt
chmod +x /etc/rc.local

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} systemctl restart rc-local.service  \033[0m" >> /root/dasan_install_log.txt
systemctl restart rc-local.service

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} systemctl status rc-local.service  \033[0m" >> /root/dasan_install_log.txt
systemctl status rc-local.service


echo -e  "\033[1;32m"==================== Utility Install ===================="\033[0m"

echo ""

echo "  기본 유틸 설치. "
echo -e  "\033[1;34m${PROMPT} apt-get install -y vim nfs-common rdate xauth firefox gcc make net-tools ipmitool \033[0m" >> /root/dasan_install_log.txt
echo -e  "\033[1;34m${PROMPT} apt-get install -y locate htop tmux git wget \033[0m" >> /root/dasan_install_log.txt
echo -e  "\033[1;34m${PROMPT} apt-get install -y xfsprogs ntfs-3g aptitude lvm2 dstat curl \033[0m" >> /root/dasan_install_log.txt

apt-get install -y vim nfs-common rdate xauth firefox gcc make locate htop tmux git wget net-tools ipmitool >> /root/dasan_install_log.txt 2>&1
apt-get install -y xfsprogs ntfs-3g aptitude lvm2 dstat curl >> /root/dasan_install_log.txt 2>&1

tail -5 /root/dasan_install_log.txt

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} sed -i '1a bash /root/LISR/1_Server/1-1_Dell/1-1-3_Ubuntu18/1-1-3-2_GPU/Dasan_Ubuntu18-Standard-install.sh >> /root/dasan_install_log.txt' /etc/rc.local   \033[0m" >> /root/dasan_install_log.txt
sed -i '1a bash /root/LISR/1_Server/1-1_Dell/1-1-3_Ubuntu18/1-1-3-2_GPU/Dasan_Ubuntu18-Standard-install.sh >> /root/dasan_install_log.txt' /etc/rc.local

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.local | sed -n 2p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 2p

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} reboot \033[0m" >> /root/dasan_install_log.txt
reboot
