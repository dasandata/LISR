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
