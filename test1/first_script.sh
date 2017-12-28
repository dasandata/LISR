#!/bin/bash
# Copyright (c) 2017 by Dasandata Corp.
# http://www.dasandata.co.kr
# mailto://mail@dasandata.co.kr
# run as a root
# Ver 0.1 (current)




# Prifix


# CentOS 7 lastst kernel version
CENTOS7_LAST_KERNEL="3.10.0-693.2.2.el7.x86_64"

# install package list
UBUNTU14_APT_INSTALL="vim nfs-common mailutils rdate xauth firefox gcc make locate htop tmux git wget ipmitool "
UBUNTU16_APT_INSTALL="vim nfs-common mailutils rdate xauth firefox gcc make locate htop tmux git wget ipmitool "
CENTOS7_YUM_INSTALL="vim pciutils perl openssh mlocate nfs-utils rdate xauth firefox nautilus wget tcsh tree lshw mailx tmux git \
kernel-headers kernel-devel ipmitool gcc make gcc-c++ cmake python-devel "
PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"


# Check ROOT UID 
ROOT_UID=0
if [ "${UID}" != "${ROOT_UID}" ]; then
  echo -e "\033[1;32m"### Must be a root to run this script."\033]0m"
  exit 1
fi

# Check Direcroty
RUN_DIR_1="/root"
RUN_DIR_2=$(pwd)
if [ "${RUN_DIR_1}" != "${RUN_DIR_2}" ]; then
  echo -e "\033[1;32m### Must be a root home directory (/root) to run this script.\033]0m"
  exit 1
fi

# Start
echo -e "\033[1;35m"### Dasandata Linux Install Start... "\033[0m" 
echo -e "\033[1;35m"### $(date +%Y"-"%m"-"%d" "%r) 
read -p "### Press any key to contnue...";echo

 
# Check Os Version 
# Ubuntu 14 or Ubuntu 16 or CentOS Linux release 7
### RELEASE1=$(lsb_release -d | cut -d ':' -f 2 | cut -d '.' -f 1)
RELEASE1=$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f 2)
RELEASE=$(echo ${RELEASE1} | tr -d ' ')

UBUNTU14="Ubuntu14.04LTS"
UBUNTU16="Ubuntu16.04.3LTS"
CENTOS7="CentOSLinux7(Core)"

case "${RELEASE}" in
	${UBUNTU14}) 
		CHK_OS="Ubuntu14" ;;
	${UBUNTU16}) 
		CHK_OS="Ubuntu16" ;;
	${CENTOS7}) 
		CHK_OS="CentOS7" ;;
	*)
		CHK_OS="Not-Detected" ;;
esac

if [ "${CHK_OS}" = "Not-Detected" ]; then
  echo -e "\033[1;32m"### The operating system is not detected and will be terminated."\033[0m"
  exit 1
fi

echo -e "\033[1;32m"### Is the operating system "'${CHK_OS}'" correct?"\033[0m"
read -p "(Yes/No)" CHK_OS_2
	# yes/no 판단: [Yy] 또는 [Yy][Ee][Ss], [Nn] 또는 [Nn][Oo]
	if [[ `echo $CHK_OS_2 | grep "^[Yy]$\|^[Yy][Ee][Ss]$" | wc -l` -ge 1 ]]
  	  then CHK_OS_2="yes"
	elif [[ `echo $CHK_OS_2| grep "^[Nn]$\|^[Nn][Oo]$" | wc -l` -ge 1 ]]
  	  then CHK_OS_2="no"
	else echo "### Invalid input."
	exit 1
	fi

	if [ ${CHK_OS_2} != "yes" ]; then
  	echo "### Check the OS Verstion."
  	exit 1
	fi

# 3. Install to Default Utils...
echo " "
echo -e "\033[1;32m### Install to Default Utils...\033[0m"
echo " "
sleep 1

