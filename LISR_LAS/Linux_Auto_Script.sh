#!/bin/sh
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr

# 기본 버전 설치 진행 순서
# 1. 변수 선언
# 2. rc.local 생성 및 변경
# 3. nouveau 끄기 및 grub 설정
# 4. selinux 제거 및 저장소 변경
# 5. 기본 패키지 설치
# 6. 프로필 설정
# 7. 서버 시간 동기화
# 8. 파이썬 설치
# 9. 파이썬 패키지 설치
# 10. 방화벽 설정
# 11. 사용자 생성 테스트
# 12. H/W 사양 체크

# GPU 버전 설치 진행 순서
# 13. CUDA,CUDNN Repo 설치
# 14. CUDA 설치 및 PATH 설정
# 15. CUDNN 설치 및 PATH 설정
# 16. 딥러닝 패키지 설치(R,R Server, JupyterHub, Pycharm)

# 서버 전용 설치 진행 순서 
# 17. 서버 전용 MSM 설치

# Dell 서버 전용 설치 순서
# 18. Mailutils
# 19. Dell 전용 OMSA설치
# 20. 서버 온도 기록 수집

# 1. 변수 선언
## Dell or Supermicro 확인
VENDOR=$(dmidecode | grep -i manufacturer | awk '{print$2}' | head -1)
## Network Interface
NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2 | tr -d ' ')
## centos, ubuntu 구별 변수 선언
OSCHECK=$(cat /etc/os-release | head -1 | cut -d "=" -f 2 | tr -d "\"" | awk '{print$1}' | tr '[A-Z]' '[a-z]')

## 고객사 정보 입력 후 파일에 저장
ls /root/customername.txt &> /dev/null
if [ $? != 0 ]
then
  echo "Customer Name?" | tee -a /root/install_log.txt
  read customername
  echo "Customer Name : $customername " | tee -a /root/install_log.txt
  echo $customername >> /root/customername.txt
else
  echo "" | tee -a /root/install_log.txt
  echo "Customer Name is already" | tee -a /root/install_log.txt
fi

echo ""

## CUDA 버전 선택 후 파일에 저장
ls /root/cudaversion.txt &> /dev/null
if [ $? != 0 ]
then
  echo "CUDA Version Select" | tee -a /root/install_log.txt
  case $OSCHECK in 
    centos )
      OS=$(cat /etc/redhat-release | awk '{print$1,$4}' | cut -d "." -f 1 | tr -d " " | tr '[A-Z]' '[a-z]')
      if [ $OS = "centos8" ]
      then
        select cudav in 10-2 11-0 11-1 No-GPU; do echo "Select CUDA Version : $cudav" ; break; done
        echo $cudav >> /root/cudaversion.txt
      else
        select cudav in 10-0 10-1 10-2 11-0 No-GPU; do echo "Select CUDA Version : $cudav" ; break; done
        echo $cudav >> /root/cudaversion.txt
      fi
      echo "" | tee -a /root/install_log.txt
      echo "Cuda Version Select complete" | tee -a /root/install_log.txt
    ;;
    ubuntu )
      OS=$(lsb_release -isr |  tr -d "." | sed -e '{N;s/\n//}' | tr '[A-Z]' '[a-z]')
      if [ $OS = "ubuntu2004" ]
      then
        select cudav in 11-0 11-1 11-2 No-GPU; do echo "Select CUDA Version : $cudav" ; break; done
        echo $cudav >> /root/cudaversion.txt
      else
        select cudav in 10-0 10-1 10-2 11-0 No-GPU; do echo "Select CUDA Version : $cudav" ; break; done
        echo $cudav >> /root/cudaversion.txt
      fi
      echo "" | tee -a /root/install_log.txt
      echo "Cuda Version Select complete" | tee -a /root/install_log.txt
    ;;
    *)
    ;;
  esac
else
  echo "" | tee -a /root/install_log.txt
  echo "CUDA Version select is already" | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 2. rc.local 생성 및 변경
ls /root/log_err.txt &> /dev/null
if [ $? != 0 ]
then
  ## 에러를 저장할 파일 생성
  touch /root/log.txt
  touch /root/log_err.txt
  echo "" | tee -a /root/install_log.txt
  echo "rc.local Setting start" | tee -a /root/install_log.txt
  case $OSCHECK in
    centos )
      ## centos는 이미 rc.local이 존재하여 실행될 파일값만 넣어준다.
      chmod +x /etc/rc.d/rc.local
      sed -i '12a bash /root/LISR/LISR_LAS/Dasan_Auto_Script.sh' /etc/rc.d/rc.local
      echo "" | tee -a /root/install_log.txt
      echo "rc.local setting complete" | tee -a /root/install_log.txt
    ;;
    ubuntu )
      OS=$(lsb_release -isr |  tr -d "." | sed -e '{N;s/\n//}' | tr '[A-Z]' '[a-z]')
      sleep 3
      ## Ubuntu16만 이미 rc.local이 존재하여 나눠서 작업
      if [ $OS = "ubuntu1604" ]
      then
        sed -i '13a bash /root/LISR/LISR_LAS/Dasan_Auto_Script.sh' /etc/rc.local
      else
        echo -e  '#!/bin/sh -e \nexit 0' | tee -a /etc/rc.local
        chmod +x /etc/rc.local
        systemctl restart rc-local.service >> /root/log.txt 2> /root/log_err.txt
        systemctl status rc-local.service >> /root/log.txt 2> /root/log_err.txt
        sed -i '1a bash /root/LISR/LISR_LAS/Dasan_Auto_Script.sh' /etc/rc.local
        echo "" | tee -a /root/install_log.txt
        echo "rc.local setting complete" | tee -a /root/install_log.txt
      fi
    ;;
    *)
    ;;
  esac
else
  echo "" | tee -a /root/install_log.txt
  echo "The rc.local file already exists." | tee -a /root/install_log.txt
fi


echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 3. nouveau 끄기 및 grub 설정
cat /etc/default/grub | grep quiet &> /dev/null
if [ $? = 0 ]
then
  echo "" | tee -a /root/install_log.txt
  echo "Nouveau Disable and Grub Settings Start." | tee -a /root/install_log.txt
  case $OSCHECK in
    centos )
      echo "" | tee -a /root/install_log.txt
      echo "CentOS Grub Setting Start." | tee -a /root/install_log.txt
      sed -i  's/rhgb//'   /etc/default/grub
      sed -i  's/quiet//'  /etc/default/grub
      sed -i  's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /' /etc/default/grub
      echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
      echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist.conf
      dracut  -f >> /root/log.txt 2> /root/log_err.txt
      grub2-mkconfig -o /boot/grub2/grub.cfg >> /root/log.txt 2> /root/log_err.txt
      grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "Nouveau and Grub Setting complete" | tee -a /root/install_log.txt
    ;;
    ubuntu )
      OS=$(lsb_release -isr |  tr -d "." | sed -e '{N;s/\n//}' | tr '[A-Z]' '[a-z]')
      echo "" | tee -a /root/install_log.txt
      echo "$OS Grub Setting Start." | tee -a /root/install_log.txt
      systemctl set-default  multi-user.target >> /root/log.txt 2> /root/log_err.txt
      echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
      echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist.conf
      perl -pi -e 's/splash//' /etc/default/grub
      perl -pi -e 's/quiet//'  /etc/default/grub
      perl -pi -e  's/^GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /'  /etc/default/grub
      perl -pi -e  's/^GRUB_HIDDEN_TIMEOUT=/#GRUB_HIDDEN_TIMEOUT=/'  /etc/default/grub
      update-initramfs -u && update-grub2 >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "Nouveau and Grub Setting complete" | tee -a /root/install_log.txt
    ;;
    *)
      echo "" | tee -a /root/install_log.txt
    ;;
  esac
else
  echo "" | tee -a /root/install_log.txt
  echo "Nouveau Disable and Grub Settings has already been complete." | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 4. selinux 제거 및 저장소 변경
case $OSCHECK in
  centos )
    OS=$(cat /etc/redhat-release | awk '{print$1,$4}' | cut -d "." -f 1 | tr -d " " | tr '[A-Z]' '[a-z]')
    echo "" | tee -a /root/install_log.txt
    echo "OS is $OS" | tee -a /root/install_log.txt
    ## SELINUX Disabled 작업
    SELINUX=$(getenforce)
    if [ $SELINUX = "Disabled" ]
    then
      echo "" | tee -a /root/install_log.txt
      echo "SELINUX is already turned off." | tee -a /root/install_log.txt
    else
      echo "" | tee -a /root/install_log.txt
      echo "Changed SELINUX to disabled." | tee -a /root/install_log.txt
      setenforce 0
      sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
      sed -i '/IPV6/d' /etc/sysconfig/network-scripts/ifcfg-${NIC}
    fi
  ;;
  ubuntu )
    OS=$(lsb_release -isr |  tr -d "." | sed -e '{N;s/\n//}' | tr '[A-Z]' '[a-z]')
    echo "" | tee -a /root/install_log.txt
    echo "OS is $OS" | tee -a /root/install_log.txt
    ## Repository를 mirror.kakao.com으로 변경
    REPO=$(awk 'NR == 8 {print$2}' /etc/apt/sources.list)
    if [ $REPO = "http://mirror.kakao.com/ubuntu/" ]
    then
      echo "" | tee -a /root/install_log.txt
      echo "The Repository has been changed." | tee -a /root/install_log.txt
    else
      echo "" | tee -a /root/install_log.txt
      echo "Repository Change" | tee -a /root/install_log.txt
      perl -pi -e 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
      perl -pi -e 's//security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
    fi
  ;;
  *)
    echo "" | tee -a /root/install_log.txt
    echo "OS Check is Failed" | tee -a /root/install_log.txt
  ;;
