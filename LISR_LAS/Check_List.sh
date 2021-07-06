#!/bin/sh
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr

# LAS 가 정상적으로 작동하였는지 체크
OSCHECK=$(cat /etc/os-release | head -1 | cut -d "=" -f 2 | tr -d "\"" | awk '{print$1}' | tr '[A-Z]' '[a-z]')
VENDOR=$(dmidecode | grep -i manufacturer | awk '{print$2}' | head -1)

echo "You have run Check List Script"  | tee -a /root/LAS_Install_Log.txt
echo "Copyright by Dasandata.co.ltd"  | tee -a /root/LAS_Install_Log.txt
echo "http://www.dasandata.co.kr"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt

# nouveau 끄기 및 grub 설정
echo "Nouveau, GRUB Check"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
cat /etc/default/grub | grep LINUX  >> /root/LAS_Install_Log.txt
cat /etc/modprobe.d/blacklist.conf | grep "blacklist nouveau"  >> /root/LAS_Install_Log.txt
cat /etc/modprobe.d/blacklist.conf | grep "options nouveau modeset=0"  >> /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "Nouveau, GRUB Check Complete"  | tee -a /root/LAS_Install_Log.txt

sleep 1

# selinux 제거 및 저장소 변경 
case $OSCHECK in 
    centos )
        echo ""  | tee -a /root/LAS_Install_Log.txt
        echo "SELINUX Check"  | tee -a /root/LAS_Install_Log.txt
        echo ""  | tee -a /root/LAS_Install_Log.txt
        echo "getenforce"  | tee -a /root/LAS_Install_Log.txt
        getenforce  >> /root/LAS_Install_Log.txt
        cat /etc/selinux/config | grep "^SELINUX="  >> /root/LAS_Install_Log.txt
        echo ""  | tee -a /root/LAS_Install_Log.txt
        echo "SELINUX Check Complete"  | tee -a /root/LAS_Install_Log.txt
    ;;
    ubuntu )
        echo ""  | tee -a /root/LAS_Install_Log.txt
        echo "Repository Check"  | tee -a /root/LAS_Install_Log.txt
        echo ""  | tee -a /root/LAS_Install_Log.txt
        cat /etc/apt/sources.list | grep -v "#\|^$" | head -3  >> /root/LAS_Install_Log.txt
        echo ""  | tee -a /root/LAS_Install_Log.txt
        echo "Repository Check Complete"  | tee -a /root/LAS_Install_Log.txt
    ;;
    *)
    ;;
esac

sleep 1

# 기본 패키지 설치
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "Pacakage Install Check"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
case $OSCHECK in 
    centos )
        uname -r  >> /root/LAS_Install_Log.txt
        rpm -qa | grep htop  >> /root/LAS_Install_Log.txt
        rpm -qa | grep kernel-headers  >> /root/LAS_Install_Log.txt
        rpm -qa | grep kernel-devel  >> /root/LAS_Install_Log.txt
    ;;
    ubuntu )
        uname -r  >> /root/LAS_Install_Log.txt
        dpkg -l | grep htop  >> /root/LAS_Install_Log.txt
        dpkg -l | grep -i linux-headers  >> /root/LAS_Install_Log.txt
    ;;
    *)
    ;;
esac
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "Pacakage Check Complete"  | tee -a /root/LAS_Install_Log.txt

sleep 1

# 프로필 설정
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "Profile Check"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
case $OSCHECK in 
    centos )
        sed -n "77,\$p"  /etc/profile  >> /root/LAS_Install_Log.txt
    ;;
    ubuntu )
        sed -n "28,\$p"  /etc/profile  >> /root/LAS_Install_Log.txt
    ;;
    *)
    ;;
esac
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "Profile Check Complete"  | tee -a /root/LAS_Install_Log.txt

sleep 1

# 서버 시간 동기화
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "Time Check"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
date  >> /root/LAS_Install_Log.txt
hwclock  >> /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "Time Check Complete"  | tee -a /root/LAS_Install_Log.txt

