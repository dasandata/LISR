#!/bin/bash
# Copyright (c) 2017 by Dasandata Corp.
# http://www.dasandata.co.kr
# mailto://mail@dasandata.co.kr
# run as a root
# 01_Define_common_variable.sh

# Check ROOT UID 
ROOT_UID=0
if [ "${UID}" != "${ROOT_UID}" ]; then
  echo "### Must be a root to run this script."
  exit 1
fi

# Define common variable 
PROMPT="[${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}]# "

# CoManD echo value
CMD_ECHO_F="echo -e \\033[1;34m"
CMD_ECHO_B="\\033[0m"

# CoMmenT echo value 
CMT_ECHO_F="echo -e \\033[1;32m"
CMT_ECHO_B="\\033[0m"

# ${EMX} Used in file #05_Check_to_IP_and_Hostname.sh and #16_For_security_enhance_Setting...sh
# Centos7 interface name, Default value is '1'
# For non-stop run script, Change to currnet external Interface name
if [ -z "${EMX}" ] ; then
EMX='1'
fi 
# 

# ${NEWUSERNAME} Used in file #17_Add_user_with_sudo-administrator-privileges.sh
# New User NAME, Default value is '1'
# For non-stop run script, Change to user name.
if [ -z "${NEWUSERNAME}" ] ; then
NEWUSERNAME='1'
fi
# 


# Check Os Version 
if [ "${CHK_OS_3}" != "os_check_ok"   ]; then

# Ubuntu 14 or Ubuntu 16 or CentOS Linux release 7
RELEASE1=$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f 2)
RELEASE=$(echo ${RELEASE1} | tr -d ' ')

UBUNTU14="Ubuntu14.04LTS"
UBUNTU16="Ubuntu16.04.3LTS"
CENTOS7="CentOSLinux7(Core)"

case "${RELEASE}" in
        ${UBUNTU14})
                export CHK_OS="Ubuntu14" ;;
        ${UBUNTU16})
                export CHK_OS="Ubuntu16" ;;
        ${CENTOS7})
                export CHK_OS="CentOS7" ;;
        *)
                export CHK_OS="Not-Detected" ;;
esac


if [ "${CHK_OS}" = "Not-Detected" ]; then
  CMT="### The operating system is not detected and will be terminated."
  ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
  exit 1
fi
echo ""
echo ""
CMT="################################################"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="### Is the operating system ${CHK_OS} correct?"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
read -p "(Yes/No)" CHK_OS_2

        # yes/no 판단: [Yy] 또는 [Yy][Ee][Ss], [Nn] 또는 [Nn][Oo]
        if [[ `echo $CHK_OS_2 | grep "^[Yy]$\|^[Yy][Ee][Ss]$" | wc -l` -ge 1 ]]
          then CHK_OS_2="yes"

        elif [[ `echo $CHK_OS_2| grep "^[Nn]$\|^[Nn][Oo]$" | wc -l` -ge 1 ]]
          then CHK_OS_2="no"

        else echo "### Invalid input."
        exit 1
        fi
	
        if [ "${CHK_OS_2}" != "yes" ]; then
        echo "### Check the OS Verstion."
        exit 1
        
	else CHK_OS_3="os_check_ok"
	echo ""
	${CMT_ECHO_F}${CHK_OS_3}${CMT_ECHO_B}
	fi

fi