esac

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 5. 기본 패키지 설치
case $OS in
  centos7 )
    echo "" | tee -a /root/install_log.txt
    echo "$OS Package Install" | tee -a /root/install_log.txt
    ## Package 설치를 ipmi 여부로 Server와 PC를 나눠서 진행
    rpm -qa | grep -i epel &> /dev/null
    if [ $? != 0 ]
    then
      yum -y update >> /root/log.txt 2> /root/log_err.txt
      yum -y  install epel-release >> /root/log.txt 2> /root/log_err.txt
      yum install -y vim pciutils openssh mlocate nfs-utils rdate xauth firefox nautilus wget ifconfig >> /root/log.txt 2> /root/log_err.txt
      yum install -y tcsh tree lshw tmux git kernel-headers kernel-devel gcc make gcc-c++ mailx >> /root/log.txt 2> /root/log_err.txt
      yum install -y cmake python-devel ntfs-3g dstat perl perl-CPAN perl-core net-tools openssl-devel git-lfs >> /root/log.txt 2> /root/log_err.txt
      sleep 3
      dmidecode | grep -i ipmi &> /dev/null
      if [ $? = 0 ]
      then
        yum install -y ipmitool >> /root/log.txt 2> /root/log_err.txt
      else
        echo "" | tee -a /root/install_log.txt
        echo "PC,Workstation do not install ipmitool" | tee -a /root/install_log.txt
      fi
      yum -y groups install "Development Tools" >> /root/log.txt 2> /root/log_err.txt
      yum -y install  glibc-static glibc-devel libstdc++ libstdc++-devel >> /root/log.txt 2> /root/log_err.txt
      sleep 3
      sed -i -e "s/\]$/\]\npriority=5/g" /etc/yum.repos.d/epel.repo >> /root/log.txt 2> /root/log_err.txt
      yum -y  install yum-plugin-priorities >> /root/log.txt 2> /root/log_err.txt
      yum -y  install htop ntfs-3g figlet >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "The package install complete" | tee -a /root/install_log.txt
    else
      echo "" | tee -a /root/install_log.txt
      echo "The package has already been installed." | tee -a /root/install_log.txt
    fi
  ;;
  centos8 )
    echo "" | tee -a /root/install_log.txt
    echo "$OS Package Install" | tee -a /root/install_log.txt
    ## Package 설치를 ipmi 여부로 Server와 PC를 나눠서 진행 - Python도 여기서 설치됨 -
    rpm -qa | grep -i epel &> /dev/null
    if [ $? != 0 ]
    then
      dnf -y update >> /root/log.txt 2> /root/log_err.txt
      sleep 3
      dnf --refresh -y upgrade >> /root/log.txt 2> /root/log_err.txt
      systemctl disable kdump.service >> /root/log.txt 2> /root/log_err.txt
      dnf install -y epel-release >> /root/log.txt 2> /root/log_err.txt
      dnf install -y vim pciutils openssh mlocate nfs-utils xauth firefox nautilus wget >> /root/log.txt 2> /root/log_err.txt
      dnf install -y tcsh tree lshw tmux git kernel-headers kernel-devel gcc make gcc-c++ cmake smartmontools >> /root/log.txt 2> /root/log_err.txt
      dnf install -y dstat perl perl-CPAN perl-core net-tools openssl-devel snapd mailx postfix >> /root/log.txt 2> /root/log_err.txt
      sleep 3
      dmidecode | grep -i ipmi &> /dev/null
      if [ $? = 0 ]
      then
        dnf install -y ipmitool >> /root/log.txt 2> /root/log_err.txt
      else
        echo "" | tee -a /root/install_log.txt
        echo "PC,Workstation do not install ipmitool" | tee -a /root/install_log.txt
      fi
      dnf -y groups install "Development Tools" >> /root/log.txt 2> /root/log_err.txt
      dnf install -y glibc-devel libstdc++ libstdc++-devel >> /root/log.txt 2> /root/log_err.txt
      sleep 3
      dnf install -y htop ntfs-3g figlet >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "The package install complete" | tee -a /root/install_log.txt
    else
      echo "" | tee -a /root/install_log.txt
      echo "The package has already been installed." | tee -a /root/install_log.txt
    fi
  ;;
  ubuntu1604 | ubuntu1804 | ubuntu2004 )
    echo "" | tee -a /root/install_log.txt
    echo "$OS Package Install" | tee -a /root/install_log.txt
    apt-get update >> /root/log.txt 2> /root/log_err.txt
    ## Package 설치를 ipmi 여부로 Server와 PC를 나눠서 진행
    dpkg -l | grep -i ethtool &> /dev/null
    if [ $? != 0 ]
    then
      apt-get install -y vim nfs-common rdate xauth firefox gcc make locate htop tmux wget figlet >> /root/log.txt 2> /root/log_err.txt
      apt-get install -y net-tools ethtool xfsprogs ntfs-3g aptitude lvm2 dstat curl npm python >> /root/log.txt 2> /root/log_err.txt
      DEBIAN_FRONTEND=noninteractive apt-get install -y mailutils smartmontools >> /root/log.txt 2> /root/log_err.txt
      apt-get -y install ubuntu-desktop dconf-editor gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal >> /root/log.txt 2> /root/log_err.txt
      apt-get -y install libzmq3-dev libcurl4-openssl-dev libxml2-dev snapd postfix >> /root/log.txt 2> /root/log_err.txt
      sleep 3
      # 불필요한 서비스 disable
      systemctl disable cups-browsed.service >> /root/log.txt 2> /root/log_err.txt
      systemctl disable cups.service >> /root/log.txt 2> /root/log_err.txt
      systemctl disable iscsi.service >> /root/log.txt 2> /root/log_err.txt
      systemctl disable ksm.service >> /root/log.txt 2> /root/log_err.txt
      systemctl disable ksmtuned.service >> /root/log.txt 2> /root/log_err.txt
      systemctl disable libstoragemgmt.service >> /root/log.txt 2> /root/log_err.txt
      systemctl disable libvirtd.service >> /root/log.txt 2> /root/log_err.txt
      systemctl disable spice-vdagentd.service >> /root/log.txt 2> /root/log_err.txt
      systemctl disable vmtoolsd.service >> /root/log.txt 2> /root/log_err.txt
      systemctl disable ModemManager.service >> /root/log.txt 2> /root/log_err.txt
      systemctl disable bluetooth.service >> /root/log.txt 2> /root/log_err.txt
      systemctl disable NetworkManager.service >> /root/log.txt 2> /root/log_err.txt
      systemctl stop    NetworkManager.service >> /root/log.txt 2> /root/log_err.txt
      systemctl disable NetworkManager-dispatcher.service >> /root/log.txt 2> /root/log_err.txt
      systemctl disable NetworkManager-wait-online.service >> /root/log.txt 2> /root/log_err.txt
      sleep 3
      ## ipmi 여부로 PC, Server 판단
      dmidecode | grep -i ipmi &> /dev/null
      if [ $? = 0 ]
      then
        apt-get install -y ipmitool >> /root/log.txt 2> /root/log_err.txt
      else
        echo "" | tee -a /root/install_log.txt
        echo "PC,Workstation do not install ipmitool" | tee -a /root/install_log.txt
      fi
      echo "" | tee -a /root/install_log.txt
      echo "The package install complete" | tee -a /root/install_log.txt
    else
      echo "" | tee -a /root/install_log.txt
      echo "The package has already been installed." | tee -a /root/install_log.txt
    fi
  ;;
  *)
  echo "" | tee -a /root/install_log.txt
  echo "Package install has already been complete" | tee -a /root/install_log.txt
  ;;
esac

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 6. 프로필 설정 
cat /root/.bashrc | grep -i "export PS1" &> /dev/null
if [ $? != 0 ]
  then
    echo "" | tee -a /root/install_log.txt
    echo "Profile Settings Start" | tee -a /root/install_log.txt
    # 프로필 alias및 프롬프트 설정 시작
    echo " "  >> /etc/profile
    echo "# Add by Dasandata"  >>   /etc/profile
    echo "alias vi='vim' "  >>   /etc/profile
    echo "alias ls='ls --color=auto' "  >>   /etc/profile
    echo "alias ll='ls -lh' "  >>   /etc/profile
    echo "alias grep='grep --color=auto' "  >>   /etc/profile
    echo " "  >> /etc/profile
    echo "# Add Timestamp to .bash_history "  >> /etc/profile
    echo 'export HISTTIMEFORMAT="20%y/%m/%d %T "'  >> /etc/profile
    echo "export PS1='\[\e[1;46;30m\][\u@\h:\W]\\$\[\e[m\] '"  >> /root/.bashrc
    echo "export PS1='\[\e[1;47;30m\][\u@\h:\W]\\$\[\e[m\] '"  >> /home/sonic/.bashrc
    source  /etc/profile
    source  /root/.bashrc
    echo $HISTSIZE
    echo "" | tee -a /root/install_log.txt
    echo "Profile Settings complete" | tee -a /root/install_log.txt
  else
    echo "" | tee -a /root/install_log.txt
    echo "Profile settings are already set up." | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

## MOTD 진행 (CentOS7,Ubuntu16.04 제외)
cat /etc/profile | grep motd &> /dev/null
if [ $? != 0 ]
then
  case $OS in
    ubuntu1804 | ubuntu2004 | centos8 )
      echo "" | tee -a /root/install_log.txt
      echo "MOTD Settings Start" | tee -a /root/install_log.txt
      mv /root/LISR/motd/ /opt/
      chmod -R 777 /opt/motd/
      echo "#Motd add" >> /etc/profile
      echo "bash /opt/motd/motd.sh" >> /etc/profile
      echo "" | tee -a /root/install_log.txt
      echo "MOTD setting complete" | tee -a /root/install_log.txt
    ;;
    *)
      echo "" | tee -a /root/install_log.txt
      echo "MOTD is already (Ubuntu16, CentOS7 is Exclude.)" | tee -a /root/install_log.txt
    ;;
  esac
else
  echo "" | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 7. 서버 시간 동기화
if [ $OS = "centos8" ]
then
  echo "Start time setting " | tee -a /root/install_log.txt
  chronyc sources -v >> /root/log.txt 2> /root/log_err.txt
  perl -pi -e 's/pool 2.centos.pool.ntp.org iburst/server time.bora.net iburst/g' /etc/chrony.conf >> /root/log.txt 2> /root/log_err.txt
  service chronyd restart >> /root/log.txt 2> /root/log_err.txt
  timedatectl set-ntp true >> /root/log.txt 2> /root/log_err.txt
  timedatectl >> /root/log.txt 2> /root/log_err.txt
  chronyc sources -v >> /root/log.txt 2> /root/log_err.txt
  echo "" | tee -a /root/install_log.txt
  echo "Time setting completed" | tee -a /root/install_log.txt
