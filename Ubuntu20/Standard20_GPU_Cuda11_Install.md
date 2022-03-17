# 다산데이타 Ubuntu 20.04  설치 표준안 (2021.01)
다산데이터 출고 장비에 설치되는 리눅스 (Ubuntu) 의 설치 표준안 입니다.  
별도의 요청사항이 없는 경우 기본적으로 아래 절차에 따라 설치한 후 출고 하고 있습니다.  
보완이 필요한 점이나 새로운 아이디어를 제보해 주시면 적극 반영하겠습니다 :)  

감사합니다.  

![Dasandata Logo](http://dasandata.co.kr/wp-content/uploads/2019/05/%EB%8B%A4%EC%82%B0%EB%A1%9C%EA%B3%A0_%EC%88%98%EC%A0%951-300x109.jpg)

## #목차
[1. Cuda 설치 사전 작업](Standard20_GPU_Cuda11_Install.md#-1-cuda-%EC%84%A4%EC%B9%98-%EC%82%AC%EC%A0%84-%EC%9E%91%EC%97%85)  
[2. Deep Learning Package Install (tensorflow, pytorch)                         ](Standard20_GPU_Cuda11_Install.md#-2-deep-learning-package-install-tensorflow-pytorch)   
[3. GPU Burning Test](Standard20_GPU_Cuda11_Install.md#-3-gpu-burning-test)   
[4. R-Server, R install](Standard20_GPU_Cuda11_Install.md#-4-r-server-r-install)   
[5. Jupyterhub install](Standard20_GPU_Cuda11_Install.md#-5-jupyterhub-install)   
[6. pycharm install ](Standard20_GPU_Cuda11_Install.md#-6-pycharm-install)   
[7. history 저장 / 차후 설치기록 참고용 ](Standard20_GPU_Cuda11_Install.md#-7-history-%EC%A0%80%EC%9E%A5--%EC%B0%A8%ED%9B%84-%EC%84%A4%EC%B9%98%EA%B8%B0%EB%A1%9D-%EC%B0%B8%EA%B3%A0%EC%9A%A9)


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

### # [1. Cuda 설치 사전 작업](#목차)

##### # nouveau disable
```bash
systemctl  get-default
systemctl  set-default  multi-user.target

lsmod  | grep  nouveau  

echo  "
blacklist nouveau
options nouveau modeset=0
"   >> /etc/modprobe.d/blacklist.conf

tail   /etc/modprobe.d/blacklist.conf

update-initramfs -u  
update-grub2  
```

##### # 사전작업 적용을 위한 재부팅
```bash
reboot  
```

##### # nouveau 가 비활성 화 되었는지 확인.
```bash
lsmod  | grep  nouveau
```

***


## # Cuda 저장소 변수 선언 / gpg key 등록 / 유틸 설치 / 저장소 업데이트

```bash
release="ubuntu"$(lsb_release -sr | sed -e "s/\.//g")

apt-get install -y sudo gnupg

apt-key adv --fetch-keys "http://developer.download.nvidia.com/compute/cuda/repos/"$release"/x86_64/7fa2af80.pub"

sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/'$release'/x86_64 /" > /etc/apt/sources.list.d/nvidia-cuda.list'

apt-get update

apt-cache  search   cuda

```

### # Cuda11 설치 / nvidia-persistenced 서비스 활성

```bash

apt-get install cuda-11-0       

systemctl enable nvidia-persistenced      

```

##### # nvidia-driver 확인
```bash
nvidia-smi

nvidia-smi -L
```

##### # Cuda 11.0 환경변수 Profile 에 추가

```bash
cat << EOF >> /etc/profile
### ADD Cuda 11.0 PATH
export PATH=/usr/local/cuda-11.0/bin:/usr/local/cuda-11.0/include:\$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH
export CUDA_HOME=/usr/local/cuda-11.0
export CUDA_INC_DIR=/usr/local/cuda-11.0/include
### add end.
EOF
```

##### # 추가 확인

```bash
tail  /etc/profile
source /etc/profile
source .bashrc
```

#### # Cuda 컴파일러 동작 확인.
```bash
ll /usr/local/ | grep cuda

which nvcc

nvcc -V
```
#### # Cuda 11.0 샘플 컴파일
```bash
cp -r /usr/local/cuda-11.0/samples/  ~/NVIDIA_CUDA-11.0_Samples
cd ~/NVIDIA_CUDA-11.0_Samples

time make -j$(grep process /proc/cpuinfo | wc -l)

# Finished building CUDA samples  마지막 메세지

```

#### # Cuda 11.0 샘플 테스트
```bash
cd ~

./NVIDIA_CUDA-11.0_Samples/bin/x86_64/linux/release/deviceQuery

./NVIDIA_CUDA-11.0_Samples/bin/x86_64/linux/release/p2pBandwidthLatencyTest

./NVIDIA_CUDA-11.0_Samples/bin/x86_64/linux/release/nbody  --help

./NVIDIA_CUDA-11.0_Samples/bin/x86_64/linux/release/nbody  -benchmark  -numdevices=2 or 3 or 4
```

### # [2. Deep Learning Package Install (tensorflow, pytorch)](#목차)

```bash
### pip 와 pip3 버젼 확인 후 pip가 phyhon3 로 바뀌었으면 아래 명령 실행 . (Ubuntu20)
### perl -pi -e 's/python3/python/'   /usr/local/bin/pip
### cat /usr/local/bin/pip

*** pip 설치전에 dns (/etc/resolv.conf) 값이 1.1.1.1 이 맞는지 확인 합니다. (속도 차이가 큽니다.)
cat /etc/resolv.conf

pip install --upgrade numpy scipy  nose  matplotlib  pandas  keras tensorflow-gpu

pip install scipy==1.2.2

pip3 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow-gpu

pip3 install numpy==1.16.0 h5py==2.10.0

pip install --upgrade torch torchvision

pip3 install --upgrade torch torchvision
```

#### # pip pip3 Check

```bash

pip -V  
which pip

pip3   -V  
which pip3
```

### # [3. GPU Burning Test](#목차)

```bash
cd
pwd
git clone https://github.com/wilicc/gpu-burn

cd gpu-burn
make

# ./gpu-burn 60  # 60sec
./gpu_burn $((60 * 1))   # 1min
```

### # [4. R-Server, R install](#목차)

```bash

# R install
apt-get install -y r-base

apt-get install -y gdebi-core

# R-server install
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.1073-amd64.deb

yes | gdebi rstudio-server-1.3.1073-amd64.deb

ufw allow 8787/tcp

ufw status

```

### # [5. Jupyterhub install](#목차)

```bash
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

apt-get install -y  nodejs

apt-get install -y  default-jre

npm install -g configurable-http-proxy

pip3 install --upgrade jupyterhub notebook

ufw allow 8000/tcp

ufw status

mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub /etc/init.d/

chmod 755 /etc/init.d/jupyterhub

mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub.service /lib/systemd/system/

chmod 777 /lib/systemd/system/jupyterhub.service

systemctl daemon-reload

systemctl enable jupyterhub.service

## Jupyterhub-r kernel
apt-get install -y libzmq3-dev libcurl4-openssl-dev

apt-get install -y libxml2-dev

R CMD BATCH /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/r_jupyterhub.R

```

### # [6. pycharm install](#목차)

```bash
snap install pycharm-community --classic
```

### # [7. history 저장 / 차후 설치기록 참고용](#목차)

```bash
# 모든 root 사용자를 로그아웃 한 다음 다시 로그인 하여 작업

logout

history  > dasan_install_history.txt
tail dasan_install_history.txt
```
