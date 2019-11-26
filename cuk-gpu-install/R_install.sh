#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"



echo " R server install "

echo ""
echo ""
echo -e  "${PROMPT} apt-get install -y  r-base " >> /root/dasan_install_log.txt
apt-get install -y  r-base  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} apt-get install -y  gdebi-core " >> /root/dasan_install_log.txt
apt-get install -y  gdebi-core  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} wget https://download2.rstudio.org/server/trusty/amd64/rstudio-server-1.2.5019-amd64.deb " >> /root/dasan_install_log.txt
wget https://download2.rstudio.org/server/trusty/amd64/rstudio-server-1.2.5019-amd64.deb  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} yes | gdebi rstudio-server-1.2.5019-amd64.deb  " >> /root/dasan_install_log.txt
yes | gdebi rstudio-server-1.2.5019-amd64.deb   >> /root/log.txt

echo ""
echo ""

echo " R desktop install & XRDP install "

echo ""
echo ""
echo -e  "${PROMPT} wget https://download1.rstudio.org/desktop/xenial/amd64/rstudio-1.2.5019-amd64.deb " >> /root/dasan_install_log.txt
wget https://download1.rstudio.org/desktop/xenial/amd64/rstudio-1.2.5019-amd64.deb  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} dpkg -i rstudio-1.2.5019-amd64.deb " >> /root/dasan_install_log.txt
dpkg -i rstudio-1.2.5019-amd64.deb  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} apt-get install -y  rdesktop  " >> /root/dasan_install_log.txt
apt-get install -y  rdesktop   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} apt-get install -y xrdp  " >> /root/dasan_install_log.txt
apt-get install -y xrdp   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} apt-get install -y dconf-editor  " >> /root/dasan_install_log.txt
apt-get install -y dconf-editor   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} ufw allow 8787/tcp  " >> /root/dasan_install_log.txt
ufw allow 8787/tcp   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} ufw allow 5900/tcp  " >> /root/dasan_install_log.txt
ufw allow 5900/tcp   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} ufw allow 3389/tcp  " >> /root/dasan_install_log.txt
ufw allow 3389/tcp   >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} ufw status  " >> /root/dasan_install_log.txt
ufw status   >> /root/log.txt

echo "  rc.local 등록 "

echo ""
echo ""
echo -e  "${PROMPT} sed -i '15s/R_install.sh/jupyterhub.sh/g' /etc/rc.local  " >> /root/dasan_install_log.txt
sed -i '15s/R_install.sh/jupyterhub.sh/g' /etc/rc.local

echo ""
echo ""
echo -e  "${PROMPT} cat /etc/rc.local | sed -n 15p " >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 15p

echo ""
echo ""
echo -e  "${PROMPT} reboot  " >> /root/dasan_install_log.txt
reboot   >> /root/log.txt
