#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}]# "
#PROMPT="[${USER}@${HOSTNAME}:${PWD/#$HOME/~}]#"

CMD_ECHO_F="echo -e \\033[1;34m"
CMD_ECHO_B="\\033[0m"

CMT_ECHO_F="echo -e \\033[1;32m"
CMT_ECHO_B="\\033[0m"

COMMAN="perl -pi -e  's/GRUB_CMDLINE_LINUX=\"/GRUB_CMDLINE_LINUX=\"ipv6.disable=1 /' /etc/default/grub"

COMMAN=
${CMD_ECHO_F}${PROMPT}${COMMAN}${CMD_ECHO_B};${COMMAN};echo ""

CMT=
${CMT_ECHO_F}${CMT}${CMT_ECHO_B};echo ""