else
  echo "Start time setting" | tee -a /root/install_log.txt
  rdate  -s  time.bora.net >> /root/log.txt 2> /root/log_err.txt
  hwclock --systohc >> /root/log.txt 2> /root/log_err.txt
  date >> /root/log.txt 2> /root/log_err.txt
  hwclock >> /root/log.txt 2> /root/log_err.txt
  echo "" | tee -a /root/install_log.txt
  echo "Time setting completed" | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 8. 파이썬 설치
pip -V &> /dev/null
if [ $? != 0 ]
then
  case $OS in
    centos7 )
      echo "" | tee -a /root/install_log.txt
      echo "Python Install" | tee -a /root/install_log.txt
      yum install -y python-devel python-setuptools python-setuptools-devel >> /root/log.txt 2> /root/log_err.txt
      curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py >> /root/log.txt 2> /root/log_err.txt
      python get-pip.py >> /root/log.txt 2> /root/log_err.txt
      yum -y install  python36  python36-devel python36-pip python36-setuptools >> /root/log.txt 2> /root/log_err.txt
      easy_install-3.6   pip >> /root/log.txt 2> /root/log_err.txt
      yum -y install   openblas* >> /root/log.txt 2> /root/log_err.txt
      pip   install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
      pip3   install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
      perl -pi -e 's/python3/python/'   /usr/local/bin/pip
      echo "" | tee -a /root/install_log.txt
      echo "Python Install complete" | tee -a /root/install_log.txt
    ;;
    centos8 )
      echo "" | tee -a /root/install_log.txt
      echo "Python Install" | tee -a /root/install_log.txt
      dnf install -y python2 python2-devel python3 python3-devel >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "Python Install complete" | tee -a /root/install_log.txt
    ;;
    ubuntu1604 )
      echo "" | tee -a /root/install_log.txt
      echo "Python Install" | tee -a /root/install_log.txt
      apt-get install -y python-dev python3-dev >> /root/log.txt 2> /root/log_err.txt
      curl -fsSL -o- https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2.7 >> /root/log.txt 2> /root/log_err.txt
      curl -fsSL -o- https://bootstrap.pypa.io/pip/3.5/get-pip.py | python3.5 >> /root/log.txt 2> /root/log_err.txt
      pip   install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
      pip3   install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "Python Install complete" | tee -a /root/install_log.txt
    ;;
    ubuntu1804 )
      echo "" | tee -a /root/install_log.txt
      echo "Python Install" | tee -a /root/install_log.txt
      apt-get install -y  python-pip python3-pip python-tk python3-tk >> /root/log.txt 2> /root/log_err.txt
      pip install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "Python Install complete" | tee -a /root/install_log.txt
    ;;
    ubuntu2004 )
      echo "" | tee -a /root/install_log.txt
      echo "Python Install" | tee -a /root/install_log.txt
      apt-get install -y python3-pip >> /root/log.txt 2> /root/log_err.txt
      add-apt-repository universe >> /root/log.txt 2> /root/log_err.txt
      apt update >> /root/log.txt 2> /root/log_err.txt
      apt list --upgradeable >> /root/log.txt 2> /root/log_err.txt
      apt install -y python2 >> /root/log.txt 2> /root/log_err.txt
      curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py >> /root/log.txt 2> /root/log_err.txt
      python2.7 get-pip.py --force-reinstall >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
      perl -pi -e 's/python3/python/'   /usr/local/bin/pip >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "Python Install complete" | tee -a /root/install_log.txt
    ;;
    *)
    ;;
  esac
else
  echo "" | tee -a /root/install_log.txt
  echo "The python has already been installed." | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 9. 파이썬 패키지 설치
pip3 list | grep tensor &> /dev/null 
if [ $? != 0 ]
then
  case $OS in
    centos7 )
      echo "" | tee -a /root/install_log.txt
      echo "Python Package Install" | tee -a /root/install_log.txt
      pip install  numpy   scipy  nose  matplotlib  pandas  keras >> /root/log.txt 2> /root/log_err.txt
      pip uninstall --yes dnspython >> /root/log.txt 2> /root/log_err.txt
      yum erase -y python-ldap pyparsing >> /root/log.txt 2> /root/log_err.txt
      pip3 install  numpy   scipy  nose  matplotlib  pandas  keras >> /root/log.txt 2> /root/log_err.txt
      pip install --upgrade setuptools >> /root/log.txt 2> /root/log_err.txt
      rm -rf /usr/share/doc/python-enum34-1.0.4* >> /root/log.txt 2> /root/log_err.txt
      rm -rf /usr/lib/python2.7/site-packages/enum34-1.0.4-py2.7.egg-info >> /root/log.txt 2> /root/log_err.txt
      pip install  --upgrade tensorflow-gpu==1.13.1 >> /root/log.txt 2> /root/log_err.txt
      pip install --upgrade setuptools >> /root/log.txt 2> /root/log_err.txt
      pip3 install  --upgrade tensorflow-gpu==1.13.1 >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade setuptools >> /root/log.txt 2> /root/log_err.txt
      pip install torch torchvision >> /root/log.txt 2> /root/log_err.txt
      pip3 install torch torchvision >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade optimuspyspark >> /root/log.txt 2> /root/log_err.txt
      pip3 uninstall --yes tensorflow >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade jupyterhub >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade notebook >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "Python Package Install complete" | tee -a /root/install_log.txt
    ;;
    centos8 )
      echo "" | tee -a /root/install_log.txt
      echo "Python Package Install" | tee -a /root/install_log.txt
      pip2 install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
      pip2 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow-gpu >> /root/log.txt 2> /root/log_err.txt
      pip2 install --upgrade setuptools >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow-gpu >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade python-dateutil >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade jupyterhub notebook flask >> /root/log.txt 2> /root/log_err.txt
      perl -pi -e 's/python3.6/python2.7/'   /usr/local/bin/pip 
      cp /usr/local/lib/python3.6/site-packages/six.py /usr/lib/python3.6/site-packages/ >> /root/log.txt 2> /root/log_err.txt
      # systemctl daemon이 다시 켜지지 않는 원인으로 아래 명령어 실행
      kill -TERM 1
      echo "" | tee -a /root/install_log.txt
      echo "Python Package Install complete" | tee -a /root/install_log.txt
    ;;
    ubuntu1604 | ubuntu1804 )
      echo "" | tee -a /root/install_log.txt
      echo "Python Package Install" | tee -a /root/install_log.txt
      pip install  numpy   scipy  nose  matplotlib  pandas  keras >> /root/log.txt 2> /root/log_err.txt
      pip3 install  numpy   scipy  nose  matplotlib  pandas  keras >> /root/log.txt 2> /root/log_err.txt
      pip install  --upgrade tensorflow-gpu==1.13.1 >> /root/log.txt 2> /root/log_err.txt
      pip3 install  --upgrade tensorflow-gpu==1.13.1 >> /root/log.txt 2> /root/log_err.txt
      if [ $OS = "ubuntu1604" ]
      then
        pip install  --upgrade setuptools >> /root/log.txt 2> /root/log_err.txt
        pip3 install  --upgrade setuptools >> /root/log.txt 2> /root/log_err.txt
      else
        echo "" | tee -a /root/install_log.txt
        pip3 install --upgrade cryptography==3.3.2 >> /root/log.txt 2> /root/log_err.txt
      fi
      pip3 install --upgrade optimuspyspark  >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade testresources >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade jupyterhub >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade notebook >> /root/log.txt 2> /root/log_err.txt
      pip install torch torchvision >> /root/log.txt 2> /root/log_err.txt
      pip3 install torch torchvision >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "Python Package Install complete" | tee -a /root/install_log.txt
    ;;
    ubuntu2004 )
      echo "" | tee -a /root/install_log.txt
      echo "Python Package Install"
      pip install --upgrade numpy scipy  nose  matplotlib  pandas  keras tensorflow-gpu >> /root/log.txt 2> /root/log_err.txt
      pip install scipy==1.2.2 >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow-gpu >> /root/log.txt 2> /root/log_err.txt
      pip3 install numpy==1.16.0 h5py==2.10.0 cryptography==3.3.2 >> /root/log.txt 2> /root/log_err.txt
      pip install --upgrade torch torchvision  >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade torch torchvision >> /root/log.txt 2> /root/log_err.txt
      pip3 install --upgrade jupyterhub notebook >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "Python Package Install complete" | tee -a /root/install_log.txt
    ;;
    *)
    ;;
  esac
else
  echo "" | tee -a /root/install_log.txt
  echo "Python Package has been installed." | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 10. 방화벽 설정
