#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;32m"==================== CUDA Profile 설정 ===================="\033[0m"

echo ""
echo ""

echo " Cuda 9.0 환경변수 Profile 에 추가 "

echo ""
echo -e  "\033[1;34m${PROMPT} echo " "  >> /etc/profile \033[0m"
echo " "  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " ADD Cuda 9.0 PATH "  >> /etc/profile \033[0m"
echo " ### ADD Cuda 9.0 PATH "  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export PATH=/usr/local/cuda-9.0/bin:/usr/local/cuda-9.0/include:\$PATH " >> /etc/profile \033[0m"
echo " export PATH=/usr/local/cuda-9.0/bin:/usr/local/cuda-9.0/include:\$PATH " >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile \033[0m"
echo " export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export CUDA_HOME=/usr/local/cuda-9.0 " >> /etc/profile \033[0m"
echo " export CUDA_HOME=/usr/local/cuda-9.0 " >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export CUDA_INC_DIR=/usr/local/cuda-9.0/include " >> /etc/profile \033[0m"
echo " export CUDA_INC_DIR=/usr/local/cuda-9.0/include " >> /etc/profile

echo ""
echo ""

echo " 추가 확인 "

echo ""
echo -e  "\033[1;34m${PROMPT} tail -5  /etc/profile   \033[0m"
tail  -5 /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} source /etc/profile   \033[0m"
source /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} source .bashrc  \033[0m"
source .bashrc


sleep 10

echo ""
echo ""

echo " Cuda 컴파일러 동작 확인. "

echo ""
echo -e  "\033[1;34m${PROMPT} ls /usr/local/ | grep cuda  \033[0m"
ls /usr/local/ | grep cuda

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

echo ""
echo ""

echo -e  "\033[1;32m"==================== Deep Learning Package Install python-PIP, tensorflow ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} cd ~ \033[0m"
cd ~

echo ""
echo -e  "\033[1;34m${PROMPT} python -V \033[0m"
python -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python \033[0m"
which  python

echo ""
echo -e  "\033[1;34m${PROMPT} python3 -V \033[0m"
python3 -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python3 \033[0m"
which  python3

echo ""
echo -e  "\033[1;34m${PROMPT} apt-get install -y  python-pip python3-pip  python3-tk \033[0m"
apt-get install -y  python-pip python3-pip  python3-tk  >> dasan_log_install_python3.txt   2>&1

echo ""
echo ""

echo " pip Check "

echo ""
echo -e  "\033[1;34m${PROMPT} python -V \033[0m"
python -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python \033[0m"
which  python

echo ""
echo -e  "\033[1;34m${PROMPT} python3 -V \033[0m"
python3 -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  python3 \033[0m"
which  python3

echo ""
echo ""

echo " ADD package install "

echo ""
echo -e  "\033[1;34m${PROMPT} pip   install --upgrade pip \033[0m"
pip   install --upgrade pip

echo ""
echo -e  "\033[1;34m${PROMPT} pip3   install --upgrade pip \033[0m"
pip3   install --upgrade pip

echo ""
echo ""

echo " 컨트롤 + D 를 눌려 로그아웃 후 재 접속 후 Dasan_GPU_pip_tensorflow_pytorch_install.sh 실행 파일 실행 "
