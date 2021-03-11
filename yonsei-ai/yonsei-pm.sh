#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

date1=$(date "+%Y-%m-%d %H:%M:%S")

# Log File
export LOGFILE="/root/dasan_Maintenance_${date1}.txt"

date | tee -a "$LOGFILE"

cat /root/banner.sample | tee -a "$LOGFILE"

echo ""
echo ""
echo "==================== younsei-ai check ===================="
echo "==================== younsei-ai check ====================" >> "/root/dasan_Maintenance_${date1}.txt"
echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} wwsh node list | sort -V " >> "/root/dasan_Maintenance_${date1}.txt"
wwsh node list | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo "==================== Master Power ===================="
echo "==================== Master Power ====================" >> "/root/dasan_Maintenance_${date1}.txt"
echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} ipmitool power status  " >> "/root/dasan_Maintenance_${date1}.txt"
ipmitool power status | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo "==================== Master Fan information ===================="
echo "==================== Master Fan information ====================" >> "/root/dasan_Maintenance_${date1}.txt"
echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} ipmitool sdr type fan " >> "/root/dasan_Maintenance_${date1}.txt"
ipmitool sdr type fan | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo "==================== Node Power ===================="
echo "==================== Node Power ====================" >> "/root/dasan_Maintenance_${date1}.txt"
echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} wwsh ipmi powerstatus | sort -V  " >> "/root/dasan_Maintenance_${date1}.txt"
wwsh ipmi powerstatus | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo "==================== Node Fan information ===================="
echo "==================== Node Fan information ====================" >> "/root/dasan_Maintenance_${date1}.txt"
echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} pdsh -w node[01-33],fpga[1-3],yonsei-ai-login[1-2] ipmitool sdr type fan | sort -V " >> "/root/dasan_Maintenance_${date1}.txt"
pdsh -w node[01-33],fpga[1-3],yonsei-ai-login[1-2] ipmitool sdr type fan | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo "==================== Node Memory information ===================="
echo "==================== Node Memory information ====================" >> "/root/dasan_Maintenance_${date1}.txt"
echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} pdsh -w node[01-33],fpga[1-3],yonsei-ai-login[1-2] cat /proc/meminfo | grep -i memtotal | sort -V " >> "/root/dasan_Maintenance_${date1}.txt"
pdsh -w node[01-33],fpga[1-3],yonsei-ai-login[1-2] cat /proc/meminfo | grep -i memtotal | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"


echo ""
echo ""
echo "==================== HDD Check ===================="
echo "==================== HDD Check ====================" >> "/root/dasan_Maintenance_${date1}.txt"
echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} lsblk " >> "/root/dasan_Maintenance_${date1}.txt"
lsblk | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} df -h  | grep -v tmpfs | grep -v overlay " >> "/root/dasan_Maintenance_${date1}.txt"
df -h  | grep -v tmpfs | grep -v overlay | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} df -hT / " >> "/root/dasan_Maintenance_${date1}.txt"
df -hT / | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} cat /proc/mdstat " >> "/root/dasan_Maintenance_${date1}.txt"
cat /proc/mdstat | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} mdadm -D /dev/md126 " >> "/root/dasan_Maintenance_${date1}.txt"
mdadm -D /dev/md126 | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} /usr/local/MegaRAID\ Storage\ Manager/StorCLI/storcli64 /c0 show " >> "/root/dasan_Maintenance_${date1}.txt"
/usr/local/MegaRAID\ Storage\ Manager/StorCLI/storcli64 /c0 show | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo "==================== Node GPU Check ===================="
echo "==================== Node GPU Check ====================" >> "/root/dasan_Maintenance_${date1}.txt"
echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} pdsh -w node[01-33] gpustat --no-color -c -u -p -F -P | sort -V " >> "/root/dasan_Maintenance_${date1}.txt"
pdsh -w node[01-33] gpustat --no-color -c -u -p -F -P | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo "==================== Slurm Scheduler Check ===================="
echo "==================== Slurm Scheduler Check ====================" >> "/root/dasan_Maintenance_${date1}.txt"
echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} systemctl status slurmctld " >> "/root/dasan_Maintenance_${date1}.txt"
systemctl status slurmctld | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} sinfo " >> "/root/dasan_Maintenance_${date1}.txt"
sinfo | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} scontrol show node | grep "NodeName\|Reason" " >> "/root/dasan_Maintenance_${date1}.txt"
scontrol show node | grep "NodeName\|Reason" | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo "==================== Network Switch Check ===================="
echo "==================== Network Switch Check ====================" >> "/root/dasan_Maintenance_${date1}.txt"
echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} grep -i internal /etc/hosts " >> "/root/dasan_Maintenance_${date1}.txt"
grep -i internal /etc/hosts | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} grep -i internal /etc/hosts | grep -v ^# | awk '{print $2}' " >> "/root/dasan_Maintenance_${date1}.txt"
grep -i internal /etc/hosts | grep -v ^# | awk '{print $2}' | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} for I in $(grep -i internal /etc/hosts | grep -v ^# | awk '{print $2}') ; do echo $I ; ping -c4 $I ; echo ; done " >> "/root/dasan_Maintenance_${date1}.txt"
for I in $(grep -i internal /etc/hosts | grep -v ^# | awk '{print $2}') ; do echo $I ; ping -c4 $I ; echo ; done | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"



echo ""
echo ""
echo "==================== Master & Node Nic Check ===================="
echo "==================== Master & Node Nic Check ====================" >> "/root/dasan_Maintenance_${date1}.txt"
echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} pdsh -w yonsei-ai-login[1-2] 'date "+%Y-%m-%d %H:%M:%S" ; ifconfig eth2 | grep 10.1.1 ; echo ' | sort -V " >> "/root/dasan_Maintenance_${date1}.txt"
pdsh -w yonsei-ai-login[1-2] 'date "+%Y-%m-%d %H:%M:%S" ; ifconfig eth2 | grep 10.1.1 ; echo ' | sort -V  | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} pdsh -w node[01-33] 'date "+%Y-%m-%d %H:%M:%S" ; ifconfig eth0 | grep 10.1.1 ; echo ' | sort -V " >> "/root/dasan_Maintenance_${date1}.txt"
pdsh -w node[01-33] 'date "+%Y-%m-%d %H:%M:%S" ; ifconfig eth0 | grep 10.1.1 ; echo ' | sort -V  | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} pdsh -w fpga[1-3] 'date "+%Y-%m-%d %H:%M:%S" ; ifconfig enp134s0f0 | grep 10.1.1 ; echo ' | sort -V " >> "/root/dasan_Maintenance_${date1}.txt"
pdsh -w fpga[1-3] 'date "+%Y-%m-%d %H:%M:%S" ; ifconfig enp134s0f0 | grep 10.1.1 ; echo ' | sort -V  | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"


