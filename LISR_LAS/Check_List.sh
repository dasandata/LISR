#!/bin/sh
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr

OSCHECK=$(cat /etc/os-release | head -1 | cut -d "=" -f 2 | tr -d "\"" | awk '{print$1}' | tr '[A-Z]' '[a-z]')
VENDOR=$(dmidecode | grep -i manufacturer | awk '{print$2}' | head -1)

echo ""  | tee -a /root/Auto_Install_Log.txt
echo "You have run Check List Script"  | tee -a /root/Auto_Install_Log.txt
echo "Copyright by Dasandata.co.ltd"  | tee -a /root/Auto_Install_Log.txt
echo "https://www.dasandata.co.kr"  | tee -a /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
# nouveau 끄기 및 grub 설정
echo "##### 1. Nouveau, GRUB Check Start #####"  | tee -a /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "=== IPv6 disable,splash quiet remove check ===" | tee -a /root/Auto_Install_Log.txt
cat /etc/default/grub | grep LINUX  >> /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "=== blacklist nouveau check ===" | tee -a /root/Auto_Install_Log.txt
cat /etc/modprobe.d/blacklist.conf | grep "blacklist nouveau"  >> /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "=== options nouveau modeset=0 check ===" | tee -a /root/Auto_Install_Log.txt
cat /etc/modprobe.d/blacklist.conf | grep "options nouveau modeset=0"  >> /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### Nouveau, GRUB Check Complete #####"  | tee -a /root/Auto_Install_Log.txt
echo "" | tee -a /root/Auto_Install_Log.txt
sleep 3

# selinux 제거 및 저장소 변경 
case $OSCHECK in 
    centos )
        echo ""  | tee -a /root/Auto_Install_Log.txt
        echo "##### 2. SELINUX Check #####"  | tee -a /root/Auto_Install_Log.txt
        echo ""  | tee -a /root/Auto_Install_Log.txt
        echo "=== selinux = disable ==="  | tee -a /root/Auto_Install_Log.txt
        getenforce  >> /root/Auto_Install_Log.txt
        cat /etc/selinux/config | grep "^SELINUX="  >> /root/Auto_Install_Log.txt
        echo ""  | tee -a /root/Auto_Install_Log.txt
        echo "##### SELINUX Check Complete #####"  | tee -a /root/Auto_Install_Log.txt
    ;;
    ubuntu )
        echo ""  | tee -a /root/Auto_Install_Log.txt
        echo "##### 2. Repository Check #####"  | tee -a /root/Auto_Install_Log.txt
        echo ""  | tee -a /root/Auto_Install_Log.txt
        echo "=== mirror.kakao.com ==="  | tee -a /root/Auto_Install_Log.txt
        cat /etc/apt/sources.list | grep -v "#\|^$" | head -3  >> /root/Auto_Install_Log.txt
        echo ""  | tee -a /root/Auto_Install_Log.txt
        echo "##### Repository Check Complete #####"  | tee -a /root/Auto_Install_Log.txt
    ;;
    *)
    ;;
esac

sleep 3

# 기본 패키지 설치
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### 3. Pacakage Install Check #####"  | tee -a /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
case $OSCHECK in 
    centos )
        echo "=== Kernel Version Check ==="  | tee -a /root/Auto_Install_Log.txt
        uname -r  >> /root/Auto_Install_Log.txt
        echo "" | tee -a /root/Auto_Install_Log.txt
        echo "=== epel,htop install ? ==="  | tee -a /root/Auto_Install_Log.txt
        rpm -qa | grep htop  >> /root/Auto_Install_Log.txt
        echo "" | tee -a /root/Auto_Install_Log.txt
        echo "=== kernel-headers version Check ==="  | tee -a /root/Auto_Install_Log.txt
        rpm -qa | grep kernel-headers  >> /root/Auto_Install_Log.txt
        echo "" | tee -a /root/Auto_Install_Log.txt
        echo "=== kernel-devel version Check ==="  | tee -a /root/Auto_Install_Log.txt
        rpm -qa | grep kernel-devel  >> /root/Auto_Install_Log.txt
        echo "" | tee -a /root/Auto_Install_Log.txt
    ;;
    ubuntu )
        echo "=== Kernel Version Check ==="  | tee -a /root/Auto_Install_Log.txt
        uname -r  >> /root/Auto_Install_Log.txt
        echo "" | tee -a /root/Auto_Install_Log.txt
        echo "=== epel,htop install ? ==="  | tee -a /root/Auto_Install_Log.txt
        dpkg -l | grep htop  >> /root/Auto_Install_Log.txt
        echo "" | tee -a /root/Auto_Install_Log.txt
        echo "=== kernel-headers Version Check ==="  | tee -a /root/Auto_Install_Log.txt
        dpkg -l | grep -i linux-headers  >> /root/Auto_Install_Log.txt
        echo "" | tee -a /root/Auto_Install_Log.txt
    ;;
    *)
    ;;
