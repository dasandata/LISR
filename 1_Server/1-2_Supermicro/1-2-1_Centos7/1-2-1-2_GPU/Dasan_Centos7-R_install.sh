#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo " R Desktop install "

echo ""
echo ""
echo -e  "${PROMPT} wget https://download1.rstudio.org/desktop/centos7/x86_64/rstudio-1.2.5033-x86_64.rpm " >> /root/dasan_install_log.txt
wget https://download1.rstudio.org/desktop/centos7/x86_64/rstudio-1.2.5033-x86_64.rpm  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} rpm -ivh rstudio-1.2.5033-x86_64.rpm  " >> /root/dasan_install_log.txt
rpm -ivh rstudio-1.2.5033-x86_64.rpm   >> /root/log.txt


echo ""
echo ""

echo " R server install "

echo ""
echo ""
echo -e  "${PROMPT} wget https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-1.2.5033-x86_64.rpm " >> /root/dasan_install_log.txt
wget https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-1.2.5033-x86_64.rpm  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} rpm -ivh rstudio-server-rhel-1.2.5033-x86_64.rpm " >> /root/dasan_install_log.txt
rpm -ivh rstudio-server-rhel-1.2.5033-x86_64.rpm  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} yum install -y R " >> /root/dasan_install_log.txt
yum install -y R  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} firewall-cmd --add-port=8787/tcp --permanent " >> /root/dasan_install_log.txt
firewall-cmd --add-port=8787/tcp --permanent  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} firewall-cmd --reload " >> /root/dasan_install_log.txt
firewall-cmd --reload  >> /root/log.txt

echo ""
echo ""
echo -e  "${PROMPT} firewall-cmd --list-all " >> /root/dasan_install_log.txt
firewall-cmd --list-all  >> /root/log.txt

echo ""
echo ""

echo "  rc.local 등록 "

echo -e  "\033[1;34m${PROMPT} sed -i '13s/Dasan_Centos7-R_install.sh/Dasan_Centos7-jupyterhub.sh/g' /etc/rc.d/rc.local    \033[0m" >> /root/dasan_install_log.txt
sed -i '13s/Dasan_Centos7-R_install.sh/Dasan_Centos7-jupyterhub.sh/g' /etc/rc.d/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.d/rc.local  | sed -n 13p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 13p


echo " 재 부팅 "
echo -e  "\033[1;34m${PROMPT} reboot  재 부팅 \033[0m" >> /root/dasan_install_log.txt
reboot
