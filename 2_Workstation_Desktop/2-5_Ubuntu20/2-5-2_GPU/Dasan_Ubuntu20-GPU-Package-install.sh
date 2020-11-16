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
apt-get install -y sudo gnupg

echo ""
apt-key adv --fetch-keys "http://developer.download.nvidia.com/compute/cuda/repos/"$release"/x86_64/7fa2af80.pub" >> /root/log.txt

echo ""
sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/'$release'/x86_64 /" > /etc/apt/sources.list.d/nvidia-cuda.list' >> /root/log.txt

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

echo -e  "==================== Cuda 11.0 설치 ===================="

echo ""
echo -e  "${PROMPT} apt-get install -y cuda-11-0 " >> /root/dasan_install_log.txt
apt-get install -y cuda-11-0

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
echo -e  "${PROMPT} systemctl enable nvidia-persistenced " >> /root/dasan_install_log.txt
systemctl enable nvidia-persistenced

echo ""
echo ""

echo " Cuda 11.0 환경변수 Profile 에 추가 "

echo ""
echo -e  "${PROMPT} echo " "  >> /etc/profile " >> /root/dasan_install_log.txt
echo " "  >> /etc/profile

echo ""
echo -e  "${PROMPT} echo " ADD Cuda 11.0 PATH "  >> /etc/profile " >> /root/dasan_install_log.txt
echo " ### ADD Cuda 11.0 PATH "  >> /etc/profile

echo ""
echo -e  "${PROMPT} echo " export PATH=/usr/local/cuda-11.0/bin:/usr/local/cuda-11.0/include:\$PATH " >> /etc/profile " >> /root/dasan_install_log.txt
echo " export PATH=/usr/local/cuda-11.0/bin:/usr/local/cuda-11.0/include:\$PATH " >> /etc/profile

echo ""
echo -e  "${PROMPT} echo " export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile " >> /root/dasan_install_log.txt
echo " export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile

echo ""
echo -e  "${PROMPT} echo " export CUDA_HOME=/usr/local/cuda-11.0 " >> /etc/profile " >> /root/dasan_install_log.txt
echo " export CUDA_HOME=/usr/local/cuda-11.0 " >> /etc/profile

echo ""
echo -e  "${PROMPT} echo " export CUDA_INC_DIR=/usr/local/cuda-11.0/include " >> /etc/profile " >> /root/dasan_install_log.txt
echo " export CUDA_INC_DIR=/usr/local/cuda-11.0/include " >> /etc/profile

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

echo " Cuda 11.0 샘플 컴파일 "

echo ""
echo -e  "${PROMPT} cp -r  /usr/local/cuda-11.0/samples/   ~/NVIDIA_CUDA-11.0_Samples " >> /root/dasan_install_log.txt
cp -r  /usr/local/cuda-11.0/samples/   ~/NVIDIA_CUDA-11.0_Samples

echo ""
echo -e  "${PROMPT} cd ~/NVIDIA_CUDA-11.0_Samples " >> /root/dasan_install_log.txt
cd ~/NVIDIA_CUDA-11.0_Samples

echo ""
echo -e  "${PROMPT} time make -j$(grep process /proc/cpuinfo | wc -l) " >> /root/dasan_install_log.txt
time make -j$(grep process /proc/cpuinfo | wc -l) >> /root/log.txt

echo ""
echo ""

## echo -e  "==================== Cudnn 7 install ===================="

## echo ""
## echo ""

## echo ""
## echo -e  "${PROMPT} apt-get install -y libcudnn7=7.6.5.32-1+cuda10.0 " >> /root/dasan_install_log.txt
## apt-get install -y libcudnn7=7.6.5.32-1+cuda10.0

## echo ""
## echo -e  "${PROMPT} apt-get install -y libcudnn7-dev=7.6.5.32-1+cuda10.0  " >> /root/dasan_install_log.txt
## apt-get install -y libcudnn7-dev=7.6.5.32-1+cuda10.0

## echo ""
## echo -e  "${PROMPT} apt-get update " >> /root/dasan_install_log.txt
## apt-get update >> /root/log.txt

## echo ""
## echo -e  "${PROMPT} apt-get install -y libcublas-dev " >> /root/dasan_install_log.txt
## apt-get install -y libcublas-dev >> /root/log.txt

## echo ""
## echo ""

echo -e  "==================== Deep Learning Package Install python-PIP, tensorflow ===================="

echo ""
echo -e  "${PROMPT} pip install --upgrade numpy scipy  nose  matplotlib  pandas  keras tensorflow-gpu " >> /root/dasan_install_log.txt
pip install --upgrade numpy scipy  nose  matplotlib  pandas  keras tensorflow-gpu

echo ""
echo -e  "${PROMPT} pip install scipy==1.2.2 " >> /root/dasan_install_log.txt
pip install scipy==1.2.2

echo ""
echo -e  "${PROMPT} pip3 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow-gpu " >> /root/dasan_install_log.txt
pip3 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow-gpu

echo ""
echo -e  "${PROMPT} pip3 install numpy==1.16.0 scipy==1.4.1 " >> /root/dasan_install_log.txt
pip3 install numpy==1.16.0 scipy==1.4.1

