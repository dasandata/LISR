# 다산데이타 CentOS 8.2 설치 표준안 (2021.01)
다산데이터 출고 장비에 설치되는 리눅스 (CenOS 8.2) 의 설치 표준안 입니다.  
별도의 요청사항이 없는 경우 기본적으로 아래 절차에 따라 설치한 후 출고 하고 있습니다.  
보완이 필요한 점이나 새로운 아이디어를 제보해 주시면 적극 반영하겠습니다 :)  

감사합니다.  

![Dasandata Logo](http://dasandata.co.kr/wp-content/uploads/2019/05/%EB%8B%A4%EC%82%B0%EB%A1%9C%EA%B3%A0_%EC%88%98%EC%A0%951-300x109.jpg)

## #목차
[1. Cuda install 사전 작업](https://github.com/dasandata/LISR/blob/master/%2BCentOS7/Standard_Install_CentOS_GPU.md#-1-cuda-install-%EC%82%AC%EC%A0%84-%EC%9E%91%EC%97%85)  
[2. Cudnn Install ](https://github.com/dasandata/LISR/blob/master/%2BCentOS7/Standard_Install_CentOS_GPU.md#-2-cudnn-install)  
[3. Deep Learning Package Install (python-pip , tensorflow)](https://github.com/dasandata/LISR/blob/master/%2BCentOS7/Standard_Install_CentOS_GPU.md#-3-deep-learning-package-install-python-pip--tensorflow)  
[4. GPU Burning Test](https://github.com/dasandata/LISR/blob/master/%2BCentOS7/Standard_Install_CentOS_GPU.md#-4-gpu-burning-test)
[5. R-Studio Server install](https://github.com/dasandata/LISR/blob/master/%2BCentos8/Standard_Install_CentOS8_GPU.md#-5-r-studio-server-install) [6. Jupyterhub install](https://github.com/dasandata/LISR/blob/master/%2BCentos8/Standard_Install_CentOS8_GPU.md#-6-jupyterhub-install) [7. Pycharm install](https://github.com/dasandata/LISR/blob/master/%2BCentos8/Standard_Install_CentOS8_GPU.md#-7-pycharm-install)   
[8. history 저장 (차후 설치기록 참고용)](https://github.com/dasandata/LISR/blob/master/%2BCentOS7/Standard_Install_CentOS_GPU.md#-5-history-%EC%A0%80%EC%9E%A5-%EC%B0%A8%ED%9B%84-%EC%84%A4%EC%B9%98%EA%B8%B0%EB%A1%9D-%EC%B0%B8%EA%B3%A0%EC%9A%A9)  

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

##### # cuda-repo (cuda 저장소)
```bash
wget http://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-repo-rhel8-10.2.89-1.x86_64.rpm

dnf install -y cuda-repo-rhel8-10.2.89-1.x86_64.rpm

```

##### # cuda repo 에서 설치가능한 패키지 목록 확인.
```bash
dnf --disablerepo="*" --enablerepo="cuda" list available
```

##### # 쿠다 샘플 컴파일에 필요한 라이브러리 설치 ( libGLU.so libX11.so libXi.so libXmu.so 등)
```bash
dnf -y install  libXi-devel mesa-libGLU-devel libXmu-devel libX11-devel freeglut-devel libXm* \
  openmotif*
```

##### # cuda 10.2 설치 (드라이버도 함께 설치됨)
```bash
dnf -y install cuda-10-2
```

##### # Nvidia Driver 동작 확인.
```bash
nvidia-smi -L

nvidia-smi
```

##### # Cuda 10.2 환경변수를 Profile 에 추가
```bash
cat << EOF >> /etc/profile
### ADD Cuda 10.2 PATH
export PATH=/usr/local/cuda-10.2/bin:/usr/local/cuda-10.2/include:\$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH
export CUDA_HOME=/usr/local/cuda-10.2
export CUDA_INC_DIR=/usr/local/cuda-10.2/include
### add end.
EOF
```

##### # Cuda 적용.
```bash
tail  /etc/profile
source /etc/profile
source .bashrc
```

##### # Cuda 컴파일러 동작 확인.
```bash
nvcc -V
```

##### # Cuda 10.2 샘플 컴파일
```bash
cp -r  /usr/local/cuda-10.2/samples/   ~/NVIDIA_CUDA-10.2_Samples
cd ~/NVIDIA_CUDA-10.2_Samples

make -j$(grep process /proc/cpuinfo | wc -l)
```

##### # Cuda 10.2 샘플 테스트
```bash
cd ~

./NVIDIA_CUDA-10.2_Samples/bin/x86_64/linux/release/deviceQuery

./NVIDIA_CUDA-10.2_Samples/bin/x86_64/linux/release/p2pBandwidthLatencyTest

./NVIDIA_CUDA-10.2_Samples/bin/x86_64/linux/release/nbody  --help

./NVIDIA_CUDA-10.2_Samples/bin/x86_64/linux/release/nbody  -benchmark  -numdevices=2 or 3 or 4
```

### # [2. Cudnn install](#목차)

##### # https://developer.download.nvidia.com/compute/machine-learning/repos/rhel8/x86_64/ # 위 사이트에서 다운로드 (로그인 필요) # Cuda10.2 용 8버전 다운 받습니다.

```bash

wget https://developer.download.nvidia.com/compute/machine-learning/repos/rhel8/x86_64/nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm

dnf install -y nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm

dnf install -y libcudnn8-8.0.2.39-1.cuda10.2

dnf install -y libcudnn8-devel-8.0.2.39-1.cuda10.2

dnf install -y libnccl-2.7.8-1+cuda10.2

dnf install -y libnccl-devel-2.7.8-1+cuda10.2

dnf install -y libnccl-static-2.7.8-1+cuda10.2

rpm -qa | grep libcudnn8

```

### # [3. Deep Learning Package Install (python-pip , tensorflow)](#목차)

```bash
dnf install -y python2 python2-devel python3 python3-devel

python2 -V

python3 -V

which pip2

which pip3

pip2 -V

pip3 -V

pip2 install --upgrade pip

pip3 install --upgrade pip

pip2 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow-gpu

pip2 install --upgrade setuptools

pip3 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow-gpu

pip3 install --upgrade python-dateutil

pip3 list | grep -i ten

perl -pi -e 's/python3.6/python2.7/'   /usr/local/bin/pip

```

##### # Python3 setuptools upgrade install bug firewall-cmd command error

```bash
cp /usr/local/lib/python3.6/site-packages/six.py /usr/lib/python3.6/site-packages/

firewall-cmd --list-all

firewall-cmd --add-port=8787/tcp --permanent

firewall-cmd --reload

firewall-cmd --list-all
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


### # [5. R-Studio Server install](#목차)

```bash
wget https://download2.rstudio.org/server/centos8/x86_64/rstudio-server-rhel-1.3.959-x86_64.rpm

dnf install -y rstudio-server-rhel-1.3.959-x86_64.rpm

dnf install -y libRmath-devel R-rpm-macros java-devel libRmath libgfortran.so.5 libopenblas.so.0 libquadmath.so.0 libtcl8.6.so libtk8.6.so

dnf config-manager --set-enabled PowerTools

dnf install -y R

systemctl restart rstudio-server.service
```

### # [6. Jupyterhub install](#목차)

dnf install -y nodejs

npm install -g configurable-http-proxy

pip3 install --upgrade jupyterhub notebook flask

pip3 list | grep -i jupyterhub

firewall-cmd --list-all

firewall-cmd --add-port=8000/tcp --permanent

firewall-cmd --reload

firewall-cmd --list-all

mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub.service /lib/systemd/system/

chmod 777 /lib/systemd/system/jupyterhub.service

mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub /etc/init.d/

chmod 755 /etc/init.d/jupyterhub

systemctl daemon-reload

systemctl enable jupyterhub.service

systemctl restart jupyterhub.service

R CMD BATCH /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/r_jupyterhub.R


### # [7. Pycharm install](#목차)

```bash
dnf install -y snapd

systemctl enable --now snapd.socket

ln -s /var/lib/snapd/snap /snap

systemctl restart snapd.socket

snap install pycharm-community --classic
```


### # [8. history 저장 (차후 설치기록 참고용)](#목차)

```bash
# 모든 root 사용자를 로그아웃 한 다음 다시 로그인 하여 작업

logout

history  > dasan_install_history.txt
tail dasan_install_history.txt
```
