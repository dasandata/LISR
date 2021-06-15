#!/bin/sh
### 기본 버전 설치 진행 순서
### 1. 변수 선언
### 2. rc.local 생성 및 변경
### 3. nouveau 끄기 및 grub 설정
### 4. selinux 제거 및 저장소 변경
### 5. 기본 패키지 설치
### 6. 프로필 설정
### 7. 서버 시간 동기화
### 8. 파이썬 설치
### 9. 파이썬 패키지 설치
### 10. 방화벽 설정
### 11. 사용자 생성 테스트
### 12. H/W 사양 체크

### 1. 변수 선언 ###
# Dell or Supermicro 확인
VENDOR=$(dmidecode | grep -i manufacturer | awk '{print$2}' | head -1)
# Network Interface
NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2 | tr -d ' ')
# OS release 를 사용하여 OS 확인
check=$(cat /etc/os-release | head -1 | cut -d "=" -f 2 | tr -d "\"" | awk '{print$1}' | tr '[A-Z]' '[a-z]')

### 2. rc.local 생성 및 변경 ###
cat /etc/rc.local | grep -i root &> /dev/null
if [ $? != 0 ]
  then
    # 출력과 에러를 저장할 파일 생성
    touch /root/log.txt 
    touch /root/log_err.txt
    echo ""
    echo rc.local Setting
    case $check in
      centos )
        # centos는 이미 rc.local이 존재하여 실행될 파일값만 넣어준다.
        chmod +x /etc/rc.d/rc.local
        sed -i '12a bash /root/Server.sh' /etc/rc.d/rc.local
        echo ""
        echo rc.local setting complete
      ;;
      ubuntu )
        OS=$(lsb_release -isr |  tr -d "." | sed -e '{N;s/\n//}' | tr '[A-Z]' '[a-z]')
        sleep 3
        # Ubuntu16만 이미 rc.local이 존재하여 나눠서 작업
        if [ $OS == "ubuntu1604" ]
          then
            sed -i '13a bash /root/Server.sh' /etc/rc.local
          else
            echo -e  '#!/bin/sh -e \nexit 0' | tee -a /etc/rc.local
            chmod +x /etc/rc.local
            systemctl restart rc-local.service
            systemctl status rc-local.service
            sed -i '1a bash /root/Server.sh' /etc/rc.local
            echo ""
            echo rc.local setting complete
        fi
      ;;
      *)
      ;;
    esac
  else
    echo ""
    echo The rc.local file already exists.
fi


echo ""
sleep 3
echo ""

### 3. nouveau 끄기 및 grub 설정 ###
cat /etc/default/grub | grep quiet &> /dev/null
if [ $? == 0 ]
  then
    echo ""
    echo Nouveau Disable and Grub Settings Start.
    case $check in
      centos )
        echo ""
        echo CentOS Grub Setting Start.
        sed -i  's/rhgb//'   /etc/default/grub
        sed -i  's/quiet//'  /etc/default/grub
        sed -i  's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /' /etc/default/grub
        echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
        echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist.conf
        dracut  -f
        grub2-mkconfig -o /boot/grub2/grub.cfg
        grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg
        echo ""
        echo Nouveau and Grub Setting complete
      ;;
      ubuntu )
        OS=$(lsb_release -isr |  tr -d "." | sed -e '{N;s/\n//}' | tr '[A-Z]' '[a-z]')
        echo ""
        echo $OS Grub Setting Start.
        systemctl  set-default  multi-user.target
        echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
        echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist.conf
        perl -pi -e 's/splash//' /etc/default/grub
        perl -pi -e 's/quiet//'  /etc/default/grub
        perl -pi -e  's/^GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /'  /etc/default/grub
        perl -pi -e  's/^GRUB_HIDDEN_TIMEOUT=/#GRUB_HIDDEN_TIMEOUT=/'  /etc/default/grub
        update-initramfs -u && update-grub2
        echo ""
        echo Nouveau and Grub Setting complete
      ;;
      *)
        echo ""
      ;;
    esac
  else
    echo ""
    echo Nouveau Disable and Grub Settings has already been complete.
fi

echo ""
sleep 3
echo ""

### 4. selinux 제거 및 저장소 변경 ###
case $check in
  centos )
    OS=$(cat /etc/redhat-release | awk '{print$1,$4}' | cut -d "." -f 1 | tr -d " " | tr '[A-Z]' '[a-z]')
    echo ""
    echo OS is $OS
    #SELINUX Disabled 작업
    SELINUX=$(getenforce)
    if [ $SELINUX == "Disabled" ]
      then
        echo ""
        echo SELINUX is already turned off.
      else
        echo ""
        echo Changed SELINUX to disabled.
        setenforce 0
        sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
        sed -i '/IPV6/d' /etc/sysconfig/network-scripts/ifcfg-${NIC}
    fi
  ;;
  ubuntu )
    OS=$(lsb_release -isr |  tr -d "." | sed -e '{N;s/\n//}' | tr '[A-Z]' '[a-z]')
    echo ""
    echo OS is $OS
    # Repository를 mirror.kakao.com으로 변경
    REPO=$(awk 'NR == 8 {print$2}' /etc/apt/sources.list)
    if [ $REPO == "http://mirror.kakao.com/ubuntu/" ]
      then
        echo ""
        echo The Repository has been changed.
      else
        echo ""
        echo Repository Change
        perl -pi -e 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
        perl -pi -e 's//security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
    fi
  ;;
  *)
    echo ""
    echo OS Check is Failed
  ;;
