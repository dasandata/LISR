#!/bin/bash
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr
# CentOS 7.x
# This File Locate is /usr/local/sbin/

# export_global_variable
source /usr/local/sbin/dasan_export_global_variable.sh

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
# /usr/local/sbin/export_global_variable.sh,
# /usr/local/sbin/temperature_check_to_log.sh,
# /usr/local/sbin/temperature_log_to_mail.sh
##################################################
" >> ${LOG}

# End of File.
