#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo " Jupyterhub install "

echo ""
echo ""
echo -e  "${PROMPT} curl --silent --location https://rpm.nodesource.com/setup_10.x | sudo bash - " >> /root/dasan_install_log.txt
curl --silent --location https://rpm.nodesource.com/setup_10.x | sudo bash - >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} yum install -y nodejs " >> /root/dasan_install_log.txt
yum install -y nodejs >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} npm install -g configurable-http-proxy " >> /root/dasan_install_log.txt
npm install -g configurable-http-proxy >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 install --upgrade optimuspyspark " >> /root/dasan_install_log.txt
pip3 install --upgrade optimuspyspark >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 uninstall --yes tensorflow " >> /root/dasan_install_log.txt
pip3 uninstall --yes tensorflow >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 install --upgrade jupyterhub " >> /root/dasan_install_log.txt
pip3 install --upgrade jupyterhub >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 install --upgrade notebook " >> /root/dasan_install_log.txt
pip3 install --upgrade notebook >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} mkdir /etc/jupyterhub " >> /root/dasan_install_log.txt
mkdir /etc/jupyterhub >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} jupyterhub --generate-config " >> /root/dasan_install_log.txt
jupyterhub --generate-config >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} mv jupyterhub_config.py /etc/jupyterhub/ " >> /root/dasan_install_log.txt
mv jupyterhub_config.py /etc/jupyterhub/ >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} sed -i '356a c.JupyterHub.port = 8000' /etc/jupyterhub/jupyterhub_config.py " >> /root/dasan_install_log.txt
sed -i '356a c.JupyterHub.port = 8000' /etc/jupyterhub/jupyterhub_config.py >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cat /etc/jupyterhub/jupyterhub_config.py | sed -n 357p " >> /root/dasan_install_log.txt
cat /etc/jupyterhub/jupyterhub_config.py | sed -n 357p >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} sed -i '358a c.LocalAuthenticator.create_system_users = True' /etc/jupyterhub/jupyterhub_config.py  " >> /root/dasan_install_log.txt
sed -i '358a c.LocalAuthenticator.create_system_users = True' /etc/jupyterhub/jupyterhub_config.py  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cat /etc/jupyterhub/jupyterhub_config.py | sed -n 359p " >> /root/dasan_install_log.txt
cat /etc/jupyterhub/jupyterhub_config.py | sed -n 359p >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} sed -i '359a c.Authenticator.add_user_cmd = ['adduser', '--force-badname', '-q', '--gecos', '""', '--disabled-password']' /etc/jupyterhub/jupyterhub_config.py " >> /root/dasan_install_log.txt
sed -i '359a c.Authenticator.add_user_cmd = ['adduser', '--force-badname', '-q', '--gecos', '""', '--disabled-password']' /etc/jupyterhub/jupyterhub_config.py >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cat /etc/jupyterhub/jupyterhub_config.py | sed -n 360p " >> /root/dasan_install_log.txt
cat /etc/jupyterhub/jupyterhub_config.py | sed -n 360p >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} sed -i '384a c.JupyterHub.proxy_class = 'jupyterhub.proxy.ConfigurableHTTPProxy'' /etc/jupyterhub/jupyterhub_config.py  " >> /root/dasan_install_log.txt
sed -i '384a c.JupyterHub.proxy_class = 'jupyterhub.proxy.ConfigurableHTTPProxy'' /etc/jupyterhub/jupyterhub_config.py  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cat /etc/jupyterhub/jupyterhub_config.py | sed -n 385p " >> /root/dasan_install_log.txt
cat /etc/jupyterhub/jupyterhub_config.py | sed -n 385p >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} sed -i '824a c.Authenticator.admin_users = {"sonic"}' /etc/jupyterhub/jupyterhub_config.py  " >> /root/dasan_install_log.txt
sed -i '824a c.Authenticator.admin_users = {"sonic"}' /etc/jupyterhub/jupyterhub_config.py  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cat /etc/jupyterhub/jupyterhub_config.py | sed -n 825p " >> /root/dasan_install_log.txt
cat /etc/jupyterhub/jupyterhub_config.py | sed -n 825p >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} firewall-cmd --add-port=8000/tcp  --permanent " >> /root/dasan_install_log.txt
firewall-cmd --add-port=8000/tcp  --permanent >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} firewall-cmd --reload " >> /root/dasan_install_log.txt
firewall-cmd --reload >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} firewall-cmd --list-all " >> /root/dasan_install_log.txt
firewall-cmd --list-all >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub.service /lib/systemd/system/ " >> /root/dasan_install_log.txt
mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub.service /lib/systemd/system/ >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} chmod 777 /lib/systemd/system/jupyterhub.service  " >> /root/dasan_install_log.txt
chmod 777 /lib/systemd/system/jupyterhub.service  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub /etc/init.d/ " >> /root/dasan_install_log.txt
mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub /etc/init.d/ >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} chmod 755 /etc/init.d/jupyterhub " >> /root/dasan_install_log.txt
chmod 755 /etc/init.d/jupyterhub >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} systemctl daemon-reload " >> /root/dasan_install_log.txt
systemctl daemon-reload >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} systemctl enable jupyterhub.service " >> /root/dasan_install_log.txt
systemctl enable jupyterhub.service >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} systemctl start jupyterhub.service  " >> /root/dasan_install_log.txt
systemctl start jupyterhub.service  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} yum install -y czmq-devel libcurl-devel openssl-devel " >> /root/dasan_install_log.txt
yum install -y czmq-devel libcurl-devel openssl-devel >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} R CMD BATCH /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/r_jupyterhub.R " >> /root/dasan_install_log.txt
R CMD BATCH /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/r_jupyterhub.R >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cd / " >> /root/dasan_install_log.txt
cd / >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} rm -rf cuda-repo-rhel7-10.0.130-1.x86_64.rpm rstudio-1.2.5033-x86_64.rpm rstudio-server-rhel-1.2.5033-x86_64.rpm r_jupyterhub.Rout dasan_log_install_* " >> /root/dasan_install_log.txt
rm -rf cuda-repo-rhel7-10.0.130-1.x86_64.rpm rstudio-1.2.5033-x86_64.rpm rstudio-server-rhel-1.2.5033-x86_64.rpm r_jupyterhub.Rout dasan_log_install_* >> /root/log.txt

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

echo -e  "\033[1;34m${PROMPT} sed -i '/root/d' /etc/rc.d/rc.local   \033[0m" >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.d/rc.local

echo ""
echo ""
echo -e  "${PROMPT} reboot  " >> /root/dasan_install_log.txt
reboot  >> /root/log.txt
