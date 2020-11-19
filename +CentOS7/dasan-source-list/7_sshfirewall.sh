#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " ssh 및 방화벽 (Firewall)설정 / 보안강화 / X11 Forwading "

echo ""
echo ""

echo " 방화벽 (Firewall) 설정. "

echo ""
echo -e  "\033[1;34m${PROMPT} ip a \033[0m"
ip a

echo ""
echo -e  "\033[1;34m${PROMPT} EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2 |tr -d ' ') \033[0m"
EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2 |tr -d ' ')

echo ""
echo -e  "\033[1;34m${PROMPT} echo ${EXT_NIC} \033[0m"
echo ${EXT_NIC}

echo ""
echo -e  "\033[1;34m${PROMPT} ifconfig ${EXT_NIC} \033[0m"
ifconfig ${EXT_NIC}

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --get-zones 설정가능 한 zone 목록 확인 \033[0m"
firewall-cmd --get-zones

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --list-all 현재 설정 확인 \033[0m"
firewall-cmd --list-all

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --get-default-zone 현재 설정 확인 \033[0m"
firewall-cmd --get-default-zone

echo ""
echo ""

echo " 외부 인터페이스를 external 존 으로 변경. "

echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --change-interface=${EXT_NIC} --zone=external --permanent \033[0m"
firewall-cmd --change-interface=${EXT_NIC} --zone=external --permanent

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --set-default-zone=external 기본 zone 을 external 로 변경 \033[0m"
firewall-cmd --set-default-zone=external

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --reload  변경 사항 적용 \033[0m"
firewall-cmd --reload

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --add-port=7777/tcp  --permanent  7777 포트 개방 \033[0m"
firewall-cmd --add-port=7777/tcp  --permanent

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --remove-service=ssh  --permanent  포트 폐쇄 \033[0m"
firewall-cmd --remove-service=ssh  --permanent

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --reload  변경 사항 적용 \033[0m"
firewall-cmd --reload

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --list-all  변경된 설정 내용 확인 \033[0m"
firewall-cmd --list-all


echo ""
echo ""

echo " sshd 설정 "

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} grep 'Root\|Port' /etc/ssh/sshd_config   변경 전 설정 확인. \033[0m"
grep 'Root\|Port' /etc/ssh/sshd_config

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i  "s/Port 22/Port 7777/g" /etc/ssh/sshd_config   포트 변경 \033[0m"
sed -i  "s/#Port 22/Port 7777/g" /etc/ssh/sshd_config

echo ""
echo ""

echo " Root 로그인 거부 설정 "

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i  "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config \033[0m"
sed -i  "s/#PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config

echo ""
echo -e  "\033[1;34m${PROMPT} grep 'Root\|Port' /etc/ssh/sshd_config  # 변경 후 설정 확인. \033[0m"
grep 'Root\|Port' /etc/ssh/sshd_config

echo ""
echo -e  "\033[1;34m${PROMPT} echo "AddressFamily inet" >> /etc/ssh/sshd_config  # X11 Forwading 관련 설정 추가. \033[0m"
echo "AddressFamily inet" >> /etc/ssh/sshd_config

echo ""
echo -e  "\033[1;34m${PROMPT} grep AddressFamily /etc/ssh/sshd_config \033[0m"
grep AddressFamily /etc/ssh/sshd_config

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl restart sshd  # ssh 데몬 재시작. \033[0m"
systemctl restart sshd
