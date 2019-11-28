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

sleep 5

echo ""
echo ""
echo -e  "${PROMPT} pip3 install optimuspyspark " >> /root/dasan_install_log.txt
pip3 install optimuspyspark  >> /root/log.txt

sleep 5

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
echo -e  "${PROMPT} pip3 uninstall --yes tensorflow-gpu " >> /root/dasan_install_log.txt
pip3 uninstall --yes tensorflow-gpu >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 install --upgrade tensorflow-estimator==2.0.1 " >> /root/dasan_install_log.txt
pip3 install --upgrade tensorflow-estimator==2.0.1  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 install --upgrade tensorboard==2.0.2 " >> /root/dasan_install_log.txt
pip3 install --upgrade tensorboard==2.0.2 >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} pip3 install --upgrade tensorflow-gpu==2.0.0 " >> /root/dasan_install_log.txt
pip3 install --upgrade tensorflow-gpu==2.0.0 >> /root/log.txt

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
echo -e  "${PROMPT} sed -i '824a c.Authenticator.admin_users = {"sonic","mathadmin"}' /etc/jupyterhub/jupyterhub_config.py   " >> /root/dasan_install_log.txt
sed -i '824a c.Authenticator.admin_users = {"sonic","mathadmin"}' /etc/jupyterhub/jupyterhub_config.py    >> /root/log.txt

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
echo -e  "${PROMPT} mv /root/LISR/cuk-gpu-install/jupyterhub /etc/init.d/  " >> /root/dasan_install_log.txt
mv /root/LISR/cuk-gpu-install/jupyterhub /etc/init.d/  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} chmod 755 /etc/init.d/jupyterhub  " >> /root/dasan_install_log.txt
chmod 755 /etc/init.d/jupyterhub   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} mv /root/LISR/cuk-gpu-install/jupyterhub.service /lib/systemd/system/ " >> /root/dasan_install_log.txt
mv /root/LISR/cuk-gpu-install/jupyterhub.service /lib/systemd/system/  >> /root/log.txt

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
echo -e  "${PROMPT} wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/nvidia-settings_418.87.01-0ubuntu1_amd64.deb  " >> /root/dasan_install_log.txt
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/nvidia-settings_418.87.01-0ubuntu1_amd64.deb    >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} dpkg -i nvidia-settings_418.87.01-0ubuntu1_amd64.deb   " >> /root/dasan_install_log.txt
dpkg -i nvidia-settings_418.87.01-0ubuntu1_amd64.deb   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} systemctl set-default graphical.target   " >> /root/dasan_install_log.txt
systemctl set-default graphical.target    >> /root/log.txt


echo " user passwd 등록 "

echo ""
echo -e  "${PROMPT} cp /root/LISR/cuk-gpu-install/shadow /etc/shadow " >> /root/dasan_install_log.txt
cp /root/LISR/cuk-gpu-install/shadow /etc/shadow    >> /root/log.txt


echo " HDD Mount /home "

echo ""
echo ""
echo -e  "${PROMPT} parted -s /dev/sda "mklabel gpt" " >> /root/dasan_install_log.txt
parted -s /dev/sda "mklabel gpt"  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} parted -s /dev/sda "mkpart primary 0% 100%"   " >> /root/dasan_install_log.txt
parted -s /dev/sda "mkpart primary 0% 100%"  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} yes | mkfs.ext4 -L HOME /dev/sda1  " >> /root/dasan_install_log.txt
yes | mkfs.ext4 -L HOME /dev/sda1  >> /root/log.txt

sleep 10

echo ""
echo ""
echo -e  "${PROMPT} mount /dev/sda1  /mnt  " >> /root/dasan_install_log.txt
mount /dev/sda1  /mnt   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT}  cd /home/  " >> /root/dasan_install_log.txt
cd /home/  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} find .  | cpio -dump  /mnt   " >> /root/dasan_install_log.txt
find .  | cpio -dump  /mnt  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} ls -l /mnt/  " >> /root/dasan_install_log.txt
ls -l /mnt/  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} umount /mnt  " >> /root/dasan_install_log.txt
umount /mnt  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} cd " >> /root/dasan_install_log.txt
cd  >> /root/log.txt


echo "fstab add line"


echo ""
echo ""
echo -e  "${PROMPT} echo  "LABEL="HOME"  /home   ext4  defaults  0  0 "    >>   /etc/fstab  " >> /root/dasan_install_log.txt
echo  "LABEL="HOME"  /home   ext4   defaults  0  0 "    >>   /etc/fstab

echo ""
echo ""
echo -e  "${PROMPT} cat /etc/fstab | grep -v ^#  " >> /root/dasan_install_log.txt
cat /etc/fstab | grep -v ^#  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} mount -a  " >> /root/dasan_install_log.txt
mount -a  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} lsblk  " >> /root/dasan_install_log.txt
lsblk  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} ls -l /home  " >> /root/dasan_install_log.txt
ls -l /home  >> /root/log.txt


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
