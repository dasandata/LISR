#!/bin/bash
# Copyright (c) 2017 by Dasandata Corp.
# http://www.dasandata.co.kr
# mailto://mail@dasandata.co.kr
# run as a root
# 16_For_security_enhance_Setting_to_Firewall_sshdconfig.sh

# Define common variable
source 01_Define_common_variable.sh

echo ""
echo ""
CMT="##########################################################"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="### For Security enhancement... "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="### Change ssh port (22 to 7777), Deny root login via ssh,"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="### Firwall Port Setting and X11Forwading Enable..."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}; sleep 3 ; echo ""

case "${RELEASE}" in
        ${CENTOS7})

	CMT="# CentOS 7 Firwall Setting"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        CMT="# Check Current firewall Setting"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="firewall-cmd --list-all "
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
	COMMAN="firewall-cmd --get-default-zone "
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

	CMT="# Change Firwall Zone of External Interface ( ${EMX} )"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="firewall-cmd --change-interface=${EMX} --zone=external  --permanent "
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN} ;echo ""
	COMMAN="firewall-cmd --set-default-zone=external"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
	COMMAN="firewall-cmd --reload  "
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
	
	CMT="# Set up ports for ssh services and remove existing config"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="firewall-cmd --add-port=7777/tcp  --permanent"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
        COMMAN="firewall-cmd --remove-service=ssh  --permanent"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
        COMMAN="firewall-cmd --reload"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
        
	CMT="# Check changed settings..."
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="firewall-cmd --list-all "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo "";sleep 5

	CMT="# Change ssh service port (22 to 7777) and Root login via ssh"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	CMT="# Check Current Config"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="grep PermitRootLogin /etc/ssh/sshd_config"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
        COMMAN="grep ^Port /etc/ssh/sshd_config"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""	

	CMT="# Change value"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="perl -pi -e 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config "
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	perl -pi -e 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config ; echo ""
	COMMAN="perl -pi -e 's/#Port 22/Port 7777/' /etc/ssh/sshd_config "
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	perl -pi -e 's/#Port 22/Port 7777/' /etc/ssh/sshd_config  ; echo ""

	CMT="# Enable X11Forwading "
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="echo \"AddressFamily inet\" >> /etc/ssh/sshd_config"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	echo "AddressFamily inet" >> /etc/ssh/sshd_config ; echo ""

	CMT="# Restart ssh service"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="systemctl restart sshd"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

        ;;

        ${UBUNTU16})

	CMT="# Ubunut16 Firewall Setting"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	CMT="# Check Current firewall status"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="systemctl status ufw"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
	COMMAN="ufw status"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
	
	CMT="# Start Ubuntu Firewall"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="ufw enable"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""	

	CMT="# Change Firwall Policy to All deny and Add new ssh port"
	${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="ufw default deny"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
	COMMAN="ufw allow 7777/tcp"

        CMT="# Check changed settings..."
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
	COMMAN="ufw status numbered"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

        CMT="# Change ssh service port (22 to 7777) and Root login via ssh"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        CMT="# Check Current Config"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="grep PermitRootLogin /etc/ssh/sshd_config"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
        COMMAN="grep ^Port /etc/ssh/sshd_config"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""  
 
        CMT="# Change value"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="perl -pi -e 's/PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
        perl -pi -e 's/PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config ; echo ""
	COMMAN="perl -pi -e 's/Port 22/Port 7777/' /etc/ssh/sshd_config "  
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	perl -pi -e 's/Port 22/Port 7777/' /etc/ssh/sshd_config ; echo ""


        CMT="# Enable X11Forwading "
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="echo \"AddressFamily inet\" >> /etc/ssh/sshd_config"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
        echo "AddressFamily inet" >> /etc/ssh/sshd_config ; echo ""

        CMT="# Restart ssh service"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="systemctl restart sshd"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

	;;

        ${UBUNTU14})

        CMT="# Ubunut14 Firwall Setting"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        CMT="# Check Current firewall status"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="service ufw status "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
        COMMAN="ufw status"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

        CMT="# Start Ubuntu Firewall"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="ufw enable"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""  


        CMT="# Change Firwall Policy to All deny and Add new ssh port"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="ufw default deny"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
        COMMAN="ufw allow 7777/tcp"

        CMT="# Check changed settings..."
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="ufw status numbered"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

        CMT="# Change ssh service port (22 to 7777) and Root login via ssh"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        CMT="# Check Current Config"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="grep PermitRootLogin /etc/ssh/sshd_config"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
        COMMAN="grep ^Port /etc/ssh/sshd_config"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""  

        CMT="# Change value"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="perl -pi -e 's/PermitRootLogin without-password/PermitRootLogin no/' /etc/ssh/sshd_config "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
        perl -pi -e 's/PermitRootLogin without-password/PermitRootLogin no/' /etc/ssh/sshd_config ; echo ""
        COMMAN="perl -pi -e 's/Port 22/Port 7777/' /etc/ssh/sshd_config "
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
        perl -pi -e 's/Port 22/Port 7777/' /etc/ssh/sshd_config ; echo ""


        CMT="# Enable X11Forwading "
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="echo \"AddressFamily inet\" >> /etc/ssh/sshd_config"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
        echo "AddressFamily inet" >> /etc/ssh/sshd_config ; echo ""

        CMT="# Restart ssh service"
        ${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
        COMMAN="service ssh restart"
        ${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""


        ;;

        *)
        echo "OS Detect Error! "
        exit 1
        ;;
esac

echo ""
CMT="### End of Firewall & sshd config ..."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B} ; echo "" ; sleep 3
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
