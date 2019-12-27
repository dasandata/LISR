#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;32m"==================== pip가 phyhon3 로 바뀌여서 아래 명령 실행 ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/python3/python/'   /usr/local/bin/pip \033[0m" >> Dasan_command.txt
perl -pi -e 's/python3/python/'   /usr/local/bin/pip

echo ""
echo -e  "\033[1;34m${PROMPT} python -V \033[0m" >> Dasan_command.txt
python -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python \033[0m" >> Dasan_command.txt
which  python

echo ""
echo -e  "\033[1;34m${PROMPT} python3 -V \033[0m" >> Dasan_command.txt
python3 -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python3 \033[0m" >> Dasan_command.txt
which  python3

echo ""
echo ""

echo " pip 설치전에 dns (/etc/resolv.conf) 값 확인 합니다. (속도 차이가 큽니다.) "

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/resolv.conf \033[0m" >> Dasan_command.txt
cat /etc/resolv.conf

echo ""
echo -e  "\033[1;34m${PROMPT} pip install  numpy   scipy  nose  matplotlib  pandas  keras \033[0m" >> Dasan_command.txt
pip install  numpy   scipy  nose  matplotlib  pandas  keras

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install  numpy   scipy  nose  matplotlib  pandas  keras \033[0m" >> Dasan_command.txt
pip3 install  numpy   scipy  nose  matplotlib  pandas  keras

echo ""
echo -e  "\033[1;34m${PROMPT} pip install  --upgrade tensorflow-gpu==1.11 \033[0m" >> Dasan_command.txt
pip install  --upgrade tensorflow-gpu==1.11

echo ""
echo -e  "\033[1;34m${PROMPT} pip install  --upgrade setuptools \033[0m" >> Dasan_command.txt
pip install  --upgrade setuptools

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install  --upgrade tensorflow-gpu==1.11 \033[0m" >> Dasan_command.txt
pip3 install  --upgrade tensorflow-gpu==1.11

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install  --upgrade setuptools \033[0m" >> Dasan_command.txt
pip3 install  --upgrade setuptools

echo ""
echo ""

echo -e  "\033[1;32m"==================== Deep Learning Package Install 2 python-PIP, PyTorch ===================="\033[0m"

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} pip install torch torchvision \033[0m" >> Dasan_command.txt
pip install torch torchvision

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install torch torchvision \033[0m" >> Dasan_command.txt
pip3 install torch torchvision
