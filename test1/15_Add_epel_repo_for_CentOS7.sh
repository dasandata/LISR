#!/bin/bash
# Copyright (c) 2017 by Dasandata Corp.
# http://www.dasandata.co.kr
# mailto://mail@dasandata.co.kr
# run as a root
# 14_Add_epel_repo_for_CentOS7.sh

# Define common variable
source 01_Define_common_variable.sh

echo ""
echo ""
CMT="#################################################################################"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="### Add Repository of EPEL (Extra Packages for Enterprise Linux) for CentOS 7... "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="### Ubuntu does not work with this script."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}; sleep 3 ; echo ""

case "${RELEASE}" in
        ${CENTOS7})

	CMT="# Check Current repolist"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="yum repolist"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

	CMT="# Install elel repo"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="yum -y install epel-release"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

        CMT="# Install yum plugin priortites"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="yum -y install yum-plugin-priorities"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""


	CMT="# Change npriority"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="sed -i -e \"s/\]$/\]\npriority=5/g\" /etc/yum.repos.d/epel.repo"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	sed -i -e "s/\]$/\]\npriority=5/g" /etc/yum.repos.d/epel.repo ; echo ""
	COMMAN="sed -i -e \"s/\]$/\]\npriority=1/g\" /etc/yum.repos.d/CentOS-Base.repo"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	sed -i -e "s/\]$/\]\npriority=1/g" /etc/yum.repos.d/CentOS-Base.repo ; echo ""

	CMT="# Check changed repolist"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="yum repolist"	
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

	CMT="# Operation test of epel repo"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="rpm -qa | grep htop"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	rpm -qa | grep htop ; echo ""
	COMMAN="yum -y install htop"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

        ;;

        ${UBUNTU16})

	echo ""
	;;

	
        ${UBUNTU14})
        
	echo ""
	
	;;
	
        *)
        echo "OS Detect Error! "
        exit 1
        ;;
esac

echo ""
CMT="### End of Add epel repo for CentOS 7..."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B} ; echo "" ; sleep 3
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
