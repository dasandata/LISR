#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " VNC 접속용 암호를 지정합니다 "
echo -e  "\033[1;34m${PROMPT} vnc4server \033[0m" >> Dasan_command.txt
vnc4server

echo ""
echo ""

echo " VNC 실행 및 연결 "

echo ""
echo -e  "\033[1;34m${PROMPT} vncserver -kill :1 \033[0m" >> Dasan_command.txt
vncserver -kill :1
echo ""
echo -e  "\033[1;34m${PROMPT} cat .vnc/xstartup \033[0m" >> Dasan_command.txt
cat .vnc/xstartup
echo ""
echo -e  "\033[1;34m${PROMPT} cp .vnc/xstartup .vnc/xstartup.bak \033[0m" >> Dasan_command.txt
cp .vnc/xstartup .vnc/xstartup.bak
echo ""
echo -e  "\033[1;34m${PROMPT} echo 'def ' >> .vnc/xstartup \033[0m"
echo 'def ' >> .vnc/xstartup
echo ""
echo -e  "\033[1;34m${PROMPT} echo 'export XKL_XMODMAP_DISABLE=1 ' >> .vnc/xstartup \033[0m"
echo 'export XKL_XMODMAP_DISABLE=1 ' >> .vnc/xstartup
echo ""
echo -e  "\033[1;34m${PROMPT} echo 'unset SESSION_MANAGER ' >> .vnc/xstartup \033[0m"
echo 'unset SESSION_MANAGER ' >> .vnc/xstartup
echo ""
echo -e  "\033[1;34m${PROMPT} echo 'unset DBUS_SESSION_BUS_ADDRESS ' >> .vnc/xstartup \033[0m"
echo 'unset DBUS_SESSION_BUS_ADDRESS ' >> .vnc/xstartup
echo ""
echo -e  "\033[1;34m${PROMPT} echo 'xrdb $HOME/.Xresources ' >> .vnc/xstartup \033[0m"
echo 'xrdb $HOME/.Xresources ' >> .vnc/xstartup
echo ""
echo -e  "\033[1;34m${PROMPT} echo 'xsetroot -solid grey ' >> .vnc/xstartup \033[0m"
echo 'xsetroot -solid grey ' >> .vnc/xstartup
echo ""
echo -e  "\033[1;34m${PROMPT} echo 'startxfce4 & ' >> .vnc/xstartup \033[0m"
echo 'startxfce4 & ' >> .vnc/xstartup






echo ""
echo ""
echo -e  "\033[1;34m${PROMPT} cat .vnc/xstartup \033[0m" >> Dasan_command.txt
cat .vnc/xstartup
echo ""
echo -e  "\033[1;34m${PROMPT} chmod +x .vnc/xstartup \033[0m" >> Dasan_command.txt
chmod +x .vnc/xstartup
echo ""
echo ""
echo -e  "\033[1;34m${PROMPT} vnc4server \033[0m" >> Dasan_command.txt
vnc4server

echo ""


echo " VNC 실행 확인 후 kill "
echo ""
echo -e  "\033[1;34m${PROMPT} vncserver -kill :1 \033[0m" >> Dasan_command.txt
vncserver -kill :1
echo ""
echo -e  "\033[1;34m${PROMPT} exit \033[0m" >> Dasan_command.txt
exit
echo ""