esac

echo ""
sleep 3
echo ""

### 5. 기본 패키지 설치 ###
case $OS in
  centos7 )
    echo ""
    echo $OS Package Install
    ## Package 설치를 ipmi 여부로 Server와 PC를 나눠서 진행
    rpm -qa | grep -i net-tools &> /dev/null
    if [ $? != 0 ]
      then
        yum -y update >> /root/log.txt 2> /root/log_err.txt
        yum -y  install epel-release >> /root/log.txt 2> /root/log_err.txt
        yum install -y vim pciutils openssh mlocate nfs-utils rdate xauth firefox nautilus wget ifconfig >> /root/log.txt 2> /root/log_err.txt
        yum install -y tcsh tree lshw tmux git kernel-headers kernel-devel gcc make gcc-c++ mailx >> /root/log.txt 2> /root/log_err.txt
        yum install -y cmake python-devel ntfs-3g dstat perl perl-CPAN perl-core net-tools openssl-devel git-lfs >> /root/log.txt 2> /root/log_err.txt
        sleep 5
        dmidecode | grep -i ipmi
          if [ $? == 0 ]
            then
              yum install -y ipmitool >> /root/log.txt 2> /root/log_err.txt
            else
              echo ""
              echo "PC,Workstation do not install ipmitool"
          fi
        yum -y groups install "Development Tools" >> /root/log.txt 2> /root/log_err.txt
        yum -y install  glibc-static glibc-devel libstdc++ libstdc++-devel >> /root/log.txt 2> /root/log_err.txt
        sleep 5
        sed -i -e "s/\]$/\]\npriority=5/g" /etc/yum.repos.d/epel.repo >> /root/log.txt 2> /root/log_err.txt
        yum -y  install yum-plugin-priorities >> /root/log.txt 2> /root/log_err.txt
        yum -y  install htop ntfs-3g figlet >> /root/log.txt 2> /root/log_err.txt
      else
        echo ""
        echo The package has already been installed.
    fi
  ;;
  centos8 )
    echo ""
    echo $OS Package Install
    ## Package 설치를 ipmi 여부로 Server와 PC를 나눠서 진행 - Python도 여기서 설치됨 -
    rpm -qa | grep -i net-tools &> /dev/null
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
        sleep 5
        dmidecode | grep -i ipmi &> /dev/null
          if [ $? == 0 ]
            then
              dnf install -y ipmitool >> /root/log.txt 2> /root/log_err.txt
            else
              echo ""
              echo "PC,Workstation do not install ipmitool"
          fi
        dnf -y groups install "Development Tools" >> /root/log.txt 2> /root/log_err.txt
        dnf install -y glibc-devel libstdc++ libstdc++-devel >> /root/log.txt 2> /root/log_err.txt
        sleep 5
        dnf install -y htop ntfs-3g figlet >> /root/log.txt 2> /root/log_err.txt
      else
        echo ""
        echo The package has already been installed.
    fi
  ;;
  ubuntu1604 | ubuntu1804 | ubuntu2004 )
    echo ""
    echo $OS Package Install
    apt-get update >> /root/log.txt 2> /root/log_err.txt
    ## Package 설치를 ipmi 여부로 Server와 PC를 나눠서 진행
    dpkg -l | grep -i lvm2 &> /dev/null
      if [ $? != 0 ]
        then
          apt-get install -y vim nfs-common rdate xauth firefox gcc make locate htop tmux wget figlet >> /root/log.txt 2> /root/log_err.txt
          apt-get install -y net-tools xfsprogs ntfs-3g aptitude lvm2 dstat curl npm python >> /root/log.txt 2> /root/log_err.txt
          DEBIAN_FRONTEND=noninteractive apt-get install -y mailutils smartmontools >> /root/log.txt 2> /root/log_err.txt
          apt-get -y install ubuntu-desktop dconf-editor gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal >> /root/log.txt 2> /root/log_err.txt
          apt-get -y install libzmq3-dev libcurl4-openssl-dev libxml2-dev snapd postfix >> /root/log.txt 2> /root/log_err.txt
          sleep 5
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
          sleep 5
          ## ipmi 여부로 PC, Server 판단
          dmidecode | grep -i ipmi &> /dev/null
            if [ $? == 0 ]
              then
                apt-get install -y ipmitool >> /root/log.txt 2> /root/log_err.txt
              else
                echo ""
                echo PC,Workstation do not install ipmitool
            fi
        else
          echo ""
          echo The package has already been installed.
      fi
  ;;
  *)
  ;;
esac

echo ""
sleep 3
echo ""

### 6. 프로필 설정 ###
cat /root/.bashrc | grep -i "export PS1" &> /dev/null
if [ $? != 0 ]
  then
    echo ""
    echo Profile Settings Start
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
    ### motd settings
#   mv /root/LISR/motd/ /opt/
#   chmod -R 777 /opt/motd/
#   echo " " >> /etc/profile
#   echo "#Motd add" >> /etc/profile
#   echo "bash /opt/motd/motd.sh" >> /etc/profile
  else
    echo ""
    echo Profile settings are already set up.
