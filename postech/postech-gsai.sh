#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

Date1=$(date "+%Y-%m-%d %H:%M:%S")

# Log File
export LOGFILE="/root/dasan_Maintenance_${Date1}.txt"

date | tee -a "$LOGFILE"

echo ""
echo ""
echo -e  "==================== postech-gsai check ===================="
echo ""
echo ""

echo " node list " >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} wwsh node list " >> "/root/dasan_Maintenance_${Date1}.txt"
wwsh node list | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Master Power ===================="
echo ""
echo ""
echo -e  "${PROMPT} dmidecode -t chassis | grep 'Power Supply State'  " >> "/root/dasan_Maintenance_${Date1}.txt"
dmidecode -t chassis | grep "Power Supply State" | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Master Fan information ===================="
echo ""
echo ""
echo -e  "${PROMPT} ipmitool sdr type fan " >> "/root/dasan_Maintenance_${Date1}.txt"
ipmitool sdr type fan | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Node Power ===================="
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-9] dmidecode -t chassis | grep "Power Supply State" | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[1-9] dmidecode -t chassis | grep "Power Supply State" | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Node Fan information ===================="
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-9] ipmitool sdr type fan | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[1-9] ipmitool sdr type fan | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== HDD Check ===================="
echo ""
echo ""
echo -e  "${PROMPT} lsblk " >> "/root/dasan_Maintenance_${Date1}.txt"
lsblk | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo -e  "${PROMPT} df -h  | grep -v tmpfs | grep -v overlay " >> "/root/dasan_Maintenance_${Date1}.txt"
df -h  | grep -v tmpfs | grep -v overlay | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Nic Check ===================="
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-9] ifconfig  eth0 | grep 192.168.0 | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[1-9] ifconfig  eth0 | grep 192.168.0 | sort -V   | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Port Speed Check ===================="
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-7] ethtool  eth0 | grep -i speed | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[1-7] ethtool  eth0 | grep -i speed | sort -V  | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo -e  "${PROMPT} pdsh -w n[8-9] ethtool  eth2 | grep -i speed | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[8-9] ethtool  eth2 | grep -i speed | sort -V  | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Port Check ===================="
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-7] ifconfig  eth0 | grep 192.168.0 | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[1-7] ifconfig  eth0 | grep 192.168.0 | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo -e  "${PROMPT} pdsh -w n[8-9] ifconfig  eth2 | grep 192.168.0 | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[8-9] ifconfig  eth2 | grep 192.168.0 | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Mount Point Check ===================="
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-9] df -h | grep "gsai-master" | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[1-9] df -h | grep "gsai-master" | sort -V  | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== GPU Check ====================" 
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-9] nvidia-smi -L | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[1-9] nvidia-smi -L | sort -V  | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo -e  "${PROMPT} pdsh -w n[1-9] nvidia-smi -L | sort -V | wc -l  " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[1-9] nvidia-smi -L | sort -V | wc -l | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"
