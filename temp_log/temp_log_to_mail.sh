#!/bin/bash
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr
# CentOS 7.x
# This File Locate is '/dadandata/temp_log_to_mail.sh'

#export_global_variable
source /dasandata/export_global_variable.sh

TITLE='IPMI_Temperature_log_by_'$TITLE_TAIL

#Log Message
LOG='/var/log/Temperature_dasandata.log'

cat $LOG | /usr/bin/mail -s $TITLE $ADMIN_LOG_EMAIL
rm $LOG

echo  "
################################################## 
# This Message from $TITLE_TAIL 
# Using crontab (/etc/crontab) 
# The location of the configuration file is below. 
# /dasandata/export_global_variable.sh
# /dasandata/temp_check_to_log.sh , /dasandata/temp_log_to_mail.sh 
################################################## \n" >> $LOG
