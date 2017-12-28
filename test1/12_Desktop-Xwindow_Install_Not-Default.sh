#!/bin/bash
# Copyright (c) 2017 by Dasandata Corp.
# http://www.dasandata.co.kr
# mailto://mail@dasandata.co.kr
# run as a root
# 12_Desktop-Xwindow_Install_Not-Default.sh

# Define common variable
source 01_Define_common_variable.sh


CMT="### Installs the Desktop environment (X-Window), but defaults set to text mode.... "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="### Run x-window only if necessary. (For saving resources on the server)"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}; sleep 3 ; echo ""

COMMAN="systemc get-default"
${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

CMT="############################################################"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="# multi-user.target is Text mode."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="# graphical.target is GUI mode."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="# Command of change default value to text mode on next boot "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="# ===>  systemctl set-default multi-user.target"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="# Command of change default value to GUI mode on next boot "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="# ===>  systemctl set-default graphical.target"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="# !! Ubuntu 14 is an exception. (need to modify / etc / default / grub) "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="############################################################"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
sleep 5
echo ""
echo ""

case "${RELEASE}" in
        ${CENTOS7})
	
	CMT="# Install to GNOME Desktop"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B} ; sleep 3
	COMMAN="yum -y  groups install \"GNOME Desktop\""
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	yum -y  groups install "GNOME Desktop";echo ""
	CMT="# Run Command on Console for test to X-Windows start. "
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	CMT="# ===> startx"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}; sleep 3

        ;;

        ${UBUNTU16})
	
	CMT="# Change the default mode to text mode."
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="systemctl set-default multi-user.target"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo "";sleep 3

	CMT="# Install to Ubuntu-Desktop"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="apt-get -y install ubuntu-desktop"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
	
	CMT="# Run Command on Console for test to X-Windows start. "
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        CMT="# ===> sudo systemctl start lightdm"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}; sleep 3	
	
	;;

        ${UBUNTU14})
        CMT="# Change the default mode to text mode."
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="perl -pi -e  's/GRUB_CMDLINE_LINUX_DEFAULT=\"/GRUB_CMDLINE_LINUX_DEFAULT=\"text /g'  /etc/default/grub "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	perl -pi -e  's/GRUB_CMDLINE_LINUX_DEFAULT="/GRUB_CMDLINE_LINUX_DEFAULT="text /g'  /etc/default/grub ;echo ""
	COMMAN="grep  \"GRUB_CMDLINE_LINUX_DEFAULT=\"  /etc/default/grub"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	grep  "GRUB_CMDLINE_LINUX_DEFAULT="  /etc/default/grub ; echo ""
        COMMAN="update-initramfs -u \&\& update-grub2 "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
        update-initramfs -u && update-grub2 ; echo ""
	
	CMT="# Install to Ubuntu-Desktop"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="apt-get -y install ubuntu-desktop"      
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

        CMT="# Run Command on Console for test to X-Windows start. "
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        CMT="# ===> sudo /etc/init.d/lightdm.start "
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}; sleep 3

        ;;

        *)
        echo "OS Dectect Error! "
        exit 1
        ;;
esac

echo ""
CMT="### End of Desktop (X-windows)  Install..."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B} ; echo "" ; sleep 3
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}

