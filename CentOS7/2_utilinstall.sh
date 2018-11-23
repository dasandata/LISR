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
echo -e  "\033[1;34m${PROMPT} yum install -y cmake python-devel ntfs-3g dstat perl perl-CPAN perl-core net-tools openssl-devel \033[0m"
yum install -y vim pciutils openssh mlocate nfs-utils rdate xauth firefox nautilus wget >>  dasan_log_install_centos_default_util.txt 2>&1
yum install -y tcsh tree lshw tmux git kernel-headers kernel-devel gcc make gcc-c++ >>  dasan_log_install_centos_default_util.txt 2>&1
yum install -y cmake python-devel ntfs-3g dstat perl perl-CPAN perl-core net-tools openssl-devel >>  dasan_log_install_centos_default_util.txt 2>&1

echo ""

echo " Development Tools 설치 "
echo ""
echo -e  "\033[1;34m${PROMPT} yum grouplist \033[0m"
yum grouplist

echo ""
echo -e  "\033[1;34m${PROMPT} yum -y groups install "Development Tools" \033[0m"
yum -y groups install "Development Tools" >> dasan_log_install_centos_developtoosl.txt

echo ""
echo -e  "\033[1;34m${PROMPT} yum -y install  glibc-static glibc-devel glibc-static libstdc++ libstdc++-devel \033[0m"
yum -y install  glibc-static glibc-devel glibc-static libstdc++ libstdc++-devel >> dasan_log_install_centos_developtoosl.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} yum grouplist \033[0m"
yum grouplist

echo ""
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

echo ""
echo ""



echo " Centos EPEL(Extra Packages for Enterprise Linux) 저장소(Repository) 설치. "
echo ""
echo -e  "\033[1;34m${PROMPT} yum repolist \033[0m"
yum repolist

echo ""
echo -e  "\033[1;34m${PROMPT} yum -y  install epel-release  \033[0m"
yum -y  install epel-release   >>    dasan_log_install_epel.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i -e "s/\]$/\]\npriority=5/g" /etc/yum.repos.d/epel.repo  \033[0m"
sed -i -e "s/\]$/\]\npriority=5/g" /etc/yum.repos.d/epel.repo

echo ""
echo -e  "\033[1;34m${PROMPT} yum -y  install yum-plugin-priorities   \033[0m"
yum -y  install yum-plugin-priorities   >>   dasan_log_install_epel.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i -e "s/\]$/\]\npriority=1/g" /etc/yum.repos.d/CentOS-Base.repo \033[0m"
sed -i -e "s/\]$/\]\npriority=1/g" /etc/yum.repos.d/CentOS-Base.repo

echo ""
echo -e  "\033[1;34m${PROMPT} yum repolist \033[0m"
yum repolist

echo ""
echo ""

echo " epel 이 활성화 되어야 설치 되는 htop 을 설치하여 검증 "
echo ""
echo -e  "\033[1;34m${PROMPT} rpm -qa | grep htop ntfs-3g 설치되었는지 확인 \033[0m"
rpm -qa | grep htop

echo ""
echo -e  "\033[1;34m${PROMPT} yum -y  install htop ntfs-3g \033[0m"
yum -y  install htop ntfs-3g >> dasan_log_install_htop,ntfs3g.txt  2>&1

echo ""
echo ""

echo " kernel / kernel-header / kernel-devel 버젼 일치 확인 "
echo ""
echo -e  "\033[1;34m${PROMPT} uname -r  현재 실행중인 커널 버젼 확인 \033[0m"
uname -r

echo ""

echo " 실행중인 커널과 동일한 버젼의 커널 패키지 (headers,devel) 가 설치 되어 있는지 확인. "
echo ""
echo -e  "\033[1;34m${PROMPT} rpm -qa | grep $(uname -r) | grep 'headers\|devel' \033[0m"
rpm -qa | grep $(uname -r) | grep 'headers\|devel'
