#!/bin/bash
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr
# CentOS 7.x
# This File Locate is '/root/dasan_temperature_log_to_mail.sh'

#export_global_variable
source /root/dasan_export_global_variable.sh

TITLE='IPMI_Temperature_log_by_'${TITLE_TAIL}

#Log Message
LOG='/var/log/Dasandata_Temperature.log'

cat ${LOG} | /usr/bin/mail -s ${TITLE} ${ADMIN_LOG_EMAIL}
rm ${LOG}

echo  "
##################################################
# This Message from ${TITLE_TAIL}
# Using crontab (/etc/crontab)
# The location of the configuration file is below.
# /root/dasan_export_global_variable.sh
# /root/dasan_temperature_check_to_log.sh ,
# /root/dasan_temperature_log_to_mail.sh.sh
################################################## \n" >> ${LOG}
