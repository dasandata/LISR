#!/bin/bash
# Copyright (c) 2017 by Dasandata Corp.
# http://www.dasandata.co.kr
# mailto://mail@dasandata.co.kr
# run as a root
# 11_Modify_grub_For_GPU-nouveau.sh

# Define common variable
source 01_Define_common_variable.sh

echo ""
CMT="################################################"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="### Modifiy grub (For GPU, Disable nouveau...)  "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B};echo "";sleep 5

CMT="# Checking status activation for 'nouveau'"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
COMMAN="lsmod | grep nouveau"
${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
lsmod | grep nouveau ; echo "";sleep 2

COMMAN="cat /etc/default/grub | grep -v '#' "
${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
cat /etc/default/grub | grep -v '#' ; echo ""
COMMAN="perl -pi -e  's/GRUB_CMDLINE_LINUX=\"/GRUB_CMDLINE_LINUX=\"nomodeset /' /etc/default/grub"
${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
perl -pi -e  's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="nomodeset /' /etc/default/grub ; echo ""
COMMAN="cat /etc/default/grub | grep -v '#' "
${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
cat /etc/default/grub | grep -v '#' ; echo ""

COMMAN="echo \"blacklist nouveau\" >> /etc/modprobe.d/blacklist.conf"
${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
COMMAN="echo \"options nouveau modeset=0\" >> /etc/modprobe.d/blacklist.conf"
${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist.conf

COMMAN="tail -2 /etc/modprobe.d/blacklist.conf"
${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""


case "${RELEASE}" in
        ${CENTOS7})
	
	COMMAN="dracut -f"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""
	COMMAN="grub2-mkconfig -o /boot/grub2/grub.cfg"
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

        ;;

        ${UBUNTU16})
	COMMAN="update-initramfs -u \&\& update-grub2 "
	${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B}
	update-initramfs -u && update-grub2 ; echo ""

        ;;

        ${UBUNTU14})

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
CMT="#########################################################"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="# Important!!"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="# Reboot required before install to  Nvidia Driver."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
CMT="#########################################################"
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
echo ""
echo ""
echo ""
sleep 5

echo ""
CMT="### End of Modify grub for GPU..."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B} ; echo "" ; sleep 3
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}


