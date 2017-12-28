#!/bin/bash
# Copyright (c) 2017 by Dasandata Corp.
# http://www.dasandata.co.kr
# mailto://mail@dasandata.co.kr
# run as a root
# 00_xxxx.sh

# Define common variable
source 01_Define_common_variable.sh


CMT="### ... "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}; sleep 3 ; echo ""

COMMAN="ip a"
${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

case "${RELEASE}" in
        ${CENTOS7})
	COMMAN=""
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
        ;;

        ${UBUNTU16})
	;;

        ${UBUNTU14})
        ;;

        *)
        echo "OS Detect Error! "
        exit 1
        ;;
esac

echo ""
CMT="### End of Default Utils Install..."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B} ; echo "" ; sleep 3
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
