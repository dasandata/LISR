#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

Date1=$(date "+%Y-%m-%d %H:%M:%S")

# Log File
export LOGFILE="/root/dasan_Maintenance_${Date1}.txt"

date | tee -a "$LOGFILE"

cat /root/banner.sample | tee -a "$LOGFILE"

echo ""
echo ""
echo "==================== postech-vm check ===================="
echo "==================== postech-vm check ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""

echo " hostname information " >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} hostname " >> "/root/dasan_Maintenance_${Date1}.txt"
hostname | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Master Power ===================="
echo "==================== Master Power ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} dmidecode -t chassis | grep 'Power Supply State'  " >> "/root/dasan_Maintenance_${Date1}.txt"
dmidecode -t chassis | grep "Power Supply State" | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Master Fan information ===================="
echo "==================== Master Fan information ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} ipmitool sdr type fan " >> "/root/dasan_Maintenance_${Date1}.txt"
ipmitool sdr type fan | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== HDD Check ===================="
echo "==================== HDD Check ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} lsblk " >> "/root/dasan_Maintenance_${Date1}.txt"
lsblk | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo -e  "${PROMPT} df -h | grep -v tmpfs " >> "/root/dasan_Maintenance_${Date1}.txt"
df -h | grep -v tmpfs | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Nic Check ===================="
echo "==================== Nic Check ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} ifconfig br0 " >> "/root/dasan_Maintenance_${Date1}.txt"
ifconfig br0 | tee -a "$LOGFILE"

echo -e  "${PROMPT} ifconfig virbr0  " >> "/root/dasan_Maintenance_${Date1}.txt"
ifconfig virbr0 | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Port Speed Check ===================="
echo "==================== Port Speed Check ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} ethtool br0 " >> "/root/dasan_Maintenance_${Date1}.txt"
ethtool br0 | tee -a "$LOGFILE"

echo -e  "${PROMPT} ethtool virbr0 " >> "/root/dasan_Maintenance_${Date1}.txt"
ethtool virbr0 | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Vm Status Check ===================="
echo "==================== Vm Status Check ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} virsh list --all " >> "/root/dasan_Maintenance_${Date1}.txt"
virsh list --all | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo -e  "${PROMPT} ssh vm-1 date " >> "/root/dasan_Maintenance_${Date1}.txt"
ssh vm-1 date | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo -e  "${PROMPT} ssh vm-2 date " >> "/root/dasan_Maintenance_${Date1}.txt"
ssh vm-2 date | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Mount Point Check ===================="
echo "==================== Mount Point Check ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} ssh vm-1 df -h | grep -v tmpfs " >> "/root/dasan_Maintenance_${Date1}.txt"
ssh vm-1 df -h | grep -v tmpfs | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo -e  "${PROMPT} ssh vm-2 df -h | grep -v tmpfs " >> "/root/dasan_Maintenance_${Date1}.txt"
ssh vm-2 df -h | grep -v tmpfs | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Kernel Information Check ===================="
echo "==================== Kernel Information Check ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} ssh vm-1 uname -a " >> "/root/dasan_Maintenance_${Date1}.txt"
ssh vm-1 uname -a | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo -e  "${PROMPT} ssh vm-2 uname -a " >> "/root/dasan_Maintenance_${Date1}.txt"
ssh vm-2 uname -a | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo -e  "${PROMPT} ssh vm-1 cat /etc/issue " >> "/root/dasan_Maintenance_${Date1}.txt"
ssh vm-1 cat /etc/issue | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo -e  "${PROMPT} ssh vm-1 cat /etc/issue " >> "/root/dasan_Maintenance_${Date1}.txt"
ssh vm-1 cat /etc/issue | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"
