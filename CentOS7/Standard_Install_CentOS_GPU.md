# 다산데이타 CentOS 7.6 설치 표준안 (2019.01)
다산데이터 출고 장비에 설치되는 리눅스 (CenOS 7.6) 의 설치 표준안 입니다.  
별도의 요청사항이 없는 경우 기본적으로 아래 절차에 따라 설치한 후 출고 하고 있습니다.  
보완이 필요한 점이나 새로운 아이디어를 제보해 주시면 적극 반영하겠습니다 :)  

감사합니다.  

![Dasandata Logo](http://www.dasandata.co.kr/dasanlogo.jpg)

## #목차
[1. Cuda install 사전 작업](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-1-%EA%B8%B0%EB%B3%B8-%EC%9C%A0%ED%8B%B8-%EC%84%A4%EC%B9%98--%EC%8B%9C%EA%B0%84-%EB%8F%99%EA%B8%B0%ED%99%94)  
[2. profile 설정 - Console Color , alias](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-2-profile-%EC%84%A4%EC%A0%95---console-color--alias)  
[3. 하드웨어 사양 / 기본 환경 확인 (os 버젼 등)](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-3-%ED%95%98%EB%93%9C%EC%9B%A8%EC%96%B4-%EC%82%AC%EC%96%91--%EA%B8%B0%EB%B3%B8-%ED%99%98%EA%B2%BD-%ED%99%95%EC%9D%B8-os-%EB%B2%84%EC%A0%BC-%EB%93%B1)  
[4. ip 및 hostname 정보 / 인터넷 연결 확인](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-4-ip-%EB%B0%8F-hostname-%EC%A0%95%EB%B3%B4--%EC%9D%B8%ED%84%B0%EB%84%B7-%EC%97%B0%EA%B2%B0-%ED%99%95%EC%9D%B8)   
[5. Desktop (X window) Install, not default](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-5-desktop-x-window-install-not-default)  
[6. ssh 및 방화벽 (Firewall)설정 / 보안강화 / X11 Forwading](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-6-ssh-%EB%B0%8F-%EB%B0%A9%ED%99%94%EB%B2%BD-firewall%EC%84%A4%EC%A0%95--%EB%B3%B4%EC%95%88%EA%B0%95%ED%99%94--x11-forwading)  
[7. 새로운 사용자 추가 / sudo 권한 부여](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-7-%EC%83%88%EB%A1%9C%EC%9A%B4-%EC%82%AC%EC%9A%A9%EC%9E%90-%EC%B6%94%EA%B0%80--sudo-%EA%B6%8C%ED%95%9C-%EB%B6%80%EC%97%AC)  
[8. 스토리지, 파티션 마운트 / lvm, UUID, LABEL](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-8-%EC%8A%A4%ED%86%A0%EB%A6%AC%EC%A7%80-%ED%8C%8C%ED%8B%B0%EC%85%98-%EB%A7%88%EC%9A%B4%ED%8A%B8--lvm-uuid-label)  
[9. Banner // login wellcome message ](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-9-banner--login-wellcome-message-)  
[10. VNC Server 설정](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-10-vnc-server-%EC%84%A4%EC%A0%95)  
[11. TeamViewer 설치](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-11-teamviewer-%EC%84%A4%EC%B9%98)  
[12. 부팅 되는 기본 커널 버젼 변경방법](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-12-%EB%B6%80%ED%8C%85-%EB%90%98%EB%8A%94-%EA%B8%B0%EB%B3%B8-%EC%BB%A4%EB%84%90-%EB%B2%84%EC%A0%BC-%EB%B3%80%EA%B2%BD%EB%B0%A9%EB%B2%95)  

[===== 장애 모니터링 =====](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#--%EC%9E%A5%EC%95%A0-%EB%AA%A8%EB%8B%88%ED%84%B0%EB%A7%81-)  
[20. SMTP for Email Alert (mailutils or mailx)](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-20-smtp-for-email-alert-mailutils-or-mailx)  
[21. SMTP for Email Alert (postfix for Dell RAID Manager)](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-21-smtp-for-email-alert-postfix-for-dell-raid-manager)  
[22. Dell OpenManage Server Administrator Install (OMSA)](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-22-dell-openmanage-server-administrator-install-omsa)  
[23. Dell OMSA - E-Mail Alert](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-23-dell-omsa---e-mail-alert)  
[24. Dell RAID Controller Management (MSM) + Alert by Email](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-24-dell-raid-controller-management-msm--alert-by-email)  
[25. 온도(temperature) 모니터 링. (ipmitool)](https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md#-25-%EC%98%A8%EB%8F%84temperature-%EB%AA%A8%EB%8B%88%ED%84%B0-%EB%A7%81-ipmitool)  

***

## # 범례(변수).
- <내용>: 상황에 따라 변경이 필요한 내용을 표현 합니다.  
- ${변수명} : 반복되어 사용되는 부분이 있을 때 사용되는 변수 입니다.  

## # 팁.
- 명령을 실행시킬때, 명령어 박스 단위로 복사하여 터미널에 붙여 넣으면 됩니다.  
- 박스가 분리되어 있는 경우 분리된 단위로 복사하여 붙여 넣어야 합니다.  

## # 리눅스 설치시 IP 와 HOSTNAME 은 수동으로 미리 설정 한다.
\# 처음 설치 할때부터 고정 IP를 설정하고 HOSTNAME을 정의 하는 것을 권장 합니다.  

### # 터미널을 통해 리눅스가 새로 설치된 장비에 로그인 합니다.

#### # Windows 에서 리눅스 접속 (putty) / X11 Forwading / 파일 송수신 (winscp)
\#  
\# putty (SSH Terminal - X11 Forwarding Enable)  
\# https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html  
\#  
\# Xming (X11 Forward - Windows Application)  
\# https://sourceforge.net/projects/xming/  
\#  
\# 파일 전송 winscp  
\# https://winscp.net/eng/download.php  
\#  
#### # 리눅스 터미널 에서.
```bash
ssh <사용자 계정>@<IP 주소>
```

### # 관리자(root) 로 전환.
```bash
# sudo -i
# 또는
# su -
```
### # sudo -i 와 su - 의 차이점
\# 1. sudo -i 는 sudo 권한이 있는 사용자가, 사용자의 암호를 사용해서 root 권한으로 명령을 실행 하는 것 입니다.  
\# root 의 패스워드를 몰라도 root 권한의 명령을 수행할 수 있습니다.  
\#  
\# 2. su -    는 sudo 권한과 관계 없이 root 의 암호를 사용해서 root 계정으로 전환 하는 것 입니다.    
\# 'su - ' 의 경우 재접속 없이 다른 사용자 계정으로 전환 할 수 있는 명령 이며 아래와 같이 실행 합니다.    
\# ex) su  -  <다른 사용자 계정이름>   

***

### # [1. Cuda install 사전 작업](#목차)

#### # nouveau disable

```bash
systemctl  get-default
systemctl set-default  multi-user.target

lsmod  | grep  nouveau

echo  "
blacklist nouveau
options nouveau modeset=0
"   >> /etc/modprobe.d/blacklist.conf

cat   /etc/modprobe.d/blacklist.conf

dracut  -f  
grub2-mkconfig  -o /boot/grub2/grub.cfg
```

##### # 사전작업 적용을 위한 재부팅
```bash
reboot
```

##### # nouveau 가 비활성 화 되었는지 확인.
```bash
lsmod | grep nouveau
```

##### # cuda-repo (cuda 저장소) 설치
```bash
curl  -L -o  cuda-repo-rhel7-9.0.176-1.x86_64.rpm \
>  http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-9.0.176-1.x86_64.rpm

yum -y install cuda-repo-rhel7-9.0.176-1.x86_64.rpm
```

##### # cuda repo 에서 설치가능한 패키지 목록 확인.
```bash
yum --disablerepo="*" --enablerepo="cuda" list available
```

##### # 쿠다 샘플 컴파일에 필요한 라이브러리 설치 ( libGLU.so libX11.so libXi.so libXmu.so 등)
```bash
yum -y install  libXi-devel mesa-libGLU-devel libXmu-devel libX11-devel freeglut-devel libXm* \
>  openmotif*
```

##### # cuda 9.0 설치 (드라이버도 함께 설치됨)
```bash
yum -y install cuda-9-0
```

##### # Nvidia Driver 동작 확인.
```bash
nvidia-smi -L

nvidia-smi
```

##### # Cuda 9.0 환경변수를 Profile 에 추가
```bash
echo  "export  PATH=/usr/local/cuda-9.0/bin/:\$PATH"   >> /etc/profile
echo  "export LD_LIBRARY_PATH=/usr/local/cuda-9.0/include/:/usr/local/cuda-9.0/lib64/:\$LD_LIBRARY_PATH"  >> /etc/profile  
echo  "export  LD_LIBRARY_PATH=/usr/local/cuda-9.0/extras/CUPTI/lib64/:/usr/local/cuda-9.0/extras/CUPTI/include/:/usr/local/cuda-9.0/extras/CUPTI/:\$LD_LIBRARY_PATH"  >> /etc/profile

source /etc/profile
```

##### # Cuda 컴파일러 동작 확인.
```bash
nvcc -V
```

##### # Cuda 9.0 샘플 컴파일
```bash
cp -r  /usr/local/cuda-9.0/samples/   ~/NVIDIA_CUDA-9.0_Samples
cd ~/NVIDIA_CUDA-9.0_Samples

make -j$(grep process /proc/cpuinfo | wc -l)
```

##### # Cuda 9.0 샘플 테스트
```bash
cd ~

./NVIDIA_CUDA-9.0_Samples/bin/x86_64/linux/release/deviceQuery

./NVIDIA_CUDA-9.0_Samples/bin/x86_64/linux/release/p2pBandwidthLatencyTest

./NVIDIA_CUDA-9.0_Samples/bin/x86_64/linux/release/nbody  --help

./NVIDIA_CUDA-9.0_Samples/bin/x86_64/linux/release/nbody  -benchmark  -numdevices=2 or 3 or 4
```

### # [2. Cudnn install](#목차)

##### # https://developer.nvidia.com/rdp/cudnn-download # 위 사이트에서 다운로드 (로그인 필요) # Cuda9.0 용 7버전 다운 받습니다.

##### # /root/cudnn7 폴더에 다운로드.
```bash
cd ~
mkdir /root/cudnn7
cd /root/cudnn7

pwd
ll

tar xvzf cudnn-9.0-linux-x64-v7.tgz
tar xvzf cudnn-9.0-linux-x64-v7.1.tgz
tar xvzf cudnn-9.0-linux-x64-v7.3.1.20.tgz
tar xvzf cudnn-9.0-linux-x64-v7.4.1.5.tgz

ls -l cuda/include/
ls -l cuda/lib64/

chmod  a+r  cuda/include/*
chmod  a+r  cuda/lib64/*

cp  -rp  cuda/include/cudnn.h  /usr/local/cuda-9.0/include/
cp  -rp  cuda/lib64/libcudnn*  /usr/local/cuda-9.0/lib64/
ls -l /usr/local/cuda-9.0/lib64/libcudnn*

cd
```

### # [3. Deep Learning Package Install (python-pip , tensorflow)](#목차)

```bash
which  python
rpm -qa  |  grep ^python-2.7
python -V

rpm -ql  python-2.7.5

easy_install pip

rpm -qa | grep  setuptools

pip -V

yum -y install  python34  python34-devel

yum search  all  python34-setuptools

yum -y install  python34-setuptools

easy_install-3.4   pip

yum -y install   openblas*
```

##### # * pip 와 pip3 사용하기 위해 수정 *

```bash
[root@Technology:~]# cat /bin/pip
#!/usr/bin/python3.4
# EASY-INSTALL-ENTRY-SCRIPT: 'pip==18.0','console_scripts','pip'
__requires__ = 'pip==18.0'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('pip==18.0', 'console_scripts', 'pip')()
    )

[root@Technology:~]# vi /bin/pip

[root@Technology:~]# cat /bin/pip
#!/usr/bin/python
# EASY-INSTALL-ENTRY-SCRIPT: 'pip==18.0','console_scripts','pip'
__requires__ = 'pip==18.0'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('pip==18.0', 'console_scripts', 'pip')()
    )
```

##### # pip , pip3 버전 확인 및 패키지 설치 .

```bash
python -V
pip -V

python3 -V
pip3 -V

cat /etc/resolv.conf

pip install  numpy   scipy  nose  matplotlib  pandas  keras

pip3 install  numpy   scipy  nose  matplotlib  pandas  keras

rm -rf /usr/lib/python2.7/site-packages/enum*
rm -rf /usr/share/doc/python-enum34-1.0.4/*

yum erase pyparsing

pip install  --upgrade tensorflow-gpu==1.11
pip3 install  --upgrade tensorflow-gpu==1.11

# tensorflow  test  package
cd ~
git clone https://github.com/aymericdamien/TensorFlow-Examples.git
ll  TensorFlow-Examples/


python        TensorFlow-Examples/examples/1_Introduction/helloworld.py  
python        TensorFlow-Examples/examples/1_Introduction/basic_operations.py

python3      TensorFlow-Examples/examples/1_Introduction/helloworld.py    
python3      TensorFlow-Examples/examples/1_Introduction/basic_operations.py

## 아래 항목도 테스트 필요 (문서에 기록은 남기지 않아도 됨)
python3  TensorFlow-Examples/examples/3_NeuralNetworks/neural_network.py
python3  TensorFlow-Examples/examples/3_NeuralNetworks/gan.py
python3  TensorFlow-Examples/examples/3_NeuralNetworks/dcgan.py
python3  TensorFlow-Examples/examples/5_DataManagement/tensorflow_dataset_api.py
```

### # [4. GPU Burning Test](#목차)

```bash
cd
pwd
git clone https://github.com/wilicc/gpu-burn

cd gpu-burn
make

# ./gpu-burn 60  # 60sec
./gpu_burn $((60 * 1))   # 1min
```

### # [5. history 저장 (차후 설치기록 참고용)](#목차)

```bash
# 모든 root 사용자를 로그아웃 한 다음 다시 로그인 하여 작업

logout

history  > dasan_install_history.txt
tail dasan_install_history.txt
```
