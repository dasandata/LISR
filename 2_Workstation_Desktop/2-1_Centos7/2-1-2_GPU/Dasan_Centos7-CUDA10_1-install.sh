#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo -e  "==================== nouveau 가 비활성 화 되었는지 확인. ===================="

echo ""
echo -e  "${PROMPT} lsmod | grep nouveau " >> /root/dasan_install_log.txt
lsmod | grep nouveau

echo ""
echo ""

echo " Cuda-repo (Cuda 저장소) 설치 "

echo ""
echo -e  "${PROMPT} wget http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-10.0.130-1.x86_64.rpm " >> /root/dasan_install_log.txt
wget http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-10.0.130-1.x86_64.rpm >> /root/log.txt

echo ""
echo -e  "${PROMPT} yum -y install cuda-repo-rhel7-10.0.130-1.x86_64.rpm" >> /root/dasan_install_log.txt
yum -y install cuda-repo-rhel7-10.0.130-1.x86_64.rpm >> /root/log.txt

echo ""
echo -e  "${PROMPT} yum --disablerepo="*" --enablerepo="cuda" list available" >> /root/dasan_install_log.txt
yum --disablerepo="*" --enablerepo="cuda" list available

echo ""
echo -e  "${PROMPT} yum -y install  libXi-devel mesa-libGLU-devel libXmu-devel libX11-devel freeglut-devel libXm*" >> /root/dasan_install_log.txt
yum -y install  libXi-devel mesa-libGLU-devel libXmu-devel libX11-devel freeglut-devel libXm* >> /root/log.txt

echo ""
echo -e  "${PROMPT} yum -y install openmotif*" >> /root/dasan_install_log.txt
yum -y install openmotif* >> /root/log.txt

echo ""
echo ""

echo -e  "==================== Cuda 10.0 설치 ===================="

echo ""
echo -e  "${PROMPT} yum -y install yum -y install cuda-10-0" >> /root/dasan_install_log.txt
yum -y install cuda-10-0 >> /root/log.txt

sleep 5

echo "  Nvidia Driver 동작 확인. "

echo ""
echo -e  "${PROMPT} ls /usr/local/ | grep cuda " >> /root/dasan_install_log.txt
ls /usr/local/ | grep cuda

echo ""
echo -e  "${PROMPT} nvidia-smi -L " >> /root/dasan_install_log.txt
nvidia-smi -L

echo ""
echo -e  "${PROMPT} nvidia-smi   " >> /root/dasan_install_log.txt
nvidia-smi

echo ""
echo ""

echo " Cuda 10.0 환경변수 Profile 에 추가 "

echo ""
echo -e  "${PROMPT} echo " "  >> /etc/profile " >> /root/dasan_install_log.txt
echo " "  >> /etc/profile

echo ""
echo -e  "${PROMPT} echo " ADD Cuda 10.0 PATH "  >> /etc/profile " >> /root/dasan_install_log.txt
echo " ### ADD Cuda 10.0 PATH "  >> /etc/profile

echo ""
echo -e  "${PROMPT} echo " export PATH=/usr/local/cuda-10.0/bin:/usr/local/cuda-10.0/include:\$PATH " >> /etc/profile " >> /root/dasan_install_log.txt
echo " export PATH=/usr/local/cuda-10.0/bin:/usr/local/cuda-10.0/include:\$PATH " >> /etc/profile

echo ""
echo -e  "${PROMPT} echo " export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile " >> /root/dasan_install_log.txt
echo " export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile

echo ""
echo -e  "${PROMPT} echo " export CUDA_HOME=/usr/local/cuda-10.0 " >> /etc/profile " >> /root/dasan_install_log.txt
echo " export CUDA_HOME=/usr/local/cuda-10.0 " >> /etc/profile

echo ""
echo -e  "${PROMPT} echo " export CUDA_INC_DIR=/usr/local/cuda-10.0/include " >> /etc/profile " >> /root/dasan_install_log.txt
echo " export CUDA_INC_DIR=/usr/local/cuda-10.0/include " >> /etc/profile

echo ""
echo ""

echo " 추가 확인 "

echo ""
echo -e  "${PROMPT} tail -5  /etc/profile   " >> /root/dasan_install_log.txt
tail  -5 /etc/profile

echo ""
echo -e  "${PROMPT} source /etc/profile   " >> /root/dasan_install_log.txt
source /etc/profile

echo ""
echo -e  "${PROMPT} source .bashrc  " >> /root/dasan_install_log.txt
source .bashrc


sleep 10

echo ""
echo ""