sleep 1

# 파이썬 설치
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "Python Install Check"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
python3 -V  >> /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "Python Install Check Complete"  | tee -a /root/LAS_Install_Log.txt

sleep 1

# 파이썬 패키지 설치
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "Python Pacakage Install Check"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
pip list >> /root/LAS_Install_Log.txt
pip list >> /root/LAS_Install_Log.txt
pip3 list >> /root/LAS_Install_Log.txt
pip3 list >> /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "Python Pacakage Check Complete"  | tee -a /root/LAS_Install_Log.txt

sleep 1

# 방화벽 설정
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "Firewall Check"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
case $OSCHECK in 
    centos )
        systemctl status firewalld  >> /root/LAS_Install_Log.txt
        echo ""  | tee -a /root/LAS_Install_Log.txt
        firewall-cmd --list-all  >> /root/LAS_Install_Log.txt
    ;;
    ubuntu )
        systemctl status ufw  >> /root/LAS_Install_Log.txt
        echo ""  | tee -a /root/LAS_Install_Log.txt
        ufw status  >> /root/LAS_Install_Log.txt
    ;;
    *)
    ;;
esac
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "Firewall Check Complete"  | tee -a /root/LAS_Install_Log.txt

sleep 1

# 사용자 생성 테스트
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "User Add Check Start"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
cat /etc/passwd | grep dasan  >> /root/LAS_Install_Log.txt
cat /etc/shadow | grep dasan  >> /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "User Add Check Complete"  | tee -a /root/LAS_Install_Log.txt

sleep 1

# H/W 사양 체크
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "H/W Check Start"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
cat /root/hwcheck.txt  >> /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "H/W Check Complete"  | tee -a /root/LAS_Install_Log.txt

sleep 1

# GPU 존재 여부에 따라 아래 체크리스트 실행
nvidia-smi &> /dev/null
if [ $? != 0 ]
then
    echo ""  | tee -a /root/LAS_Install_Log.txt
    echo "Check List Complete"  | tee -a /root/LAS_Install_Log.txt
    case $OSCHECK in 
        centos )
            sed -i '/root/d' /etc/rc.d/rc.local
            rm -f cudaversion.txt nvidia.txt
            rm -f nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm cuda-repo-rhel8-10.2.89-1.x86_64.rpm
            exit 5
        ;;
        ubuntu )
            sed -i '/root/d' /etc/rc.local
            rm -f cudaversion.txt nvidia.txt
            exit 5
        ;;
        *)
        ;;
    esac
else
    echo ""  | tee -a /root/LAS_Install_Log.txt
    echo "GPU Check List Start"  | tee -a /root/LAS_Install_Log.txt
fi


sleep 1

# CUDA,CUDNN Repo 설치
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "CUDA, CUDNN Repo Check Start"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
case $OSCHECK in 
    centos )
        rpm -qa | grep nvidia  >> /root/LAS_Install_Log.txt
        rpm -qa | grep cuda-repo  >> /root/LAS_Install_Log.txt
    ;;
    ubuntu )
        ls /etc/apt/sources.list.d/  >> /root/LAS_Install_Log.txt
    ;;
    *)
    ;;
esac
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "CUDA, CUDNN Repo Complete"  | tee -a /root/LAS_Install_Log.txt

sleep 1

# CUDA 설치 및 PATH 설정
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "CUDA Install Check Start"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
nvidia-smi  >> /root/LAS_Install_Log.txt
nvidia-smi -L  >> /root/LAS_Install_Log.txt
which nvcc  >> /root/LAS_Install_Log.txt
nvcc -V  >> /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "CUDA Check Complete"  | tee -a /root/LAS_Install_Log.txt

sleep 1

# CUDNN 설치 및 PATH 설정
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "CUDNN Install Check Start"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
case $OSCHECK in 
    centos )
        rpm -qa | grep libcudnn*  >> /root/LAS_Install_Log.txt
    ;;
    ubuntu )
        dpkg -l | grep libcudnn*  >> /root/LAS_Install_Log.txt
    ;;
    *)
    ;;