esac
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### Pacakage Check Complete #####"  | tee -a /root/Auto_Install_Log.txt

sleep 3

# 프로필 설정
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### 4. Profile Check #####"  | tee -a /root/Auto_Install_Log.txt
case $OSCHECK in 
    centos )
        sed -n "77,\$p"  /etc/profile  >> /root/Auto_Install_Log.txt
    ;;
    ubuntu )
        sed -n "28,\$p"  /etc/profile  >> /root/Auto_Install_Log.txt
    ;;
    *)
    ;;
esac
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### Profile Check Complete #####"  | tee -a /root/Auto_Install_Log.txt

sleep 3

# 서버 시간 동기화
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### 5. Time Check #####"  | tee -a /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "=== Time ==="  | tee -a /root/Auto_Install_Log.txt
date  >> /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "=== H/W Time ==="  | tee -a /root/Auto_Install_Log.txt
hwclock  >> /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### Time Check Complete #####"  | tee -a /root/Auto_Install_Log.txt

sleep 3

# 파이썬 확인
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### 6. Python Version Check #####"  | tee -a /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
/usr/bin/python3 -V >> /root/Auto_Install_Log.txt
sleep 3
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### Python Version Check Complete #####"  | tee -a /root/Auto_Install_Log.txt

sleep 3

# 파이썬 패키지 확인
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### 7. Python Pacakage Install Check #####"  | tee -a /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
pip list  >> /root/Auto_Install_Log.txt
sleep 3
echo ""  | tee -a /root/Auto_Install_Log.txt
pip3 list >> /root/Auto_Install_Log.txt
sleep 3
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### Python Pacakage Check Complete #####"  | tee -a /root/Auto_Install_Log.txt

sleep 3

# 방화벽 설정
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### 8. Firewall Check #####"  | tee -a /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
case $OSCHECK in 
    centos )
        echo "=== firewall service Check ==="  | tee -a /root/Auto_Install_Log.txt
        systemctl status firewalld  >> /root/Auto_Install_Log.txt
        echo ""  | tee -a /root/Auto_Install_Log.txt
        echo "=== firewall port Check ==="  | tee -a /root/Auto_Install_Log.txt
        firewall-cmd --list-all >> /root/Auto_Install_Log.txt
    ;;
    ubuntu )
        echo "=== firewall service Check ==="  | tee -a /root/Auto_Install_Log.txt
        systemctl status ufw  >> /root/Auto_Install_Log.txt
        echo ""  | tee -a /root/Auto_Install_Log.txt
        echo "=== firewall port Check ==="  | tee -a /root/Auto_Install_Log.txt
        ufw status  >> /root/Auto_Install_Log.txt
    ;;
    *)
    ;;
esac
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### Firewall Check Complete #####"  | tee -a /root/Auto_Install_Log.txt

sleep 3

# 사용자 생성 테스트
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### 9. User Add Check Start #####"  | tee -a /root/Auto_Install_Log.txt
cat /etc/passwd | grep dasan  >> /root/Auto_Install_Log.txt
cat /etc/shadow | grep dasan  >> /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### User Add Check Complete #####"  | tee -a /root/Auto_Install_Log.txt

sleep 3

# H/W 사양 체크
echo ""  | tee -a /root/Auto_Install_Log.txt
cat /root/HWcheck.txt  >> /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### H/W Check Complete #####"  | tee -a /root/Auto_Install_Log.txt

sleep 3

# MegaRaid Storage Manager 설치
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### 11. MSM Install Check Start #####"  | tee -a /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
ls /usr/local/MegaRAID\ Storage\ Manager/  | grep startupui >> /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### MSM Check Complete #####"  | tee -a /root/Auto_Install_Log.txt

sleep 3

# Dell OMSA 설치
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### 12. OMSA Install Check Start #####"  | tee -a /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
racadm get system.ServerInfo  >> /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### OMSA Check Complete #####"  | tee -a /root/Auto_Install_Log.txt

# GPU 존재 여부에 따라 아래 체크리스트 실행
lspci | grep -i nvidia  &> /dev/null
if [ $? != 0 ]
then
    echo ""  | tee -a /root/Auto_Install_Log.txt
    echo "##### Check List Complete #####"  | tee -a /root/Auto_Install_Log.txt
    case $OSCHECK in 
        centos )
            sed -i '/root/d' /etc/rc.d/rc.local
            sleep 3
            rm -f nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm cuda-repo-rhel8-10.2.89-1.x86_64.rpm
            sleep 3
            systemctl restart rc-local.service
            exit 0
        ;;
        ubuntu )
            sleep 3
            sed -i '/root/d' /etc/rc.local 
            sleep 3
            systemctl restart rc-local.service
            exit 0
        ;;
        *)
        ;;
    esac
