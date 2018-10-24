#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " ssh port 를 7777로 변경하고, ssh를 통한 Root Login을 거부 한 후 "
echo " 변경된 포트에 맞게 방화벽을 설정한 합니다. "
echo " X11 Forwading 에 필요한 설정을 추가 합니다. "

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl status ufw \033[0m"
systemctl status ufw
echo ""
echo -e  "\033[1;34m${PROMPT} ufw status \033[0m"
ufw status
echo ""
echo -e  "\033[1;34m${PROMPT} ufw enable \033[0m"
ufw enable


echo " 기본 정책을 차단 (deny) 로 변경한 후 필요한 포트 (또는 서비스) 만 허용. "

echo ""

echo -e  "\033[1;34m${PROMPT} ufw status \033[0m"
ufw status
echo ""
echo -e  "\033[1;34m${PROMPT} ufw default deny \033[0m"
ufw default deny
echo ""
echo -e  "\033[1;34m${PROMPT} ufw allow 22/tcp \033[0m"
ufw allow 22/tcp
echo ""
echo -e  "\033[1;34m${PROMPT} ufw allow 7777/tcp \033[0m"
ufw allow 7777/tcp
echo ""
echo -e  "\033[1;34m${PROMPT} ufw status numbered \033[0m"
ufw status numbered
echo ""