esac
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "CUDNN Check Complete"  | tee -a /root/LAS_Install_Log.txt

sleep 1

# 딥러닝 패키지 설치(R,R Server, JupyterHub, Pycharm)
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "Deep Learning Install Check Start"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
case $OSCHECK in 
    centos )
        rpm -qa | grep rstudio  >> /root/LAS_Install_Log.txt
        rpm -qa | grep r-base  >> /root/LAS_Install_Log.txt
        systemctl enable jupyterhub.service  >> /root/LAS_Install_Log.txt
    ;;
    ubuntu )
        dpkg -l | grep rstudio  >> /root/LAS_Install_Log.txt
        dpkg -l | grep r-base  >> /root/LAS_Install_Log.txt
        systemctl enable jupyterhub.service  >> /root/LAS_Install_Log.txt
    ;;
    *)
    ;;
esac
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "Deep Learning Check Complete"  | tee -a /root/LAS_Install_Log.txt

sleep 1

# PC, WorkStation은 여기까지 체크 진행
dmidecode | grep -i ipmi &> /dev/null
if [ $? != 0 ]
then
    echo ""  | tee -a /root/LAS_Install_Log.txt
    echo "Check List Complete"  | tee -a /root/LAS_Install_Log.txt
    case $OSCHECK in 
        centos )
            sed -i '/root/d' /etc/rc.d/rc.local
            rm -f cudaversion.txt nvidia.txt
            rm -f nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm cuda-repo-rhel8-10.2.89-1.x86_64.rpm
            exit 10
        ;;
        ubuntu )
            sed -i '/root/d' /etc/rc.local
            rm -f cudaversion.txt nvidia.txt
            exit 10
        ;;
        *)
        ;;
    esac
else
    echo ""  | tee -a /root/LAS_Install_Log.txt
    echo "Server Check List Start"  | tee -a /root/LAS_Install_Log.txt
fi

sleep 1

# MegaRaid Storage Manager 설치
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "MSM Install Check Start"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
ls /usr/local/MegaRAID\ Storage\ Manager/  >> /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "MSM Check Complete"  | tee -a /root/LAS_Install_Log.txt

sleep 1

# Dell Server 체크 진행
if [ $VENDOR != "Dell" ]
then
    echo ""  | tee -a /root/LAS_Install_Log.txt
    echo "$VENDOR Server Check List Complete"  | tee -a /root/LAS_Install_Log.txt
        case $OSCHECK in 
        centos )
            sed -i '/root/d' /etc/rc.d/rc.local
            rm -f cudaversion.txt nvidia.txt
            rm -f nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm cuda-repo-rhel8-10.2.89-1.x86_64.rpm
            exit 15
        ;;
        ubuntu )
            sed -i '/root/d' /etc/rc.local
            rm -f cudaversion.txt nvidia.txt
            exit 15
        ;;
        *)
        ;;
    esac
else
    echo ""  | tee -a /root/LAS_Install_Log.txt
    echo "$VENDOR Server Check List Start"  | tee -a /root/LAS_Install_Log.txt
fi

sleep 1

# Dell OMSA 설치
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "OMSA Install Check Start"  | tee -a /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
systemctl status dataeng  >> /root/LAS_Install_Log.txt
echo ""  | tee -a /root/LAS_Install_Log.txt
echo "OMSA Check Complete"  | tee -a /root/LAS_Install_Log.txt

sleep 1

echo ""
echo "Check List Complete"
case $OSCHECK in 
    centos )
        sed -i '/root/d' /etc/rc.d/rc.local
        rm -f cudaversion.txt nvidia.txt
        rm -f nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm cuda-repo-rhel8-10.2.89-1.x86_64.rpm
    ;;
    ubuntu )
        sed -i '/root/d' /etc/rc.local
        rm -f cudaversion.txt nvidia.txt
    ;;
    *)
    ;;
esac
exit 20