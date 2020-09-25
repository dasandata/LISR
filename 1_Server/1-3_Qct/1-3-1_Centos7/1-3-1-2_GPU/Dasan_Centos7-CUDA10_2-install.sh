#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo ""
echo ""

echo -e  "\033[1;32m"==================== Deep Learning Package Install python-PIP, tensorflow ===================="\033[0m"

echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/python3/python/'   /usr/local/bin/pip \033[0m" >> /root/dasan_install_log.txt
perl -pi -e 's/python3/python/'   /usr/local/bin/pip

echo ""
echo -e  "\033[1;34m${PROMPT} pip -V \033[0m" >> /root/dasan_install_log.txt
pip -V

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 -V \033[0m" >> /root/dasan_install_log.txt
pip3 -V

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/resolv.conf \033[0m" >> /root/dasan_install_log.txt
cat /etc/resolv.conf

echo ""
echo -e  "\033[1;34m${PROMPT} pip install  numpy   scipy  nose  matplotlib  pandas  keras\033[0m" >> /root/dasan_install_log.txt
pip install  numpy   scipy  nose  matplotlib  pandas  keras

echo ""
echo -e  "\033[1;34m${PROMPT} pip uninstall --yes dnspython \033[0m" >> /root/dasan_install_log.txt
pip uninstall --yes dnspython

echo ""
echo -e  "\033[1;34m${PROMPT} yum erase -y python-ldap pyparsing \033[0m" >> /root/dasan_install_log.txt
yum erase -y python-ldap pyparsing

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install  numpy   scipy  nose  matplotlib  pandas  keras \033[0m" >> /root/dasan_install_log.txt
pip3 install  numpy   scipy  nose  matplotlib  pandas  keras

echo ""
echo -e  "\033[1;34m${PROMPT} pip install --upgrade setuptools \033[0m" >> /root/dasan_install_log.txt
pip install --upgrade setuptools

echo ""
echo -e  "\033[1;34m${PROMPT} rm -rf /usr/share/doc/python-enum34-1.0.4* \033[0m" >> /root/dasan_install_log.txt
rm -rf /usr/share/doc/python-enum34-1.0.4*

echo ""
echo -e  "\033[1;34m${PROMPT} rm -rf /usr/lib/python2.7/site-packages/enum34-1.0.4-py2.7.egg-info \033[0m" >> /root/dasan_install_log.txt
rm -rf /usr/lib/python2.7/site-packages/enum34-1.0.4-py2.7.egg-info

echo ""
echo -e  "\033[1;34m${PROMPT} pip install  --upgrade tensorflow-gpu==1.13.1 \033[0m" >> /root/dasan_install_log.txt
pip install  --upgrade tensorflow-gpu==1.13.1

echo ""
echo -e  "\033[1;34m${PROMPT} pip install --upgrade setuptools \033[0m" >> /root/dasan_install_log.txt
pip install --upgrade setuptools

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install  --upgrade tensorflow-gpu==1.13.1 \033[0m" >> /root/dasan_install_log.txt
pip3 install  --upgrade tensorflow-gpu==1.13.1

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install --upgrade setuptools \033[0m" >> /root/dasan_install_log.txt
pip3 install --upgrade setuptools

echo -e  "\033[1;32m"==================== RAID Controller Management MSM  ===================="\033[0m" >> /root/dasan_install_log.txt

echo ""
echo ""

echo -e "Centos 7" >> /root/dasan_install_log.txt

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} cat /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-1_Centos7/1-2-1-2_GPU/Install_MSM_CentOS7.sh  \033[0m" >> /root/dasan_install_log.txt
cat /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-1_Centos7/1-2-1-2_GPU/Install_MSM_CentOS7.sh

echo ""
echo -e  "\033[1;34m${PROMPT} bash /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-1_Centos7/1-2-1-2_GPU/Install_MSM_CentOS7.sh \033[0m" >> /root/dasan_install_log.txt
bash /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-1_Centos7/1-2-1-2_GPU/Install_MSM_CentOS7.sh

sleep 10

echo ""
echo ""


echo ""
echo ""

echo "  rc.local 등록 "
echo ""
echo ""
echo -e  "\033[1;34m${PROMPT} sed -i '13s/Dasan_Centos7-CUDA10_2-install.sh/Dasan_Centos7-R_install.sh/g' /etc/rc.d/rc.local    \033[0m" >> /root/dasan_install_log.txt
sed -i '13s/Dasan_Centos7-CUDA10_2-install.sh/Dasan_Centos7-R_install.sh/g' /etc/rc.d/rc.local

echo ""
echo ""
echo -e  "\033[1;34m${PROMPT} systemctl enable nvidia-persistenced  \033[0m" >> /root/dasan_install_log.txt
systemctl enable nvidia-persistenced

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} reboot  \033[0m" >> /root/dasan_install_log.txt
reboot