echo ""
echo ""
echo "==================== Master & Node Port Speed Check ===================="
echo "==================== Master & Node Port Speed Check ====================" >> "/root/dasan_Maintenance_${date1}.txt"
echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} ethtool enp175s0f0 | grep Speed " >> "/root/dasan_Maintenance_${date1}.txt"
ethtool enp175s0f0 | grep Speed | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} pdsh -w yonsei-ai-login[1-2] 'date "+%Y-%m-%d %H:%M:%S" ; ethtool eth2 | grep -i Speed ; echo ' | sort -V " >> "/root/dasan_Maintenance_${date1}.txt"
pdsh -w yonsei-ai-login[1-2] 'date "+%Y-%m-%d %H:%M:%S" ; ethtool eth2 | grep -i Speed ; echo ' | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} pdsh -w fpga[1-3] 'date "+%Y-%m-%d %H:%M:%S" ; ethtool enp134s0f0 | grep -i Speed ; echo ' | sort -V " >> "/root/dasan_Maintenance_${date1}.txt"
pdsh -w fpga[1-3] 'date "+%Y-%m-%d %H:%M:%S" ; ethtool enp134s0f0 | grep -i Speed ; echo ' | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} pdsh -w node[01-33] 'date "+%Y-%m-%d %H:%M:%S" ; ethtool eth0 | grep Speed ; echo ' | sort -V " >> "/root/dasan_Maintenance_${date1}.txt"
pdsh -w node[01-33] 'date "+%Y-%m-%d %H:%M:%S" ; ethtool eth0 | grep Speed ; echo ' | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo "==================== Node Time Sync Check ===================="
echo "==================== Node Time Sync Check ====================" >> "/root/dasan_Maintenance_${date1}.txt"
echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} uptime " >> "/root/dasan_Maintenance_${date1}.txt"
uptime | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} pdsh -w login[1-2],fpga[1-3],node[01-33]   'date "+%Y-%m-%d %H:%M:%S" ; uptime'  | sort -V " >> "/root/dasan_Maintenance_${date1}.txt"
pdsh -w login[1-2],fpga[1-3],node[01-33]   'date "+%Y-%m-%d %H:%M:%S" ; uptime'  | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo "==================== Mount Point Check ===================="
echo "==================== Mount Point Check ====================" >> "/root/dasan_Maintenance_${date1}.txt"
echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} ssh login1 df -ht nfs | sed '1d' " >> "/root/dasan_Maintenance_${date1}.txt"
ssh login1 df -ht nfs | sed '1d' | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} pdsh -w login[1,2],node[01-33] uptime | wc -l " >> "/root/dasan_Maintenance_${date1}.txt"
pdsh -w login[1,2],node[01-33] uptime | wc -l | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} pdsh -w login[1,2],node[01-33] 'df -ht nfs | sed '1d'' | wc -l " >> "/root/dasan_Maintenance_${date1}.txt"
pdsh -w login[1,2],node[01-33] 'df -ht nfs | sed '1d'' | wc -l | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} echo $((3*35)) " >> "/root/dasan_Maintenance_${date1}.txt"
echo $((3*35)) | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} grep -i das /etc/hosts " >> "/root/dasan_Maintenance_${date1}.txt"
grep -i das /etc/hosts | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} ping -c4 yonsei-ai-das-a " >> "/root/dasan_Maintenance_${date1}.txt"
ping -c4 yonsei-ai-das-a | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} ping -c4 yonsei-ai-das-b " >> "/root/dasan_Maintenance_${date1}.txt"
ping -c4 yonsei-ai-das-b | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} grep -i powerscale /etc/hosts " >> "/root/dasan_Maintenance_${date1}.txt"
grep -i powerscale /etc/hosts | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo "==================== Firmware Version Check ===================="
echo "==================== Firmware Version Check ====================" >> "/root/dasan_Maintenance_${date1}.txt"
echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} dmidecode | grep -A3 "BIOS Information" " >> "/root/dasan_Maintenance_${date1}.txt"
dmidecode | grep -A3 "BIOS Information" | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} ssh fpga1 dmidecode | grep -A3 "BIOS Information" " >> "/root/dasan_Maintenance_${date1}.txt"
ssh fpga1 dmidecode | grep -A3 "BIOS Information" | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"

echo ""
echo ""
echo $date1
echo -e  "${PROMPT} ${date1} " >> "/root/dasan_Maintenance_${date1}.txt"
echo -e  "${PROMPT} ssh node01 dmidecode | grep -A3 "BIOS Information" " >> "/root/dasan_Maintenance_${date1}.txt"
ssh node01 dmidecode | grep -A3 "BIOS Information" | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${date1}.txt"
