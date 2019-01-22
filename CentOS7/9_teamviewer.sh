#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " Teamviewer install. "

echo ""

echo -e  "\033[1;34m${PROMPT} yum install  epel-release \033[0m"
yum install  epel-release
echo ""
echo -e  "\033[1;34m${PROMPT} yum -y install qt5-* \033[0m"
yum -y install qt5-*  >> dasan_log_install_qt5_teamviewer_.txt
tail  dasan_log_install_qt5_teamviewer_.txt
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} yum -y install https://download.teamviewer.com/download/teamviewer.i686.rpm \033[0m"
yum -y install https://download.teamviewer.com/download/teamviewer.i686.rpm \
>> dasan_log_install_teamviewer.txt
tail  dasan_log_install_teamviewer.txt
echo ""

echo " Teamviewer Passwd 설정 "
echo ""
echo -e  "\033[1;34m${PROMPT} teamviewer passwd ******* \033[0m"
read teamviewer passwd 123456qwer!

COUNTER=20

until [  $COUNTER -lt 1 ]; do

      echo COUNTER $COUNTER

      let COUNTER-=1

done

sleep 20


echo ""
echo " Teamviewer 실행 및 id 확인 "
echo ""
echo -e  "\033[1;34m${PROMPT} teamviewer daemon enable \033[0m"
teamviewer daemon enable
echo ""

COUNTER=5

until [  $COUNTER -lt 1 ]; do

      echo COUNTER $COUNTER

      let COUNTER-=1

done

sleep 5

echo ""

echo -e  "\033[1;34m${PROMPT} teamviewer --daemon restart \033[0m"
teamviewer --daemon restart
echo ""

COUNTER=10

until [  $COUNTER -lt 1 ]; do

      echo COUNTER $COUNTER

      let COUNTER-=1

done

sleep 10

echo ""

echo -e  "\033[1;34m${PROMPT} teamviewer info \033[0m"
teamviewer info
echo ""

echo " Teamviewer Passwd 설정 다시 해주고 info 확인 "
echo ""
echo -e  "\033[1;34m${PROMPT} teamviewer passwd ******* \033[0m"
echo ""
echo -e  "\033[1;34m${PROMPT} teamviewer info \033[0m"
