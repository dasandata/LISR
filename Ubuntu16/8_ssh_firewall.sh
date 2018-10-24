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
read Command may disrupt existing ssh connections. Proceed with operation (y|n)?