fi

echo ""
sleep 3
echo ""

### 7. 서버 시간 동기화 ###
if [ $OS == "centos8" ]
  then
    chronyc sources -v
    perl -pi -e 's/pool 2.centos.pool.ntp.org iburst/server time.bora.net iburst/g' /etc/chrony.conf
    service chronyd restart
    timedatectl set-ntp true
    timedatectl
    chronyc sources -v
  else
    rdate  -s  time.bora.net
    hwclock --systohc
    date
    hwclock
fi

echo ""
sleep 3
echo ""

### 8. 파이썬 설치 ###
pip -V &> /dev/null
if [ $? != 0 ]
  then
    case $OS in
      centos7 )
        echo ""
        echo Python Install
          yum install -y python-devel python-setuptools python-setuptools-devel >> /root/log.txt 2> /root/log_err.txt
          curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py >> /root/log.txt 2> /root/log_err.txt
          python get-pip.py
          yum -y install  python36  python36-devel python36-pip python36-setuptools >> /root/log.txt 2> /root/log_err.txt
          easy_install-3.6   pip >> /root/log.txt 2> /root/log_err.txt
          yum -y install   openblas* >> /root/log.txt 2> /root/log_err.txt
          pip   install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
          pip3   install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
          perl -pi -e 's/python3/python/'   /usr/local/bin/pip
      ;;
      centos8 )
        echo ""
        echo Python Install
          dnf install -y python2 python2-devel python3 python3-devel >> /root/log.txt 2> /root/log_err.txt
      ;;
      ubuntu1604 )
        echo ""
        echo Python Install
          apt-get install -y python-dev python3-dev >> /root/log.txt 2> /root/log_err.txt
          curl -fsSL -o- https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2.7 >> /root/log.txt 2> /root/log_err.txt
          curl -fsSL -o- https://bootstrap.pypa.io/pip/3.5/get-pip.py | python3.5 >> /root/log.txt 2> /root/log_err.txt
          pip   install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
          pip3   install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
      ;;
      ubuntu1804 )
        echo ""
        echo Python Install
          apt-get install -y  python-pip python3-pip python-tk python3-tk >> /root/log.txt 2> /root/log_err.txt
          pip install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
          pip3 install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
      ;;
      ubuntu2004 )
        echo ""
        echo Python Install
          apt-get install -y python3-pip >> /root/log.txt 2> /root/log_err.txt
          add-apt-repository universe >> /root/log.txt 2> /root/log_err.txt
          apt update >> /root/log.txt 2> /root/log_err.txt
          apt list --upgradeable >> /root/log.txt 2> /root/log_err.txt
          apt install -y python2 >> /root/log.txt 2> /root/log_err.txt
          curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py >> /root/log.txt 2> /root/log_err.txt
          python2.7 get-pip.py --force-reinstall >> /root/log.txt 2> /root/log_err.txt
          pip3 install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
          perl -pi -e 's/python3/python/'   /usr/local/bin/pip >> /root/log.txt 2> /root/log_err.txt
      ;;
      *)
    ;;
    esac
  else
    echo ""
    echo The python has already been installed.
fi

echo ""
sleep 3
echo ""

### 9. 파이썬 패키지 설치 ###
pip3 list | grep tensor &> /dev/null
if [ $? != 0 ]
then
  case $OS in
    centos7 )
      echo ""
      echo Python Package Install
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
        pip3 install --upgrade optimuspyspark
        pip3 uninstall --yes tensorflow
        pip3 install --upgrade jupyterhub
        pip3 install --upgrade notebook
    ;;
    centos8 )
      echo ""
      echo Python Package Install
        pip2 install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
        pip3 install --upgrade pip >> /root/log.txt 2> /root/log_err.txt
        pip2 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow-gpu >> /root/log.txt 2> /root/log_err.txt
        pip2 install --upgrade setuptools >> /root/log.txt 2> /root/log_err.txt
        pip3 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow-gpu >> /root/log.txt 2> /root/log_err.txt
        pip3 install --upgrade python-dateutil >> /root/log.txt 2> /root/log_err.txt
        pip3 install --upgrade jupyterhub notebook flask
        perl -pi -e 's/python3.6/python2.7/'   /usr/local/bin/pip
        cp /usr/local/lib/python3.6/site-packages/six.py /usr/lib/python3.6/site-packages/ >> /root/log.txt 2> /root/log_err.txt
    ;;
    ubuntu1604 | ubuntu1804 )
      echo ""
      echo Python Package Install
        pip install  numpy   scipy  nose  matplotlib  pandas  keras >> /root/log.txt 2> /root/log_err.txt
        pip3 install  numpy   scipy  nose  matplotlib  pandas  keras >> /root/log.txt 2> /root/log_err.txt
        pip install  --upgrade tensorflow-gpu==1.13.1 >> /root/log.txt 2> /root/log_err.txt
        pip3 install  --upgrade tensorflow-gpu==1.13.1 >> /root/log.txt 2> /root/log_err.txt
        if [ $OS == "ubuntu1604" ]
        then
          pip install  --upgrade setuptools >> /root/log.txt 2> /root/log_err.txt
          pip3 install  --upgrade setuptools >> /root/log.txt 2> /root/log_err.txt
        else
          echo ""
        fi
        pip3 install --upgrade optimuspyspark 
        pip3 install --upgrade testresources
        pip3 install --upgrade jupyterhub
        pip3 install --upgrade notebook
        pip install torch torchvision >> /root/log.txt 2> /root/log_err.txt
        pip3 install torch torchvision >> /root/log.txt 2> /root/log_err.txt
    ;;
    ubuntu2004 )
      echo ""
      echo Python Package Install
        pip install --upgrade numpy scipy  nose  matplotlib  pandas  keras tensorflow-gpu >> /root/log.txt 2> /root/log_err.txt
        pip install scipy==1.2.2 >> /root/log.txt 2> /root/log_err.txt
        pip3 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow-gpu >> /root/log.txt 2> /root/log_err.txt
        pip3 install numpy==1.16.0 h5py==2.10.0 >> /root/log.txt 2> /root/log_err.txt
        pip install --upgrade torch torchvision  >> /root/log.txt 2> /root/log_err.txt
        pip3 install --upgrade torch torchvision >> /root/log.txt 2> /root/log_err.txt
        pip3 install --upgrade jupyterhub notebook
    ;;
    *)
    ;;
  esac
