#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo -e  "==================== nouveau 가 비활성 화 되었는지 확인. ===================="

echo ""
echo -e  "${PROMPT} lsmod  | grep  nouveau " >> /root/dasan_install_log.txt
lsmod  | grep  nouveau


echo ""
echo ""

echo " Cuda-repo (Cuda 저장소) 설치 "

echo ""
release="ubuntu"$(lsb_release -sr | sed -e "s/\.//g")

echo ""
echo -e  "${PROMPT} apt-get install sudo gnupg " >> /root/dasan_install_log.txt
apt-get install -y sudo gnupg >> /root/log.txt

echo ""
apt-key adv --fetch-keys "http://developer.download.nvidia.com/compute/cuda/repos/"$release"/x86_64/7fa2af80.pub" >> /root/log.txt

echo ""
sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/'$release'/x86_64 /" > /etc/apt/sources.list.d/nvidia-cuda.list' >> /root/log.txt

echo ""
sh -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/'$release'/x86_64 /" > /etc/apt/sources.list.d/nvidia-machine-learning.list' >> /root/log.txt

echo ""
echo ""

echo " Cuda-repo 에서 설치가능한 패키지 목록 확인. "

echo ""
echo -e  "${PROMPT} apt-get update " >> /root/dasan_install_log.txt
apt-get update >> /root/log.txt

echo ""
echo -e  "${PROMPT} apt-cache  search   cuda " >> /root/dasan_install_log.txt
apt-cache  search   cuda

echo ""
echo ""

echo -e  "==================== Cuda 10.0 설치 ===================="

echo ""
echo -e  "${PROMPT} apt-get install -y cuda-10-0 " >> /root/dasan_install_log.txt
apt-get install -y cuda-10-0  >> /root/log.txt

echo ""
echo ""

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
echo -e  "${PROMPT} apt-get install -y libcudnn7=7.6.5.32-1+cuda10.0 " >> /root/dasan_install_log.txt
apt-get install -y libcudnn7=7.6.5.32-1+cuda10.0

echo ""
echo -e  "${PROMPT} apt-get install -y libcudnn7-dev=7.6.5.32-1+cuda10.0  " >> /root/dasan_install_log.txt
apt-get install -y libcudnn7-dev=7.6.5.32-1+cuda10.0

echo ""
echo -e  "${PROMPT} apt-get update " >> /root/dasan_install_log.txt
apt-get update >> /root/log.txt

echo ""
echo -e  "${PROMPT} apt-get install -y libcublas-dev " >> /root/dasan_install_log.txt
apt-get install -y libcublas-dev >> /root/log.txt

echo ""
echo ""

echo -e  "==================== Deep Learning Package Install python-PIP, tensorflow ===================="

echo ""
echo -e  "${PROMPT} cd ~ " >> /root/dasan_install_log.txt
cd ~

echo ""
echo -e  "${PROMPT} python -V " >> /root/dasan_install_log.txt
python -V

echo ""
echo -e  "${PROMPT} which  python " >> /root/dasan_install_log.txt
which  python

echo ""
echo -e  "${PROMPT} python3 -V " >> /root/dasan_install_log.txt
python3 -V

echo ""
echo -e  "${PROMPT} which  python3 " >> /root/dasan_install_log.txt
which  python3

echo ""
echo -e  "${PROMPT} apt-get install -y  python-pip python3-pip python-tk python3-tk " >> /root/dasan_install_log.txt
apt-get install -y  python-pip python3-pip python-tk python3-tk >> /root/log.txt

echo ""
echo ""

echo " pip Check "

echo ""
echo -e  "${PROMPT} python -V " >> /root/dasan_install_log.txt
python -V

echo ""
echo -e  "${PROMPT} which  python " >> /root/dasan_install_log.txt
which  python

echo ""
echo -e  "${PROMPT} python3 -V " >> /root/dasan_install_log.txt
python3 -V

echo ""
echo -e  "${PROMPT} which  python3 " >> /root/dasan_install_log.txt
which  python3

echo ""
echo ""

echo " ADD package install "

echo ""
echo -e  "${PROMPT} pip   install --upgrade pip " >> /root/dasan_install_log.txt
pip   install --upgrade pip >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip3   install --upgrade pip " >> /root/dasan_install_log.txt
pip3   install --upgrade pip >> /root/log.txt

echo ""
echo ""

echo "  rc.local 등록 "
echo -e  "${PROMPT} sed -i '2s/Dasan_Ubuntu18-CUDA10_1-install.sh/Dasan_Ubuntu18-CUDA10_2-install.sh/g' /etc/rc.local  " >> /root/dasan_install_log.txt
sed -i '2s/Dasan_Ubuntu18-CUDA10_1-install.sh/Dasan_Ubuntu18-CUDA10_2-install.sh/g' /etc/rc.local

echo -e  "${PROMPT} cat /etc/rc.local | sed -n 2p " >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 2p

echo ""
echo ""

echo "  재부팅 "
echo -e  "${PROMPT} reboot " >> /root/dasan_install_log.txt
reboot
