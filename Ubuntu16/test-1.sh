#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

grep "inet_interfaces\|inet_protocols" /etc/postfix/main.cf

perl -pi -e 's/^inet_protocols = all/inet_protocols = ipv4/'  /etc/postfix/main.cf

grep inet_protocols  /etc/postfix/main.cf

grep 'mynetworks = '   /etc/postfix/main.cf

perl -pi -e 's/^mynetworks/#mynetworks/'   /etc/postfix/main.cf

grep  'mynetworks = '   /etc/postfix/main.cf

systemctl restart postfix
