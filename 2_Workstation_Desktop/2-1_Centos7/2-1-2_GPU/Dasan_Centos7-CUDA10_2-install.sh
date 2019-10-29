#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo ""
echo ""

echo -e  "==================== Deep Learning Package Install python-PIP, tensorflow ===================="

echo ""

echo ""
echo -e  "${PROMPT} perl -pi -e 's/python3.6/python/'   /usr/local/bin/pip " >> /root/dasan_install_log.txt
perl -pi -e 's/python3.6/python/'   /usr/local/bin/pip

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
echo ""
echo -e  "${PROMPT} sed -i '/root/d' /etc/rc.d/rc.local   " >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.d/rc.local

echo ""
echo -e  "${PROMPT} sed -i '12a nvidia-smi -pm 1' /etc/rc.d/rc.local   " >> /root/dasan_install_log.txt
sed -i '12a nvidia-smi -pm 1' /etc/rc.d/rc.local

echo ""
echo -e  "${PROMPT} cat /etc/rc.d/rc.local  | sed -n 13p  " >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 13p

echo ""
echo ""

echo ""
echo -e  "${PROMPT} reboot  " >> /root/dasan_install_log.txt
reboot
