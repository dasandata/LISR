#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

date

echo ""
echo ""

echo -e  "==================== postech-gsai check ===================="

echo " node list "
echo ""
echo ""
echo -e  "${PROMPT} wwsh node list && date " >> /root/dasan_Maintenance.txt
wwsh node list >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo " Master Power "
echo ""
echo ""
echo -e  "${PROMPT} dmidecode -t chassis | grep 'Power Supply State'  " >> /root/dasan_Maintenance.txt
dmidecode -t chassis | grep "Power Supply State" >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo " Master Fan information "
echo ""
echo ""
echo -e  "${PROMPT} ipmitool sdr type fan " >> /root/dasan_Maintenance.txt
ipmitool sdr type fan >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo " Node Power "
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-9] dmidecode -t chassis | grep "Power Supply State" | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[1-9] dmidecode -t chassis | grep "Power Supply State" | sort -V >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt


echo " Node Fan information "
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-9] ipmitool sdr type fan | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[1-9] ipmitool sdr type fan | sort -V >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo " HDD Check "
echo ""
echo ""
echo -e  "${PROMPT} lsblk " >> /root/dasan_Maintenance.txt
lsblk >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT} df -h  | grep -v tmpfs | grep -v overlay " >> /root/dasan_Maintenance.txt
df -h  | grep -v tmpfs | grep -v overlay >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo " Nic Check "
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-9] ifconfig  eth0 | grep 192.168.0 | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[1-9] ifconfig  eth0 | grep 192.168.0 | sort -V   >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo " Port Speed Check "
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-7] ethtool  eth0 | grep -i speed | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[1-7] ethtool  eth0 | grep -i speed | sort -V  >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT} pdsh -w n[8-9] ethtool  eth2 | grep -i speed | sort -V " >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo " Port Check "
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-7] ifconfig  eth0 | grep 192.168.0 | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[1-7] ifconfig  eth0 | grep 192.168.0 | sort -V >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT} pdsh -w n[8-9] ifconfig  eth2 | grep 192.168.0 | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[8-9] ifconfig  eth2 | grep 192.168.0 | sort -V >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo " Mount Point Check "
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-9] df -h | grep "gsai-master" | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[1-9] df -h | grep "gsai-master" | sort -V  >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo " GPU Check "
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-9] nvidia-smi -L | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[1-9] nvidia-smi -L | sort -V  >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT} pdsh -w n[1-9] nvidia-smi -L | sort -V | wc -l  " >> /root/dasan_Maintenance.txt
pdsh -w n[1-9] nvidia-smi -L | sort -V | wc -l

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt
