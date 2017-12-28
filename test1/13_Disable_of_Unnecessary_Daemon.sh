#!/bin/bash
# Copyright (c) 2017 by Dasandata Corp.
# http://www.dasandata.co.kr
# mailto://mail@dasandata.co.kr
# run as a root
# 13_Disable_of_Unnecessary_Daemon.sh

# Define common variable
source 01_Define_common_variable.sh

echo ""
echo ""
CMT="#########################################################"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="### Disable unnecessary daemons to reduce resource waste "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="### and increase system speed... "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}; sleep 3 ; echo ""

case "${RELEASE}" in
        ${CENTOS7})
	
	CMT="# Check the currently running daemon."
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="systemctl list-unit-files  -t service  | grep enable "
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	systemctl list-unit-files  -t service  | grep enable ; echo ""
	CMT="# Disable daemons..."
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B};echo ""

	COMMAN="systemctl disable bluetooth.service"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable iscsi.service"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable ksm.service "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable ksmtuned.service "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable libstoragemgmt.service "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable libvirtd.service "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable NetworkManager.service  "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable NetworkManager-dispatcher.service "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable spice-vdagentd.service  "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable vmtoolsd.service "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable ModemManager.service"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        ;;

        ${UBUNTU16})

        CMT="# Check the currently running daemon."
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="systemctl list-unit-files  -t service  | grep enable "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
        systemctl list-unit-files  -t service  | grep enable ; echo ""
        CMT="# Disable daemons..."
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B};echo ""        
	
        COMMAN="systemctl disable bluetooth.service"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable iscsi.service"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable ksm.service "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable ksmtuned.service "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable libstoragemgmt.service "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable libvirtd.service "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable NetworkManager.service  "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable NetworkManager-dispatcher.service "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable spice-vdagentd.service  "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable vmtoolsd.service "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="systemctl disable ModemManager.service"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}

	;;

        ${UBUNTU14})

	CMT="# Reference site: https://askubuntu.com/questions/19320/how-to-enable-or-disable-services"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	
	CMT="# sysv-rc-conf & rcconf & update-rc.d ... etc..."
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}

	CMT="# Disable to Network-Manager "
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="ll /etc/init/network-manager.conf "
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
	COMMAN="mv /etc/init/network-manager.conf /etc/init/network-manager.conf.disable"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

        ;;

        *)
        echo "OS Detect Error! "
        exit 1
        ;;
esac

echo ""
CMT="### End of Disable_of_Unnecessary_Daemon..."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B} ; echo "" ; sleep 3
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
