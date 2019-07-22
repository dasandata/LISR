#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;32m"==================== nouveau 가 비활성 화 되었는지 확인. ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} lsmod | grep nouveau \033[0m" >> /root/Dasan_command.txt
lsmod | grep nouveau

echo ""
echo ""

echo " Cuda-repo (Cuda 저장소) 설치 "

echo ""
echo -e  "\033[1;34m${PROMPT} wget http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-10.0.130-1.x86_64.rpm \033[0m" >> /root/Dasan_command.txt
wget http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-10.0.130-1.x86_64.rpm

echo ""
echo -e  "\033[1;34m${PROMPT} yum -y install cuda-repo-rhel7-10.0.130-1.x86_64.rpm" >> /root/Dasan_command.txt
yum -y install cuda-repo-rhel7-10.0.130-1.x86_64.rpm

echo ""
echo -e  "\033[1;34m${PROMPT} yum --disablerepo="*" --enablerepo="cuda" list available" >> /root/Dasan_command.txt
yum --disablerepo="*" --enablerepo="cuda" list available

echo ""
echo -e  "\033[1;34m${PROMPT} yum -y install  libXi-devel mesa-libGLU-devel libXmu-devel libX11-devel freeglut-devel libXm*" >> /root/Dasan_command.txt
yum -y install  libXi-devel mesa-libGLU-devel libXmu-devel libX11-devel freeglut-devel libXm*

echo ""
echo -e  "\033[1;34m${PROMPT} yum -y install openmotif*" >> /root/Dasan_command.txt
yum -y install openmotif*

echo ""
echo ""

echo -e  "\033[1;32m"==================== Cuda 10.0 설치 ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} yum -y install yum -y install cuda-10-0" >> /root/Dasan_command.txt
yum -y install cuda-10-0

sleep 5

echo "  Nvidia Driver 동작 확인. "

echo ""
echo -e  "\033[1;34m${PROMPT} ls /usr/local/ | grep cuda \033[0m" >> /root/Dasan_command.txt
ls /usr/local/ | grep cuda

echo ""
echo -e  "\033[1;34m${PROMPT} nvidia-smi -L \033[0m" >> /root/Dasan_command.txt
nvidia-smi -L

echo ""
echo -e  "\033[1;34m${PROMPT} nvidia-smi   \033[0m" >> /root/Dasan_command.txt
nvidia-smi

echo ""
echo ""

echo " Cuda 10.0 환경변수 Profile 에 추가 "

echo ""
echo -e  "\033[1;34m${PROMPT} echo " "  >> /etc/profile \033[0m" >> /root/Dasan_command.txt
echo " "  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " ADD Cuda 10.0 PATH "  >> /etc/profile \033[0m" >> /root/Dasan_command.txt
echo " ### ADD Cuda 10.0 PATH "  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export PATH=/usr/local/cuda-10.0/bin:/usr/local/cuda-10.0/include:\$PATH " >> /etc/profile \033[0m" >> /root/Dasan_command.txt
echo " export PATH=/usr/local/cuda-10.0/bin:/usr/local/cuda-10.0/include:\$PATH " >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile \033[0m" >> /root/Dasan_command.txt
echo " export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export CUDA_HOME=/usr/local/cuda-10.0 " >> /etc/profile \033[0m" >> /root/Dasan_command.txt
echo " export CUDA_HOME=/usr/local/cuda-10.0 " >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export CUDA_INC_DIR=/usr/local/cuda-10.0/include " >> /etc/profile \033[0m" >> /root/Dasan_command.txt
echo " export CUDA_INC_DIR=/usr/local/cuda-10.0/include " >> /etc/profile

echo ""
echo ""

echo " 추가 확인 "

echo ""
echo -e  "\033[1;34m${PROMPT} tail -5  /etc/profile   \033[0m" >> /root/Dasan_command.txt
tail  -5 /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} source /etc/profile   \033[0m" >> /root/Dasan_command.txt
source /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} source .bashrc  \033[0m" >> /root/Dasan_command.txt
source .bashrc


sleep 10

echo ""
echo ""

echo " Cuda 컴파일러 동작 확인. "

echo ""
echo -e  "\033[1;34m${PROMPT} ls /usr/local/ | grep cuda  \033[0m" >> /root/Dasan_command.txt
ls /usr/local/ | grep cuda

echo ""
echo -e  "\033[1;34m${PROMPT} which nvcc \033[0m" >> /root/Dasan_command.txt
which nvcc

echo ""
echo -e  "\033[1;34m${PROMPT} nvcc -V \033[0m" >> /root/Dasan_command.txt
nvcc -V

echo ""
echo ""

echo " Cuda 10.0 샘플 컴파일 "

echo ""
echo -e  "\033[1;34m${PROMPT} cp -r  /usr/local/cuda-10.0/samples/   ~/NVIDIA_CUDA-10.0_Samples \033[0m" >> /root/Dasan_command.txt
cp -r  /usr/local/cuda-10.0/samples/   ~/NVIDIA_CUDA-10.0_Samples

echo ""
echo -e  "\033[1;34m${PROMPT} cd ~/NVIDIA_CUDA-10.0_Samples \033[0m" >> /root/Dasan_command.txt
cd ~/NVIDIA_CUDA-10.0_Samples

echo ""
echo -e  "\033[1;34m${PROMPT} time make -j$(grep process /proc/cpuinfo | wc -l) \033[0m" >> /root/Dasan_command.txt
time make -j$(grep process /proc/cpuinfo | wc -l)