case "${RELEASE}" in
        ${UBUNTU14}) 
        echo "### Modify apt source list to ftp.daum.net..."

	echo "perl -pi -e 's/kr.archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list"
	perl -pi -e 's/kr.archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
	echo "perl -pi -e 's/security.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list"
	perl -pi -e 's/security.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list

	echo "apt update"
	apt update

	echo "### Utils Install..."
	echo "apt -y install "${UBUNTU14_APT_INSTALL}
	apt -y install $UBUNTU14_APT_INSTALL	

	echo "### Sync Time and Date..."
	echo "rdate  -s  time.bora.net "
	rdate  -s  time.bora.net 
	echo "hwclock --systohc"
	hwclock --systohc  
	echo "date"
	date
	echo "hwclock"
	hwclock
	;;

	${UBUNTU16}) 
        echo "### Modify apt source list to ftp.daum.net..."
        
        echo "perl -pi -e 's/kr.archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list"
        perl -pi -e 's/kr.archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
        echo "perl -pi -e 's/security.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list"
        perl -pi -e 's/security.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
        
        echo "apt update"
        apt update

        echo "### Utils Install..."
        echo "apt -y install "${UBUNTU16_APT_INSTALL}
        apt -y install $UBUNTU16_APT_INSTALL         

        echo "### Sync Time and Date..."
        echo "rdate  -s  time.bora.net "
        rdate  -s  time.bora.net 
        echo "hwclock --systohc"
        hwclock --systohc  
        echo "date"
        date
        echo "hwclock"
        hwclock        
	;;

	${CENTOS7}) 

	if [[ $(uname -r) != ${CENTOS7_LAST_KERNEL}  ]]
	   then 
	   echo -e "\033[1;32m"### Current kernel version is $(uname -r)  "\033[0m"
	   echo -e "\033[1;32m"### If you are using the latest version of the kernel, "\033[0m"
	   echo -e "\033[1;32m"### run \'yum update\' and \'reboot\' then run again this script. "\033[0m"
	   echo " "
	   echo -e "\033[1;32m"### Do you want to run the \'yum update\' and \'reboot\' commands? "\033[0m"
	   read -p "(Yes/No) " KERNEL_UP
		# yes/no 판단: [Yy] 또는 [Yy][Ee][Ss], [Nn] 또는 [Nn][Oo]
		if [[ `echo $KERNEL_UP | grep "^[Yy]$\|^[Yy][Ee][Ss]$" | wc -l` -ge 1 ]]
  		then KERNEL_UP="yes"
		elif [[ `echo $KERNEL_UP| grep "^[Nn]$\|^[Nn][Oo]$" | wc -l` -ge 1 ]]
  		then KERNEL_UP="no"
		else echo "### Invalid input."
		exit 1
		fi
	   else echo "Kernel Version is $(uname -r)"
	fi

	if [ ${KERNEL_UP} == "yes" ]; then
  	echo " "
	echo -e "\033[1;34m"${PROMPT} \'yum -y -q update\' "\033[0m"
	sleep 3 
	yum -y -q update
	echo -e "\033[1;34m"${PROMPT} \'reboot\' "\033[0m"
	sleep 3
	reboot
	exit 1
	fi
	
	echo " "
	echo -e "\033[1;34m"${PROMPT} yum -y -q -e 0 install $CENTOS7_YUM_INSTALL "\033[0m"
	yum -y -q install $CENTOS7_YUM_INSTALL
	echo " "
	echo -e "\033[1;32m"### Sync Time and Date..."\033[0m"
	echo " "
	sleep 3
	echo -e "\033[1;34m"${PROMPT} rdate  -s  time.bora.net "\033[0m"
	rdate  -s  time.bora.net 
	echo -e "\033[1;34m"${PROMPT} clock --systohc"\033[0m"
	clock --systohc  
	echo -e "\033[1;34m"${PROMPT} date"\033[0m"
	date
        echo -e "\033[1;34m"${PROMPT} hwclock"\033[0m"
        hwclock
	;;

	*)
	echo "OS Dectect Error! "
	exit 1
	;;
esac

echo " "
echo -e "\033[1;32m"### End of Default Utils Install..."\033[0m"
echo " "
sleep 3

### 4. Profile, bashrc 
echo -e "\033[1;32m"### Modify - /etc/profile , .bashrc..."\033[0m"
echo " "
sleep 3

echo -e "\033[1;34m"${PROMPT} tail /etc/profile "\033[0m"
tail /etc/profile
echo " "
echo -e "\033[1;32m"### add to /etc/profile "\033[0m"
echo " " >> /etc/profile
echo " " >> /etc/profile
echo "#add by dasandata" >> /etc/profile
echo "alias vi='vim'"    >> /etc/profile
echo "alias ls='ls --color=auto'" >> /etc/profile
echo "alias ll='ls -lh'" >> /etc/profile
echo "alias grep='grep --color=auto'" >> /etc/profile
echo "#add end." >> /etc/profile
echo " "
echo -e "\033[1;34m"${PROMPT} tail /etc/profile "\033[0m"
tail /etc/profile
echo " "

