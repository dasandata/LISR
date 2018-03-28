#!/bin/bash
### Check to Hardware Spec

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e "\033[1;32m"### Start to Check Hardware Spec.... "\033[0m"
echo " "
echo -e  "\033[1;32m"=== System ==="\033[0m"
echo -e  "\033[1;34m${PROMPT} dmidecode --type system | grep -v \"^$\|#\|SMBIOS\|Handle\|Not\" \033[0m"
dmidecode --type system | grep -v "^$\|#\|SMBIOS\|Handle\|Not"

echo " "
echo -e  "\033[1;32m"=== CPU ==="\033[0m"
echo -e  "\033[1;34m${PROMPT} lscpu | grep -v \"Flags\|NUMA\"  \033[0m"
lscpu | grep -v "Flags\|NUMA"

echo " "
echo -e  "\033[1;34m${PROMPT} cat /proc/cpuinfo | head \033[0m"
cat /proc/cpuinfo | head

echo " "
echo -e  "\033[1;32m"=== Memory Device ==="\033[0m"
echo -e "\033[1;34m${PROMPT} dmidecode --type 16 | grep -v \"dmidecode\|SMBIOS\|Handle\" \033[0m"
dmidecode --type 16 | grep -v "dmidecode\|SMBIOS\|Handle"

echo " "
echo -e "\033[1;34m${PROMPT} dmidecode --type memory | grep \"Number Of Devices\|Size\|Locator\|Clock\|DDR\|Rank\" | grep -v \"No\|Unknown\"  \033[0m"
dmidecode --type memory | grep "Number Of Devices\|Size\|Locator\|Clock\|DDR\|Rank" | grep -v "No\|Unknown"

echo " "
echo -e "\033[1;34m${PROMPT} dmidecode --type memory  | grep Size | grep -v No | wc -l \033[0m"
dmidecode --type memory  | grep Size | grep -v No | wc -l

echo " "
echo -e "\033[1;34m${PROMPT} dmidecode --type memory  | grep Size | grep -v No | grep -c GB \033[0m"
dmidecode --type memory  | grep Size | grep -v No | grep -c GB

echo " "
echo -e "\033[1;34m${PROMPT} cat /proc/meminfo | grep MemTotal \033[0m"
cat /proc/meminfo | grep MemTotal

echo " "
echo -e "\033[1;34m"${PROMPT} free -m "\033[0m"
free -m

echo " "
echo -e "\033[1;34m"${PROMPT} free -h "\033[0m"
free -h

echo " "
echo -e  "\033[1;32m"=== Pci Device ==="\033[0m"
echo -e "\033[1;34m"${PROMPT} lspci \| grep -i vga "\033[0m"
lspci | grep -i vga

echo " "
echo -e "\033[1;34m"${PROMPT} lspci \| grep -i nvidia "\033[0m"
lspci | grep -i nvidia

echo " "
echo -e "\033[1;34m"${PROMPT} lspci \| grep -i raid "\033[0m"
lspci | grep -i raid

echo " "
echo -e "\033[1;34m"${PROMPT} dmidecode \| grep NIC "\033[0m"
dmidecode | grep NIC

echo " "
echo -e "\033[1;34m"${PROMPT} lspci \| grep -i communication "\033[0m"
lspci | grep -i communication

echo " "
echo -e "\033[1;34m"${PROMPT} dmesg \| grep NIC "\033[0m"
dmesg | grep NIC

echo " "
echo -e  "\033[1;32m"=== Power Supply ==="\033[0m"
echo -e "\033[1;34m"${PROMPT} dmidecode --type 39  \| grep \"System\|Name:\|Capacity\"  "\033[0m"
dmidecode --type 39  | grep "System\|Name:\|Capacity"

echo " "
echo -e  "\033[1;32m"=== Disk "&" Partition ==="\033[0m"
echo -e "\033[1;34m"${PROMPT} lsblk "\033[0m"
lsblk

echo " "
echo -e "\033[1;34m"${PROMPT} blkid "\033[0m"
blkid

echo " "
echo -e "\033[1;34m"${PROMPT} cat /etc/fstab \| grep -v \"#\|^$\" "\033[0m"
cat /etc/fstab | grep -v "#\|^$"

echo " "
echo -e "\033[1;34m"${PROMPT} df -hT \| grep -v tmpfs "\033[0m"
df -hT | grep -v tmpfs

echo " "
echo -e  "\033[1;32m"=== O/S ==="\033[0m"
echo -e "\033[1;34m"${PROMPT} cat /etc/*-release "\033[0m"
cat /etc/*-release

echo " "
echo -e "\033[1;34m"${PROMPT} uname -a "\033[0m"
uname -a

echo " "
echo -e  "\033[1;32m"=== END / 하드웨어 사양 확인 끝 ==="\033[0m"
echo " "

# End of file.
