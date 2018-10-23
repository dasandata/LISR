#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " # 부팅시 화면에 부팅로그 표시되도록 grub 수정 , 불필요한 ipv6를 비활성화 "
echo -e  "\033[1;34m${PROMPT} ip a | grep inet6 \033[0m"
ip a | grep inet6

echo ""
echo ""

echo " # 설정 변경 "
echo -e  "\033[1;34m${PROMPT} cat /etc/default/grub | grep -v #\|^$ \033[0m"
cat /etc/default/grub | grep -v "#\|^$"

echo ""
echo ""

echo " # 부팅시 화면에 부팅로그가 표시 되도록 rhgb 항목 지움 "
echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/splash//' /etc/default/grub \033[0m"
perl -pi -e 's/splash//' /etc/default/grub
echo ""
echo " # 부팅시 화면에 부팅로그가 표시 되도록 quiet 항목 지움 "
echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/quiet//'  /etc/default/grub \033[0m"
perl -pi -e 's/quiet//'  /etc/default/grub

echo ""
echo ""

echo " # ipv6 비활성 "
echo -e  "\033[1;34m${PROMPT} perl -pi -e  's/^GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /'  /etc/default/grub \033[0m"
perl -pi -e  's/^GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /'  /etc/default/grub

echo ""

echo " # timeout 옵션 해제 "
echo -e  "\033[1;34m${PROMPT} perl -pi -e  's/^GRUB_HIDDEN_TIMEOUT=/#GRUB_HIDDEN_TIMEOUT=/'  /etc/default/grub \033[0m"
perl -pi -e  's/^GRUB_HIDDEN_TIMEOUT=/#GRUB_HIDDEN_TIMEOUT=/'  /etc/default/grub

echo ""

echo " # 변경 사항 확인 "
echo -e  "\033[1;34m${PROMPT} cat /etc/default/grub | grep -v #\|^$ \033[0m"
cat /etc/default/grub | grep -v "#\|^$"

echo ""

echo " # boot kernel 에 설정 적용 "
echo -e  "\033[1;34m${PROMPT} update-initramfs -u && update-grub2 \033[0m"
update-initramfs -u && update-grub2

echo ""

echo " # 재부팅 "
echo -e  "\033[1;34m${PROMPT} reboot \033[0m"
reboot