echo ""
echo -e  "${PROMPT} pip install --upgrade torch torchvision " >> /root/dasan_install_log.txt
pip install --upgrade torch torchvision

echo ""
echo -e  "${PROMPT} pip3 install --upgrade torch torchvision " >> /root/dasan_install_log.txt
pip3 install --upgrade torch torchvision

echo ""
echo ""

echo -e  "==================== R Server install ===================="

echo ""
echo -e  "${PROMPT} apt-get install -y r-base " >> /root/dasan_install_log.txt
apt-get install -y r-base

echo ""
echo -e  "${PROMPT} apt-get install -y gdebi-core " >> /root/dasan_install_log.txt
apt-get install -y gdebi-core

echo ""
echo -e  "${PROMPT} wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.1073-amd64.deb " >> /root/dasan_install_log.txt
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.1073-amd64.deb

echo ""
echo -e  "${PROMPT} yes | gdebi rstudio-server-1.3.1073-amd64.deb " >> /root/dasan_install_log.txt
yes | gdebi rstudio-server-1.3.1073-amd64.deb

echo ""
echo -e  "${PROMPT} ufw allow 8787/tcp " >> /root/dasan_install_log.txt
ufw allow 8787/tcp

echo ""
echo -e  "${PROMPT} ufw status " >> /root/dasan_install_log.txt
ufw status

echo ""
echo ""

echo -e  "==================== Jupyter hub install ===================="

echo ""
echo -e  "${PROMPT} curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - " >> /root/dasan_install_log.txt
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

echo ""
echo -e  "${PROMPT} apt-get install -y nodejs " >> /root/dasan_install_log.txt
apt-get install -y nodejs >> /root/log.txt

echo ""
echo -e  "${PROMPT} apt-get install -y  default-jre " >> /root/dasan_install_log.txt
apt-get install -y  default-jre >> /root/log.txt

echo ""
echo -e  "${PROMPT} npm install -g configurable-http-proxy " >> /root/dasan_install_log.txt
npm install -g configurable-http-proxy >> /root/log.txt

echo ""
echo -e  "${PROMPT} pip3 install --upgrade jupyterhub notebook " >> /root/dasan_install_log.txt
pip3 install --upgrade jupyterhub notebook >> /root/log.txt

echo ""
echo -e  "${PROMPT} ufw allow 8000/tcp " >> /root/dasan_install_log.txt
ufw allow 8000/tcp >> /root/log.txt

echo ""
echo -e  "${PROMPT} ufw status " >> /root/dasan_install_log.txt
ufw status >> /root/log.txt

echo ""
echo -e  "${PROMPT} mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub /etc/init.d/ " >> /root/dasan_install_log.txt
mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub /etc/init.d/ >> /root/log.txt

echo ""
echo -e  "${PROMPT} chmod 755 /etc/init.d/jupyterhub " >> /root/dasan_install_log.txt
chmod 755 /etc/init.d/jupyterhub >> /root/log.txt

echo ""
echo -e  "${PROMPT} mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub.service /lib/systemd/system/ " >> /root/dasan_install_log.txt
mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub.service /lib/systemd/system/ >> /root/log.txt

echo ""
echo -e  "${PROMPT} chmod 777 /lib/systemd/system/jupyterhub.service " >> /root/dasan_install_log.txt
chmod 777 /lib/systemd/system/jupyterhub.service >> /root/log.txt

echo ""
echo -e  "${PROMPT} systemctl daemon-reload " >> /root/dasan_install_log.txt
systemctl daemon-reload >> /root/log.txt

echo ""
echo -e  "${PROMPT} systemctl enable jupyterhub.service " >> /root/dasan_install_log.txt
systemctl enable jupyterhub.service >> /root/log.txt

echo ""
echo -e  "${PROMPT} apt-get install -y libxml2-dev libzmq3-dev libcurl4-openssl-dev " >> /root/dasan_install_log.txt
apt-get install -y libxml2-dev libzmq3-dev libcurl4-openssl-dev >> /root/log.txt

echo ""
echo -e  "${PROMPT} R CMD BATCH /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/r_jupyterhub.R " >> /root/dasan_install_log.txt
R CMD BATCH /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/r_jupyterhub.R >> /root/log.txt

echo ""
echo ""

echo -e  "==================== Pycharm install ===================="

echo ""
echo -e  "${PROMPT} snap install pycharm-community --classic " >> /root/dasan_install_log.txt
snap install pycharm-community --classic >> /root/log.txt

echo ""
echo -e  "${PROMPT} systemctl set-default graphical.target " >> /root/dasan_install_log.txt
systemctl set-default graphical.target >> /root/log.txt

echo ""
echo -e  "${PROMPT} systemctl get-default  " >> /root/dasan_install_log.txt
systemctl get-default  >> /root/log.txt

echo ""
echo ""

echo "  rc.local 등록 "
echo ""
echo -e  "${PROMPT} sed -i '/root/d' /etc/rc.local  " >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.local

echo ""
echo ""

echo -e  "${PROMPT} cat /etc/rc.local | sed -n 2p " >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 2p

echo ""
echo ""

echo "  재부팅 "
echo -e  "${PROMPT} reboot " >> /root/dasan_install_log.txt
reboot