else
  echo ""
  echo Python Package has been installed.
fi

echo ""
sleep 3
echo ""

### 10. 방화벽 설정 ###
case $OS in
  centos7 | centos8 )
    systemctl status firewalld | grep inactive &> /dev/null
      if [ $? != 0 ]
      then
        echo ""
        echo Firewall Settings
              firewall-cmd --get-zones
              firewall-cmd --list-all
              firewall-cmd --get-default-zone
              firewall-cmd --change-interface=${NIC} --zone=external --permanent
              firewall-cmd --set-default-zone=external
              firewall-cmd --reload
              firewall-cmd --add-port=7777/tcp  --permanent
              # R Server Port
              firewall-cmd --add-port=8787/tcp --permanent
              # jupyterHub Port
              firewall-cmd --add-port=8000/tcp --permanent
              # OMSA Port
              firewall-cmd   --add-port=1311/tcp  --zone=external   --permanent
              firewall-cmd --remove-service=ssh  --permanent
              firewall-cmd --reload
              sed -i  "s/#Port 22/Port 7777/g" /etc/ssh/sshd_config
              sed -i  "s/#PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config
              echo "AddressFamily inet" >> /etc/ssh/sshd_config
              systemctl restart sshd
      else
        echo ""
        echo The Firewall has already been started.
      fi
  ;;
  ubuntu1604 | ubuntu1804 | ubuntu2004 )
    ufw status | grep inactive &> /dev/null
      if [ $? == 0 ]
      then
        echo ""
        echo Firewall Settings
          systemctl start ufw
          systemctl enable ufw
          yes | ufw enable
          echo ""
          ufw default deny
          ufw allow 22/tcp 
          ufw allow 7777/tcp 
          # R Server port
          ufw allow 8787/tcp 
          # JupyterHub port
          ufw allow 8000/tcp
          # Pycharm port
          ufw allow 5900/tcp
          # OMSA port
          ufw allow 1311/tcp
          if [ $OS == "ubuntu1604" ]
          then
          perl -pi -e "s/Port 22/Port 7777/g" /etc/ssh/sshd_config
          else
          echo ""
          fi
          perl -pi -e "s/#Port 22/Port 7777/g" /etc/ssh/sshd_config
          perl -pi -e "s/PermitRootLogin prohibit-password/PermitRootLogin no/g" /etc/ssh/sshd_config
          echo "AddressFamily inet" >> /etc/ssh/sshd_config
          systemctl restart sshd
      else
        echo ""
        echo The Firewall has already been started.
      fi
  ;;
  *)
  echo ""
  ;;
esac

echo ""
sleep 3
echo ""

### 11. 사용자 생성 테스트 ###
ls /home/ | grep -i dasan &> /dev/null
if [ $? != 0 ]
then
  case $OS in
    centos7 | centos8 )
      echo ""
      echo User Add Start
        useradd dasan
        usermod -aG wheel dasan
    ;;
    ubuntu1604 | ubuntu1804 | ubuntu2004 )
      echo ""
      echo User add Start
        adduser --disabled-login --gecos "" dasan
        usermod -G sudo dasan
    ;;
  *)
  ;;
  esac
else
  echo ""
  echo User add has already been complete.
fi

echo ""
sleep 3
echo ""

### 12. H/W 사양 체크
cat /root/hwcheck.txt &> /dev/null
if [ $? != 0 ]
then
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
else
  echo ""
  echo H/W check has already been completed.
fi


echo ""
sleep 3
echo ""

lspci | grep -i nvidia
if [ $? != 0 ]
then
# rc.local 기본 값으로 변경
  echo ""
  echo "Complete basic setup"
  sed -i '/root/d' /etc/rc.local
  reboot
else
  echo ""
  echo GPU Settings Start.
  reboot
fi

########################GPU 버전 진행########################
### 1. CUDA,CUDNN Repo 설치
### 2. CUDA 설치 및 PATH 설정
### 3. CUDNN 설치 및 PATH 설정
### 4. 딥러닝 패키지 설치
### 5. R-server, Jupyter-hub, pytorch, pycharm 설치
### 6. Mailutils 설정
### 7. Dell 전용 OMSA설치
### 8. 서버 전용 MSM 설치

