#!/bin/bash
# Copyright (c) 2017 by Dasandata Corp.
# http://www.dasandata.co.kr
# mailto://mail@dasandata.co.kr
# run as a root
# 11_Modify_grub-ipv6-selinux.sh

# Define common variable
source 01_Define_common_variable.sh
echo ""
echo ""
CMT="#######################################################################"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="### Modify grub (Display Boot Log, ipv6 disable... Selinux Disable...)  "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B};echo "";sleep 5

case "${RELEASE}" in
        ${CENTOS7})

	COMMAN="cat /etc/default/grub "
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	cat /etc/default/grub ;	echo ""
	COMMAN="perl -pi -e  's/rhgb//'   /etc/default/grub"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	perl -pi -e  's/rhgb//'   /etc/default/grub ; echo ""
	COMMAN="perl -pi -e  's/quiet//'  /etc/default/grub"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	perl -pi -e  's/quiet//'  /etc/default/grub ; echo ""
	COMMAN="perl -pi -e  's/GRUB_CMDLINE_LINUX=\"/GRUB_CMDLINE_LINUX=\"ipv6.disable=1 /' /etc/default/grub"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	perl -pi -e  's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /' /etc/default/grub ; 	echo ""
        
	COMMAN="cat /etc/default/grub "
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
	COMMAN="grub2-mkconfig -o /boot/grub2/grub.cfg"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
	COMMAN="getenforce"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
	COMMAN="setenforce 0"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
	COMMAN="getenforce"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

        COMMAN="perl -pi -e 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config "
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	perl -pi -e 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config ;echo ""
	COMMAN="cat /etc/selinux/config"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

        ;;

        ${UBUNTU16})
	
	COMMAN="cat /etc/default/grub"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
	COMMAN="perl -pi -e 's/quiet//'  /etc/default/grub"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	perl -pi -e 's/quiet//'  /etc/default/grub ; echo ""
	COMMAN="perl -pi -e 's/splash//' /etc/default/grub"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}	
	perl -pi -e 's/splash//' /etc/default/grub ; echo ""
	COMMAN="perl -pi -e  's/GRUB_CMDLINE_LINUX=\"/GRUB_CMDLINE_LINUX=\"ipv6.disable=1 /'  /etc/default/grub"
	perl -pi -e  's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /'  /etc/default/grub ; echo ""
	COMMAN="cat /etc/default/grub | grep -v '#'"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	cat /etc/default/grub | grep -v '#' ; echo ""
	COMMAN="update-initramfs -u \&\& update-grub2 "
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	update-initramfs -u && update-grub2 ; echo ""

        ;;
        ${UBUNTU14})

        COMMAN="cat /etc/default/grub"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
        COMMAN="perl -pi -e 's/quiet//'  /etc/default/grub"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
        perl -pi -e 's/quiet//'  /etc/default/grub ; echo ""
        COMMAN="perl -pi -e 's/splash//' /etc/default/grub"     
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
        perl -pi -e 's/splash//' /etc/default/grub ; echo ""
        COMMAN="perl -pi -e  's/GRUB_CMDLINE_LINUX=\"/GRUB_CMDLINE_LINUX=\"ipv6.disable=1 /'  /etc/default/grub"
        perl -pi -e  's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /'  /etc/default/grub ; echo ""
        COMMAN="cat /etc/default/grub | grep -v '#'"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
        cat /etc/default/grub | grep -v '#' ; echo ""
        COMMAN="update-initramfs -u \&\& update-grub2 "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
        update-initramfs -u && update-grub2 ; echo ""

        ;;

        *)
        echo "OS Dectect Error! "
        exit 1
        ;;
esac

echo ""
CMT="### End of Modify grub..."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B} ; echo "" ; sleep 3
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
