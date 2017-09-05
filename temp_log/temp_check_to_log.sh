#!/bin/bash
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr
# CentOS 7.x
# This File Locate is '/dadandata/temp_check_to_log.sh'

# Temperature Detect 
AA=$(ipmitool sdr type Temperature)
BB=$(echo $AA | cut -d "|" -f 21 | cut -d " " -f 2)

# Log Message
LOG='/var/log/Temperature_dasandata.log'

echo $(date '+%Y-%m-%d %a %H:%M:%S')' Ambient Temp is ' $BB  >> $LOG
