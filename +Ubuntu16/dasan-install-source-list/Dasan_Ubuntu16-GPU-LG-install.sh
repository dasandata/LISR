#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;32m"==================== nouveau 가 비활성 화 되었는지 확인. ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} lsmod  | grep  nouveau \033[0m" >> Dasan_command.txt
lsmod  | grep  nouveau


echo ""
echo ""

echo " Cuda-repo (Cuda 저장소) 설치 "

echo ""
echo -e  "\033[1;34m${PROMPT} wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb \033[0m" >> Dasan_command.txt
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb

echo ""
echo -e  "\033[1;34m${PROMPT} dpkg -i  cuda-repo-ubuntu1604_10.0.130-1_amd64.deb \033[0m" >> Dasan_command.txt
dpkg -i  cuda-repo-ubuntu1604_10.0.130-1_amd64.deb

echo ""
echo -e  "\033[1;34m${PROMPT} wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub \033[0m" >> Dasan_command.txt
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub

echo ""
echo -e  "\033[1;34m${PROMPT} apt-key add 7fa2af80.pub \033[0m" >> Dasan_command.txt
apt-key add 7fa2af80.pub

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/apt/sources.list.d/cuda.list \033[0m" >> Dasan_command.txt
cat /etc/apt/sources.list.d/cuda.list

echo ""
echo ""

echo " Cuda-repo 에서 설치가능한 패키지 목록 확인. "

echo ""
echo -e  "\033[1;34m${PROMPT} apt-get update \033[0m" >> Dasan_command.txt
apt-get update

echo ""
echo -e  "\033[1;34m${PROMPT} apt-cache  search   cuda \033[0m" >> Dasan_command.txt
apt-cache  search   cuda

echo ""
echo ""

echo -e  "\033[1;32m"==================== Cuda 10.0 / 9.0 설치 ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} apt-get install -y cuda-10-0 cuda-9-0 \033[0m" >> Dasan_command.txt
apt-get install -y cuda-10-0 cuda-9-0 >> dasan_log_install_cuda10.txt   2>&1

echo ""
echo ""

echo "  Nvidia Driver 동작 확인. "

echo ""
echo -e  "\033[1;34m${PROMPT} ls /usr/local/ | grep cuda \033[0m" >> Dasan_command.txt
ls /usr/local/ | grep cuda

echo ""
echo -e  "\033[1;34m${PROMPT} nvidia-smi -L \033[0m" >> Dasan_command.txt
nvidia-smi -L

echo ""
echo -e  "\033[1;34m${PROMPT} nvidia-smi   \033[0m" >> Dasan_command.txt
nvidia-smi

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} mount -t nfs 192.168.0.5:file /mnt \033[0m" >> Dasan_command.txt
mount -t nfs 192.168.0.5:file /mnt

echo ""
echo -e  "\033[1;34m${PROMPT} mkdir /root/cudnn7 \033[0m" >> Dasan_command.txt
mkdir /root/cudnn7

echo ""
echo -e  "\033[1;34m${PROMPT} cp /mnt/2_windows\ 관련\ \(서울대\)/windows_cuda_file/cudnn-9.0-linux-x64-v7.* /root/cudnn7 \033[0m" >> Dasan_command.txt
cp /mnt/2_windows\ 관련\ \(서울대\)/windows_cuda_file/cudnn-9.0-linux-x64-v7.* /root/cudnn7

sleep 5

echo ""
echo -e  "\033[1;34m${PROMPT} cd  /root/cudnn7 \033[0m" >> Dasan_command.txt
cd  /root/cudnn7

echo ""
echo -e  "\033[1;34m${PROMPT} umount /mnt #마운트 해제 \033[0m" >> Dasan_command.txt
umount /mnt #마운트 해제

echo ""
echo -e  "\033[1;34m${PROMPT} pwd \033[0m" >> Dasan_command.txt
pwd

echo ""
echo -e  "\033[1;34m${PROMPT} ls \033[0m" >> Dasan_command.txt
ls

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-9.0-linux-x64-v7.tgz \033[0m" >> Dasan_command.txt
tar xvzf cudnn-9.0-linux-x64-v7.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-9.0-linux-x64-v7.1.tgz \033[0m" >> Dasan_command.txt
tar xvzf cudnn-9.0-linux-x64-v7.1.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-9.0-linux-x64-v7.3.1.20.tgz \033[0m" >> Dasan_command.txt
tar xvzf cudnn-9.0-linux-x64-v7.3.1.20.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-9.0-linux-x64-v7.4.1.5.tgz \033[0m" >> Dasan_command.txt
tar xvzf cudnn-9.0-linux-x64-v7.4.1.5.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} ls -l cuda/include/ \033[0m" >> Dasan_command.txt
ls -l cuda/include/

echo ""
echo -e  "\033[1;34m${PROMPT} ls -l cuda/lib64/ \033[0m" >> Dasan_command.txt
ls -l cuda/lib64/

echo ""
echo -e  "\033[1;34m${PROMPT} chmod  a+r  cuda/include/* \033[0m" >> Dasan_command.txt
chmod  a+r  cuda/include/*

echo ""
echo -e  "\033[1;34m${PROMPT} chmod  a+r  cuda/lib64/* \033[0m" >> Dasan_command.txt
chmod  a+r  cuda/lib64/*

echo ""
echo -e  "\033[1;34m${PROMPT} cp  -rp  cuda/include/cudnn.h  /usr/local/cuda-9.0/include/ \033[0m" >> Dasan_command.txt
cp  -rp  cuda/include/cudnn.h  /usr/local/cuda-9.0/include/

echo ""
echo -e  "\033[1;34m${PROMPT} cp  -rp  cuda/lib64/libcudnn*  /usr/local/cuda-9.0/lib64/ \033[0m" >> Dasan_command.txt
cp  -rp  cuda/lib64/libcudnn*  /usr/local/cuda-9.0/lib64/

echo ""
echo -e  "\033[1;34m${PROMPT} ls -l /usr/local/cuda-9.0/lib64/libcudnn* \033[0m" >> Dasan_command.txt
ls -l /usr/local/cuda-9.0/lib64/libcudnn*

echo ""
echo -e  "\033[1;34m${PROMPT} cd ~ \033[0m" >> Dasan_command.txt
cd ~

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} mount -t nfs 192.168.0.5:file /mnt \033[0m" >> Dasan_command.txt
mount -t nfs 192.168.0.5:file /mnt

echo ""
echo -e  "\033[1;34m${PROMPT} mkdir /root/cudnn7-1 \033[0m" >> Dasan_command.txt
mkdir /root/cudnn7-1

echo ""
echo -e  "\033[1;34m${PROMPT} cp /mnt/2_windows\ 관련\ \(서울대\)/windows_cuda_file/cudnn-10.0-linux-x64-v7.* /root/cudnn7-1 \033[0m" >> Dasan_command.txt
cp /mnt/2_windows\ 관련\ \(서울대\)/windows_cuda_file/cudnn-10.0-linux-x64-v7.* /root/cudnn7-1

sleep 5

echo ""
echo -e  "\033[1;34m${PROMPT} cd  /root/cudnn7-1 \033[0m" >> Dasan_command.txt
cd  /root/cudnn7-1

echo ""
echo -e  "\033[1;34m${PROMPT} umount /mnt #마운트 해제 \033[0m" >> Dasan_command.txt
umount /mnt #마운트 해제

echo ""
echo -e  "\033[1;34m${PROMPT} pwd \033[0m" >> Dasan_command.txt
pwd

echo ""
echo -e  "\033[1;34m${PROMPT} ls \033[0m" >> Dasan_command.txt
ls

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-10.0-linux-x64-v7.3.0.29.tgz \033[0m" >> Dasan_command.txt
tar xvzf cudnn-10.0-linux-x64-v7.3.0.29.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-10.0-linux-x64-v7.3.1.20.tgz \033[0m" >> Dasan_command.txt
tar xvzf cudnn-10.0-linux-x64-v7.3.1.20.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-10.0-linux-x64-v7.4.1.5.tgz \033[0m" >> Dasan_command.txt
tar xvzf cudnn-10.0-linux-x64-v7.4.1.5.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-10.0-linux-x64-v7.4.2.24.tgz \033[0m" >> Dasan_command.txt
tar xvzf cudnn-10.0-linux-x64-v7.4.2.24.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-10.0-linux-x64-v7.5.0.56.tgz \033[0m" >> Dasan_command.txt
tar xvzf cudnn-10.0-linux-x64-v7.5.0.56.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} ls -l cuda/include/ \033[0m" >> Dasan_command.txt
ls -l cuda/include/

echo ""
echo -e  "\033[1;34m${PROMPT} ls -l cuda/lib64/ \033[0m" >> Dasan_command.txt
ls -l cuda/lib64/

echo ""
echo -e  "\033[1;34m${PROMPT} chmod  a+r  cuda/include/* \033[0m" >> Dasan_command.txt
chmod  a+r  cuda/include/*

echo ""
echo -e  "\033[1;34m${PROMPT} chmod  a+r  cuda/lib64/* \033[0m" >> Dasan_command.txt
chmod  a+r  cuda/lib64/*

echo ""
echo -e  "\033[1;34m${PROMPT} cp  -rp  cuda/include/cudnn.h  /usr/local/cuda-10.0/include/ \033[0m" >> Dasan_command.txt
cp  -rp  cuda/include/cudnn.h  /usr/local/cuda-10.0/include/

echo ""
echo -e  "\033[1;34m${PROMPT} cp  -rp  cuda/lib64/libcudnn*  /usr/local/cuda-10.0/lib64/ \033[0m" >> Dasan_command.txt
cp  -rp  cuda/lib64/libcudnn*  /usr/local/cuda-10.0/lib64/

echo ""
echo -e  "\033[1;34m${PROMPT} ls -l /usr/local/cuda-10.0/lib64/libcudnn* \033[0m" >> Dasan_command.txt
ls -l /usr/local/cuda-10.0/lib64/libcudnn*

echo ""
echo -e  "\033[1;34m${PROMPT} cd ~ \033[0m" >> Dasan_command.txt
cd ~


echo " Cuda 9.0 샘플 컴파일 "

echo ""
echo -e  "\033[1;34m${PROMPT} cp -r  /usr/local/cuda-9.0/samples/   ~/NVIDIA_CUDA-9.0_Samples \033[0m" >> Dasan_command.txt
cp -r  /usr/local/cuda-9.0/samples/   ~/NVIDIA_CUDA-9.0_Samples

echo ""
echo -e  "\033[1;34m${PROMPT} cd ~/NVIDIA_CUDA-9.0_Samples \033[0m" >> Dasan_command.txt
cd ~/NVIDIA_CUDA-9.0_Samples

echo ""
echo -e  "\033[1;34m${PROMPT} time make -j$(grep process /proc/cpuinfo | wc -l) \033[0m" >> Dasan_command.txt
time make -j$(grep process /proc/cpuinfo | wc -l)

sleep 3

echo ""
echo ""

echo " Cuda 10.0 샘플 컴파일 "

echo ""
echo -e  "\033[1;34m${PROMPT} cp -r  /usr/local/cuda-10.0/samples/   ~/NVIDIA_CUDA-10.0_Samples \033[0m" >> Dasan_command.txt
cp -r  /usr/local/cuda-10.0/samples/   ~/NVIDIA_CUDA-10.0_Samples

echo ""
echo -e  "\033[1;34m${PROMPT} cd ~/NVIDIA_CUDA-10.0_Samples \033[0m" >> Dasan_command.txt
cd ~/NVIDIA_CUDA-10.0_Samples

echo ""
echo -e  "\033[1;34m${PROMPT} time make -j$(grep process /proc/cpuinfo | wc -l) \033[0m" >> Dasan_command.txt
time make -j$(grep process /proc/cpuinfo | wc -l)

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl enable nvidia-persistenced \033[0m" >> Dasan_command.txt
systemctl enable nvidia-persistenced

echo "  rc.local 등록 "
echo -e  "\033[1;34m${PROMPT} sed -i '14s/Dasan_Ubuntu16-GPU-LG-install.sh/Dasan_Ubuntu16-Module-CUDA-install.sh/g' /etc/rc.local  \033[0m" >> /root/dasan_install_log.txt
sed -i '14s/Dasan_Ubuntu16-GPU-LG-install.sh/Dasan_Ubuntu16-Module-CUDA-install.sh/g' /etc/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.local | sed -n 14p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 14p

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} reboot  \033[0m" >> /root/dasan_install_log.txt
reboot
