#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"



echo " Jupyterhub install "

echo ""
echo ""
echo -e  "${PROMPT} curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - " >> /root/dasan_install_log.txt
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} apt-get install -y nodejs " >> /root/dasan_install_log.txt
apt-get install -y  nodejs  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} apt-get install -y  default-jre " >> /root/dasan_install_log.txt
apt-get install -y  default-jre >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} npm install -g configurable-http-proxy  " >> /root/dasan_install_log.txt
npm install -g configurable-http-proxy  >> /root/log.txt

echo ""
echo ""

sleep 5

echo ""
echo ""
echo -e  "${PROMPT} pip3 install --upgrade optimuspyspark " >> /root/dasan_install_log.txt
pip3 install --upgrade optimuspyspark  >> /root/log.txt

sleep 5

echo ""
echo ""
echo -e  "${PROMPT} pip3 install --upgrade testresources " >> /root/dasan_install_log.txt
pip3 install --upgrade testresources  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 install --upgrade jupyterhub " >> /root/dasan_install_log.txt
pip3 install --upgrade jupyterhub  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 install --upgrade notebook " >> /root/dasan_install_log.txt
pip3 install --upgrade notebook >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} mkdir /etc/jupyterhub " >> /root/dasan_install_log.txt
mkdir /etc/jupyterhub  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} jupyterhub --generate-config -f /etc/jupyterhub/jupyterhub_config.py " >> /root/dasan_install_log.txt
jupyterhub --generate-config -f /etc/jupyterhub/jupyterhub_config.py   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} sed -i '356a c.JupyterHub.port = 8000' /etc/jupyterhub/jupyterhub_config.py   " >> /root/dasan_install_log.txt
sed -i '356a c.JupyterHub.port = 8000' /etc/jupyterhub/jupyterhub_config.py    >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cat /etc/jupyterhub/jupyterhub_config.py | sed -n 357p  " >> /root/dasan_install_log.txt
cat /etc/jupyterhub/jupyterhub_config.py | sed -n 357p   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} sed -i '358a c.LocalAuthenticator.create_system_users = True' /etc/jupyterhub/jupyterhub_config.py   " >> /root/dasan_install_log.txt
sed -i '358a c.LocalAuthenticator.create_system_users = True' /etc/jupyterhub/jupyterhub_config.py   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cat /etc/jupyterhub/jupyterhub_config.py | sed -n 359p  " >> /root/dasan_install_log.txt
cat /etc/jupyterhub/jupyterhub_config.py | sed -n 359p   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} sed -i '359a c.Authenticator.add_user_cmd = ['adduser', '--force-badname', '-q', '--gecos', '""', '--disabled-password']' /etc/jupyterhub/jupyterhub_config.py   " >> /root/dasan_install_log.txt
sed -i '359a c.Authenticator.add_user_cmd = ['adduser', '--force-badname', '-q', '--gecos', '""', '--disabled-password']' /etc/jupyterhub/jupyterhub_config.py    >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cat /etc/jupyterhub/jupyterhub_config.py | sed -n 360p  " >> /root/dasan_install_log.txt
cat /etc/jupyterhub/jupyterhub_config.py | sed -n 360p  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} sed -i '384a c.JupyterHub.proxy_class = 'jupyterhub.proxy.ConfigurableHTTPProxy'' /etc/jupyterhub/jupyterhub_config.py   " >> /root/dasan_install_log.txt
sed -i '384a c.JupyterHub.proxy_class = 'jupyterhub.proxy.ConfigurableHTTPProxy'' /etc/jupyterhub/jupyterhub_config.py   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cat /etc/jupyterhub/jupyterhub_config.py | sed -n 385p  " >> /root/dasan_install_log.txt
cat /etc/jupyterhub/jupyterhub_config.py | sed -n 385p   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} sed -i '824a c.Authenticator.admin_users = {"sonic"}' /etc/jupyterhub/jupyterhub_config.py   " >> /root/dasan_install_log.txt
sed -i '824a c.Authenticator.admin_users = {"sonic"}' /etc/jupyterhub/jupyterhub_config.py    >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cat /etc/jupyterhub/jupyterhub_config.py | sed -n 825p  " >> /root/dasan_install_log.txt
cat /etc/jupyterhub/jupyterhub_config.py | sed -n 825p  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} ufw status  " >> /root/dasan_install_log.txt
ufw status   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} ufw allow 8000/tcp " >> /root/dasan_install_log.txt
ufw allow 8000/tcp   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} ufw status  " >> /root/dasan_install_log.txt
ufw status   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub /etc/init.d/  " >> /root/dasan_install_log.txt
mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub /etc/init.d/  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} chmod 755 /etc/init.d/jupyterhub  " >> /root/dasan_install_log.txt
chmod 755 /etc/init.d/jupyterhub   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub.service /lib/systemd/system/ " >> /root/dasan_install_log.txt
mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub.service /lib/systemd/system/  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} chmod 777 /lib/systemd/system/jupyterhub.service  " >> /root/dasan_install_log.txt
chmod 777 /lib/systemd/system/jupyterhub.service  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} systemctl daemon-reload " >> /root/dasan_install_log.txt
systemctl daemon-reload >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} systemctl enable jupyterhub.service  " >> /root/dasan_install_log.txt
systemctl enable jupyterhub.service  >> /root/log.txt

