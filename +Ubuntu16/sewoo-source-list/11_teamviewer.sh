#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " Teamviewer install. "

echo ""

echo -e  "\033[1;34m${PROMPT} wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb \033[0m"
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
echo ""
echo -e  "\033[1;34m${PROMPT} apt-get -y install ./teamviewer_amd64.deb \033[0m"
apt-get -y install ./teamviewer_amd64.deb
echo ""

echo " Teamviewer Passwd 설정 "
echo ""
echo -e  "\033[1;34m${PROMPT} teamviewer passwd ******* \033[0m"
read teamviewer passwd

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