echo -e "\033[1;32m"### add to /root/.bashrc  "\033[0m"
echo "export PS1='\[\e[1;41;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc
echo -e "\033[1;34m"${PROMPT} tail -1 /root/.bashrc "\033[0m"
tail -1 /root/.bashrc
echo " "

echo -e "\033[1;32m"### add to /home/user/.bashrc  "\033[0m"
echo "export PS1='\[\e[1;31m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/user/.bashrc
echo -e "\033[1;34m"${PROMPT} tail -1 /home/user/.bashrc "\033[0m"
tail -1 /home/user/.bashrc
echo " "

### 5. Check to Hardware Spec
echo -e "\033[1;32m"### Start to Check Hardware Spec.... "\033[0m"
echo " "
sleep 5
echo " "
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
sleep 3 

### 10. Check to IP and HOSTNAME 
echo -e  "\033[1;32m"### Check to IP and HOSTNAME... "\033[0m"
sleep 3
echo " "

echo -e "\033[1;34m"${PROMPT} ip a "\033[0m"
ip a
echo " "
case "${RELEASE}" in
        ${CENTOS7})
	read -p "Typeing to Interface Name (ex: em1, em2, ens192, p2p1, etc....) " EMX
	echo -e "\033[1;34m"${PROMPT} cat /etc/sysconfig/network-scripts/ifcfg-${EMX} "\033[0m"
	cat /etc/sysconfig/network-scripts/ifcfg-${EMX}
	echo -e "\033[1;34m"${PROMPT} cat /etc/hostname "\033[0m"
	cat /etc/hostname
	echo -e "\033[1;34m"${PROMPT} cat /etc/resolv.conf "\033[0m" 
	cat /etc/resolv.conf
	echo -e "\033[1;34m"${PROMPT} ping -c 4 google.com "\033[0m" 
	ping -c 4 google.com
	echo " "
	;;
 
	${UBUNTU16})
        echo -e "\033[1;34m"${PROMPT} cat /etc/network/interfaces "\033[0m"
        cat /etc/network/interfaces
        echo -e "\033[1;34m"${PROMPT} cat /etc/hostname "\033[0m"
        cat /etc/hostname
        echo -e "\033[1;34m"${PROMPT} cat /etc/resolv.conf "\033[0m" 
        cat /etc/resolv.conf
        echo -e "\033[1;34m"${PROMPT} ping -c 4 google.com "\033[0m" 
        ping -c 4 google.com
        echo " "
        ;;

        ${UBUNTU14})
        echo -e "\033[1;34m"${PROMPT} cat /etc/network/interfaces "\033[0m"
        cat /etc/network/interfaces
        echo -e "\033[1;34m"${PROMPT} cat /etc/hostname "\033[0m"
        cat /etc/hostname
        echo -e "\033[1;34m"${PROMPT} cat /etc/resolv.conf "\033[0m" 
        cat /etc/resolv.conf
        echo -e "\033[1;34m"${PROMPT} ping -c 4 google.com "\033[0m" 
        ping -c 4 google.com
        echo " "
        ;; 

        *)
        echo "OS Dectect Error! "
        exit 1
        ;;
esac

### 11. grub , ipv6, selinux

echo -e  "\033[1;32m"### Modifiy grub \(Display Boot Log, ipv6 disable... Selinux Disable...\)  "\033[0m"
sleep 3
echo " "

