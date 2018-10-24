#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " 새로운 사용자를 추가하고, sudo 권한을 부여 합니다. "

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} NEW_USER=dasan \033[0m"
NEW_USER=dasan
echo ""
echo -e  "\033[1;34m${PROMPT} echo ${NEW_USER}\033[0m"
echo ${NEW_USER}
echo ""
echo -e  "\033[1;34m${PROMPT} adduser ${NEW_USER} \033[0m"
adduser ${NEW_USER}
echo ""

echo " 관리자로 전환될 수 있도록, 새 사용자를 wheel 그룹에 포함. "
echo ""
echo -e  "\033[1;34m${PROMPT} grep ${NEW_USER} /etc/group \033[0m"
grep ${NEW_USER} /etc/group
echo ""
echo -e  "\033[1;34m${PROMPT} usermod -G sudo ${NEW_USER} \033[0m"
usermod -G sudo ${NEW_USER}
echo ""
echo -e  "\033[1;34m${PROMPT} grep ${NEW_USER} /etc/group \033[0m"
grep ${NEW_USER} /etc/group
echo ""

echo " sonic유저 계정 로그아웃 후 dasan유저 계정으로 su - 확인 "
