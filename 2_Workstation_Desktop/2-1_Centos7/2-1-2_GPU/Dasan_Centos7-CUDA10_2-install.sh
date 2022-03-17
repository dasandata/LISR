#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo ""
echo ""

echo -e  "==================== Deep Learning Package Install python-PIP, tensorflow ===================="

echo ""

echo ""
echo -e  "${PROMPT} perl -pi -e 's/python3/python/'   /usr/local/bin/pip " >> /root/dasan_install_log.txt
perl -pi -e 's/python3/python/'   /usr/local/bin/pip

echo ""
echo -e  "${PROMPT} pip -V " >> /root/dasan_install_log.txt
pip -V

echo ""
echo -e  "${PROMPT} pip3 -V " >> /root/dasan_install_log.txt
pip3 -V

echo ""
echo -e  "${PROMPT} cat /etc/resolv.conf " >> /root/dasan_install_log.txt
cat /etc/resolv.conf

echo ""
echo -e  "${PROMPT} pip install  numpy   scipy  nose  matplotlib  pandas  keras" >> /root/dasan_install_log.txt
pip install  numpy   scipy  nose  matplotlib  pandas  keras >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip uninstall --yes dnspython " >> /root/dasan_install_log.txt
pip uninstall --yes dnspython >> /root/log.txt

echo ""
echo -e  "${PROMPT} yum erase -y python-ldap pyparsing " >> /root/dasan_install_log.txt
yum erase -y python-ldap pyparsing >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip3 install  numpy   scipy  nose  matplotlib  pandas  keras " >> /root/dasan_install_log.txt
pip3 install  numpy   scipy  nose  matplotlib  pandas  keras >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip install --upgrade setuptools " >> /root/dasan_install_log.txt
pip install --upgrade setuptools >> /root/log.txt

echo ""
echo -e  "${PROMPT} rm -rf /usr/share/doc/python-enum34-1.0.4* " >> /root/dasan_install_log.txt
rm -rf /usr/share/doc/python-enum34-1.0.4* >> /root/log.txt

echo ""
echo -e  "${PROMPT} rm -rf /usr/lib/python2.7/site-packages/enum34-1.0.4-py2.7.egg-info " >> /root/dasan_install_log.txt
rm -rf /usr/lib/python2.7/site-packages/enum34-1.0.4-py2.7.egg-info >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip install  --upgrade tensorflow-gpu==1.13.1 " >> /root/dasan_install_log.txt
pip install  --upgrade tensorflow-gpu==1.13.1 >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip install --upgrade setuptools " >> /root/dasan_install_log.txt
pip install --upgrade setuptools >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip3 install  --upgrade tensorflow-gpu==1.13.1 " >> /root/dasan_install_log.txt
pip3 install  --upgrade tensorflow-gpu==1.13.1 >> /root/log.txt

echo -e  "${PROMPT} pip3 install --upgrade setuptools " >> /root/dasan_install_log.txt
pip3 install --upgrade setuptools >> /root/log.txt


echo ""
echo ""

echo "  rc.local 등록 "
echo -e  "${PROMPT} sed -i '13s/Dasan_Centos7-CUDA10_2-install.sh/Dasan_Centos7-R_install.sh/g' /etc/rc.d/rc.local    " >> /root/dasan_install_log.txt
sed -i '13s/Dasan_Centos7-CUDA10_2-install.sh/Dasan_Centos7-R_install.sh/g' /etc/rc.d/rc.local

echo -e  "${PROMPT} cat /etc/rc.d/rc.local  | sed -n 13p " >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 13p


echo ""
echo -e  "${PROMPT} systemctl enable nvidia-persistenced  " >> /root/dasan_install_log.txt
systemctl enable nvidia-persistenced

echo ""
echo ""

echo ""
echo -e  "${PROMPT} reboot  " >> /root/dasan_install_log.txt
reboot
