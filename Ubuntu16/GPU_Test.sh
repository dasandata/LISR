#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;32m"==================== Deep Learning Package Install python-PIP, tensorflow ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} cd ~ \033[0m"
cd ~

echo ""
echo -e  "\033[1;34m${PROMPT} python -V \033[0m"
python -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python \033[0m"
which  python

echo ""
echo -e  "\033[1;34m${PROMPT} python3 -V \033[0m"
python3 -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python3 \033[0m"
which  python3

echo ""
echo -e  "\033[1;34m${PROMPT} apt-get install -y  python-pip python3-pip  python3-tk \033[0m"
apt-get install -y  python-pip python3-pip  python3-tk  >> dasan_log_install_python3.txt   2>&1

echo ""
echo ""

echo " pip Check "

echo ""
echo -e  "\033[1;34m${PROMPT} python -V \033[0m"
python -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python \033[0m"
which  python

echo ""
echo -e  "\033[1;34m${PROMPT} python3 -V \033[0m"
python3 -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python3 \033[0m"
which  python3

echo ""
echo ""

echo " ADD package install "

echo ""
echo -e  "\033[1;34m${PROMPT} pip   install --upgrade pip \033[0m"
pip   install --upgrade pip

echo ""
echo -e  "\033[1;34m${PROMPT} pip3   install --upgrade pip \033[0m"
pip3   install --upgrade pip

echo ""
echo ""

echo " 컨트롤 + D 를 눌려 로그아웃 후 재 접속 후 Dasan_GPU_Install_standard_1 실행 파일 실행 "
