#!/bin/bash
# Copyright (c) 2017 by Dasandata Corp.
# http://www.dasandata.co.kr
# mailto://mail@dasandata.co.kr
# run as a root
# 17_Add_user_with_sudo-administrator-privileges.sh

# Define common variable
source 01_Define_common_variable.sh


CMT="### Add a new user, "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="### and grant sudo (administrator) permission... "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}; sleep 3 ; echo ""



case "${RELEASE}" in
        ${CENTOS7})

	COMMAN="echo ### "
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
CMT="### End of Add_user_with_sudo-administrator-privileges..."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B} ; echo "" ; sleep 3
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