case $OS in
  centos7 | centos8 )
    systemctl status firewalld | grep inactive &> /dev/null
    if [ $? != 0 ]
    then
      echo "" | tee -a /root/install_log.txt
      echo "Firewall Settings" | tee -a /root/install_log.txt
      firewall-cmd --get-zones >> /root/log.txt 2> /root/log_err.txt
      firewall-cmd --list-all >> /root/log.txt 2> /root/log_err.txt
      firewall-cmd --get-default-zone >> /root/log.txt 2> /root/log_err.txt
      firewall-cmd --change-interface=${NIC} --zone=external --permanent >> /root/log.txt 2> /root/log_err.txt
      firewall-cmd --set-default-zone=external >> /root/log.txt 2> /root/log_err.txt
      firewall-cmd --reload >> /root/log.txt 2> /root/log_err.txt
      firewall-cmd --add-port=7777/tcp --zone=external --permanent >> /root/log.txt 2> /root/log_err.txt
      ## R Server Port
      firewall-cmd --add-port=8787/tcp --zone=external --permanent >> /root/log.txt 2> /root/log_err.txt
      ## jupyterHub Port
      firewall-cmd --add-port=8000/tcp --zone=external --permanent >> /root/log.txt 2> /root/log_err.txt
      firewall-cmd --remove-service=ssh --zone=external --permanent >> /root/log.txt 2> /root/log_err.txt
      firewall-cmd --reload >> /root/log.txt 2> /root/log_err.txt
      sed -i  "s/#Port 22/Port 7777/g" /etc/ssh/sshd_config
      sed -i  "s/#PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config
      echo "AddressFamily inet" >> /etc/ssh/sshd_config
      systemctl restart sshd >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "Firewall setting complete" | tee -a /root/install_log.txt
    else
      echo "" | tee -a /root/install_log.txt
      echo "The Firewall has already been started." | tee -a /root/install_log.txt
    fi
  ;;
  ubuntu1604 | ubuntu1804 | ubuntu2004 )
    ufw status | grep inactive &> /dev/null
    if [ $? = 0 ]
    then
      echo "" | tee -a /root/install_log.txt
      echo "Firewall Settings" | tee -a /root/install_log.txt
      systemctl start ufw >> /root/log.txt 2> /root/log_err.txt
      systemctl enable ufw >> /root/log.txt 2> /root/log_err.txt
      yes | ufw enable >> /root/log.txt 2> /root/log_err.txt
      ufw default deny >> /root/log.txt 2> /root/log_err.txt
      ufw allow 22/tcp  >> /root/log.txt 2> /root/log_err.txt
      ufw allow 7777/tcp  >> /root/log.txt 2> /root/log_err.txt
      ## R Server port
      ufw allow 8787/tcp  >> /root/log.txt 2> /root/log_err.txt
      ## JupyterHub port
      ufw allow 8000/tcp >> /root/log.txt 2> /root/log_err.txt
      ## Pycharm port
      ufw allow 5900/tcp >> /root/log.txt 2> /root/log_err.txt
      if [ $OS = "ubuntu1604" ]
      then
        perl -pi -e "s/Port 22/Port 7777/g" /etc/ssh/sshd_config
      else
        echo "" | tee -a /root/install_log.txt
      fi
      perl -pi -e "s/#Port 22/Port 7777/g" /etc/ssh/sshd_config
      perl -pi -e "s/PermitRootLogin prohibit-password/PermitRootLogin no/g" /etc/ssh/sshd_config
      echo "AddressFamily inet" >> /etc/ssh/sshd_config
      systemctl restart sshd >> /root/log.txt 2> /root/log_err.txt
    else
      echo "" | tee -a /root/install_log.txt
      echo "The Firewall has already been started." | tee -a /root/install_log.txt
    fi
  ;;
  *)
    echo "" | tee -a /root/install_log.txt
  ;;
esac

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 11. 사용자 생성 테스트
ls /home/ | grep -i dasan &> /dev/null
if [ $? != 0 ]
then
  case $OS in
    centos7 | centos8 )
      echo "" | tee -a /root/install_log.txt
      echo "User Add Start" | tee -a /root/install_log.txt
      useradd dasan >> /root/log.txt 2> /root/log_err.txt
      usermod -aG wheel dasan >> /root/log.txt 2> /root/log_err.txt
    ;;
    ubuntu1604 | ubuntu1804 | ubuntu2004 )
      echo "" | tee -a /root/install_log.txt
      echo "User add Start" | tee -a /root/install_log.txt
      adduser --disabled-login --gecos "" dasan >> /root/log.txt 2> /root/log_err.txt
      usermod -G sudo dasan >> /root/log.txt 2> /root/log_err.txt
    ;;
    *)
    ;;
  esac
else
  echo "" | tee -a /root/install_log.txt
  echo "User add has already been complete." | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 12. H/W 사양 체크
cat /root/hwcheck.txt &> /dev/null
if [ $? != 0 ]
then
  echo "H/W Check Start" | tee -a /root/install_log.txt
  touch /root/hwcheck.txt
  echo "========== H/W Check Start =============" >> /root/hwcheck.txt
  echo === System === >> /root/hwcheck.txt
  dmidecode --type system | grep -v "^$\|#\|SMBIOS\|Handle\|Not" >> /root/hwcheck.txt
  echo === CPU === >> /root/hwcheck.txt
  lscpu | grep -v "Flags\|NUMA" >> /root/hwcheck.txt
  echo === Memory Devices === >> /root/hwcheck.txt
  dmidecode --type 16 | grep -v "dmidecode\|SMBIOS\|Handle" >> /root/hwcheck.txt
  dmidecode --type memory | grep "Number Of Devices\|Size\|Locator\|Clock\|DDR\|Rank" | grep -v "No\|Unknown" >> /root/hwcheck.txt
  cat /proc/meminfo | grep MemTotal >> /root/hwcheck.txt
  free -h >> /root/hwcheck.txt
  echo === PCIe === >> /root/hwcheck.txt
  lspci | grep -i vga >> /root/hwcheck.txt
  lspci | grep -i nvidia >> /root/hwcheck.txt
  dmidecode | grep NIC >> /root/hwcheck.txt
  lspci | grep -i communication >> /root/hwcheck.txt
  dmesg | grep NIC >> /root/hwcheck.txt
  echo === Power Supply === >> /root/hwcheck.txt
  dmidecode --type 39  | grep "System\|Name:\|Capacity" >> /root/hwcheck.txt
  echo "=== Disk & Partition ===" >> /root/hwcheck.txt
  blkid >> /root/hwcheck.txt
  echo "=== OS release & kernel ===" >> /root/hwcheck.txt
  uname -a >> /root/hwcheck.txt
  echo "========== H/W Check Complete =============" >> /root/hwcheck.txt
  echo "" | tee -a /root/install_log.txt
  echo "H/W Check Complete" | tee -a /root/install_log.txt
else
  echo "" | tee -a /root/install_log.txt
  echo "H/W check has already been completed." | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

## CPU 버전 PC, Server 여기까지 (Dell 서버만 뒤에 메일 설정 진행)
lspci | grep -i nvidia &> /dev/null
if [ $? != 0 ]
then
  echo "" | tee -a /root/install_log.txt
  echo "Complete basic setup" | tee -a /root/install_log.txt
  case $OS in
    centos7 | centos8 )
      dmidecode | grep -i ipmi &> /dev/null
      if [ $? != 0 ]
      then
        echo "" | tee -a /root/install_log.txt
        echo "End of PC,Work CPU version " | tee -a /root/install_log.txt
        sed -i '/root/d' /etc/rc.d/rc.local
        systemctl set-default graphical.target >> /root/log.txt 2> /root/log_err.txt
        reboot
      else
        echo "" | tee -a /root/install_log.txt
        echo "The server continues." | tee -a /root/install_log.txt
        cat /root/nvidia.txt &> /dev/null
        if [ $? != 0 ]
        then
          touch /root/nvidia.txt
          reboot
        else
          echo "" | tee -a /root/install_log.txt
        fi
      fi
    ;;
    ubuntu1604 | ubuntu1804 | ubuntu2004 )
      dmidecode | grep -i ipmi &> /dev/null
      if [ $? != 0 ]
      then
        echo "" | tee -a /root/install_log.txt
        echo "End of PC,Work CPU version " | tee -a /root/install_log.txt
        sed -i '/root/d' /etc/rc.local
        systemctl set-default graphical.target >> /root/log.txt 2> /root/log_err.txt
        reboot
      else
        echo "" | tee -a /root/install_log.txt
        echo "The server continues." | tee -a /root/install_log.txt
        cat /root/nvidia.txt &> /dev/null
        if [ $? != 0 ]
        then
          touch /root/nvidia.txt
          reboot
        else
          echo "" | tee -a /root/install_log.txt
        fi
      fi
    ;;
    *)
    ;;
  esac
else
  echo "" | tee -a /root/install_log.txt
  echo "GPU Settings Start." | tee -a /root/install_log.txt
  cat /root/nvidia.txt &> /dev/null
  if [ $? != 0 ]
  then
    touch /root/nvidia.txt
    reboot
  else
    echo "" | tee -a /root/install_log.txt
  fi
fi

## 모든 서버는 MSM 설치가 필요하며 Dell의 경우 OMSA까지 추가로 필요하기 때문에 GPU 설치는 건너 뜁니다. 
lspci | grep -i nvidia &> /dev/null
if [ $? != 0 ]
then
  OS="Skip this server as it has no GPU."
else
  echo ""
fi

# 13. CUDA,CUDNN Repo 설치
cat /etc/profile | grep cuda &> /dev/null
if [ $? != 0 ]
then
  case $OS in
    centos7 )
      echo "" | tee -a /root/install_log.txt
      echo "CUDA,CUDNN REPO install Start" | tee -a /root/install_log.txt
      wget http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-10.0.130-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
      wget https://developer.download.nvidia.com/compute/machine-learning/repos/rhel7/x86_64/nvidia-machine-learning-repo-rhel7-1.0.0-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
      yum -y install nvidia-machine-learning-repo-rhel7-1.0.0-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
      yum -y install cuda-repo-rhel7-10.0.130-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
      yum --disablerepo="*" --enablerepo="cuda" list available >> /root/log.txt 2> /root/log_err.txt
      yum -y install  libXi-devel mesa-libGLU-devel libXmu-devel libX11-devel freeglut-devel libXm* >> /root/log.txt 2> /root/log_err.txt
      yum -y install openmotif* >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "CUDA,CUDNN REPO install complete" | tee -a /root/install_log.txt
    ;;
    centos8 )
      echo "" | tee -a /root/install_log.txt
      echo "CUDA,CUDNN REPO install Start" | tee -a /root/install_log.txt
      wget http://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-repo-rhel8-10.2.89-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
      wget https://developer.download.nvidia.com/compute/machine-learning/repos/rhel8/x86_64/nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
      dnf install -y nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
      dnf install -y cuda-repo-rhel8-10.2.89-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
      dnf install -y libXi-devel mesa-libGLU-devel libXmu-devel libX11-devel freeglut-devel libXm* >> /root/log.txt 2> /root/log_err.txt
      dnf install -y openmotif* >> /root/log.txt 2> /root/log_err.txt
      dnf --disablerepo="*" --enablerepo="cuda" list available >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "CUDA,CUDNN REPO install complete" | tee -a /root/install_log.txt
    ;;
    ubuntu1604 | ubuntu1804 | ubuntu2004 )
      echo "" | tee -a /root/install_log.txt
      echo "CUDA,CUDNN REPO install Start" | tee -a /root/install_log.txt
      apt-get install -y sudo gnupg >> /root/log.txt 2> /root/log_err.txt
      apt-key adv --fetch-keys "http://developer.download.nvidia.com/compute/cuda/repos/"$OS"/x86_64/7fa2af80.pub" >> /root/log.txt 2> /root/log_err.txt
      sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/'$OS'/x86_64 /" > /etc/apt/sources.list.d/nvidia-cuda.list' >> /root/log.txt 2> /root/log_err.txt
      sh -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/'$OS'/x86_64 /" > /etc/apt/sources.list.d/nvidia-machine-learning.list'  >> /root/log.txt 2> /root/log_err.txt
      apt-get update >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "CUDA,CUDNN REPO install complete" | tee -a /root/install_log.txt
    ;;
    *)
      echo "" | tee -a /root/install_log.txt
      echo "CUDA,CUDNN repo install:$OS" | tee -a /root/install_log.txt
    ;;
  esac
