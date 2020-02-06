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

echo -e  "\033[1;34m${PROMPT} pip3 install --upgrade setuptools \033[0m" >> /root/dasan_install_log.txt
pip3 install --upgrade setuptools


echo ""
echo ""

echo "  rc.local 등록 "
echo ""
echo -e  "\033[1;34m${PROMPT} sed -i '/root/d' /etc/rc.d/rc.local   \033[0m" >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.d/rc.local

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl enable nvidia-persistenced  \033[0m" >> /root/dasan_install_log.txt
systemctl enable nvidia-persistenced

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i '12a bash /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Dasan-dell-install.sh >> /root/dasan_install_log.txt' /etc/rc.d/rc.local   \033[0m" >> /root/dasan_install_log.txt
sed -i '12a bash /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Dasan-dell-install.sh >> /root/dasan_install_log.txt' /etc/rc.d/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.d/rc.local  | sed -n 13p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 13p

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} reboot  \033[0m" >> /root/dasan_install_log.txt
reboot
