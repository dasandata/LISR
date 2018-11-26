#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;32m"==================== nouveau 가 비활성 화 되었는지 확인. ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} lsmod  | grep  nouveau \033[0m"
lsmod  | grep  nouveau


echo ""
echo ""

echo " Cuda-repo (Cuda 저장소) 설치 "

echo ""
echo -e  "\033[1;34m${PROMPT} wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb \033[0m"
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb

echo ""
echo -e  "\033[1;34m${PROMPT} dpkg -i  cuda-repo-ubuntu1604_8.0.61-1_amd64.deb \033[0m"
dpkg -i  cuda-repo-ubuntu1604_8.0.61-1_amd64.deb

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/apt/sources.list.d/cuda.list \033[0m"
cat /etc/apt/sources.list.d/cuda.list

echo ""
echo ""

echo " Cuda-repo 에서 설치가능한 패키지 목록 확인. "

echo ""
echo -e  "\033[1;34m${PROMPT} apt-get update \033[0m"
apt-get update

echo ""
echo -e  "\033[1;34m${PROMPT} apt-cache  search   cuda \033[0m"
apt-cache  search   cuda

echo ""
echo ""

echo " 쿠다 샘플 컴파일에 필요한 라이브러리 설치 ( libGLU.so libX11.so libXi.so libXmu.so 등) "

echo ""
echo -e  "\033[1;34m${PROMPT} apt-get install -y  libglu1-mesa  libxi-dev  libxmu-dev  libglu1-mesa-dev  libgl1-mesa-glx  libgles2-mesa-dev freeglut3-dev  build-essential  libx11-dev  libxmu-dev  \033[0m"
apt-get install -y  libglu1-mesa  libxi-dev  libxmu-dev  libglu1-mesa-dev  libgl1-mesa-glx  libgles2-mesa-dev freeglut3-dev  build-essential  libx11-dev  libxmu-dev

echo ""
echo -e  "\033[1;34m${PROMPT} ln -s /usr/lib/x86_64-linux-gnu/libGLU.so    /usr/lib/libGLU.so \033[0m"
ln -s /usr/lib/x86_64-linux-gnu/libGLU.so    /usr/lib/libGLU.so

echo ""
echo -e  "\033[1;34m${PROMPT} ll    /usr/lib/libGLU.so \033[0m"
ll    /usr/lib/libGLU.so

echo ""
echo -e  "\033[1;34m${PROMPT} ln -s /usr/lib/x86_64-linux-gnu/libGL.so      /usr/lib/libGL.so \033[0m"
ln -s /usr/lib/x86_64-linux-gnu/libGL.so      /usr/lib/libGL.so

echo ""
echo -e  "\033[1;34m${PROMPT} ll   /usr/lib/libGL.so \033[0m"
ll   /usr/lib/libGL.so

echo ""
echo -e  "\033[1;34m${PROMPT} ln -s /usr/lib/x86_64-linux-gnu/libX11.so     /usr/lib/libX11.so \033[0m"
ln -s /usr/lib/x86_64-linux-gnu/libX11.so     /usr/lib/libX11.so

echo ""
echo -e  "\033[1;34m${PROMPT} ll  /usr/lib/libX11.so \033[0m"
ll  /usr/lib/libX11.so

echo ""
echo -e  "\033[1;34m${PROMPT} ln -s /usr/lib/x86_64-linux-gnu/libXi.so        /usr/lib/libXi.so \033[0m"
ln -s /usr/lib/x86_64-linux-gnu/libXi.so        /usr/lib/libXi.so

echo ""
echo -e  "\033[1;34m${PROMPT} ll  /usr/lib/libXi.so \033[0m"
ll  /usr/lib/libXi.so

echo ""
echo -e  "\033[1;34m${PROMPT} ln -s /usr/lib/x86_64-linux-gnu/libXmu.so    /usr/lib/libXmu.so \033[0m"
ln -s /usr/lib/x86_64-linux-gnu/libXmu.so    /usr/lib/libXmu.so

echo ""
echo -e  "\033[1;34m${PROMPT} ll /usr/lib/libXmu.so \033[0m"
ll /usr/lib/libXmu.so

echo ""
echo ""

echo " Cuda 9.0 설치 "

echo ""
echo -e  "\033[1;34m${PROMPT} apt-get install -y cuda-9-0 \033[0m"
apt-get install -y cuda-9-0  >> dasan_log_install_cuda9.txt   2>&1

echo ""
echo ""

echo "  Nvidia Driver 동작 확인. "

echo ""
echo -e  "\033[1;34m${PROMPT} ll /usr/local/ | grep cuda \033[0m"
ll /usr/local/ | grep cuda

echo ""
echo -e  "\033[1;34m${PROMPT} nvidia-smi -L \033[0m"
nvidia-smi -L

echo ""
echo -e  "\033[1;34m${PROMPT} nvidia-smi   \033[0m"
nvidia-smi


echo ""
echo ""

echo " Cuda 9.0 환경변수 Profile 에 추가 "

echo ""
echo -e  "\033[1;34m${PROMPT} export PATH=/usr/local/cuda-9.0/bin:/usr/local/cuda-9.0/include:\$PATH >> /etc/profile \033[0m"
export PATH=/usr/local/cuda-9.0/bin:/usr/local/cuda-9.0/include:\$PATH >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH >> /etc/profile \033[0m"
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} export CUDA_HOME=/usr/local/cuda-9.0 >> /etc/profile \033[0m"
export CUDA_HOME=/usr/local/cuda-9.0 >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} export CUDA_INC_DIR=/usr/local/cuda-9.0/include >> /etc/profile \033[0m"
export CUDA_INC_DIR=/usr/local/cuda-9.0/include >> /etc/profile

echo ""
echo ""

echo " 추가 확인 "

echo ""
echo -e  "\033[1;34m${PROMPT} tail  /etc/profile   \033[0m"
tail  /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} source /etc/profile   \033[0m"
source /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} source .bashrc  \033[0m"
source .bashrc

echo ""
echo ""

echo " Cuda 컴파일러 동작 확인. "

echo ""
echo -e  "\033[1;34m${PROMPT} ll /usr/local/ | grep cuda  \033[0m"
ll /usr/local/ | grep cuda

echo ""
echo -e  "\033[1;34m${PROMPT} which nvcc \033[0m"
which nvcc

echo ""
echo -e  "\033[1;34m${PROMPT} nvcc -V \033[0m"
nvcc -V

echo ""
echo ""

echo " Cuda 9.0 샘플 컴파일 "

echo ""
echo -e  "\033[1;34m${PROMPT} cp -r  /usr/local/cuda-9.0/samples/   ~/NVIDIA_CUDA-9.0_Samples \033[0m"
cp -r  /usr/local/cuda-9.0/samples/   ~/NVIDIA_CUDA-9.0_Samples

echo ""
echo -e  "\033[1;34m${PROMPT} cd ~/NVIDIA_CUDA-9.0_Samples \033[0m"
cd ~/NVIDIA_CUDA-9.0_Samples

echo ""
echo -e  "\033[1;34m${PROMPT} time make -j$(grep process /proc/cpuinfo | wc -l) \033[0m"
time make -j$(grep process /proc/cpuinfo | wc -l)