else
  echo "" | tee -a /root/install_log.txt
  echo "The Cuda REPO has already been installed." | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 14. CUDA 설치 및 PATH 설정
## 저장소에 CentOS8 , Ubuntu20 2가지는 CUDA 11.0 버전만 파일이 있어 나머지 버전 추후 추가 예정
cat /etc/profile | grep cuda &> /dev/null
if [ $? != 0 ]
then
  cudav=$(cat /root/cudaversion.txt)
  case $OS in
    centos7 )
      echo "CUDA $cudav install Start" | tee -a /root/install_log.txt
      yum -y install cuda-$cudav >> /root/log.txt 2> /root/log_err.txt
      cudav="${cudav/-/.}"
      systemctl enable nvidia-persistenced >> /root/log.txt 2> /root/log_err.txt
      echo " "  >> /etc/profile
      echo "### ADD Cuda $cudav PATH"  >> /etc/profile
      echo "export PATH=/usr/local/cuda-$cudav/bin:/usr/local/cuda-$cudav/include:\$PATH " >> /etc/profile
      echo "export LD_LIBRARY_PATH=/usr/local/cuda-$cudav/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile
      echo "export CUDA_HOME=/usr/local/cuda-$cudav " >> /etc/profile
      echo "export CUDA_INC_DIR=/usr/local/cuda-$cudav/include " >> /etc/profile
      cat /etc/profile | tail -6 >> /root/log.txt 2> /root/log_err.txt
      source /etc/profile
      source /root/.bashrc
      ls /usr/local/ | grep cuda >> /root/log.txt 2> /root/log_err.txt
      nvidia-smi -L >> /root/log.txt 2> /root/log_err.txt
      nvidia-smi >> /root/log.txt 2> /root/log_err.txt
      which nvcc >> /root/log.txt 2> /root/log_err.txt
      nvcc -V >> /root/log.txt 2> /root/log_err.txt
      cp -r  /usr/local/cuda-$cudav/samples/   ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
      cd ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
      time make -j$(grep process /proc/cpuinfo | wc -l) >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "CUDA $cudav install Start complete" | tee -a /root/install_log.txt
    ;;
    centos8 )
      echo "CUDA $cudav install Start" | tee -a /root/install_log.txt
      dnf -y install cuda-$cudav >> /root/log.txt 2> /root/log_err.txt
      cudav="${cudav/-/.}"
      systemctl enable nvidia-persistenced.service >> /root/log.txt 2> /root/log_err.txt
      systemctl start nvidia-persistenced.service >> /root/log.txt 2> /root/log_err.txt
      echo " "  >> /etc/profile
      echo "### ADD Cuda $cudav PATH"  >> /etc/profile
      echo "export PATH=/usr/local/cuda-$cudav/bin:/usr/local/cuda-$cudav/include:\$PATH " >> /etc/profile
      echo "export LD_LIBRARY_PATH=/usr/local/cuda-$cudav/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile
      echo "export CUDA_HOME=/usr/local/cuda-$cudav " >> /etc/profile
      echo "export CUDA_INC_DIR=/usr/local/cuda-$cudav/include " >> /etc/profile
      cat /etc/profile | tail -6 >> /root/log.txt 2> /root/log_err.txt
      source /etc/profile
      source /root/.bashrc
      ls /usr/local/ | grep cuda >> /root/log.txt 2> /root/log_err.txt
      nvidia-smi -L >> /root/log.txt 2> /root/log_err.txt
      nvidia-smi >> /root/log.txt 2> /root/log_err.txt
      nvcc -V >> /root/log.txt 2> /root/log_err.txt
      cp -r  /usr/local/cuda-$cudav/samples/   ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
      cd ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
      time make -j$(grep process /proc/cpuinfo | wc -l) >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "CUDA $cudav install Start complete" | tee -a /root/install_log.txt
    ;;
    ubuntu1604 | ubuntu1804 )
      echo "CUDA $cudav install Start" | tee -a /root/install_log.txt
      apt-get -y install cuda-$cudav  >> /root/log.txt 2> /root/log_err.txt
      cudav="${cudav/-/.}"
      systemctl enable nvidia-persistenced >> /root/log.txt 2> /root/log_err.txt
      echo " "  >> /etc/profile
      echo "### ADD Cuda $cudav PATH"  >> /etc/profile
      echo "export PATH=/usr/local/cuda-$cudav/bin:/usr/local/cuda-$cudav/include:\$PATH " >> /etc/profile
      echo "export LD_LIBRARY_PATH=/usr/local/cuda-$cudav/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile
      echo "export CUDA_HOME=/usr/local/cuda-$cudav " >> /etc/profile
      echo "export CUDA_INC_DIR=/usr/local/cuda-$cudav/include " >> /etc/profile
      cat /etc/profile | tail -6 >> /root/log.txt 2> /root/log_err.txt
      source /etc/profile
      source /root/.bashrc
      ls /usr/local/ | grep cuda >> /root/log.txt 2> /root/log_err.txt
      nvidia-smi -L >> /root/log.txt 2> /root/log_err.txt
      nvidia-smi >> /root/log.txt 2> /root/log_err.txt
      nvcc -V >> /root/log.txt 2> /root/log_err.txt
      cp -r  /usr/local/cuda-$cudav/samples/   ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
      cd ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
      time make -j$(grep process /proc/cpuinfo | wc -l) >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "CUDA $cudav install Start complete" | tee -a /root/install_log.txt
    ;;
    ubuntu2004 )
      echo "CUDA $cudav install Start" | tee -a /root/install_log.txt
      apt-get -y install cuda-$cudav >> /root/log.txt 2> /root/log_err.txt
      cudav="${cudav/-/.}"
      systemctl enable nvidia-persistenced >> /root/log.txt 2> /root/log_err.txt
      echo " "  >> /etc/profile
      echo "### ADD Cuda $cudav PATH"  >> /etc/profile
      echo "export PATH=/usr/local/cuda-$cudav/bin:/usr/local/cuda-$cudav/include:\$PATH " >> /etc/profile
      echo "export LD_LIBRARY_PATH=/usr/local/cuda-$cudav/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile
      echo "export CUDA_HOME=/usr/local/cuda-$cudav " >> /etc/profile
      echo "export CUDA_INC_DIR=/usr/local/cuda-$cudav/include " >> /etc/profile
      cat /etc/profile | tail -6 >> /root/log.txt 2> /root/log_err.txt
      source /etc/profile
      source /root/.bashrc
      ls /usr/local/ | grep cuda >> /root/log.txt 2> /root/log_err.txt
      nvidia-smi -L >> /root/log.txt 2> /root/log_err.txt
      nvidia-smi >> /root/log.txt 2> /root/log_err.txt
      nvcc -V >> /root/log.txt 2> /root/log_err.txt
      cp -r  /usr/local/cuda-$cudav/samples/   ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
      cd ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
      time make -j$(grep process /proc/cpuinfo | wc -l) >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "CUDA $cudav install Start complete" | tee -a /root/install_log.txt
    ;;
    *)
      echo "" | tee -a /root/install_log.txt
      echo "CUDA install:$OS" | tee -a /root/install_log.txt
    ;;
  esac
else
  echo "" | tee -a /root/install_log.txt
  echo "The CUDA has already been installed." | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 15. CUDNN 설치 및 PATH 설정
updatedb
locate libcudnn  &> /dev/null
if [ $? != 0 ]
then
  case $OS in
    centos7 )
      echo "" | tee -a /root/install_log.txt
      echo "libcudnn Install Start" | tee -a /root/install_log.txt
      if [ $cudav = "11.0" ]
      then
        yum -y install libcudnn8* >> /root/log.txt 2> /root/log_err.txt
        yum -y upgrade >> /root/log.txt 2> /root/log_err.txt
      else
        yum -y install libcudnn7* >> /root/log.txt 2> /root/log_err.txt
        yum -y upgrade >> /root/log.txt 2> /root/log_err.txt
      fi
      echo "" | tee -a /root/install_log.txt
      echo "libcudnn Install complete" | tee -a /root/install_log.txt
    ;;
    centos8 )
      ## CentOS8 은 저장소에 libcudnn8만 존재함
      echo "" | tee -a /root/install_log.txt
      echo "libcudnn Install Start" | tee -a /root/install_log.txt
      dnf -y install libcudnn8*   >> /root/log.txt 2> /root/log_err.txt
      dnf -y install libnccl* >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "libcudnn Install complete" | tee -a /root/install_log.txt
    ;;
    ubuntu1604 | ubuntu1804 )
      echo "" | tee -a /root/install_log.txt
      echo "libcudnn Install Start" | tee -a /root/install_log.txt
      if [ $cudav = "11.0" ]
      then
        apt-get -y install libcudnn8* >> /root/log.txt 2> /root/log_err.txt
        apt-get install -y libcublas-dev >> /root/log.txt 2> /root/log_err.txt
      else
        apt-get -y install libcudnn7* >> /root/log.txt 2> /root/log_err.txt
        apt-get install -y libcublas-dev >> /root/log.txt 2> /root/log_err.txt
      fi
      echo "" | tee -a /root/install_log.txt
      echo "libcudnn Install complete" | tee -a /root/install_log.txt
    ;;
    ubuntu2004 )
      ## Ubuntu20.04 는 저장소에 libcudnn8만 존재함
      echo "" | tee -a /root/install_log.txt
      echo "libcudnn Install Start" | tee -a /root/install_log.txt
      apt-get -y install libcudnn8* >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "libcudnn Install complete" | tee -a /root/install_log.txt
    ;;
    *)
    echo "" | tee -a /root/install_log.txt
    echo "CUDNN, PATH Setting:$OS" | tee -a /root/install_log.txt
    ;;
  esac
