#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " 재부팅 후 확인. "
echo ""
echo -e  "\033[1;34m${PROMPT} getenforce       SELINUX 상태 확인. \033[0m"
getenforce

echo ""

echo -e  "\033[1;34m${PROMPT} ip a | grep inet6       아무 결과가 없는 것이  ipv6 disable 이 잘 적용 된것 입니다. \033[0m"
ip a | grep inet6

echo ""

echo " 서버 기본 설정에 필요한 유틸리티들 설치 "
echo ""

echo -e  "\033[1;34m${PROMPT} yum install -y vim pciutils openssh mlocate nfs-utils rdate xauth firefox nautilus wget \033[0m"
echo -e  "\033[1;34m${PROMPT} yum install -y tcsh tree lshw tmux git kernel-headers kernel-devel gcc make gcc-c++ \033[0m"
echo -e  "\033[1;34m${PROMPT} yum install -y cmake python-devel ntfs-3g dstat perl perl-CPAN perl-core net-tools \033[0m"
yum install -y vim pciutils openssh mlocate nfs-utils rdate xauth firefox nautilus wget
yum install -y tcsh tree lshw tmux git kernel-headers kernel-devel gcc make gcc-c++
yum install -y cmake python-devel ntfs-3g dstat perl perl-CPAN perl-core net-tools openssl-devel

echo ""

echo " Development Tools 설치 "
echo ""
echo -e  "\033[1;34m${PROMPT} yum grouplist \033[0m"
yum grouplist

echo ""
echo -e  "\033[1;34m${PROMPT} yum -y groups install "Development Tools" \033[0m"
yum -y groups install "Development Tools"

echo ""
echo -e  "\033[1;34m${PROMPT} yum -y install  glibc-static glibc-devel glibc-static libstdc++ libstdc++-devel \033[0m"
yum -y install  glibc-static glibc-devel glibc-static libstdc++ libstdc++-devel

echo ""
echo -e  "\033[1;34m${PROMPT} yum grouplist \033[0m"
yum grouplist

echo ""

echo " 인터넷 시간에 맞추어 서버의 시간 조정 "
echo ""
echo -e  "\033[1;34m${PROMPT} rdate  -s  time.bora.net \033[0m"
rdate  -s  time.bora.net
echo ""
echo -e  "\033[1;34m${PROMPT} clock --systohc \033[0m"
clock --systohc
echo ""
echo -e  "\033[1;34m${PROMPT} date \033[0m"
date
echo ""
echo -e  "\033[1;34m${PROMPT} hwclock \033[0m"
hwclock