echo " Cuda 컴파일러 동작 확인. "

echo ""
echo -e  "${PROMPT} ls /usr/local/ | grep cuda  " >> /root/dasan_install_log.txt
ls /usr/local/ | grep cuda

echo ""
echo -e  "${PROMPT} which nvcc " >> /root/dasan_install_log.txt
which nvcc

echo ""
echo -e  "${PROMPT} nvcc -V " >> /root/dasan_install_log.txt
nvcc -V

echo ""
echo ""

echo " Cuda 10.0 샘플 컴파일 "

echo ""
echo -e  "${PROMPT} cp -r  /usr/local/cuda-10.0/samples/   ~/NVIDIA_CUDA-10.0_Samples " >> /root/dasan_install_log.txt
cp -r  /usr/local/cuda-10.0/samples/   ~/NVIDIA_CUDA-10.0_Samples

echo ""
echo -e  "${PROMPT} cd ~/NVIDIA_CUDA-10.0_Samples " >> /root/dasan_install_log.txt
cd ~/NVIDIA_CUDA-10.0_Samples

echo ""
echo -e  "${PROMPT} time make -j$(grep process /proc/cpuinfo | wc -l) " >> /root/dasan_install_log.txt
time make -j$(grep process /proc/cpuinfo | wc -l) >> /root/log.txt

echo ""
echo ""

echo -e  "==================== Cudnn 7 install ===================="

echo ""
echo ""

echo ""
echo -e  "${PROMPT} mount -t nfs 192.168.0.5:file /mnt " >> /root/dasan_install_log.txt
mount -t nfs 192.168.0.5:file /mnt

echo ""
echo -e  "${PROMPT} mkdir /root/cudnn7 " >> /root/dasan_install_log.txt
mkdir /root/cudnn7

echo ""
echo -e  "${PROMPT} cp /mnt/2_windows\ 관련\ \(서울대\)/windows_cuda_file/cudnn-10.0-linux-x64-v7.* /root/cudnn7 " >> /root/dasan_install_log.txt
cp /mnt/2_windows\ 관련\ \(서울대\)/windows_cuda_file/cudnn-10.0-linux-x64-v7.* /root/cudnn7

sleep 20

echo ""
echo -e  "${PROMPT} cd  /root/cudnn7 " >> /root/dasan_install_log.txt
cd  /root/cudnn7

echo ""

echo -e  "${PROMPT} umount /mnt #마운트 해제 " >> /root/dasan_install_log.txt
umount /mnt #마운트 해제

echo ""
echo -e  "${PROMPT} pwd " >> /root/dasan_install_log.txt
pwd

echo ""
echo -e  "${PROMPT} ls " >> /root/dasan_install_log.txt
ls

echo ""
echo -e  "${PROMPT} tar xvzf cudnn-10.0-linux-x64-v7.3.0.29.tgz " >> /root/dasan_install_log.txt
tar xvzf cudnn-10.0-linux-x64-v7.3.0.29.tgz

echo ""
echo -e  "${PROMPT} tar xvzf cudnn-10.0-linux-x64-v7.3.1.20.tgz " >> /root/dasan_install_log.txt
tar xvzf cudnn-10.0-linux-x64-v7.3.1.20.tgz

echo ""
echo -e  "${PROMPT} tar xvzf cudnn-10.0-linux-x64-v7.4.1.5.tgz " >> /root/dasan_install_log.txt
tar xvzf cudnn-10.0-linux-x64-v7.4.1.5.tgz

echo ""
echo -e  "${PROMPT} tar xvzf cudnn-10.0-linux-x64-v7.4.2.24.tgz " >> /root/dasan_install_log.txt
tar xvzf cudnn-10.0-linux-x64-v7.4.2.24.tgz

echo ""
echo -e  "${PROMPT} tar xvzf cudnn-10.0-linux-x64-v7.5.0.56.tgz " >> /root/dasan_install_log.txt
tar xvzf cudnn-10.0-linux-x64-v7.5.0.56.tgz

sleep 20

echo ""
echo -e  "${PROMPT} ls -l cuda/include/ " >> /root/dasan_install_log.txt
ls -l cuda/include/

echo ""
echo -e  "${PROMPT} ls -l cuda/lib64/ " >> /root/dasan_install_log.txt
ls -l cuda/lib64/