### 1. CUDA,CUDNN Repo 설치
cat /etc/profile | grep cuda &> /dev/null
if [ $? != 0 ]
  then
    case $OS in
      centos7 )
        echo ""
        echo CUDA,CUDNN REPO install Start
          wget http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-10.0.130-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
          wget https://developer.download.nvidia.com/compute/machine-learning/repos/rhel7/x86_64/nvidia-machine-learning-repo-rhel7-1.0.0-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
          yum -y install nvidia-machine-learning-repo-rhel7-1.0.0-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
          yum -y install cuda-repo-rhel7-10.0.130-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
          yum --disablerepo="*" --enablerepo="cuda" list available >> /root/log.txt 2> /root/log_err.txt
          yum -y install  libXi-devel mesa-libGLU-devel libXmu-devel libX11-devel freeglut-devel libXm* >> /root/log.txt 2> /root/log_err.txt
          yum -y install openmotif* >> /root/log.txt 2> /root/log_err.txt
      ;;
      centos8 )
        echo ""
        echo CUDA,CUDNN REPO install Start
          wget http://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-repo-rhel8-10.2.89-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
          wget https://developer.download.nvidia.com/compute/machine-learning/repos/rhel8/x86_64/nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
          dnf install -y nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
          dnf install -y cuda-repo-rhel8-10.2.89-1.x86_64.rpm >> /root/log.txt 2> /root/log_err.txt
          dnf install -y libXi-devel mesa-libGLU-devel libXmu-devel libX11-devel freeglut-devel libXm* >> /root/log.txt 2> /root/log_err.txt
          dnf install -y openmotif* >> /root/log.txt 2> /root/log_err.txt
          dnf --disablerepo="*" --enablerepo="cuda" list available >> /root/log.txt 2> /root/log_err.txt
      ;;
      ubuntu1604 | ubuntu1804 | ubuntu2004 )
        echo ""
        echo CUDA,CUDNN REPO install Start
          apt-get install -y sudo gnupg >> /root/log.txt 2> /root/log_err.txt
          apt-key adv --fetch-keys "http://developer.download.nvidia.com/compute/cuda/repos/"$OS"/x86_64/7fa2af80.pub" >> /root/log.txt 2> /root/log_err.txt
          sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/'$OS'/x86_64 /" > /etc/apt/sources.list.d/nvidia-cuda.list' >> /root/log.txt 2> /root/log_err.txt
          sh -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/'$OS'/x86_64 /" > /etc/apt/sources.list.d/nvidia-machine-learning.list'  >> /root/log.txt 2> /root/log_err.txt
          apt-get update >> /root/log.txt 2> /root/log_err.txt
      ;;
      *)
    ;;
    esac
  else
    echo ""
    echo The Cuda REPO has already been installed.
fi

echo ""
sleep 3
echo ""

### 2. CUDA 설치 및 PATH 설정
#### 저장소에 CentOS8 , Ubuntu20 2가지는 CUDA 11.0 버전만 파일이 있어 나머지 버전 추후 추가 예정
cat /etc/profile | grep cuda &> /dev/null
if [ $? != 0 ]
  then
    case $OS in
      centos7 )
        echo "CUDA 버전을 선택해 주세요"
        select cudav in 10-0 10-1 10-2 11-0; do echo "$cudav" ; break; done
        echo ""
        echo CUDA $cudav install Start 
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
          source .bashrc
          ls /usr/local/ | grep cuda >> /root/log.txt 2> /root/log_err.txt
          nvidia-smi -L >> /root/log.txt 2> /root/log_err.txt
          nvidia-smi >> /root/log.txt 2> /root/log_err.txt
          which nvcc >> /root/log.txt 2> /root/log_err.txt
          nvcc -V >> /root/log.txt 2> /root/log_err.txt
          cp -r  /usr/local/cuda-$cudav/samples/   ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
          cd ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
          time make -j$(grep process /proc/cpuinfo | wc -l) >> /root/log.txt 2> /root/log_err.txt
      ;;
      centos8 )
        echo "CUDA 버전을 선택해 주세요"
        select cudav in 11-0; do echo "$cudav" ; break; done
        echo ""
        echo CUDA $cudav install Start
        dnf -y install cuda-$cudav
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
        source .bashrc
        ls /usr/local/ | grep cuda >> /root/log.txt 2> /root/log_err.txt
        nvidia-smi -L >> /root/log.txt 2> /root/log_err.txt
        nvidia-smi >> /root/log.txt 2> /root/log_err.txt
        nvcc -V >> /root/log.txt 2> /root/log_err.txt
        cp -r  /usr/local/cuda-$cudav/samples/   ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
        cd ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
        time make -j$(grep process /proc/cpuinfo | wc -l) >> /root/log.txt 2> /root/log_err.txt
      ;;
      ubuntu1604 | ubuntu1804 )
        echo "CUDA 버전을 선택해 주세요"
        select cudav in 10-0 10-1 10-2 11-0; do echo "$cudav" ; break; done
        echo ""
        echo CUDA $cudav install Start
        apt-get -y install cuda-$cudav 
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
        source .bashrc
        ls /usr/local/ | grep cuda >> /root/log.txt 2> /root/log_err.txt
        nvidia-smi -L >> /root/log.txt 2> /root/log_err.txt
        nvidia-smi >> /root/log.txt 2> /root/log_err.txt
        nvcc -V >> /root/log.txt 2> /root/log_err.txt
        cp -r  /usr/local/cuda-$cudav/samples/   ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
        cd ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
        time make -j$(grep process /proc/cpuinfo | wc -l) >> /root/log.txt 2> /root/log_err.txt
      ;;
      ubuntu2004 )
        echo "CUDA 버전을 선택해 주세요"
        select cudav in 11-0; do echo "$cudav" ; break; done
        echo ""
        echo CUDA $cudav install Start
        apt-get -y install cuda-$cudav 
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
        source .bashrc
        ls /usr/local/ | grep cuda >> /root/log.txt 2> /root/log_err.txt
        nvidia-smi -L >> /root/log.txt 2> /root/log_err.txt
        nvidia-smi >> /root/log.txt 2> /root/log_err.txt
        nvcc -V >> /root/log.txt 2> /root/log_err.txt
        cp -r  /usr/local/cuda-$cudav/samples/   ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
        cd ~/NVIDIA_CUDA-"$cudav"_Samples >> /root/log.txt 2> /root/log_err.txt
        time make -j$(grep process /proc/cpuinfo | wc -l) >> /root/log.txt 2> /root/log_err.txt
      ;;
      *)
    ;;
    esac
  else
    echo ""
    echo The CUDA has already been installed.