else
  echo "" | tee -a /root/install_log.txt
  echo "The CUDNN has already been installed." | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 16. 딥러닝 패키지 설치(R,R Server, JupyterHub, Pycharm)
updatedb
locate rstudio  &> /dev/null
if [ $? != 0 ]
then
  case $OS in
    centos7 | centos8 )
      echo "" | tee -a /root/install_log.txt
      echo "Deep Learnig Package Install Start" | tee -a /root/install_log.txt
      ## R,R-sutdio install
      wget https://download1.rstudio.org/desktop/centos7/x86_64/rstudio-1.2.5033-x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
      rpm -ivh rstudio-1.2.5033-x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
      wget https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-1.2.5033-x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
      rpm -ivh rstudio-server-rhel-1.2.5033-x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
      yum install -y R >> /root/log.txt 2> /root/log_err.txt
      ## JupyterHub install
      curl --silent --location https://rpm.nodesource.com/setup_14.x | sudo bash - >> /root/log.txt 2> /root/log_err.txt
      yum install -y nodejs >> /root/log.txt 2> /root/log_err.txt
      npm install -g configurable-http-proxy >> /root/log.txt 2> /root/log_err.txt
      mkdir /etc/jupyterhub
      jupyterhub --generate-config >> /root/log.txt 2> /root/log_err.txt
      mv jupyterhub_config.py /etc/jupyterhub/
      sed -i '356a c.JupyterHub.port = 8000' /etc/jupyterhub/jupyterhub_config.py
      sed -i '358a c.LocalAuthenticator.create_system_users = True' /etc/jupyterhub/jupyterhub_config.py
      sed -i '359a c.Authenticator.add_user_cmd = ['adduser', '--force-badname', '-q', '--gecos', '""', '--disabled-password']' /etc/jupyterhub/jupyterhub_config.py
      sed -i '384a c.JupyterHub.proxy_class = 'jupyterhub.proxy.ConfigurableHTTPProxy'' /etc/jupyterhub/jupyterhub_config.py
      sed -i '824a c.Authenticator.admin_users = {"sonic"}' /etc/jupyterhub/jupyterhub_config.py
      rm -rf cuda-repo-rhel7-10.0.130-1.x86_64.rpm rstudio-1.2.5033-x86_64.rpm rstudio-server-rhel-1.2.5033-x86_64.rpm r_jupyterhub.Rout
      echo "" | tee -a /root/install_log.txt
      echo "Deep Learnig Package install complete"  | tee -a /root/install_log.txt
    ;;
    centos8 )
      echo "" | tee -a /root/install_log.txt
      echo "Deep Learnig Package Install Start" | tee -a /root/install_log.txt
      ## Pycharm install
      systemctl enable --now snapd.socket >> /root/log.txt 2> /root/log_err.txt
      ln -s /var/lib/snapd/snap /snap
      systemctl restart snapd.socket >> /root/log.txt 2> /root/log_err.txt
      sleep 3
      snap install pycharm-community --classic >> /root/log.txt 2> /root/log_err.txt
      ## R,R-studio Install
      wget https://download2.rstudio.org/server/centos8/x86_64/rstudio-server-rhel-1.3.959-x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
      dnf install -y rstudio-server-rhel-1.3.959-x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
      dnf install -y java-devel  libgfortran.so.5 libopenblas.so.0 libquadmath.so.0 libtcl8.6.so libtk8.6.so >> /root/log.txt 2> /root/log_err.txt
      # libRmath-devel R-rpm-macros  libRmath 패키지 존재하지 않아 설치 불가
      dnf config-manager --set-enabled powertools >> /root/log.txt 2> /root/log_err.txt
      dnf install -y R >> /root/log.txt 2> /root/log_err.txt
      systemctl restart rstudio-server.service >> /root/log.txt 2> /root/log_err.txt
      ## JupyterHub Install
      dnf install -y nodejs >> /root/log.txt 2> /root/log_err.txt
      npm install -g configurable-http-proxy >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "Deep Learnig Package install complete" | tee -a /root/install_log.txt
    ;;
    ubuntu1604 )
      echo "" | tee -a /root/install_log.txt
      echo "Deep Learnig Package Install Start" | tee -a /root/install_log.txt
      apt-get install -y dkms linux-generic-hwe-16.04 xserver-xorg-hwe-16.04 >> /root/log.txt 2> /root/log_err.txt
      ## R server install
      apt-get install -y  r-base gdebi-core >> /root/log.txt 2> /root/log_err.txt
      wget https://download2.rstudio.org/server/trusty/amd64/rstudio-server-1.2.5019-amd64.deb >> /root/log.txt 2> /root/log_err.txt
      yes | gdebi rstudio-server-1.2.5019-amd64.deb >> /root/log.txt 2> /root/log_err.txt
      wget https://download1.rstudio.org/desktop/xenial/amd64/rstudio-1.2.5019-amd64.deb >> /root/log.txt 2> /root/log_err.txt
      dpkg -i rstudio-1.2.5019-amd64.deb >> /root/log.txt 2> /root/log_err.txt
      apt-get install -y  rdesktop >> /root/log.txt 2> /root/log_err.txt
      ## JupyterHub install
      curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -  >> /root/log.txt 2> /root/log_err.txt
      apt-get install -y  nodejs default-jre >> /root/log.txt 2> /root/log_err.txt
      npm install -g configurable-http-proxy >> /root/log.txt 2> /root/log_err.txt
      ## Pycharm install
      snap install pycharm-community --classic >> /root/log.txt 2> /root/log_err.txt
      rm -rf 7fa2af80.pub cuda-repo-ubuntu1604_10.0.130-1_amd64.deb rstudio-1.2.5019-amd64.deb rstudio-server-1.2.5019-amd64.deb
      echo "" | tee -a /root/install_log.txt
      echo "Deep Learnig Package install complete" | tee -a /root/install_log.txt
    ;;
    ubuntu1804 )
      echo "" | tee -a /root/install_log.txt
      echo "Deep Learnig Package Install Start" | tee -a /root/install_log.txt
      apt-get install -y dkms linux-generic-hwe-18.04 xserver-xorg-hwe-18.04 >> /root/log.txt 2> /root/log_err.txt
      ## R Server install
      apt-get install -y  r-base gdebi-core >> /root/log.txt 2> /root/log_err.txt
      wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.2.5019-amd64.deb >> /root/log.txt 2> /root/log_err.txt
      yes | gdebi rstudio-server-1.2.5019-amd64.deb >> /root/log.txt 2> /root/log_err.txt
      wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.5019-amd64.deb >> /root/log.txt 2> /root/log_err.txt
      dpkg -i rstudio-1.2.5019-amd64.deb >> /root/log.txt 2> /root/log_err.txt
      apt-get install -y  rdesktop >> /root/log.txt 2> /root/log_err.txt
      ## JupyterHub install
      curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -  >> /root/log.txt 2> /root/log_err.txt
      apt-get install -y  nodejs default-jre >> /root/log.txt 2> /root/log_err.txt
      npm install -g configurable-http-proxy >> /root/log.txt 2> /root/log_err.txt
      mkdir /etc/jupyterhub
      jupyterhub --generate-config -f /etc/jupyterhub/jupyterhub_config.py
      sed -i '356a c.JupyterHub.port = 8000' /etc/jupyterhub/jupyterhub_config.py
      sed -i '358a c.LocalAuthenticator.create_system_users = True' /etc/jupyterhub/jupyterhub_config.py
      sed -i '359a c.Authenticator.add_user_cmd = ['adduser', '--force-badname', '-q', '--gecos', '""', '--disabled-password']' /etc/jupyterhub/jupyterhub_config.py
      sed -i '384a c.JupyterHub.proxy_class = 'jupyterhub.proxy.ConfigurableHTTPProxy'' /etc/jupyterhub/jupyterhub_config.py
      sed -i '824a c.Authenticator.admin_users = {"sonic"}' /etc/jupyterhub/jupyterhub_config.py
      ## pycharm install
      snap install pycharm-community --classic >> /root/log.txt 2> /root/log_err.txt
      sed -i "5s/networkd/NetworkManager/" /etc/netplan/01-netcfg.yaml
      systemctl enable network-manager.service >> /root/log.txt 2> /root/log_err.txt
      rm -rf 7fa2af80.pub cuda-repo-ubuntu1804_10.0.130-1_amd64.deb rstudio-1.2.5019-amd64.deb rstudio-server-1.2.5019-amd64.deb
      echo "" | tee -a /root/install_log.txt
      echo "Deep Learnig Package install complete" | tee -a /root/install_log.txt
    ;;
    ubuntu2004 )
      echo "" | tee -a /root/install_log.txt
      echo "Deep Learnig Package Install Start" | tee -a /root/install_log.txt
      ## R Server install
      apt-get install -y r-base >> /root/log.txt 2> /root/log_err.txt
      apt-get install -y gdebi-core >> /root/log.txt 2> /root/log_err.txt
      wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.1073-amd64.deb >> /root/log.txt 2> /root/log_err.txt
      yes | gdebi rstudio-server-1.3.1073-amd64.deb >> /root/log.txt 2> /root/log_err.txt
      ## JupyterHub install
      curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
      apt-get install -y nodejs default-jre >> /root/log.txt 2> /root/log_err.txt
      npm install -g configurable-http-proxy >> /root/log.txt 2> /root/log_err.txt
      ## Pycharm install
      snap install pycharm-community --classic >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "Deep Learnig Package install complete" | tee -a /root/install_log.txt
    ;;
    *)
      echo "" | tee -a /root/install_log.txt
      echo "Deep Learnig package install:$OS"   | tee -a /root/install_log.txt
    ;;
  esac
  sleep 3
