#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"



echo " Jupyterhub install "

echo ""
echo ""
echo -e  "${PROMPT} curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - " >> /root/dasan_install_log.txt
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} apt-get -y install nodejs " >> /root/dasan_install_log.txt
apt-get -y install nodejs  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} apt-get -y install default-jre " >> /root/dasan_install_log.txt
apt-get -y install default-jre >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} npm install -g configurable-http-proxy  " >> /root/dasan_install_log.txt
npm install -g configurable-http-proxy  >> /root/log.txt

echo ""
echo ""

echo ""
echo ""
echo -e  "${PROMPT} pip3 install optimuspyspark " >> /root/dasan_install_log.txt
pip3 install optimuspyspark  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 uninstall --yes tensorflow-estimator " >> /root/dasan_install_log.txt
pip3 uninstall --yes tensorflow-estimator  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 uninstall --yes tensorboard  " >> /root/dasan_install_log.txt
pip3 uninstall --yes tensorboard   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 uninstall --yes tensorflow " >> /root/dasan_install_log.txt
pip3 uninstall --yes tensorflow >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 install --upgrade tensorflow-estimator " >> /root/dasan_install_log.txt
pip3 install --upgrade tensorflow-estimator  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 install --upgrade tensorboard " >> /root/dasan_install_log.txt
pip3 install --upgrade tensorboard >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 install jupyterhub " >> /root/dasan_install_log.txt
pip3 install jupyterhub  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 install --upgrade notebook " >> /root/dasan_install_log.txt
pip3 install --upgrade notebook >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 install --upgrade six " >> /root/dasan_install_log.txt
pip3 install --upgrade six  >> /root/log.txt

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
echo -e  "${PROMPT} sed -i '356a c.JupyterHub.port = 80' /etc/jupyterhub/jupyterhub_config.py   " >> /root/dasan_install_log.txt
sed -i '356a c.JupyterHub.port = 80' /etc/jupyterhub/jupyterhub_config.py    >> /root/log.txt

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
echo -e  "${PROMPT} sed -i '824a c.Authenticator.admin_users = {'UserAdmin'}' /etc/jupyterhub/jupyterhub_config.py   " >> /root/dasan_install_log.txt
sed -i '824a c.Authenticator.admin_users = {'UserAdmin'}' /etc/jupyterhub/jupyterhub_config.py    >> /root/log.txt

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
echo -e  "${PROMPT} systemctl set-default graphical.target   " >> /root/dasan_install_log.txt
systemctl set-default graphical.target    >> /root/log.txt


echo "  rc.local 등록 "

echo ""
echo -e  "${PROMPT} sed -i '/root/d' /etc/rc.local  " >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.local

echo ""
echo ""
echo -e  "${PROMPT} reboot " >> /root/dasan_install_log.txt
reboot  >> /root/log.txt
