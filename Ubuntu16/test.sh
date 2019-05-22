#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

apt-get  -y  install mailutils

source /usr/local/sbin/dasan_export_global_variable.sh
echo $TITLE_TAIL

echo "Test of SMTP... OK. " >  test_message.txt
cat test_message.txt

mail -s   $TITLE_TAIL   -t   $ADMIN_LOG_EMAIL   <   test_message.txt