echo ""
echo -e  "${PROMPT} chmod  a+r  cuda/include/* " >> /root/dasan_install_log.txt
chmod  a+r  cuda/include/*

echo ""
echo -e  "${PROMPT} chmod  a+r  cuda/lib64/* " >> /root/dasan_install_log.txt
chmod  a+r  cuda/lib64/*

echo ""
echo -e  "${PROMPT} cp  -rp  cuda/include/cudnn.h  /usr/local/cuda-10.0/include/ " >> /root/dasan_install_log.txt
cp  -rp  cuda/include/cudnn.h  /usr/local/cuda-10.0/include/

echo ""
echo -e  "${PROMPT} cp  -rp  cuda/lib64/libcudnn*  /usr/local/cuda-10.0/lib64/ " >> /root/dasan_install_log.txt
cp  -rp  cuda/lib64/libcudnn*  /usr/local/cuda-10.0/lib64/

echo ""
echo -e  "${PROMPT} ls -l /usr/local/cuda-10.0/lib64/libcudnn* " >> /root/dasan_install_log.txt
ls -l /usr/local/cuda-10.0/lib64/libcudnn*

echo ""
echo -e  "${PROMPT} cd ~ " >> /root/dasan_install_log.txt
cd ~

echo ""
echo ""

echo -e  "==================== Deep Learning Package Install python-PIP, tensorflow ===================="

echo ""

echo ""
echo -e  "${PROMPT} yum install -y python-devel python-setuptools python-setuptools-devel " >> /root/dasan_install_log.txt
yum install -y python-devel python-setuptools python-setuptools-devel >> /root/log.txt

echo ""
echo -e  "${PROMPT} which  python " >> /root/dasan_install_log.txt
which  python

echo ""
echo -e  "${PROMPT} which  python " >> /root/dasan_install_log.txt
which  python

echo ""
echo -e  "${PROMPT} rpm -qa  |  grep ^python-2.7 " >> /root/dasan_install_log.txt
rpm -qa  |  grep ^python-2.7

echo ""
echo -e  "${PROMPT} python -V " >> /root/dasan_install_log.txt
python -V

echo ""
echo -e  "${PROMPT} rpm -ql  python-2.7.5 " >> /root/dasan_install_log.txt
rpm -ql  python-2.7.5

echo ""
echo -e  "${PROMPT} easy_install pip " >> /root/dasan_install_log.txt
easy_install pip >> /root/log.txt

echo ""
echo -e  "${PROMPT} rpm -qa | grep  setuptools " >> /root/dasan_install_log.txt
rpm -qa | grep  setuptools

echo ""
echo -e  "${PROMPT} pip -V " >> /root/dasan_install_log.txt
pip -V

echo ""
echo -e  "${PROMPT} yum -y install  python36  python36-devel python36-pip python36-setuptools " >> /root/dasan_install_log.txt
yum -y install  python36  python36-devel python36-pip python36-setuptools >> /root/log.txt

echo ""
echo -e  "${PROMPT} yum search  all  python36-setuptools " >> /root/dasan_install_log.txt
yum search  all  python36-setuptools

echo ""
echo -e  "${PROMPT} easy_install-3.6   pip " >> /root/dasan_install_log.txt
easy_install-3.6   pip >> /root/log.txt

echo ""
echo -e  "${PROMPT} yum -y install   openblas* " >> /root/dasan_install_log.txt
yum -y install   openblas* >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip -V " >> /root/dasan_install_log.txt
pip -V

echo ""
echo -e  "${PROMPT} pip3 -V " >> /root/dasan_install_log.txt
pip3 -V

echo ""
echo -e  "${PROMPT} python -V " >> /root/dasan_install_log.txt
python -V

echo ""
echo -e  "${PROMPT} python3 -V " >> /root/dasan_install_log.txt
python3 -V

echo ""
echo -e  "${PROMPT} pip   install --upgrade pip " >> /root/dasan_install_log.txt
pip   install --upgrade pip >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip3   install --upgrade pip " >> /root/dasan_install_log.txt
pip3   install --upgrade pip >> /root/log.txt

echo ""
echo ""

echo "  rc.local 등록 "
echo -e  "${PROMPT} sed -i '13s/Dasan_Centos7-CUDA10_1-install.sh/Dasan_Centos7-CUDA10_2-install.sh/g' /etc/rc.d/rc.local    " >> /root/dasan_install_log.txt
sed -i '13s/Dasan_Centos7-CUDA10_1-install.sh/Dasan_Centos7-CUDA10_2-install.sh/g' /etc/rc.d/rc.local

echo -e  "${PROMPT} cat /etc/rc.d/rc.local  | sed -n 13p " >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 13p

echo " 재 부팅 "
echo -e  "${PROMPT} reboot  재 부팅 " >> /root/dasan_install_log.txt
reboot
