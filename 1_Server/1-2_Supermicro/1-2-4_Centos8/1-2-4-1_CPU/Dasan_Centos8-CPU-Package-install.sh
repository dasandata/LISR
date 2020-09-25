#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo ""
echo ""

echo -e  "\033[1;32m"==================== Deep Learning Package Install Python-pip, Tensorflow ===================="\033[0m"

echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} python2 -V \033[0m" >> /root/dasan_install_log.txt
python2 -V

echo ""
echo -e  "\033[1;34m${PROMPT} python3 -V \033[0m" >> /root/dasan_install_log.txt
python3 -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  pip2 \033[0m" >> /root/dasan_install_log.txt
which pip2

echo ""
echo -e  "\033[1;34m${PROMPT} which  pip3 \033[0m" >> /root/dasan_install_log.txt
which pip3

echo ""
echo -e  "\033[1;34m${PROMPT} pip2 -V \033[0m" >> /root/dasan_install_log.txt
pip2 -V

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 -V \033[0m" >> /root/dasan_install_log.txt
pip3 -V

echo ""
echo -e  "\033[1;34m${PROMPT} pip2 install --upgrade pip \033[0m" >> /root/dasan_install_log.txt
pip2 install --upgrade pip

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install --upgrade pip \033[0m" >> /root/dasan_install_log.txt
pip3 install --upgrade pip

echo ""
echo -e  "\033[1;34m${PROMPT} pip2 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow \033[0m" >> /root/dasan_install_log.txt
pip2 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow

echo ""
echo -e  "\033[1;34m${PROMPT} pip2 install --upgrade setuptools \033[0m" >> /root/dasan_install_log.txt
pip2 install --upgrade setuptools

echo ""
echo -e  "\033[1;34m${PROMPT} pip2 list | grep -i ten \033[0m" >> /root/dasan_install_log.txt
pip2 list | grep -i ten

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow \033[0m" >> /root/dasan_install_log.txt
pip3 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install --upgrade python-dateutil \033[0m" >> /root/dasan_install_log.txt
pip3 install --upgrade python-dateutil

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 list | grep -i ten \033[0m" >> /root/dasan_install_log.txt
pip3 list | grep -i ten

echo ""
echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/python3.6/python2.7/'   /usr/local/bin/pip \033[0m" >> /root/dasan_install_log.txt
perl -pi -e 's/python3.6/python2.7/'   /usr/local/bin/pip

echo ""
echo ""

echo -e  "\033[1;32m"==================== R-studio Server install ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} wget https://download2.rstudio.org/server/centos8/x86_64/rstudio-server-rhel-1.3.959-x86_64.rpm \033[0m" >> /root/dasan_install_log.txt
wget https://download2.rstudio.org/server/centos8/x86_64/rstudio-server-rhel-1.3.959-x86_64.rpm

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y rstudio-server-rhel-1.3.959-x86_64.rpm \033[0m" >> /root/dasan_install_log.txt
dnf install -y rstudio-server-rhel-1.3.959-x86_64.rpm

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y libRmath-devel R-rpm-macros java-devel libRmath libgfortran.so.5 libopenblas.so.0 libquadmath.so.0 libtcl8.6.so libtk8.6.so \033[0m" >> /root/dasan_install_log.txt
dnf install -y libRmath-devel R-rpm-macros java-devel libRmath libgfortran.so.5 libopenblas.so.0 libquadmath.so.0 libtcl8.6.so libtk8.6.so

echo ""
echo -e  "\033[1;34m${PROMPT} dnf config-manager --set-enabled PowerTools \033[0m" >> /root/dasan_install_log.txt
dnf config-manager --set-enabled PowerTools

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y R \033[0m" >> /root/dasan_install_log.txt
dnf install -y R

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl restart rstudio-server.service \033[0m" >> /root/dasan_install_log.txt
systemctl restart rstudio-server.service

echo -e  "\033[1;32m"==================== Python3 setuptools upgrade install bug firewall-cmd command error ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} cp /usr/local/lib/python3.6/site-packages/six.py /usr/lib/python3.6/site-packages/ \033[0m" >> /root/dasan_install_log.txt
cp /usr/local/lib/python3.6/site-packages/six.py /usr/lib/python3.6/site-packages/

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --list-all \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --list-all

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --add-port=8787/tcp --permanent \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --add-port=8787/tcp --permanent

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --reload \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --reload

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --list-all \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --list-all

echo ""
echo ""

echo -e  "\033[1;32m"==================== Jupyterhub install ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y nodejs \033[0m" >> /root/dasan_install_log.txt
dnf install -y nodejs

echo ""
echo -e  "\033[1;34m${PROMPT} npm install -g configurable-http-proxy \033[0m" >> /root/dasan_install_log.txt
npm install -g configurable-http-proxy

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install --upgrade jupyterhub notebook flask \033[0m" >> /root/dasan_install_log.txt
pip3 install --upgrade jupyterhub notebook flask

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 list | grep -i jupyterhub \033[0m" >> /root/dasan_install_log.txt
pip3 list | grep -i jupyterhub

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --list-all \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --list-all

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --add-port=8000/tcp --permanent \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --add-port=8000/tcp --permanent

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --reload \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --reload

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --list-all \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --list-all

echo ""
echo -e  "\033[1;34m${PROMPT} mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub.service /lib/systemd/system/ \033[0m" >> /root/dasan_install_log.txt
mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub.service /lib/systemd/system/

echo ""
echo -e  "\033[1;34m${PROMPT} chmod 777 /lib/systemd/system/jupyterhub.service \033[0m" >> /root/dasan_install_log.txt
chmod 777 /lib/systemd/system/jupyterhub.service

echo ""
echo -e  "\033[1;34m${PROMPT} mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub /etc/init.d/ \033[0m" >> /root/dasan_install_log.txt
mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub /etc/init.d/

echo ""
echo -e  "\033[1;34m${PROMPT} chmod 755 /etc/init.d/jupyterhub \033[0m" >> /root/dasan_install_log.txt
chmod 755 /etc/init.d/jupyterhub

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl daemon-reload \033[0m" >> /root/dasan_install_log.txt
systemctl daemon-reload

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl enable jupyterhub.service \033[0m" >> /root/dasan_install_log.txt
systemctl enable jupyterhub.service

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl restart jupyterhub.service \033[0m" >> /root/dasan_install_log.txt
systemctl restart jupyterhub.service

echo ""
echo -e  "\033[1;34m${PROMPT} R CMD BATCH /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/r_jupyterhub.R \033[0m" >> /root/dasan_install_log.txt
R CMD BATCH /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/r_jupyterhub.R

echo ""
echo ""

echo -e  "\033[1;32m"==================== Pycharm install ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y snapd \033[0m" >> /root/dasan_install_log.txt
dnf install -y snapd

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl enable --now snapd.socket \033[0m" >> /root/dasan_install_log.txt
systemctl enable --now snapd.socket

echo ""
echo -e  "\033[1;34m${PROMPT} ln -s /var/lib/snapd/snap /snap \033[0m" >> /root/dasan_install_log.txt
ln -s /var/lib/snapd/snap /snap

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl restart snapd.socket \033[0m" >> /root/dasan_install_log.txt
systemctl restart snapd.socket

sleep 30

echo ""
echo -e  "\033[1;34m${PROMPT} snap install pycharm-community --classic \033[0m" >> /root/dasan_install_log.txt
snap install pycharm-community --classic

sleep 300

echo ""
echo ""

echo -e  "\033[1;32m"==================== Dell RAID Controller Management MSM Alert by Email ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} cat /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Install_Dell_MSM_CentOS7.sh  \033[0m" >> /root/dasan_install_log.txt
cat /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Install_Dell_MSM_CentOS7.sh

echo ""
echo -e  "\033[1;34m${PROMPT} bash /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Install_Dell_MSM_CentOS7.sh \033[0m" >> /root/dasan_install_log.txt
bash /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Install_Dell_MSM_CentOS7.sh

sleep 10

echo ""
echo ""

echo " ipmitool Fan speed Max "
echo ""
echo ""
echo -e  "\033[1;34m${PROMPT} ipmitool sdr type fan \033[0m" >> /root/dasan_install_log.txt
ipmitool sdr type fan

sleep 5

echo -e  "\033[1;34m${PROMPT} ipmitool raw 0x30 0x45 0x00 \033[0m" >> /root/dasan_install_log.txt
ipmitool raw 0x30 0x45 0x00

sleep 5

echo -e  "\033[1;34m${PROMPT} ipmitool raw 0x30 0x70 0x66 0x01 0x00 0x64 \033[0m" >> /root/dasan_install_log.txt
ipmitool raw 0x30 0x70 0x66 0x01 0x00 0x64

sleep 5

echo -e  "\033[1;34m${PROMPT} ipmitool raw 0x30 0x70 0x66 0x01 0x01 0x64 \033[0m" >> /root/dasan_install_log.txt
ipmitool raw 0x30 0x70 0x66 0x01 0x01 0x64

sleep 5

echo -e  "\033[1;34m${PROMPT} ipmitool raw 0x30 0x70 0x66 0x01 0x02 0x64 \033[0m" >> /root/dasan_install_log.txt
ipmitool raw 0x30 0x70 0x66 0x01 0x02 0x64

sleep 5

echo -e  "\033[1;34m${PROMPT} ipmitool raw 0x30 0x70 0x66 0x01 0x03 0x64 \033[0m" >> /root/dasan_install_log.txt
ipmitool raw 0x30 0x70 0x66 0x01 0x03 0x64

sleep 5

echo -e  "\033[1;34m${PROMPT} ipmitool sdr type fan \033[0m" >> /root/dasan_install_log.txt
ipmitool sdr type fan


echo "  rc.local 등록 "

echo -e  "\033[1;34m${PROMPT} sed -i '/root/d' /etc/rc.d/rc.local   \033[0m" >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.d/rc.local

echo " 재 부팅 "
echo -e  "\033[1;34m${PROMPT} reboot  재 부팅 \033[0m" >> /root/dasan_install_log.txt
reboot
