#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo -e  "==================== pip가 phyhon3 로 바뀌여서 아래 명령 실행 ===================="

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
echo -e  "${PROMPT} pip3 install  --upgrade tensorflow-gpu==1.13.1 " >> /root/dasan_install_log.txt
pip3 install  --upgrade tensorflow-gpu==1.13.1 >> /root/log.txt

echo -e  "==================== Deep Learning Package Install 2 python-PIP, PyTorch ===================="

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

echo -e  "==================== RAID Controller Management MSM  ===================="

echo ""
echo ""

echo -e "Ubuntu18" >> /root/dasan_install_log.txt

echo ""
echo ""

echo ""
echo -e  "${PROMPT} cat /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-3_Ubuntu18/1-2-3-2_GPU/Install_MSM_Ubuntu.sh  " >> /root/dasan_install_log.txt
cat /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-3_Ubuntu18/1-2-3-2_GPU/Install_MSM_Ubuntu.sh >> /root/log.txt

echo ""
echo -e  "${PROMPT} bash /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-3_Ubuntu18/1-2-3-2_GPU/Install_MSM_Ubuntu.sh " >> /root/dasan_install_log.txt
bash /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-3_Ubuntu18/1-2-3-2_GPU/Install_MSM_Ubuntu.sh >> /root/log.txt

sleep 10

echo ""
echo ""

echo "  rc.local 등록 "
echo ""
echo -e  "${PROMPT} sed -i '/root/d' /etc/rc.local  " >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.local

echo ""
echo ""

echo -e  "${PROMPT} systemctl enable nvidia-persistenced " >> /root/dasan_install_log.txt
systemctl enable nvidia-persistenced

echo ""
echo ""

echo "  재부팅 "
echo -e  "${PROMPT} reboot " >> /root/dasan_install_log.txt
reboot
