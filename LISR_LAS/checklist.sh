#!/bin/sh
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr

# LAS 가 정상적으로 작동하였는지 체크
OSCHECK=$(cat /etc/os-release | head -1 | cut -d "=" -f 2 | tr -d "\"" | awk '{print$1}' | tr '[A-Z]' '[a-z]')
# 기본 버전 설치 진행 순서
# nouveau 끄기 및 grub 설정
echo "Nouveau, GRUB Check" >> /root/CheckList.txt
echo "" >> /root/CheckList.txt
cat /root/install_log.txt | grep "CentOS Grub Setting Start" >> /root/CheckList.txt
cat /etc/default/grub | grep LINUX >> /root/CheckList.txt
cat /etc/modprobe.d/blacklist.conf >> /root/CheckList.txt
cat /etc/default/grub | grep "Nouveau and Grub Setting complete" | tee -a /root/install_log.txt
echo "" >> /root/CheckList.txt
echo "Nouveau, GRUB Check Complete" >> /root/CheckList.txt
# selinux 제거 및 저장소 변경
case $OSCHECK in 
    centos )
        echo "" >> /root/CheckList.txt
        echo "SELINUX Repository Check" >> /root/CheckList.txt
        cat /root/install_log.txt | grep "SELINUX is already turned off." >> /root/CheckList.txt
        echo "getenforce" >> /root/CheckList.txt
        getenforce >> /root/CheckList.txt
        cat /etc/selinux/config | grep "^SELINUX=" >> /root/CheckList.txt
        echo "" >> /root/CheckList.txt
        echo "SELINUX Repository Check Complete" >> /root/CheckList.txt
    ;;
    ubuntu )
        echo "" >> /root/CheckList.txt
        echo "Repository Check" >> /root/CheckList.txt
        cat /etc/apt/sources.list | grep -v "#\|^$" | head -3 >> /root/CheckList.txt
        echo "" >> /root/CheckList.txt
        echo "SELINUX Repository Check Complete" >> /root/CheckList.txt
    ;;
    *)
    ;;
esac
# 기본 패키지 설치
echo "" >> /root/CheckList.txt
echo "Pacakage Install Check" >> /root/CheckList.txt
case $OSCHECK in 
    centos )
        rpm -qa | grep htop >> /root/CheckList.txt
        rpm -qa | grep ^ethtool >> /root/CheckList.txt
        
    ;;
    ubuntu )
        dpkg -l | grep htop >> /root/CheckList.txt
        dpkg -l | grep ^ethtool >> /root/CheckList.txt
    ;;
    *)
    ;;
esac
echo "" >> /root/CheckList.txt
echo "Pacakage Install Check Complete" >> /root/CheckList.txt
# 프로필 설정
# 서버 시간 동기화
# 파이썬 설치
# 파이썬 패키지 설치
# 방화벽 설정
# 사용자 생성 테스트
# H/W 사양 체크

# GPU 버전 설치 진행 순서 
# CUDA,CUDNN Repo 설치
# CUDA 설치 및 PATH 설정
# CUDNN 설치 및 PATH 설정
# 딥러닝 패키지 설치(R,R Server, JupyterHub, Pycharm)
 
# MegaRaid Storage Manager 설치
# Mailutils
# Dell OMSA 설치
# 서버 온도 기록 수집

