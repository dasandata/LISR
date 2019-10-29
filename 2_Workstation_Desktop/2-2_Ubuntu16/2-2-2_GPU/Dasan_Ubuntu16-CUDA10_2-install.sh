#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo -e  ""==================== pip가 phyhon3 로 바뀌여서 아래 명령 실행 ====================""

echo ""
echo -e  "${PROMPT} perl -pi -e 's/python3/python/'   /usr/local/bin/pip " >> /root/dasan_install_log.txt
perl -pi -e 's/python3/python/'   /usr/local/bin/pip

echo ""
echo -e  "${PROMPT} python -V " >> /root/dasan_install_log.txt
python -V

echo ""
echo -e  "${PROMPT} which  python " >> /root/dasan_install_log.txt
which  python

echo ""
echo -e  "${PROMPT} python3 -V " >> /root/dasan_install_log.txt
python3 -V

echo ""
echo -e  "${PROMPT} which  python3 " >> /root/dasan_install_log.txt
which  python3

echo ""
echo ""

echo " pip 설치전에 dns (/etc/resolv.conf) 값 확인 합니다. (속도 차이가 큽니다.) "

echo ""
echo -e  "${PROMPT} cat /etc/resolv.conf " >> /root/dasan_install_log.txt
cat /etc/resolv.conf

echo ""
echo -e  "${PROMPT} pip install  numpy   scipy  nose  matplotlib  pandas  keras " >> /root/dasan_install_log.txt
pip install  numpy   scipy  nose  matplotlib  pandas  keras >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip3 install  numpy   scipy  nose  matplotlib  pandas  keras " >> /root/dasan_install_log.txt
pip3 install  numpy   scipy  nose  matplotlib  pandas  keras >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip install  --upgrade tensorflow-gpu==1.13.1 " >> /root/dasan_install_log.txt
pip install  --upgrade tensorflow-gpu==1.13.1 >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip install  --upgrade setuptools " >> /root/dasan_install_log.txt
pip install  --upgrade setuptools >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip3 install  --upgrade tensorflow-gpu==1.13.1 " >> /root/dasan_install_log.txt
pip3 install  --upgrade tensorflow-gpu==1.13.1 >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip3 install  --upgrade setuptools " >> /root/dasan_install_log.txt
pip3 install  --upgrade setuptools >> /root/log.txt

echo ""
echo ""

echo -e  ""==================== Deep Learning Package Install 2 python-PIP, PyTorch ====================""

echo ""
echo ""

echo ""
echo -e  "${PROMPT} pip install torch torchvision " >> /root/dasan_install_log.txt
pip install torch torchvision >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip3 install torch torchvision " >> /root/dasan_install_log.txt
pip3 install torch torchvision >> /root/log.txt

echo ""

echo ""
echo -e  "${PROMPT} sed -i '/root/d' /etc/rc.local  " >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.local

echo ""
echo -e  "${PROMPT} sed -i '13a nvidia-smi -pm 1' /etc/rc.local  " >> /root/dasan_install_log.txt
sed -i '13a nvidia-smi -pm 1' /etc/rc.local

echo ""
echo -e  "${PROMPT} cat /etc/rc.local | sed -n 13p  " >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 13p

echo ""
echo ""

echo ""
echo -e  "${PROMPT} reboot  " >> /root/dasan_install_log.txt
reboot