else
  echo "" | tee -a /root/install_log.txt
  echo "The Deep Learnig Package has already been installed." | tee -a /root/install_log.txt
fi

## jupyterhub 마무리 설정
if [  $OS != "Skip this server as it has no GPU." ]
then
  echo "" | tee -a /root/install_log.txt
  echo "JupyterHub Setting Files Copy" | tee -a /root/install_log.txt
  ## jupyter hub service 설정 파일 복사
  mv /root/LISR/LISR_LAS/jupyterhub.service /lib/systemd/system/
  mv /root/LISR/LISR_LAS/jupyterhub /etc/init.d/
  chmod 777 /lib/systemd/system/jupyterhub.service >> /root/log.txt 2> /root/log_err.txt
  chmod 755 /etc/init.d/jupyterhub >> /root/log.txt 2> /root/log_err.txt
  systemctl daemon-reload >> /root/log.txt 2> /root/log_err.txt
  systemctl enable jupyterhub.service >> /root/log.txt 2> /root/log_err.txt
  systemctl restart jupyterhub.service >> /root/log.txt 2> /root/log_err.txt
  R CMD BATCH /root/LISR/LISR_LAS/r_jupyterhub.R >> /root/log.txt 2> /root/log_err.txt
  echo "" | tee -a /root/install_log.txt
  echo "JupyterHub Setting Files Copy Complete" | tee -a /root/install_log.txt
else
  echo ""
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

#### Server만 아래 스크립트 진행 #####
dmidecode | grep -i ipmi &> /dev/null
if [ $? != 0 ]
then
  # rc.local 기본 값으로 변경
  echo "" | tee -a /root/install_log.txt
  echo "LAS install complete" | tee -a /root/install_log.txt
  case $OS in
    centos7 | centos8 )
      sed -i '/root/d' /etc/rc.d/rc.local
      systemctl set-default graphical.target >> /root/log.txt 2> /root/log_err.txt
    ;;
    ubuntu1604 | ubuntu1804 | ubuntu2004 )
      sed -i '/root/d' /etc/rc.local
      systemctl set-default graphical.target >> /root/log.txt 2> /root/log_err.txt
    ;;
    *)
    ;;
  esac
  reboot
else
  echo "" | tee -a /root/install_log.txt
  echo "Server Package Install Start." | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

## GPU 없는 서버가 여기까지 건너뛰기 위해 제거했던 OS 변수 입력
if [ $OSCHECK = "centos" ]
then
  OS=$(cat /etc/redhat-release | awk '{print$1,$4}' | cut -d "." -f 1 | tr -d " " | tr '[A-Z]' '[a-z]')
else
  OS=$(lsb_release -isr |  tr -d "." | sed -e '{N;s/\n//}' | tr '[A-Z]' '[a-z]')
fi

# 17. 서버 전용 MSM 설치
dmidecode | grep -i ipmi &> /dev/null
if [ $? = 0 ]
then
  case $OS in
    centos7 | centos8 )
      echo "" | tee -a /root/install_log.txt
      echo "MSM install start" | tee -a /root/install_log.txt
      mkdir /tmp/raid_manager && cd /tmp/raid_manager
      wget https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/17.05.00.02_Linux-64_MSM.gz >> /root/log.txt 2> /root/log_err.txt
      tar xvzf 17.05.00.02_Linux-64_MSM.gz >> /root/log.txt 2> /root/log_err.txt
      cd /tmp/raid_manager/disk/ && ./install.csh -a >> /root/log.txt 2> /root/log_err.txt
      /usr/local/MegaRAID\ Storage\ Manager/startupui.sh  & >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "MSM install complete" | tee -a /root/install_log.txt
    ;;
    ubuntu1604 | ubuntu1804 | ubuntu2004 )
      echo "" | tee -a /root/install_log.txt
      echo "MSM install start" | tee -a /root/install_log.txt
      mkdir /tmp/raid_manager && cd /tmp/raid_manager
      wget https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/17.05.00.02_Linux-64_MSM.gz >> /root/log.txt 2> /root/log_err.txt
      tar xvzf 17.05.00.02_Linux-64_MSM.gz >> /root/log.txt 2> /root/log_err.txt
      cd disk/
      apt-get -y install alien >> /root/log.txt 2> /root/log_err.txt
      alien --scripts *.rpm >> /root/log.txt 2> /root/log_err.txt
      dpkg --install lib-utils2_1.00-9_all.deb >> /root/log.txt 2> /root/log_err.txt
      dpkg --install megaraid-storage-manager_17.05.00-3_all.deb >> /root/log.txt 2> /root/log_err.txt
      systemctl start vivaldiframeworkd.service >> /root/log.txt 2> /root/log_err.txt
      systemctl enable vivaldiframeworkd.service >> /root/log.txt 2> /root/log_err.txt
      /usr/local/MegaRAID\ Storage\ Manager/startupui.sh  & >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "MSM install complete" | tee -a /root/install_log.txt
    ;;
    *)
    ;;
  esac
else
  echo "" | tee -a /root/install_log.txt
  echo "MSM is ready or IPMI does not exist." | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

## Dell Server를 제외한 Server는 여기까지 실행
echo $VENDOR | grep -i dell &> /dev/null
if [ $? != 0 ]
then
# rc.local 기본 값으로 변경
  echo "" | tee -a /root/install_log.txt
  echo "LAS install complete" | tee -a /root/install_log.txt
    case $OS in
      centos7 | centos8 )
        sed -i '/root/d' /etc/rc.d/rc.local
        systemctl set-default  multi-user.target
      ;;
      ubuntu1604 | ubuntu1804 | ubuntu2004 )
        sed -i '/root/d' /etc/rc.local
        systemctl set-default  multi-user.target
      ;;
      *)
      ;;
  esac
  reboot
else
  echo "" | tee -a /root/install_log.txt
  echo "The Dell server-only alert mailing setup begins." | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 18. Mailutils 설정 (Dell Server만 진행)
ls /usr/local/sbin/export_global_variable.sh &> /dev/null
if [ $? != 0 ]
then
  echo "" | tee -a /root/install_log.txt
  echo "Mailutils setting start" | tee -a /root/install_log.txt
  cp /root/LISR/LISR_LAS/export_global_variable.sh  /usr/local/sbin/export_global_variable.sh
  customer=$(cat /root/customername.txt)
  sed -i  "s/ABCDEFG/${customer}/" /usr/local/sbin/export_global_variable.sh
  source /usr/local/sbin/export_global_variable.sh
  # 메일 발송을 위한 설정값 변경
  case $OS in
    centos7 | centos8 )
      grep inet_protocols   /etc/postfix/main.cf >> /root/log.txt 2> /root/log_err.txt
      sed -i  's/inet_protocols = all/inet_protocols = ipv4/' /etc/postfix/main.cf
      grep inet_protocols   /etc/postfix/main.cf >> /root/log.txt 2> /root/log_err.txt
      systemctl restart postfix >> /root/log.txt 2> /root/log_err.txt
      echo "Test of SMTP... OK." | mail -s $TITLE_TAIL $ADMIN_LOG_EMAIL >> /root/log.txt 2> /root/log_err.txt
      systemctl status postfix | grep Active: >> /root/log.txt 2> /root/log_err.txt
      grep 'inet_interfaces =' /etc/postfix/main.cf >> /root/log.txt 2> /root/log_err.txt
      sed -i  "s/inet_interfaces = localhost/#inet_interfaces = localhost/" /etc/postfix/main.cf
      sed -i  "s/#inet_interfaces = all/inet_interfaces = all/" /etc/postfix/main.cf
      systemctl  restart postfix >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "Mailutils setting start" | tee -a /root/install_log.txt
    ;;
    ubuntu1604 | ubuntu1804 | ubuntu2004 )
      grep "inet_interfaces\|inet_protocols" /etc/postfix/main.cf >> /root/log.txt 2> /root/log_err.txt
      perl -pi -e 's/^inet_protocols = all/inet_protocols = ipv4/'  /etc/postfix/main.cf
      grep inet_protocols  /etc/postfix/main.cf >> /root/log.txt 2> /root/log_err.txt
      grep 'mynetworks = '   /etc/postfix/main.cf >> /root/log.txt 2> /root/log_err.txt
      perl -pi -e 's/^mynetworks/#mynetworks/'   /etc/postfix/main.cf
      grep  'mynetworks = '   /etc/postfix/main.cf >> /root/log.txt 2> /root/log_err.txt
      systemctl restart postfix >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "Mailutils setting start" | tee -a /root/install_log.txt
    ;;
    *)
      echo "" | tee -a /root/install_log.txt
      echo "Mailutils setting error" | tee -a /root/install_log.txt
    ;;
  esac
else
  echo "" | tee -a /root/install_log.txt
  echo "The Mailutils has already been setting." | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

