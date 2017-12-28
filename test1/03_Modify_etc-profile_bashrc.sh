#!/bin/bash
# Copyright (c) 2017 by Dasandata Corp.
# http://www.dasandata.co.kr
# mailto://mail@dasandata.co.kr
# run as a root
# 03_Modify_etc-profile_bashrc.sh 

# Define common variable
source 01_Define_common_variable.sh

echo ""
CMT="### Modify - /etc/profile , .bashrc..."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B} ; echo "" ; sleep 3

COMMAN="tail /etc/profile"
${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN} ; echo "" ; sleep 2

CMT="### add to /etc/profile (using echo command) "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}

echo " " >> /etc/profile
echo " " >> /etc/profile
echo "#add by dasandata" >> /etc/profile
echo "alias vi='vim'"    >> /etc/profile
echo "alias ls='ls --color=auto'" >> /etc/profile
echo "alias ll='ls -lh'" >> /etc/profile
echo "alias grep='grep --color=auto'" >> /etc/profile
echo "#add end." >> /etc/profile
echo " " >> /etc/profile

COMMAN="tail /etc/profile"
${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN} ; echo "" 

CMT="### add to /root/.bashrc  "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B} 

echo "export PS1='\[\e[1;41;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc

COMMAN="tail -1 /root/.bashrc "
${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN} ; echo "" 

CMT="### add to /home/user/.bashrc  "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B} 

echo "export PS1='\[\e[1;31m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/user/.bashrc

COMMAN="tail -1 /home/user/.bashrc "
${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN} ; echo "" 

echo ""
CMT="### End of Modify /etc/profile & .bashrc ..."
${CMT_ECHO_F}${CMT}${CMT_ECHO_B} ; echo "" ; sleep 3
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
${CMD_ECHO_F}${PROMPT}${CMD_ECHO_B}