fi

echo ""
sleep 3
echo ""

### 3. CUDNN 설치 및 PATH 설정
updatedb
locate libcudnn  &> /dev/null
if [ $? != 0 ]
  then
    case $OS in
      centos7 )
        echo ""
        echo libcudnn Install Start
        case $cudav
          10.0 | 10.1 | 10.2 )
            yum -y install libcudnn7* >> /root/log.txt 2> /root/log_err.txt
            yum -y upgrade >> /root/log.txt 2> /root/log_err.txt
          ;;
          11.0 )
            yum -y install libcudnn8* >> /root/log.txt 2> /root/log_err.txt
            yum -y upgrade >> /root/log.txt 2> /root/log_err.txt
          ;;
          *)
            echo ""
            echo CUDA version is not correct
          ;;
        esac
      ;;
      centos8 )
        ## CentOS8 은 저장소에 libcudnn8만 존재함
        echo ""
        echo libcudnn Install Start
        dnf -y install libcudnn8*   >> /root/log.txt 2> /root/log_err.txt
        dnf -y install libnccl* >> /root/log.txt 2> /root/log_err.txt
      ;;
      ubuntu1604 | ubuntu1804 )
        echo ""
        echo libcudnn Install Start
        case $cudav
          10.0 | 10.1 | 10.2 )
            apt-get -y install libcudnn7* >> /root/log.txt 2> /root/log_err.txt
            apt-get install -y libcublas-dev
          ;;
          11.0 )
            apt-get -y install libcudnn8* >> /root/log.txt 2> /root/log_err.txt
            apt-get install -y libcublas-dev
          ;;
          *)
            echo ""
            echo CUDA version is not correct
          ;;
        esac
      ;;
      ubuntu2004 )
        ## Ubuntu20.04 는 저장소에 libcudnn8만 존재함
        echo ""
        echo libcudnn Install Start
        apt-get -y install libcudnn8* >> /root/log.txt 2> /root/log_err.txt
      ;;
      *)
    ;;
    esac
  else
    echo ""
    echo The CUDNN has already been installed.
fi

echo ""
sleep 3
echo ""

### 4. 딥러닝 패키지 설치(R,R Server, JupyterHub, Pycharm)