else
    echo ""  | tee -a /root/Auto_Install_Log.txt
    echo "##### GPU Check List Start #####"  | tee -a /root/Auto_Install_Log.txt
fi


sleep 3

# CUDA,CUDNN Repo 설치
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### 13. CUDA, CUDNN Repo Check Start #####"  | tee -a /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
case $OSCHECK in 
    centos )
        rpm -qa | grep nvidia  >> /root/Auto_Install_Log.txt
        sleep 3
        rpm -qa | grep cuda  >> /root/Auto_Install_Log.txt
        sleep 3
    ;;
    ubuntu )
        ls /etc/apt/sources.list.d/  >> /root/Auto_Install_Log.txt
        sleep 3
    ;;
    *)
    ;;
esac
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### CUDA, CUDNN Repo Complete #####"  | tee -a /root/Auto_Install_Log.txt

sleep 3

# CUDA 설치 및 PATH 설정
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### 14. CUDA, CUDNN  Install Check Start #####"  | tee -a /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "=== Nvidia Driver Check ==="  | tee -a /root/Auto_Install_Log.txt
nvidia-smi  >> /root/Auto_Install_Log.txt
sleep 3
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "=== GPU Install Check ==="  | tee -a /root/Auto_Install_Log.txt
nvidia-smi -L  >> /root/Auto_Install_Log.txt
sleep 3
nvidia-smi  -a | grep "Serial Number" >> /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
sleep 3
echo "=== CUDA version Check ==="  | tee -a /root/Auto_Install_Log.txt
nvcc -V  >> /root/Auto_Install_Log.txt
sleep 3
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "=== CUDA Version Check Complete ==="  | tee -a /root/Auto_Install_Log.txt

sleep 3

# CUDNN 설치 및 PATH 설정
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "=== CUDNN Install Check Start ==="  | tee -a /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
case $OSCHECK in 
    centos )
        rpm -qa | grep libcudnn*  >> /root/Auto_Install_Log.txt
        sleep 3
    ;;
    ubuntu )
        dpkg -l | grep libcudnn*  >> /root/Auto_Install_Log.txt
        sleep 3
    ;;
    *)
    ;;
esac
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "=== CUDNN Check Complete ==="  | tee -a /root/Auto_Install_Log.txt
echo "##### CUDA, CUDNN Install Check Complete #####"  | tee -a /root/Auto_Install_Log.txt
sleep 3

# 딥러닝 패키지 설치(R,R Server, JupyterHub, Pycharm)
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### 15. Deep Learning Install Check Start #####"  | tee -a /root/Auto_Install_Log.txt
echo ""  | tee -a /root/Auto_Install_Log.txt
case $OSCHECK in 
    centos )
        echo "=== R,R-Server Check ==="  | tee -a /root/Auto_Install_Log.txt
        rpm -qa | grep rstudio  >> /root/Auto_Install_Log.txt
        sleep 3
        rpm -qa | grep r-base  >> /root/Auto_Install_Log.txt
        sleep 3
        echo ""  | tee -a /root/Auto_Install_Log.txt
        echo "=== JupyterHUB service Check ==="  | tee -a /root/Auto_Install_Log.txt
        systemctl status jupyterhub.service  >> /root/Auto_Install_Log.txt
    ;;
    ubuntu )
        echo "=== R,R-Server Check ==="  | tee -a /root/Auto_Install_Log.txt
        dpkg -l | grep rstudio  >> /root/Auto_Install_Log.txt
        sleep 3
        dpkg -l | grep r-base  >> /root/Auto_Install_Log.txt
        sleep 3
        echo ""  | tee -a /root/Auto_Install_Log.txt
        echo "=== JupyterHUB service Check ==="  | tee -a /root/Auto_Install_Log.txt
        systemctl status jupyterhub.service  >> /root/Auto_Install_Log.txt
    ;;
    *)
    ;;
esac
echo ""  | tee -a /root/Auto_Install_Log.txt
echo "##### Deep Learning Check Complete #####"  | tee -a /root/Auto_Install_Log.txt

sleep 3

echo ""
case $OSCHECK in 
    centos )
        echo "##### GPU Check List Complete #####"  | tee -a /root/Auto_Install_Log.txt
        sed -i '/root/d' /etc/rc.d/rc.local
        sleep 3
        rm -f nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm cuda-repo-rhel8-10.2.89-1.x86_64.rpm
        sleep 3
        systemctl restart rc-local.service
        exit 0
    ;;
    ubuntu )
        echo "##### GPU Check List Complete #####"  | tee -a /root/Auto_Install_Log.txt
        sed -i '/root/d' /etc/rc.local
        sleep 3
        systemctl restart rc-local.service
        exit 0
    ;;
    *)
    ;;
esac