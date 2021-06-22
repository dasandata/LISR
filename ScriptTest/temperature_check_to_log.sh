#!/bin/bash
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr
# CentOS 7.x
# This file location is /usr/local/sbin/

# Log Message
LOG='/var/log/Dasandata_Temperature.log'

# Temperature Detect for Inlet
#AA=$(ipmitool sdr type Temperature)
#BB=$(echo ${AA} | cut -d "|" -f 5 | cut -d " " -f 2)
#echo $(date '+%Y-%m-%d %a %H:%M:%S')' Inlet Temp is ' ${BB} 'degrees C' >> $LOG

# Temperature Detect for Ambient
#AA=$(ipmitool sdr type Temperature)
#BB=$(echo ${AA} | cut -d "|" -f 21 | cut -d " " -f 2)
#echo $(date '+%Y-%m-%d %a %H:%M:%S')' Ambient Temp is '${BB}' degrees C' >> $LOG

CC=$(ipmitool sdr type Temperature | grep "Ambient\|Inlet" | awk '{print $1, $2, $10, $11, $12}')
echo $(date '+%Y-%m-%d %a %H:%M:%S') ${CC} >> $LOG

# End of File.