updatedb
locate rstudio  &> /dev/null
if [ $? != 0 ]
  then
    case $OS in
      centos7 | centos8 )
        echo ""
        echo Deep Learnig Package Install Start
          # R,R-sutdio install
          wget https://download1.rstudio.org/desktop/centos7/x86_64/rstudio-1.2.5033-x86_64.rpm
          rpm -ivh rstudio-1.2.5033-x86_64.rpm
          wget https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-1.2.5033-x86_64.rpm
          rpm -ivh rstudio-server-rhel-1.2.5033-x86_64.rpm
          yum install -y R
          # JupyterHub install
          curl --silent --location https://rpm.nodesource.com/setup_10.x | sudo bash -
          yum install -y nodejs
          npm install -g configurable-http-proxy
          mkdir /etc/jupyterhub
          jupyterhub --generate-config
          mv jupyterhub_config.py /etc/jupyterhub/
          sed -i '356a c.JupyterHub.port = 8000' /etc/jupyterhub/jupyterhub_config.py
          sed -i '358a c.LocalAuthenticator.create_system_users = True' /etc/jupyterhub/jupyterhub_config.py
          sed -i '359a c.Authenticator.add_user_cmd = ['adduser', '--force-badname', '-q', '--gecos', '""', '--disabled-password']' /etc/jupyterhub/jupyterhub_config.py
          sed -i '384a c.JupyterHub.proxy_class = 'jupyterhub.proxy.ConfigurableHTTPProxy'' /etc/jupyterhub/jupyterhub_config.py
          sed -i '824a c.Authenticator.admin_users = {"sonic"}' /etc/jupyterhub/jupyterhub_config.py
          rm -rf cuda-repo-rhel7-10.0.130-1.x86_64.rpm rstudio-1.2.5033-x86_64.rpm rstudio-server-rhel-1.2.5033-x86_64.rpm r_jupyterhub.Rout
      ;;
      centos8 )
          # Pycharm install
          systemctl enable --now snapd.socket
          ln -s /var/lib/snapd/snap /snap
          systemctl restart snapd.socket
          sleep 2
          snap install pycharm-community --classic
          # R,R-studio Install
          wget https://download2.rstudio.org/server/centos8/x86_64/rstudio-server-rhel-1.3.959-x86_64.rpm
          dnf install -y rstudio-server-rhel-1.3.959-x86_64.rpm
          dnf install -y libRmath-devel R-rpm-macros java-devel libRmath libgfortran.so.5 libopenblas.so.0 libquadmath.so.0 libtcl8.6.so libtk8.6.so
          dnf config-manager --set-enabled PowerTools
          dnf install -y R
          systemctl restart rstudio-server.service
          # JupyterHub Install
          dnf install -y nodejs
          npm install -g configurable-http-proxy
      ;;
      ubuntu1604 )
        echo ""
        echo Deep Learnig Package Install Start
        apt-get install -y dkms linux-generic-hwe-16.04 xserver-xorg-hwe-16.04
        # R server install
        apt-get install -y  r-base gdebi-core
        wget https://download2.rstudio.org/server/trusty/amd64/rstudio-server-1.2.5019-amd64.deb
        yes | gdebi rstudio-server-1.2.5019-amd64.deb
        wget https://download1.rstudio.org/desktop/xenial/amd64/rstudio-1.2.5019-amd64.deb
        dpkg -i rstudio-1.2.5019-amd64.deb
        apt-get install -y  rdesktop
        # JupyterHub install
        curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - 
        apt-get install -y  nodejs default-jre
        npm install -g configurable-http-proxy
        # Pycharm install
        snap install pycharm-community --classic
        rm -rf 7fa2af80.pub cuda-repo-ubuntu1604_10.0.130-1_amd64.deb rstudio-1.2.5019-amd64.deb rstudio-server-1.2.5019-amd64.deb

      ;;
      ubuntu1804 )
        echo ""
        echo Deep Learnig Package Install Start
          apt-get install -y dkms linux-generic-hwe-18.04 xserver-xorg-hwe-18.04
          # R Server install
          apt-get install -y  r-base gdebi-core
          wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.2.5019-amd64.deb
          yes | gdebi rstudio-server-1.2.5019-amd64.deb
          wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.5019-amd64.deb
          dpkg -i rstudio-1.2.5019-amd64.deb
          apt-get install -y  rdesktop
          # JupyterHub install
          curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
          apt-get install -y  nodejs default-jre
          npm install -g configurable-http-proxy
          mkdir /etc/jupyterhub
          jupyterhub --generate-config -f /etc/jupyterhub/jupyterhub_config.py
          sed -i '356a c.JupyterHub.port = 8000' /etc/jupyterhub/jupyterhub_config.py
          sed -i '358a c.LocalAuthenticator.create_system_users = True' /etc/jupyterhub/jupyterhub_config.py
          sed -i '359a c.Authenticator.add_user_cmd = ['adduser', '--force-badname', '-q', '--gecos', '""', '--disabled-password']' /etc/jupyterhub/jupyterhub_config.py
          sed -i '384a c.JupyterHub.proxy_class = 'jupyterhub.proxy.ConfigurableHTTPProxy'' /etc/jupyterhub/jupyterhub_config.py
          sed -i '824a c.Authenticator.admin_users = {"sonic"}' /etc/jupyterhub/jupyterhub_config.py
          # pycharm install
          snap install pycharm-community --classic
          sed -i "5s/networkd/NetworkManager/" /etc/netplan/01-netcfg.yaml
          systemctl enable network-manager.service
          rm -rf 7fa2af80.pub cuda-repo-ubuntu1804_10.0.130-1_amd64.deb rstudio-1.2.5019-amd64.deb rstudio-server-1.2.5019-amd64.deb
      ;;
      ubuntu2004 )
        echo ""
        echo Deep Learnig Package Install Start
        # R Server install
        apt-get install -y r-base
        apt-get install -y gdebi-core
        wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.1073-amd64.deb
        yes | gdebi rstudio-server-1.3.1073-amd64.deb
        # JupyterHub install
        curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
        apt-get install -y nodejs default-jre
        npm install -g configurable-http-proxy
        # Pycharm install
        snap install pycharm-community --classic
      ;;
      *)
    ;;
    esac
  else
    echo ""
    echo The CUDNN has already been installed.
fi

echo ""
sleep 3
echo ""

# JupyterHub 설정파일 복사 (파일 코드가 길어서 복사로 진행)
ll /lib/systemd/system/jupyterhub.service  &> /dev/null
if [ $? != 0]
then
  ## jupyter hub service 설정 파일 복사
  mv /root/LISR/jupyterhub.service /lib/systemd/system/
  mv /root/LISR/jupyterhub /etc/init.d/
  chmod 777 /lib/systemd/system/jupyterhub.service
  chmod 755 /etc/init.d/jupyterhub
  systemctl daemon-reload
  systemctl enable jupyterhub.service
  systemctl restart jupyterhub.service
  R CMD BATCH /root/LISR/r_jupyterhub.R
