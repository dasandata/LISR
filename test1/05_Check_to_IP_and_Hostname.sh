#!/bin/bash
# Copyright (c) 2017 by Dasandata Corp.
# http://www.dasandata.co.kr
# mailto://mail@dasandata.co.kr
# run as a root
# 05_Check_to_IP_and_Hostname.sh

# Define common variable
source 01_Define_common_variable.sh


CMT="### Check to IP and HOSTNAME... "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}; sleep 3 ; echo ""

COMMAN="ip a"
${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

case "${RELEASE}" in
        ${CENTOS7})
	
	if [ "${EMX}" == "1" ] ; then
        read -p "# Typeing to External Interface Name ex(em1,em2,ens192,p2p1,etc..: " EMX

	else echo "# External Interface name is ${EMX} "
	sleep 3


	fi

	COMMAN="cat /etc/sysconfig/network-scripts/ifcfg-${EMX}"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

	COMMAN="cat /etc/hostname"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
	COMMAN="cat /etc/resolv.conf"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
	COMMAN="ping -c 4 google.com"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}	
	echo ""
        ;;

        ${UBUNTU16})
	COMMAN="cat /etc/network/interfaces "
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
	COMMAN="cat /etc/hostname"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
	COMMAN="cat /etc/resolv.con"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
	COMMAN="ping -c 4 google.com"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
	echo ""
	;;

        ${UBUNTU14})
        COMMAN="cat /etc/network/interfaces "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="cat /etc/hostname"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="cat /etc/resolv.con"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        COMMAN="ping -c 4 google.com"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN}
        echo ""
        ;;

        *)
        echo "OS Dectect Error! "
        exit 1
        ;;
esac

echo ""
CMT="### End of Check IP and Hostname ..."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B} ; echo "" ; sleep 3
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}

