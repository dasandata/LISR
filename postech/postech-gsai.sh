#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

date >> /root/dasan_Maintenance.txt

echo ""
echo ""
echo -e  "==================== postech-gsai check ===================="  >> /root/dasan_Maintenance.txt
echo ""
echo ""

echo " node list " >> /root/dasan_Maintenance.txt
echo ""
echo ""
echo -e  "${PROMPT} wwsh node list " >> /root/dasan_Maintenance.txt
wwsh node list >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo ""
echo ""
echo "==================== Master Power ====================" >> /root/dasan_Maintenance.txt
echo ""
echo ""
echo -e  "${PROMPT} dmidecode -t chassis | grep 'Power Supply State'  " >> /root/dasan_Maintenance.txt
dmidecode -t chassis | grep "Power Supply State" >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo ""
echo ""
echo "==================== Master Fan information " >> /root/dasan_Maintenance.txt
echo ""
echo ""
echo -e  "${PROMPT} ipmitool sdr type fan " >> /root/dasan_Maintenance.txt
ipmitool sdr type fan >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo ""
echo ""
echo " Node Power " >> /root/dasan_Maintenance.txt
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-9] dmidecode -t chassis | grep "Power Supply State" | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[1-9] dmidecode -t chassis | grep "Power Supply State" | sort -V >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo ""
echo ""
echo " Node Fan information " >> /root/dasan_Maintenance.txt
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-9] ipmitool sdr type fan | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[1-9] ipmitool sdr type fan | sort -V >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo ""
echo ""
echo " HDD Check " >> /root/dasan_Maintenance.txt
echo ""
echo ""
echo -e  "${PROMPT} lsblk " >> /root/dasan_Maintenance.txt
lsblk >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT} df -h  | grep -v tmpfs | grep -v overlay " >> /root/dasan_Maintenance.txt
df -h  | grep -v tmpfs | grep -v overlay >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo ""
echo ""
echo " Nic Check " >> /root/dasan_Maintenance.txt
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-9] ifconfig  eth0 | grep 192.168.0 | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[1-9] ifconfig  eth0 | grep 192.168.0 | sort -V   >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo ""
echo ""
echo " Port Speed Check " >> /root/dasan_Maintenance.txt
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-7] ethtool  eth0 | grep -i speed | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[1-7] ethtool  eth0 | grep -i speed | sort -V  >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT} pdsh -w n[8-9] ethtool  eth2 | grep -i speed | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[8-9] ethtool  eth2 | grep -i speed | sort -V  >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo ""
echo ""
echo " Port Check " >> /root/dasan_Maintenance.txt
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-7] ifconfig  eth0 | grep 192.168.0 | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[1-7] ifconfig  eth0 | grep 192.168.0 | sort -V >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT} pdsh -w n[8-9] ifconfig  eth2 | grep 192.168.0 | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[8-9] ifconfig  eth2 | grep 192.168.0 | sort -V >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo ""
echo ""
echo " Mount Point Check " >> /root/dasan_Maintenance.txt
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-9] df -h | grep "gsai-master" | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[1-9] df -h | grep "gsai-master" | sort -V  >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo ""
echo ""
echo " GPU Check " >> /root/dasan_Maintenance.txt
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-9] nvidia-smi -L | sort -V " >> /root/dasan_Maintenance.txt
pdsh -w n[1-9] nvidia-smi -L | sort -V  >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT} pdsh -w n[1-9] nvidia-smi -L | sort -V | wc -l  " >> /root/dasan_Maintenance.txt
pdsh -w n[1-9] nvidia-smi -L | sort -V | wc -l >> /root/dasan_Maintenance.txt

echo -e  "${PROMPT}   " >> /root/dasan_Maintenance.txt
