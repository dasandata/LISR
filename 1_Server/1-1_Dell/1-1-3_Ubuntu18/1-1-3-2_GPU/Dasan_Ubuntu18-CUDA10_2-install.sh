#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;32m"==================== pip가 phyhon3 로 바뀌여서 아래 명령 실행 ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/python3/python/'   /usr/local/bin/pip \033[0m" >> /root/dasan_install_log.txt
perl -pi -e 's/python3/python/'   /usr/local/bin/pip

echo ""
echo -e  "\033[1;34m${PROMPT} python -V \033[0m" >> /root/dasan_install_log.txt
python -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python \033[0m" >> /root/dasan_install_log.txt
which  python

echo ""
echo -e  "\033[1;34m${PROMPT} python3 -V \033[0m" >> /root/dasan_install_log.txt
python3 -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python3 \033[0m" >> /root/dasan_install_log.txt
which  python3

echo ""
echo ""

echo " pip 설치전에 dns (/etc/resolv.conf) 값 확인 합니다. (속도 차이가 큽니다.) "

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/resolv.conf \033[0m" >> /root/dasan_install_log.txt
cat /etc/resolv.conf

echo ""
echo -e  "\033[1;34m${PROMPT} pip install  numpy   scipy  nose  matplotlib  pandas  keras \033[0m" >> /root/dasan_install_log.txt
pip install  numpy   scipy  nose  matplotlib  pandas  keras

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install  numpy   scipy  nose  matplotlib  pandas  keras \033[0m" >> /root/dasan_install_log.txt
pip3 install  numpy   scipy  nose  matplotlib  pandas  keras

echo ""
echo -e  "\033[1;34m${PROMPT} pip install  --upgrade tensorflow-gpu==1.13.1 \033[0m" >> /root/dasan_install_log.txt
pip install  --upgrade tensorflow-gpu==1.13.1

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install  --upgrade tensorflow-gpu==1.13.1 \033[0m" >> /root/dasan_install_log.txt
pip3 install  --upgrade tensorflow-gpu==1.13.1

echo -e  "\033[1;32m"==================== Deep Learning Package Install 2 python-PIP, PyTorch ===================="\033[0m"

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} pip install torch torchvision \033[0m" >> /root/dasan_install_log.txt
pip install torch torchvision

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install torch torchvision \033[0m" >> /root/dasan_install_log.txt
pip3 install torch torchvision

echo ""
echo ""

echo "  rc.local 등록 "
echo ""
echo -e  "\033[1;34m${PROMPT} sed -i '/root/d' /etc/rc.local  \033[0m" >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.local

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i '1a nvidia-smi -pm 1' /etc/rc.local   \033[0m" >> /root/dasan_install_log.txt
sed -i '1a nvidia-smi -pm 1' /etc/rc.local

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/rc.local | sed -n 2p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 2p



echo ""
echo ""

echo "  재부팅 "
echo -e  "\033[1;34m${PROMPT} reboot \033[0m" >> /root/dasan_install_log.txt
reboot
