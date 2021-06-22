#!/bin/bash
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr
# This file location is /usr/local/sbin/

# export_global_variable
source /usr/local/sbin/dasan_export_global_variable.sh

# Email Title
TITLE='Dell_OMSA_Alert_by_'$TITLE_TAIL

# Set Variable
OMSA_REPORT='./OMSA_REPORT.log'
OMSA_EMAIL_LOG='./OMSA_EMAIL.log'
OMREPORT_EXEC='/opt/dell/srvadmin/bin/omreport'

# Set Check Level
#OMSA_CHECK_LEVEL='Fatal, Critical, Fail..??'
OMSA_CHECK_LEVEL='Critical'

# Echo Message Head
echo  "
##################################################
# This Message from ${TITLE_TAIL}
# Using Dell Opne Mangement Server Administrator
# The location of the configuration file is below.
# /usr/local/sbin/export_global_variable.sh
# /usr/local/sbin/alert_omsa.sh
# $(date +%Y"-"%m"-"%d" "%r)
################################################## " >> ${OMSA_EMAIL_LOG}

# Extract report
${OMREPORT_EXEC} system alertlog | head -500 > ${OMSA_REPORT}

# check XML Transformation failed
# 추가예정 입니다...;;

# Define Report of OMSA_CHECK_LEVEL
# Include 'non-Critical'
MAX_LINE=$(grep 'Severity' ${OMSA_REPORT} | grep ${OMSA_CHECK_LEVEL} | wc -l)
LINE_NUM=($(cat -n ${OMSA_REPORT} | grep 'Severity' | grep ${OMSA_CHECK_LEVEL} | cut -f 1) )
LINE_SEL=0
# If want except to 'non-Critical'
#MAX_LINE=$(grep Severity ${OMSA_REPORT} | grep ${OMSA_CHECK_LEVEL} | grep -v Non-Critical | wc -l)
#LINE_NUM=($(cat -n ${OMSA_REPORT} | grep Severity | grep ${OMSA_CHECK_LEVEL} | grep -v Non-Critical | cut -f 1))
#LINE_SEL=0

# Echo Message Body
while [ ${MAX_LINE} -ne 0 ]
        do

        AAA=${LINE_NUM[${LINE_SEL}]}
        BBB=$(( ${AAA} + 20))
        CCC='./OMSA_TMP_DATA'

        sed -n ${AAA},${BBB}p ${OMSA_REPORT} > ${CCC}
        ENDL=$(cat ${CCC} | grep -n '^$'| head -1 | cut -d ":" -f 1)

        sed -n 1,${ENDL}p ${CCC} >> ${OMSA_EMAIL_LOG}
        echo "==================================== " >> ${OMSA_EMAIL_LOG}

        rm ${CCC}
        LINE_SEL=$(( ${LINE_SEL} + 1 ))
        MAX_LINE=$(( ${MAX_LINE} - 1 ))
done

# os 종류에 맞추어 주석을 해제 합니다.
# Centos 7.x - Send to Email
#cat ${OMSA_EMAIL_LOG} | /usr/bin/mail -s $TITLE $ADMIN_LOG_EMAIL

# Ubuntu 16 - Send to Email
#/usr/bin/mail -s $TITLE -t $ADMIN_LOG_EMAIL < ${OMSA_EMAIL_LOG}

# Ubuntu 17 - Send to Email
#cat ${OMSA_EMAIL_LOG} | /usr/bin/mail -s $TITLE $ADMIN_LOG_EMAIL


# Remove Log File
rm ${OMSA_REPORT}
rm ${OMSA_EMAIL_LOG}

# End of file.
