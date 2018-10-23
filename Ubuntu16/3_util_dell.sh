#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo "  재부팅 후 확인. "
echo -e  "\033[1;34m${PROMPT} ip a | grep inet6 \033[0m"
ip a | grep inet6
echo "  아무 결과가 없는 것이 ipv6 disable 이 잘 적용 된것 입니다. "

echo ""

echo "  기본 유틸 설치. "
echo -e  "\033[1;34m${PROMPT} apt-get install -y vim nfs-common rdate xauth firefox gcc make \033[0m"
echo -e  "\033[1;34m${PROMPT} apt-get install -y locate htop tmux git wget ipmitool \033[0m"
echo -e  "\033[1;34m${PROMPT} apt-get install -y xfsprogs ntfs-3g aptitude lvm2 dstat curl  \033[0m"
apt-get install -y  \
vim nfs-common rdate xauth firefox gcc make locate htop tmux git wget ipmitool \
xfsprogs ntfs-3g aptitude lvm2 dstat curl

echo ""
echo ""

COUNTER=10

until [  $COUNTER -lt 1 ]; do

      echo COUNTER $COUNTER

      let COUNTER-=1

done

sleep 10

echo -e  "\033[1;34m${PROMPT} apt-get install -y python-dev \033[0m"
apt-get install -y python-dev

echo ""
echo ""

echo "  서버 시간 동기화. "
echo -e  "\033[1;34m${PROMPT} rdate  -s  time.bora.net \033[0m"
echo -e  "\033[1;34m${PROMPT} hwclock --systohc \033[0m"
echo -e  "\033[1;34m${PROMPT} date \033[0m"
echo -e  "\033[1;34m${PROMPT} hwclock \033[0m"
rdate  -s  time.bora.net
hwclock --systohc
date
hwclock