echo ""
echo ""

echo " jupyter R kernel add "

echo ""
echo ""
echo -e  "${PROMPT} apt-get install -y libzmq3-dev libcurl4-openssl-dev " >> /root/dasan_install_log.txt
apt-get install -y libzmq3-dev libcurl4-openssl-dev >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} apt-get install -y libxml2-dev  " >> /root/dasan_install_log.txt
apt-get install -y libxml2-dev  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} R CMD BATCH /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/r_jupyterhub.R " >> /root/dasan_install_log.txt
R CMD BATCH /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/r_jupyterhub.R >> /root/log.txt

echo ""
echo ""

echo " desktop sharing NetworkManager & pycharm install "

echo ""
echo ""
echo -e  "${PROMPT} snap install pycharm-community --classic  " >> /root/dasan_install_log.txt
snap install pycharm-community --classic  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} sed -i "5s/networkd/NetworkManager/" /etc/netplan/01-netcfg.yaml " >> /root/dasan_install_log.txt
sed -i "5s/networkd/NetworkManager/" /etc/netplan/01-netcfg.yaml  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} systemctl enable network-manager.service " >> /root/dasan_install_log.txt
systemctl enable network-manager.service >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} ufw allow 5900/tcp " >> /root/dasan_install_log.txt
ufw allow 5900/tcp >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} systemctl set-default graphical.target   " >> /root/dasan_install_log.txt
systemctl set-default graphical.target    >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cd /   " >> /root/dasan_install_log.txt
cd /   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} rm -rf 7fa2af80.pub cuda-repo-ubuntu1804_10.0.130-1_amd64.deb rstudio-1.2.5019-amd64.deb rstudio-server-1.2.5019-amd64.deb  " >> /root/dasan_install_log.txt
rm -rf 7fa2af80.pub cuda-repo-ubuntu1804_10.0.130-1_amd64.deb rstudio-1.2.5019-amd64.deb rstudio-server-1.2.5019-amd64.deb  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} apt-get install -y dkms linux-generic-hwe-18.04 xserver-xorg-hwe-18.04 " >> /root/dasan_install_log.txt
apt-get install -y dkms linux-generic-hwe-18.04 xserver-xorg-hwe-18.04


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

echo ""
echo ""
echo "  rc.local 등록 "

echo ""
echo -e  "${PROMPT} sed -i '/root/d' /etc/rc.local  " >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.local

echo ""
echo ""
echo -e  "${PROMPT} reboot " >> /root/dasan_install_log.txt
reboot  >> /root/log.txt