### 19. Dell 전용 OMSA설치
systemctl status dsm_om_connsvc &> /dev/null
if [ $? != 0 ]
then
  echo "" | tee -a /root/install_log.txt
  echo "OMSA install start" | tee -a /root/install_log.txt
  ## OMSA Port
  firewall-cmd --add-port=1311/tcp --zone=external --permanent >> /root/log.txt 2> /root/log_err.txt
  firewall-cmd --reload >> /root/log.txt 2> /root/log_err.txt
  case $OS in
    centos7 | centos8 )
      perl -p -i -e '$.==20 and print "exclude = libsmbios smbios-utils-bin\n"' /etc/yum.repos.d/CentOS-Base.repo
      wget http://linux.dell.com/repo/hardware/dsu/bootstrap.cgi -O  ./dellomsainstall.sh >> /root/log.txt 2> /root/log_err.txt
      sed -i -e "s/enabled=1/enabled=0/g" ./dellomsainstall.sh 
      bash ./dellomsainstall.sh >> /root/log.txt 2> /root/log_err.txt
      rm -f ./dellomsainstall.sh >> /root/log.txt 2> /root/log_err.txt
      yum -y erase  tog-pegasus-libs >> /root/log.txt 2> /root/log_err.txt
      yum -y install --enablerepo=dell-system-update_dependent -y  srvadmin-all openssl-devel >> /root/log.txt 2> /root/log_err.txt
      systemctl enable dataeng >> /root/log.txt 2> /root/log_err.txt
      systemctl enable dsm_om_connsvc >> /root/log.txt 2> /root/log_err.txt
      systemctl start dataeng >> /root/log.txt 2> /root/log_err.txt
      systemctl start dsm_om_connsvc >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "OMSA install complete" | tee -a /root/install_log.txt
    ;;
    ubuntu1604 )
      ## OMSA port
      ufw allow 1311/tcp >> /root/log.txt 2> /root/log_err.txt
      echo 'deb http://linux.dell.com/repo/community/openmanage/911/xenial xenial main'  >  /etc/apt/sources.list.d/linux.dell.com.sources.list
      wget http://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc >> /root/log.txt 2> /root/log_err.txt
      apt-key add 0x1285491434D8786F.asc >> /root/log.txt 2> /root/log_err.txt
      apt-get -y update >> /root/log.txt 2> /root/log_err.txt
      apt-get -y install srvadmin-all >> /root/log.txt 2> /root/log_err.txt
      systemctl enable dataeng >> /root/log.txt 2> /root/log_err.txt
      systemctl enable dsm_om_connsvc >> /root/log.txt 2> /root/log_err.txt
      systemctl start dataeng >> /root/log.txt 2> /root/log_err.txt
      systemctl start dsm_om_connsvc >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "OMSA install complete" | tee -a /root/install_log.txt
    ;;
    ubuntu1804 )
      ## OMSA port
      ufw allow 1311/tcp >> /root/log.txt 2> /root/log_err.txt
      echo 'deb http://linux.dell.com/repo/community/openmanage/940/bionic bionic main'  > /etc/apt/sources.list.d/linux.dell.com.sources.list
      wget http://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc
      apt-key add 0x1285491434D8786F.asc >> /root/log.txt 2> /root/log_err.txt
      apt-get  -y update >> /root/log.txt 2> /root/log_err.txt
      apt-get  -y  install srvadmin-all >> /root/log.txt 2> /root/log_err.txt
      cd /usr/lib/x86_64-linux-gnu/ >> /root/log.txt 2> /root/log_err.txt
      ln -s /usr/lib/x86_64-linux-gnu/libssl.so.1.1 libssl.so >> /root/log.txt 2> /root/log_err.txt
      cd
      systemctl enable dataeng >> /root/log.txt 2> /root/log_err.txt
      systemctl enable dsm_om_connsvc >> /root/log.txt 2> /root/log_err.txt
      systemctl start dataeng >> /root/log.txt 2> /root/log_err.txt
      systemctl start dsm_om_connsvc >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "OMSA install complete" | tee -a /root/install_log.txt
    ;;
    ubuntu2004 )
      ## OMSA port
      ufw allow 1311/tcp >> /root/log.txt 2> /root/log_err.txt
      echo 'deb http://linux.dell.com/repo/community/openmanage/950/focal focal main'  > /etc/apt/sources.list.d/linux.dell.com.sources.list
      wget http://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc
      apt-key add 0x1285491434D8786F.asc >> /root/log.txt 2> /root/log_err.txt
      apt-get  -y update >> /root/log.txt 2> /root/log_err.txt
      apt-get  -y  install srvadmin-all >> /root/log.txt 2> /root/log_err.txt
      cd /usr/lib/x86_64-linux-gnu/ >> /root/log.txt 2> /root/log_err.txt
      ln -s /usr/lib/x86_64-linux-gnu/libssl.so.1.1 libssl.so >> /root/log.txt 2> /root/log_err.txt
      cd
      systemctl enable dsm_sa_datamgrd.service >> /root/log.txt 2> /root/log_err.txt
      systemctl enable dsm_om_connsvc >> /root/log.txt 2> /root/log_err.txt
      systemctl start dsm_sa_datamgrd.service >> /root/log.txt 2> /root/log_err.txt
      systemctl start dsm_om_connsvc >> /root/log.txt 2> /root/log_err.txt
      echo "" | tee -a /root/install_log.txt
      echo "OMSA install complete" | tee -a /root/install_log.txt
    ;;
    *)
      echo "" | tee -a /root/install_log.txt
      echo "OMSA install error" | tee -a /root/install_log.txt
    ;;
  esac
else
  echo ""| tee -a /root/install_log.txt
  echo "The OMSA has already been setting" | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

### OMSA E-mail Alert
cat /etc/crontab | grep -i dasan &> /dev/null
if [ $? != 0 ]
then
  echo "" | tee -a /root/install_log.txt
  echo "OMSA E-Mail Alert setting start" | tee -a /root/install_log.txt
  TITLE='Dell_OMSA_Alert_by_'$TITLE_TAIL
  OMSA_REPORT='./OMSA_REPORT.log'
  OMSA_EMAIL_LOG='./OMSA_EMAIL.log'
  OMREPORT_EXEC='/opt/dell/srvadmin/bin/omreport'
  OMSA_CHECK_LEVEL='Critical'
  echo  "
##################################################
# This Message from ${TITLE_TAIL}
# Using Dell Opne Mangement Server Administrator
# The location of the configuration file is below.
# /usr/local/sbin/export_global_variable.sh
# /usr/local/sbin/alert_omsa.sh
# $(date +%Y"-"%m"-"%d" "%r)
################################################## " >> ${OMSA_EMAIL_LOG}
  ${OMREPORT_EXEC} system alertlog | head -500 > ${OMSA_REPORT}
  MAX_LINE=$(grep 'Severity' ${OMSA_REPORT} | grep ${OMSA_CHECK_LEVEL} | wc -l)
  LINE_NUM=($(cat -n ${OMSA_REPORT} | grep 'Severity' | grep ${OMSA_CHECK_LEVEL} | cut -f 1) )
  LINE_SEL=0
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
  case $OS in
    centos7 | centos8 )
      cat ${OMSA_EMAIL_LOG} | /usr/bin/mail -s $TITLE $ADMIN_LOG_EMAIL
      rm ${OMSA_REPORT}
      rm ${OMSA_EMAIL_LOG}
    ;;
    ubuntu1604 | ubuntu1804 | ubuntu2004 )
      /usr/bin/mail -s $TITLE -t $ADMIN_LOG_EMAIL < ${OMSA_EMAIL_LOG}
      rm ${OMSA_REPORT}
      rm ${OMSA_EMAIL_LOG}
    ;;
    *)
    ;;
  esac
  bash  /root/LISR/LISR_LAS/omconfig_set.sh  >> /root/log.txt 2> /root/log_err.txt
  echo "" | tee -a /root/install_log.txt
  echo "OMSA E-Mail Alert setting complete" | tee -a /root/install_log.txt
else
  echo "" | tee -a /root/install_log.txt
  echo "The E-mail alert has already been setting" | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

# 20. 서버 온도 기록 수집
cat /etc/crontab | grep -i dasan &> /dev/null
if [ $? != 0 ]
then
  echo "" | tee -a /root/install_log.txt
  echo "Server Temperature setting start" | tee -a /root/install_log.txt
  cp /root/LISR/LISR_LAS/temperature_check_to_log.sh /usr/local/sbin/
  cp /root/LISR/LISR_LAS/temperature_log_to_mail.sh  /usr/local/sbin/
echo "
# add by dasandata
# 매시 30분에 온도체크 로그생성
30 * * * * root /usr/local/sbin/temperature_check_to_log.sh
# 매일 오전 8시에 온도체크 로그 발송
0  8 * * * root /usr/local/sbin/temperature_log_to_mail.sh
" >>  /etc/crontab
  echo "" | tee -a /root/install_log.txt
  echo "Server Temperature setting complete" | tee -a /root/install_log.txt
else
  echo "" | tee -a /root/install_log.txt
  echo "The server temperature has already been setting" | tee -a /root/install_log.txt
fi

echo "" | tee -a /root/install_log.txt
sleep 3
echo "" | tee -a /root/install_log.txt

## 스크립트 완료 정리 후 재부팅
cat /etc/crontab | grep dasan &> /dev/null
if [ $? = 0 ]
then
# rc.local 기본 값으로 변경
  echo "" | tee -a /root/install_log.txt
  echo "LAS install complete" | tee -a /root/install_log.txt
    case $OS in
    centos7 | centos8 )
      sed -i '/root/d' /etc/rc.d/rc.local
      systemctl set-default  multi-user.target | tee -a /root/install_log.txt
    ;;
    ubuntu1604 | ubuntu1804 | ubuntu2004 )
      sed -i '/root/d' /etc/rc.local
      systemctl set-default  multi-user.target | tee -a /root/install_log.txt
      cat /dev/null > /var/spool/mail/root
    ;;
    *)
    ;;
  esac
  reboot
else
  echo "" | tee -a /root/install_log.txt
  echo "Mail setting Error". | tee -a /root/install_log.txt
fi

############################################################
## 스크립트 완료 후 생성되는 파일 목록
## rm -f customername.txt cudaversion.txt nvidia.txt
## rm -f nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm  cuda-repo-rhel8-10.2.89-1.x86_64.rpm
## centos는 추가로 삭제 nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm
## centos는 추가로 삭제 cuda-repo-rhel8-10.2.89-1.x86_64.rpm
## install_log / 스크립트 실행 부분 표시하는 파일
## log,txt / 명령어에 따른 출력 저장한 파일
## log_err.txt / 출력 도중 에러 저장되는 파일
## customername.txt / 고객사 이름 변수 저장 파일
## cudaversion.txt / 쿠다 버전 선택 변수 저장 파일
## nvidia.txt / GPU 존재 여부 확인 변수 저장 파일
## hwcheck.txt / 하드웨어 정보 파일
## cuda-repo-rhel8-10.2.89-1.x86_64.rpm / centos에서 쿠다 저장소 설정시 다운받은 파일
## nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm / centos에서 쿠다 저장소 설정시 다운받은 파일
############################################################
############################################################