#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

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
echo -e  "\033[1;34m${PROMPT} pip install  --upgrade setuptools \033[0m" >> /root/dasan_install_log.txt
pip install  --upgrade setuptools

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install  --upgrade tensorflow-gpu==1.13.1 \033[0m" >> /root/dasan_install_log.txt
pip3 install  --upgrade tensorflow-gpu==1.13.1

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install  --upgrade setuptools \033[0m" >> /root/dasan_install_log.txt
pip3 install  --upgrade setuptools

echo ""
echo ""

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

echo -e  "\033[1;32m"==================== RAID Controller Management MSM  ===================="\033[0m" >> /root/dasan_install_log.txt

echo ""
echo ""

echo -e "Ubuntu16" >> /root/dasan_install_log.txt

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} cat /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-2_Ubuntu16/1-2-2-2_GPU/Install_MSM_Ubuntu.sh  \033[0m" >> /root/dasan_install_log.txt
cat /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-2_Ubuntu16/1-2-2-2_GPU/Install_MSM_Ubuntu.sh

echo ""
echo -e  "\033[1;34m${PROMPT} bash /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-2_Ubuntu16/1-2-2-2_GPU/Install_MSM_Ubuntu.sh \033[0m" >> /root/dasan_install_log.txt
bash /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-2_Ubuntu16/1-2-2-2_GPU/Install_MSM_Ubuntu.sh

sleep 10

echo ""
echo ""

echo ""
echo -e  "${PROMPT} apt-get install -y dkms linux-generic-hwe-16.04 xserver-xorg-hwe-16.04 " >> /root/dasan_install_log.txt
apt-get install -y dkms linux-generic-hwe-16.04 xserver-xorg-hwe-16.04

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i '/root/d' /etc/rc.local  \033[0m" >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.local

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl enable nvidia-persistenced  \033[0m" >> /root/dasan_install_log.txt
systemctl enable nvidia-persistenced

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} reboot  \033[0m" >> /root/dasan_install_log.txt
reboot
