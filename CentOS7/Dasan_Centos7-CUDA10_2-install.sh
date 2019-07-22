#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo ""
echo ""

echo -e  "\033[1;32m"==================== Deep Learning Package Install python-PIP, tensorflow ===================="\033[0m"

echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/python3.6/python/'   /usr/local/bin/pip \033[0m" >> /root/Dasan_command.txt
perl -pi -e 's/python3.6/python/'   /usr/local/bin/pip

echo ""
echo -e  "\033[1;34m${PROMPT} pip -V \033[0m" >> /root/Dasan_command.txt
pip -V

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 -V \033[0m" >> /root/Dasan_command.txt
pip3 -V

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/resolv.conf \033[0m" >> /root/Dasan_command.txt
cat /etc/resolv.conf

echo ""
echo -e  "\033[1;34m${PROMPT} pip install  numpy   scipy  nose  matplotlib  pandas  keras\033[0m" >> /root/Dasan_command.txt
pip install  numpy   scipy  nose  matplotlib  pandas  keras

echo ""
echo -e  "\033[1;34m${PROMPT} pip uninstall dnspython \033[0m" >> /root/Dasan_command.txt
pip uninstall dnspython

echo ""
echo -e  "\033[1;34m${PROMPT} yum erase -y python-ldap pyparsing \033[0m" >> /root/Dasan_command.txt
yum erase -y python-ldap pyparsing

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install  numpy   scipy  nose  matplotlib  pandas  keras \033[0m" >> /root/Dasan_command.txt
pip3 install  numpy   scipy  nose  matplotlib  pandas  keras

echo ""
echo -e  "\033[1;34m${PROMPT} pip install setuptools \033[0m" >> /root/Dasan_command.txt
pip install setuptools

echo ""
echo -e  "\033[1;34m${PROMPT} rm -rf /usr/share/doc/python-enum34-1.0.4* \033[0m" >> /root/Dasan_command.txt
rm -rf /usr/share/doc/python-enum34-1.0.4*

echo ""
echo -e  "\033[1;34m${PROMPT} rm -rf /usr/lib/python2.7/site-packages/enum34-1.0.4-py2.7.egg-info \033[0m" >> /root/Dasan_command.txt
rm -rf /usr/lib/python2.7/site-packages/enum34-1.0.4-py2.7.egg-info

echo ""
echo -e  "\033[1;34m${PROMPT} pip install  --upgrade tensorflow-gpu==1.13.1 \033[0m" >> /root/Dasan_command.txt
pip install  --upgrade tensorflow-gpu==1.13.1

echo ""
echo -e  "\033[1;34m${PROMPT} pip install --upgrade setuptools \033[0m" >> /root/Dasan_command.txt
pip install --upgrade setuptools

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install  --upgrade tensorflow-gpu==1.13.1 \033[0m" >> /root/Dasan_command.txt
pip3 install  --upgrade tensorflow-gpu==1.13.1

echo -e  "\033[1;34m${PROMPT} pip3 install --upgrade setuptools \033[0m" >> /root/Dasan_command.txt
pip3 install --upgrade setuptools