case "${RELEASE}" in
        ${CENTOS7})

	echo -e "\033[1;34m"${PROMPT} cat /etc/default/grub "\033[0m" 
	cat /etc/default/grub
	echo -e "\033[1;34m"${PROMPT} perl -pi -e  \'s/rhgb//\'   /etc/default/grub "\033[0m" 
	perl -pi -e  's/rhgb//'   /etc/default/grub
	echo -e "\033[1;34m"${PROMPT} perl -pi -e  \'s/quiet//\'  /etc/default/grub  "\033[0m" 
	perl -pi -e  's/quiet//'  /etc/default/grub 
	echo -e "\033[1;34m"${PROMPT} perl -pi -e  \'s/GRUB_CMDLINE_LINUX=\"/GRUB_CMDLINE_LINUX=\"ipv6.disable=1 /\' /etc/default/grub "\033[0m" 
	perl -pi -e  's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /' /etc/default/grub 
	echo -e "\033[1;34m"${PROMPT} cat /etc/default/grub "\033[0m" 
	cat /etc/default/grub 
	echo -e "\033[1;34m"${PROMPT} grub2-mkconfig -o /boot/grub2/grub.cfg   "\033[0m" 
	grub2-mkconfig -o /boot/grub2/grub.cfg  
	echo " "
	sleep 3
	
	echo -e "\033[1;34m"${PROMPT} getenforce "\033[0m" 
	getenforce
	echo -e "\033[1;34m"${PROMPT} setenforce 0 "\033[0m" 
	setenforce 0
	echo -e "\033[1;34m"${PROMPT} getenforce "\033[0m" 
	getenforce
	echo -e "\033[1;34m"${PROMPT} sed -i \'s/SELINUX=enforcing/SELINUX=disabled/\' /etc/selinux/config "\033[0m" 
	sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
	echo -e "\033[1;34m"${PROMPT} cat /etc/sysconfig/selinux  "\033[0m" 
	cat /etc/sysconfig/selinux 
	echo " "
        ;;
        
        ${UBUNTU16})
	
	echo -e "\033[1;34m"${PROMPT} cat /etc/default/grub \| grep -v \'#\' "\033[0m" 
	cat /etc/default/grub | grep -v '#'
	echo -e "\033[1;34m"${PROMPT} perl -pi -e \'s/quiet//\'  /etc/default/grub "\033[0m" 
	perl -pi -e 's/quiet//'    /etc/default/grub
	echo -e "\033[1;34m"${PROMPT} perl -pi -e \'s/splash//\'   /etc/default/grub "\033[0m" 
	perl -pi -e 's/splash//' /etc/default/grub
	echo -e "\033[1;34m"${PROMPT} perl -pi -e  \'s/GRUB_CMDLINE_LINUX=\"/GRUB_CMDLINE_LINUX=\"ipv6.disable=1 /\'  /etc/default/grub "\033[0m" 
	perl -pi -e  's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /'  /etc/default/grub 
	echo -e "\033[1;34m"${PROMPT} cat /etc/default/grub \| grep -v \'#\' "\033[0m" 
	cat /etc/default/grub | grep -v '#'
	echo -e "\033[1;34m"${PROMPT} update-initramfs -u \&\& update-grub2 "\033[0m" 
	update-initramfs -u && update-grub2 
        echo " "
        ;;
 
        ${UBUNTU14})

        echo -e "\033[1;34m"${PROMPT} cat /etc/default/grub \| grep -v \'#\' "\033[0m" 
        cat /etc/default/grub | grep -v '#'
        echo -e "\033[1;34m"${PROMPT} perl -pi -e \'s/quiet//\'  /etc/default/grub "\033[0m" 
        perl -pi -e 's/quiet//'    /etc/default/grub
        echo -e "\033[1;34m"${PROMPT} perl -pi -e \'s/splash//\'   /etc/default/grub "\033[0m" 
        perl -pi -e 's/splash//' /etc/default/grub
        echo -e "\033[1;34m"${PROMPT} perl -pi -e  \'s/GRUB_CMDLINE_LINUX=\"/GRUB_CMDLINE_LINUX=\"ipv6.disable=1 /\'  /etc/default/grub "\033[0m" 
        perl -pi -e  's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /'  /etc/default/grub 
        echo -e "\033[1;34m"${PROMPT} cat /etc/default/grub \| grep -v \'#\' "\033[0m" 
        cat /etc/default/grub | grep -v '#'
        echo -e "\033[1;34m"${PROMPT} update-initramfs -u \&\& update-grub2 "\033[0m" 
        update-initramfs -u && update-grub2 
        echo " "
        ;;

        *)
        echo "OS Dectect Error! "
        exit 1
        ;;
esac

echo -e "\033[1;34m"${PROMPT}  "\033[0m" 





### Sample


case "${RELEASE}" in
        ${CENTOS7})



        echo " "
        ;;  
            
        ${UBUNTU16})



        echo " "
        ;;  
 
        ${UBUNTU14})


        echo " "
        ;;  

        *)  
        echo "OS Dectect Error! "
        exit 1
        ;;  
esac

echo -e "\033[1;34m"${PROMPT}  "\033[0m" 






echo " "
echo -e "\033[1;35m"###### end "\033[0m"