else
  echo ""
fi

echo ""
sleep 3
echo ""

## MOTD 진행 (CentOS7,Ubuntu16.04 제외)

ll /opt/motd &> /dev/null
if [ $? != 0]
then
  case $OS in
    ubuntu1804 | ubuntu2004 | centos8 )
    mv /root/LISR/motd/ /opt/
    chmod -R 777 /opt/motd/
    echo "#Motd add" >> /etc/profile
    echo "bash /opt/motd/motd.sh" >> /etc/profile
    ;;
    *)
      echo ""
      echo $OS is not supported
    ;;
  esac
else
  echo ""
fi

echo ""
sleep 3
echo ""

#### Server만 아래 스크립트 진행 #####
dmidecode | grep -i ipmi &> /dev/null
if [ $? != 0 ]
then
# rc.local 기본 값으로 변경
  echo ""
  echo "Complete basic setup"
  sed -i '/root/d' /etc/rc.local
  reboot
else
  echo ""
  echo Server Package Install Start.
fi

echo ""
sleep 3
echo ""

### 6. Mailutils 설정

ll /usr/local/sbin/dasan_variable.sh &> /dev/null
if [ $? != 0]
then
# 메일 발송을 위한 변수 설정



  case $OS in
    centos7 | centos8 )
    grep inet_protocols   /etc/postfix/main.cf
    sed -i  's/inet_protocols = all/inet_protocols = ipv4/' /etc/postfix/main.cf
    grep inet_protocols   /etc/postfix/main.cf
    systemctl restart postfix
    echo "Test of SMTP... OK." | mail -s $TITLE_TAIL $ADMIN_LOG_EMAIL
    ;;
    ubuntu1604 | ubuntu1804 | ubuntu2004 )
    grep "inet_interfaces\|inet_protocols" /etc/postfix/main.cf
    perl -pi -e 's/^inet_protocols = all/inet_protocols = ipv4/'  /etc/postfix/main.cf
    grep inet_protocols  /etc/postfix/main.cf
    grep 'mynetworks = '   /etc/postfix/main.cf
    perl -pi -e 's/^mynetworks/#mynetworks/'   /etc/postfix/main.cf
    grep  'mynetworks = '   /etc/postfix/main.cf
    systemctl restart postfix
    ;;
    *)
    ;;
  esac
else
echo ""
fi

echo ""
sleep 3
echo ""

### 7. Dell 전용 OMSA설치

cat /etc/yum.repos.d/CentOS-Base.repo | grep libsmbios  &> /dev/null
if [ $? != 0 ]
then
  case $OS in
    centos7 | centos8 )
      perl -p -i -e '$.==20 and print "exclude = libsmbios smbios-utils-bin\n"' /etc/yum.repos.d/CentOS-Base.repo
      wget http://linux.dell.com/repo/hardware/dsu/bootstrap.cgi -O  ./dellomsainstall.sh
      sed -i -e "s/enabled=1/enabled=0/g" ./dellomsainstall.sh
      bash ./dellomsainstall.sh
      rm -f ./dellomsainstall.sh
      yum -y erase  tog-pegasus-libs
      yum -y install --enablerepo=dell-system-update_dependent -y  srvadmin-all openssl-devel
    ;;
    ubuntu1604)
      echo 'deb http://linux.dell.com/repo/community/openmanage/911/xenial xenial main'  >  /etc/apt/sources.list.d/linux.dell.com.sources.list
      wget http://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc
      apt-key add 0x1285491434D8786F.asc
      apt-get  -y update
      apt-get  -y  install srvadmin-all
    ;;
    ubuntu1804 )
      echo 'deb http://linux.dell.com/repo/community/openmanage/940/bionic bionic main'  > /etc/apt/sources.list.d/linux.dell.com.sources.list
      wget http://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc
      apt-key add 0x1285491434D8786F.asc
      apt-get  -y update
      apt-get  -y  install srvadmin-all
      cd /usr/lib/x86_64-linux-gnu/
      ln -s /usr/lib/x86_64-linux-gnu/libssl.so.1.1 libssl.so
      cd
    ;;
    ubuntu2004 )
      echo 'deb http://linux.dell.com/repo/community/openmanage/950/focal focal main'  > /etc/apt/sources.list.d/linux.dell.com.sources.list
      wget http://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc
      apt-key add 0x1285491434D8786F.asc
      apt-get  -y update
      apt-get  -y  install srvadmin-all
      cd /usr/lib/x86_64-linux-gnu/
      ln -s /usr/lib/x86_64-linux-gnu/libssl.so.1.1 libssl.so
      cd
    ;;
    *)
    ;;
  esac
  ### 시스템이 시작될 때 관련 서비스가 실행 되도록 설정 (systemctl enable) ###
  systemctl enable dataeng
  systemctl enable dsm_om_connsvc
  systemctl start dataeng
  systemctl start dsm_om_connsvc
else
fi

echo ""
sleep 3
echo ""

## OMSA 메일발송 sh 작성



### 8. 서버 전용 MSM 설치