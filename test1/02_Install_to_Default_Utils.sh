#!/bin/bash
# Copyright (c) 2017 by Dasandata Corp.
# http://www.dasandata.co.kr
# mailto://mail@dasandata.co.kr
# run as a root
# 02_Install_to_Default_Utils.sh

# Define common variable
source 01_Define_common_variable.sh

# Prifix
# Define CentOS 7 lastst kernel version
CENTOS7_LAST_KERNEL="3.10.0-693.2.2.el7.x86_64"

# install package list
UBUNTU14_APT_INSTALL="vim nfs-common mailutils rdate xauth firefox gcc make locate htop tmux git wget ipmitool "
UBUNTU16_APT_INSTALL="vim nfs-common mailutils rdate xauth firefox gcc make locate htop tmux git wget ipmitool "
CENTOS7_YUM_INSTALL="vim pciutils perl openssh mlocate nfs-utils rdate xauth firefox nautilus wget tcsh tree lshw mailx tmux git kernel-headers kernel-devel ipmitool gcc make gcc-c++ cmake python-devel "

# Start install.
echo ""
echo ""
CMT="##################################"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="### Install to Default Utils..."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="##################################"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
echo ""
echo ""
sleep 5
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}


case "${RELEASE}" in
        ${UBUNTU14})
	CMT="### Modify apt source list to ftp.daum.net..."
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	echo ""
	COMMAN="perl -pi -e 's/kr.archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}
	COMMAN="perl -pi -e 's/security.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}
	echo ""
	COMMAN="apt update"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; sleep 5 ; ${COMMAN}
	echo ""
	CMT="### Utils Install..."
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	echo ""
	COMMAN="apt -y install ${UBUNTU14_APT_INSTALL}"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; sleep 5 ; ${COMMAN}
	echo ""
	CMT="### Sync Time and Date..."
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	echo ""
	COMMAN="rdate  -s  time.bora.net "
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}
	COMMAN="hwclock --systohc"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}
	COMMAN="date"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}
	COMMAN="hwclock"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}
	;;	
        
	${UBUNTU16})
	CMT="### Modify apt source list to ftp.daum.net..."
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        echo ""
        COMMAN="perl -pi -e 's/kr.archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}
        COMMAN="perl -pi -e 's/security.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}
        echo ""
        COMMAN="apt update"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; sleep 5 ; ${COMMAN}
        echo ""
        CMT="### Utils Install..."
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        echo ""
        COMMAN="apt -y install ${UBUNTU16_APT_INSTALL}"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; sleep 5 ; ${COMMAN}
        echo ""
        CMT="### Sync Time and Date..."
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        echo ""
        COMMAN="rdate  -s  time.bora.net "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}
        COMMAN="hwclock --systohc"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}
        COMMAN="date"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}
        COMMAN="hwclock"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}
        ;;        


        ${CENTOS7})
	
        if [[ $(uname -r) != ${CENTOS7_LAST_KERNEL}  ]]
           then
           CMT="### The latest kernel version is "
           ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}${CENTOS7_LAST_KERNEL}
           CMT="###    Current kernel version is "
	   ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}$(uname -r)
	   CMT="### If you want using the latest version of the kernel, "
           ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	   CMT="### run 'yum update' and 'reboot' then run again this script. "
  	   ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	   echo ""
	   CMT="### Do you want proceed kernel update ('yum update' and 'reboot') now?  "
	   ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
           read -p "(Yes/No) " KERNEL_UP
                
		# yes/no 판단: [Yy] 또는 [Yy][Ee][Ss], [Nn] 또는 [Nn][Oo]
                if [[ `echo $KERNEL_UP | grep "^[Yy]$\|^[Yy][Ee][Ss]$" | wc -l` -ge 1 ]]
                then KERNEL_UP="yes"
                elif [[ `echo $KERNEL_UP| grep "^[Nn]$\|^[Nn][Oo]$" | wc -l` -ge 1 ]]
                then KERNEL_UP="no"
                else echo "### Invalid input."
                exit 1
                fi

           else
	   echo "" 
	   CMT="### The most recent kernel version is "
	   ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}${CENTOS7_LAST_KERNEL}
	   CMT="### Current kernel version is "
	   ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}$(uname -r)
	   sleep 5
        fi

if [ -z "${CHK_OS_3}" ] ; then
          
	if [ ${KERNEL_UP} == "yes" ]; then
        echo " "
	COMMAN="yum -y update"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; sleep 3 ; ${COMMAN}
        
	COMMAN="reboot"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; sleep 3 ; ${COMMAN}
	
        fi
fi 

	echo ""
	COMMAN="yum -y install ${CENTOS7_YUM_INSTALL}"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; sleep 3 ; ${COMMAN}
        echo ""
        
	CMT="### Sync Time and Date..."
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B} ; sleep 3
	echo ""
        
	COMMAN="rdate  -s  time.bora.net"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}
        COMMAN="clock --systohc"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}
        COMMAN="date"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}
        COMMAN="hwclock"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B} ; ${COMMAN}        
        ;;

        *)
        echo "OS Detect Error! "
        exit 1
        ;;
esac

echo ""
CMT="### End of Default Utils Install..."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B} ; echo "" ; sleep 10
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}



