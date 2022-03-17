#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;34m${PROMPT} cat /etc/apt/sources.list | grep -v \"#\|^$\" \033[0m"
cat /etc/apt/sources.list  |  grep -v "#\|^$"
echo "  기본 저장소 확인 "

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list \033[0m"
perl -pi -e 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
echo "  Security 부분 변경 "

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} cat /etc/apt/sources.list | grep -v \"#\|^$\" \033[0m"
cat /etc/apt/sources.list  |  grep -v "#\|^$"
echo "  변경 내용 확인 "

echo ""
echo ""

echo -e  "\033[1;34m${PROMPT} apt-get update \033[0m"
apt-get update
echo "  적용 하기 "
