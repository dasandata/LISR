#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo "  우선 kernel 을 업데이트 와 grub 를 수정하고, 재부팅 한 후 진행 합니다. "
echo ""
echo -e  "${PROMPT} yum -y update " >> /root/dasan_install_log.txt
yum -y update >> /root/log.txt

echo ""

echo " 설정이 까다로운 SELINUX 를 disable 합니다. "
echo ""
echo -e  "${PROMPT} setenforce 0 " >> /root/dasan_install_log.txt
setenforce 0

echo ""

echo -e  "${PROMPT} getenforce " >> /root/dasan_install_log.txt
getenforce

echo ""

echo -e  "${PROMPT} sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config " >> /root/dasan_install_log.txt
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

echo ""

echo -e  "${PROMPT} grep 'SELINUX=' /etc/selinux/config  " >> /root/dasan_install_log.txt
grep 'SELINUX=' /etc/selinux/config

echo ""

echo " 부팅시 화면에 부팅로그가 표시되도록 grub 를 수정하고, 불필요한 ipv6를 비활성화 하여 ip 정보 가독성을 높입니다. "
echo ""
echo -e  "${PROMPT} ip a | grep inet6 " >> /root/dasan_install_log.txt
ip a | grep inet6

echo ""

echo " 설정 변경. "
echo ""
echo -e  "${PROMPT} cat /etc/default/grub  기존 설정 내용 확인 " >> /root/dasan_install_log.txt
cat /etc/default/grub

echo ""
echo -e  "${PROMPT} sed -i  's/rhgb//'   /etc/default/grub  부팅시 화면에 부팅로그가 표시 되도록 rhgb 항목 지움 " >> /root/dasan_install_log.txt
sed -i  's/rhgb//'   /etc/default/grub

echo ""
echo -e  "${PROMPT} sed -i  's/quiet//'  /etc/default/grub   # 부팅시 화면에 부팅로그가 표시 되도록 quiet 항목 지움 " >> /root/dasan_install_log.txt
sed -i  's/quiet//'  /etc/default/grub

echo ""

echo " ipv6 비활성 "
echo ""
echo -e  "${PROMPT} sed -i  's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /' /etc/default/grub " >> /root/dasan_install_log.txt
sed -i  's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /' /etc/default/grub

echo ""
echo -e  "${PROMPT} cat /etc/default/grub   변경사항 확인 " >> /root/dasan_install_log.txt
cat /etc/default/grub

echo ""
echo -e  "${PROMPT} grub2-mkconfig -o /boot/grub2/grub.cfg   boot kernel 에 설정 적용 " >> /root/dasan_install_log.txt
grub2-mkconfig -o /boot/grub2/grub.cfg

echo ""
echo -e  "${PROMPT} grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg   boot kernel 에 설정 적용 " >> /root/dasan_install_log.txt
grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg

echo ""
echo ""

echo "  rc.local 등록 "
echo -e  "${PROMPT} sed -i '13s/Dasan_Centos7-yumupdate-install.sh/Dasan_Centos7-Standard-install.sh/g' /etc/rc.d/rc.local    " >> /root/dasan_install_log.txt
sed -i '13s/Dasan_Centos7-yumupdate-install.sh/Dasan_Centos7-Standard-install.sh/g' /etc/rc.d/rc.local

echo -e  "${PROMPT} cat /etc/rc.d/rc.local  | sed -n 13p " >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 13p

echo " 재 부팅 "
echo -e  "${PROMPT} reboot  재 부팅 " >> /root/dasan_install_log.txt
reboot
