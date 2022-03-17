#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;32m"==================== nouveau 가 비활성 화 되었는지 확인. ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} lsmod  | grep  nouveau \033[0m" >> /root/dasan_install_log.txt
lsmod  | grep  nouveau


echo ""
echo ""

echo " Cuda-repo (Cuda 저장소) 설치 "

echo ""
echo -e  "\033[1;34m${PROMPT} wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb \033[0m" >> /root/dasan_install_log.txt
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb

echo ""
echo -e  "\033[1;34m${PROMPT} dpkg -i  cuda-repo-ubuntu1604_10.0.130-1_amd64.deb \033[0m" >> /root/dasan_install_log.txt
dpkg -i  cuda-repo-ubuntu1604_10.0.130-1_amd64.deb

echo ""
echo -e  "\033[1;34m${PROMPT} wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub \033[0m" >> /root/dasan_install_log.txt
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub

echo ""
echo -e  "\033[1;34m${PROMPT} apt-key add 7fa2af80.pub \033[0m" >> /root/dasan_install_log.txt
apt-key add 7fa2af80.pub

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/apt/sources.list.d/cuda.list \033[0m" >> /root/dasan_install_log.txt
cat /etc/apt/sources.list.d/cuda.list

echo ""
echo ""

echo " Cuda-repo 에서 설치가능한 패키지 목록 확인. "

echo ""
echo -e  "\033[1;34m${PROMPT} apt-get update \033[0m" >> /root/dasan_install_log.txt
apt-get update

echo ""
echo -e  "\033[1;34m${PROMPT} apt-cache  search   cuda \033[0m" >> /root/dasan_install_log.txt
apt-cache  search   cuda

echo ""
echo ""

echo -e  "\033[1;32m"==================== Cuda 10.0 설치 ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} apt-get install -y cuda-10-0 \033[0m" >> /root/dasan_install_log.txt
apt-get install -y cuda-10-0  >> dasan_log_install_cuda10.txt   2>&1

echo ""
echo ""

echo "  Nvidia Driver 동작 확인. "

echo ""
echo -e  "\033[1;34m${PROMPT} ls /usr/local/ | grep cuda \033[0m" >> /root/dasan_install_log.txt
ls /usr/local/ | grep cuda

echo ""
echo -e  "\033[1;34m${PROMPT} nvidia-smi -L \033[0m" >> /root/dasan_install_log.txt
nvidia-smi -L

echo ""
echo -e  "\033[1;34m${PROMPT} nvidia-smi   \033[0m" >> /root/dasan_install_log.txt
nvidia-smi


echo ""
echo ""

echo " Cuda 10.0 환경변수 Profile 에 추가 "

echo ""
echo -e  "\033[1;34m${PROMPT} echo " "  >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo " "  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " ADD Cuda 10.0 PATH "  >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo " ### ADD Cuda 10.0 PATH "  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export PATH=/usr/local/cuda-10.0/bin:/usr/local/cuda-10.0/include:\$PATH " >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo " export PATH=/usr/local/cuda-10.0/bin:/usr/local/cuda-10.0/include:\$PATH " >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo " export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export CUDA_HOME=/usr/local/cuda-10.0 " >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo " export CUDA_HOME=/usr/local/cuda-10.0 " >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export CUDA_INC_DIR=/usr/local/cuda-10.0/include " >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo " export CUDA_INC_DIR=/usr/local/cuda-10.0/include " >> /etc/profile

echo ""
echo ""

echo " 추가 확인 "

echo ""
echo -e  "\033[1;34m${PROMPT} tail -5  /etc/profile   \033[0m" >> /root/dasan_install_log.txt
tail  -5 /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} source /etc/profile   \033[0m" >> /root/dasan_install_log.txt
source /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} source .bashrc  \033[0m" >> /root/dasan_install_log.txt
source .bashrc


sleep 10

echo ""
echo ""

echo " Cuda 컴파일러 동작 확인. "

echo ""
echo -e  "\033[1;34m${PROMPT} ls /usr/local/ | grep cuda  \033[0m" >> /root/dasan_install_log.txt
ls /usr/local/ | grep cuda

echo ""
echo -e  "\033[1;34m${PROMPT} which nvcc \033[0m" >> /root/dasan_install_log.txt
which nvcc

echo ""
echo -e  "\033[1;34m${PROMPT} nvcc -V \033[0m" >> /root/dasan_install_log.txt
nvcc -V

echo ""
echo ""

echo " Cuda 10.0 샘플 컴파일 "

echo ""
echo -e  "\033[1;34m${PROMPT} cp -r  /usr/local/cuda-10.0/samples/   ~/NVIDIA_CUDA-10.0_Samples \033[0m" >> /root/dasan_install_log.txt
cp -r  /usr/local/cuda-10.0/samples/   ~/NVIDIA_CUDA-10.0_Samples

echo ""
echo -e  "\033[1;34m${PROMPT} cd ~/NVIDIA_CUDA-10.0_Samples \033[0m" >> /root/dasan_install_log.txt
cd ~/NVIDIA_CUDA-10.0_Samples

echo ""
echo -e  "\033[1;34m${PROMPT} time make -j$(grep process /proc/cpuinfo | wc -l) \033[0m" >> /root/dasan_install_log.txt
time make -j$(grep process /proc/cpuinfo | wc -l)

echo ""
echo ""

echo -e  "\033[1;32m"==================== Cudnn 7 install ===================="\033[0m"

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} mount -t nfs 192.168.0.5:file /mnt \033[0m" >> /root/dasan_install_log.txt
mount -t nfs 192.168.0.5:file /mnt

echo ""
echo -e  "\033[1;34m${PROMPT} mkdir /root/cudnn7 \033[0m" >> /root/dasan_install_log.txt
mkdir /root/cudnn7

echo ""
echo -e  "\033[1;34m${PROMPT} cp /mnt/2_windows\ 관련\ \(서울대\)/windows_cuda_file/cudnn-10.0-linux-x64-v7.* /root/cudnn7 \033[0m" >> /root/dasan_install_log.txt
cp /mnt/2_windows\ 관련\ \(서울대\)/windows_cuda_file/cudnn-10.0-linux-x64-v7.* /root/cudnn7

sleep 20

echo ""
echo -e  "\033[1;34m${PROMPT} cd  /root/cudnn7 \033[0m" >> /root/dasan_install_log.txt
cd  /root/cudnn7

echo ""

echo -e  "\033[1;34m${PROMPT} umount /mnt #마운트 해제 \033[0m" >> /root/dasan_install_log.txt
umount /mnt #마운트 해제

echo ""
echo -e  "\033[1;34m${PROMPT} pwd \033[0m" >> /root/dasan_install_log.txt
pwd

echo ""
echo -e  "\033[1;34m${PROMPT} ls \033[0m" >> /root/dasan_install_log.txt
ls

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-10.0-linux-x64-v7.3.0.29.tgz \033[0m" >> /root/dasan_install_log.txt
tar xvzf cudnn-10.0-linux-x64-v7.3.0.29.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-10.0-linux-x64-v7.3.1.20.tgz \033[0m" >> /root/dasan_install_log.txt
tar xvzf cudnn-10.0-linux-x64-v7.3.1.20.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-10.0-linux-x64-v7.4.1.5.tgz \033[0m" >> /root/dasan_install_log.txt
tar xvzf cudnn-10.0-linux-x64-v7.4.1.5.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-10.0-linux-x64-v7.4.2.24.tgz \033[0m" >> /root/dasan_install_log.txt
tar xvzf cudnn-10.0-linux-x64-v7.4.2.24.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-10.0-linux-x64-v7.5.0.56.tgz \033[0m" >> /root/dasan_install_log.txt
tar xvzf cudnn-10.0-linux-x64-v7.5.0.56.tgz

sleep 20

echo ""
echo -e  "\033[1;34m${PROMPT} ls -l cuda/include/ \033[0m" >> /root/dasan_install_log.txt
ls -l cuda/include/

echo ""
echo -e  "\033[1;34m${PROMPT} ls -l cuda/lib64/ \033[0m" >> /root/dasan_install_log.txt
ls -l cuda/lib64/

echo ""
echo -e  "\033[1;34m${PROMPT} chmod  a+r  cuda/include/* \033[0m" >> /root/dasan_install_log.txt
chmod  a+r  cuda/include/*

echo ""
echo -e  "\033[1;34m${PROMPT} chmod  a+r  cuda/lib64/* \033[0m" >> /root/dasan_install_log.txt
chmod  a+r  cuda/lib64/*

echo ""
echo -e  "\033[1;34m${PROMPT} cp  -rp  cuda/include/cudnn.h  /usr/local/cuda-10.0/include/ \033[0m" >> /root/dasan_install_log.txt
cp  -rp  cuda/include/cudnn.h  /usr/local/cuda-10.0/include/

echo ""
echo -e  "\033[1;34m${PROMPT} cp  -rp  cuda/lib64/libcudnn*  /usr/local/cuda-10.0/lib64/ \033[0m" >> /root/dasan_install_log.txt
cp  -rp  cuda/lib64/libcudnn*  /usr/local/cuda-10.0/lib64/

echo ""
echo -e  "\033[1;34m${PROMPT} ls -l /usr/local/cuda-10.0/lib64/libcudnn* \033[0m" >> /root/dasan_install_log.txt
ls -l /usr/local/cuda-10.0/lib64/libcudnn*

echo ""
echo -e  "\033[1;34m${PROMPT} cd ~ \033[0m" >> /root/dasan_install_log.txt
cd ~

echo ""
echo ""

echo -e  "\033[1;32m"==================== Deep Learning Package Install python-PIP, tensorflow ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} cd ~ \033[0m" >> /root/dasan_install_log.txt
cd ~

echo ""
echo -e  "\033[1;34m${PROMPT} python -V \033[0m" >> /root/dasan_install_log.txt
python -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python \033[0m" >> /root/dasan_install_log.txt
which  python

echo ""
echo -e  "\033[1;34m${PROMPT} python3 -V \033[0m" >> /root/dasan_install_log.txt
python3 -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python3 \033[0m" >> /root/dasan_install_log.txt
which  python3

echo ""
echo -e  "\033[1;34m${PROMPT} apt-get install -y  python-pip python3-pip  python3-tk \033[0m" >> /root/dasan_install_log.txt
apt-get install -y  python-pip python3-pip  python3-tk

echo ""
echo ""

echo " pip Check "

echo ""
echo -e  "\033[1;34m${PROMPT} python -V \033[0m" >> /root/dasan_install_log.txt
python -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python \033[0m" >> /root/dasan_install_log.txt
which  python

echo ""
echo -e  "\033[1;34m${PROMPT} python3 -V \033[0m" >> /root/dasan_install_log.txt
python3 -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python3 \033[0m" >> /root/dasan_install_log.txt
which  python3

echo ""
echo ""

echo " ADD package install "

echo ""
echo -e  "\033[1;34m${PROMPT} pip   install --upgrade pip \033[0m" >> /root/dasan_install_log.txt
pip   install --upgrade pip

echo ""
echo -e  "\033[1;34m${PROMPT} pip3   install --upgrade pip \033[0m" >> /root/dasan_install_log.txt
pip3   install --upgrade pip

echo ""
echo ""

echo "  rc.local 등록 "
echo -e  "\033[1;34m${PROMPT} sed -i '14s/Dasan_Ubuntu16-CUDA10_1-install.sh/Dasan_Ubuntu16-CUDA10_2-install.sh/g' /etc/rc.local  \033[0m" >> /root/dasan_install_log.txt
sed -i '14s/Dasan_Ubuntu16-CUDA10_1-install.sh/Dasan_Ubuntu16-CUDA10_2-install.sh/g' /etc/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.local | sed -n 14p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 14p

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} reboot  \033[0m" >> /root/dasan_install_log.txt
reboot
