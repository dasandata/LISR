#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;32m"==================== Repository ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/apt/sources.list | grep -v \"#\|^$\" \033[0m"
cat /etc/apt/sources.list  |  grep -v "#\|^$"
echo "  기본 저장소 확인 "

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list \033[0m"
perl -pi -e 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
echo "  Security 부분 변경 "

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} cat /etc/apt/sources.list | grep -v \"#\|^$\" \033[0m"
cat /etc/apt/sources.list  |  grep -v "#\|^$"
echo "  변경 내용 확인 "

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} apt-get update \033[0m"
apt-get update  >>  dasan_log_ubuntu_repo_update.txt

tail -5 dasan_log_ubuntu_repo_update.txt

echo "  적용 하기 "

echo ""
echo ""

echo -e  "\033[1;32m"==================== Utility Install ===================="\033[0m"

echo ""

echo "  기본 유틸 설치. "
echo -e  "\033[1;34m${PROMPT} apt-get install -y vim nfs-common rdate xauth firefox gcc make \033[0m"
echo -e  "\033[1;34m${PROMPT} apt-get install -y locate htop tmux git wget \033[0m"
echo -e  "\033[1;34m${PROMPT} apt-get install -y xfsprogs ntfs-3g aptitude lvm2 dstat curl  \033[0m"

echo -e  "\033[1;34m${PROMPT}  apt-get install -y  \
vim nfs-common rdate xauth firefox gcc make locate htop tmux git wget \
xfsprogs ntfs-3g aptitude lvm2 dstat curl libssl libssl-dev >> dasan_log_install_ubuntu_default_util.txt 2>&1 \033[0m"
apt-get install -y  \
vim nfs-common rdate xauth firefox gcc make locate htop tmux git wget \
xfsprogs ntfs-3g aptitude lvm2 dstat curl libssl libssl-dev >> dasan_log_install_ubuntu_default_util.txt 2>&1

echo -e  "\033[1;34m${PROMPT} tail -5 dasan_log_install_ubuntu_default_util.txt \033[0m"
tail -5 dasan_log_install_ubuntu_default_util.txt

echo ""
echo ""

sleep 10

echo ""

echo -e  "\033[1;34m${PROMPT} apt-get install -y python-dev \033[0m"
apt-get install -y python-dev  >> dasan_log_ubuntu_python-dev_install.txt

echo -e  "\033[1;34m${PROMPT} tail -5 dasan_log_ubuntu_python-dev_install.txt \033[0m"
tail -5 dasan_log_ubuntu_python-dev_install.txt


echo "  재부팅 "
echo -e  "\033[1;34m${PROMPT} reboot \033[0m"
reboot
