#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo -e  "\033[1;32m"==================== nouveau 가 비활성 화 되었는지 확인. ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} lsmod | grep nouveau \033[0m" >> /root/dasan_install_log.txt
lsmod | grep nouveau

echo ""
echo ""

echo " Cuda-repo (Cuda 저장소) 설치 "

sleep 60

echo ""
echo -e  "\033[1;34m${PROMPT} wget http://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-repo-rhel8-10.2.89-1.x86_64.rpm \033[0m" >> /root/dasan_install_log.txt
wget http://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-repo-rhel8-10.2.89-1.x86_64.rpm

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y cuda-repo-rhel8-10.2.89-1.x86_64.rpm \033[0m" >> /root/dasan_install_log.txt
dnf install -y cuda-repo-rhel8-10.2.89-1.x86_64.rpm

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y libXi-devel mesa-libGLU-devel libXmu-devel libX11-devel freeglut-devel libXm* \033[0m" >> /root/dasan_install_log.txt
dnf install -y libXi-devel mesa-libGLU-devel libXmu-devel libX11-devel freeglut-devel libXm*

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y openmotif* \033[0m" >> /root/dasan_install_log.txt
dnf install -y openmotif*

echo ""
echo -e  "\033[1;34m${PROMPT} dnf --disablerepo="*" --enablerepo="cuda" list available \033[0m" >> /root/dasan_install_log.txt
dnf --disablerepo="*" --enablerepo="cuda" list available

echo ""
echo ""

echo -e  "\033[1;32m"==================== Cuda 10.2 설치 ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y cuda-10-2 \033[0m" >> /root/dasan_install_log.txt
dnf install -y cuda-10-2

sleep 5

echo ""
echo -e  "\033[1;34m${PROMPT} ls /usr/local/ | grep cuda \033[0m" >> /root/dasan_install_log.txt
ls /usr/local/ | grep cuda

echo "  Nvidia Driver 동작 확인. "

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl enable nvidia-persistenced.service \033[0m" >> /root/dasan_install_log.txt
systemctl enable nvidia-persistenced.service

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl start nvidia-persistenced.service \033[0m" >> /root/dasan_install_log.txt
systemctl start nvidia-persistenced.service

echo ""
echo -e  "\033[1;34m${PROMPT} nvidia-smi -L \033[0m" >> /root/dasan_install_log.txt
nvidia-smi -L

echo ""
echo -e  "\033[1;34m${PROMPT} nvidia-smi   \033[0m" >> /root/dasan_install_log.txt
nvidia-smi

echo ""
echo ""

echo " Cuda 10.2 환경변수 Profile 에 추가 "

echo ""
echo -e  "\033[1;34m${PROMPT} echo " "  >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo " "  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " ADD Cuda 10.2 PATH "  >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo " ### ADD Cuda 10.2 PATH "  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export PATH=/usr/local/cuda-10.2/bin:/usr/local/cuda-10.2/include:\$PATH " >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo " export PATH=/usr/local/cuda-10.2/bin:/usr/local/cuda-10.2/include:\$PATH " >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo " export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH " >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export CUDA_HOME=/usr/local/cuda-10.2 " >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo " export CUDA_HOME=/usr/local/cuda-10.2 " >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " export CUDA_INC_DIR=/usr/local/cuda-10.2/include " >> /etc/profile \033[0m" >> /root/dasan_install_log.txt
echo " export CUDA_INC_DIR=/usr/local/cuda-10.2/include " >> /etc/profile

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
echo -e  "\033[1;34m${PROMPT} which nvcc \033[0m" >> /root/dasan_install_log.txt
which nvcc

echo ""
echo -e  "\033[1;34m${PROMPT} nvcc -V \033[0m" >> /root/dasan_install_log.txt
nvcc -V

echo ""
echo ""

echo " Cuda 10.2 샘플 컴파일 "

echo ""
echo -e  "\033[1;34m${PROMPT} cp -r  /usr/local/cuda-10.2/samples/   ~/NVIDIA_CUDA-10.2_Samples \033[0m" >> /root/dasan_install_log.txt
cp -r  /usr/local/cuda-10.2/samples/   ~/NVIDIA_CUDA-10.2_Samples

echo ""
echo -e  "\033[1;34m${PROMPT} cd ~/NVIDIA_CUDA-10.2_Samples \033[0m" >> /root/dasan_install_log.txt
cd ~/NVIDIA_CUDA-10.2_Samples

echo ""
echo -e  "\033[1;34m${PROMPT} time make -j$(grep process /proc/cpuinfo | wc -l) \033[0m" >> /root/dasan_install_log.txt
time make -j$(grep process /proc/cpuinfo | wc -l)

echo ""
echo ""

echo -e  "\033[1;32m"==================== Cudnn 8 install ===================="\033[0m"

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} wget https://developer.download.nvidia.com/compute/machine-learning/repos/rhel8/x86_64/nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm \033[0m" >> /root/dasan_install_log.txt
wget https://developer.download.nvidia.com/compute/machine-learning/repos/rhel8/x86_64/nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm \033[0m" >> /root/dasan_install_log.txt
dnf install -y nvidia-machine-learning-repo-rhel8-1.0.0-1.x86_64.rpm

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y libcudnn8-8.0.2.39-1.cuda10.2  \033[0m" >> /root/dasan_install_log.txt
dnf install -y libcudnn8-8.0.2.39-1.cuda10.2

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y libcudnn8-devel-8.0.2.39-1.cuda10.2   \033[0m" >> /root/dasan_install_log.txt
dnf install -y libcudnn8-devel-8.0.2.39-1.cuda10.2

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y libnccl-2.7.8-1+cuda10.2   \033[0m" >> /root/dasan_install_log.txt
dnf install -y libnccl-2.7.8-1+cuda10.2

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y libnccl-devel-2.7.8-1+cuda10.2  \033[0m" >> /root/dasan_install_log.txt
dnf install -y libnccl-devel-2.7.8-1+cuda10.2

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y libnccl-static-2.7.8-1+cuda10.2   \033[0m" >> /root/dasan_install_log.txt
dnf install -y libnccl-static-2.7.8-1+cuda10.2

echo ""
echo -e  "\033[1;34m${PROMPT} rpm -qa | grep libcudnn8 \033[0m" >> /root/dasan_install_log.txt
rpm -qa | grep libcudnn8

echo ""
echo ""

echo -e  "\033[1;32m"==================== Deep Learning Package Install Python-pip, Tensorflow-gpu ===================="\033[0m"

echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} python2 -V \033[0m" >> /root/dasan_install_log.txt
python2 -V

echo ""
echo -e  "\033[1;34m${PROMPT} python3 -V \033[0m" >> /root/dasan_install_log.txt
python3 -V

echo ""
echo -e  "\033[1;34m${PROMPT} which  pip2 \033[0m" >> /root/dasan_install_log.txt
which pip2

echo ""
echo -e  "\033[1;34m${PROMPT} which  pip3 \033[0m" >> /root/dasan_install_log.txt
which pip3

echo ""
echo -e  "\033[1;34m${PROMPT} pip2 -V \033[0m" >> /root/dasan_install_log.txt
pip2 -V

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 -V \033[0m" >> /root/dasan_install_log.txt
pip3 -V

echo ""
echo -e  "\033[1;34m${PROMPT} pip2 install --upgrade pip \033[0m" >> /root/dasan_install_log.txt
pip2 install --upgrade pip

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install --upgrade pip \033[0m" >> /root/dasan_install_log.txt
pip3 install --upgrade pip

echo ""
echo -e  "\033[1;34m${PROMPT} pip2 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow-gpu \033[0m" >> /root/dasan_install_log.txt
pip2 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow-gpu

echo ""
echo -e  "\033[1;34m${PROMPT} pip2 install --upgrade setuptools \033[0m" >> /root/dasan_install_log.txt
pip2 install --upgrade setuptools

echo ""
echo -e  "\033[1;34m${PROMPT} pip2 list | grep -i ten \033[0m" >> /root/dasan_install_log.txt
pip2 list | grep -i ten

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow-gpu \033[0m" >> /root/dasan_install_log.txt
pip3 install --upgrade numpy scipy nose matplotlib pandas keras tensorflow-gpu

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install --upgrade python-dateutil \033[0m" >> /root/dasan_install_log.txt
pip3 install --upgrade python-dateutil

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 list | grep -i ten \033[0m" >> /root/dasan_install_log.txt
pip3 list | grep -i ten

echo ""
echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/python3.6/python2.7/'   /usr/local/bin/pip \033[0m" >> /root/dasan_install_log.txt
perl -pi -e 's/python3.6/python2.7/'   /usr/local/bin/pip

echo ""
echo ""

echo -e  "\033[1;32m"==================== R-studio Server install ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} wget https://download2.rstudio.org/server/centos8/x86_64/rstudio-server-rhel-1.3.959-x86_64.rpm \033[0m" >> /root/dasan_install_log.txt
wget https://download2.rstudio.org/server/centos8/x86_64/rstudio-server-rhel-1.3.959-x86_64.rpm

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y rstudio-server-rhel-1.3.959-x86_64.rpm \033[0m" >> /root/dasan_install_log.txt
dnf install -y rstudio-server-rhel-1.3.959-x86_64.rpm

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y libRmath-devel R-rpm-macros java-devel libRmath libgfortran.so.5 libopenblas.so.0 libquadmath.so.0 libtcl8.6.so libtk8.6.so \033[0m" >> /root/dasan_install_log.txt
dnf install -y libRmath-devel R-rpm-macros java-devel libRmath libgfortran.so.5 libopenblas.so.0 libquadmath.so.0 libtcl8.6.so libtk8.6.so

echo ""
echo -e  "\033[1;34m${PROMPT} dnf config-manager --set-enabled PowerTools \033[0m" >> /root/dasan_install_log.txt
dnf config-manager --set-enabled PowerTools

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y R \033[0m" >> /root/dasan_install_log.txt
dnf install -y R

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl restart rstudio-server.service \033[0m" >> /root/dasan_install_log.txt
systemctl restart rstudio-server.service

echo -e  "\033[1;32m"==================== Python3 setuptools upgrade install bug firewall-cmd command error ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} cp /usr/local/lib/python3.6/site-packages/six.py /usr/lib/python3.6/site-packages/ \033[0m" >> /root/dasan_install_log.txt
cp /usr/local/lib/python3.6/site-packages/six.py /usr/lib/python3.6/site-packages/

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --list-all \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --list-all

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --add-port=8787/tcp --permanent \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --add-port=8787/tcp --permanent

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --reload \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --reload

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --list-all \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --list-all

echo ""
echo ""

echo -e  "\033[1;32m"==================== Jupyterhub install ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y nodejs \033[0m" >> /root/dasan_install_log.txt
dnf install -y nodejs

echo ""
echo -e  "\033[1;34m${PROMPT} npm install -g configurable-http-proxy \033[0m" >> /root/dasan_install_log.txt
npm install -g configurable-http-proxy

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 install --upgrade jupyterhub notebook flask \033[0m" >> /root/dasan_install_log.txt
pip3 install --upgrade jupyterhub notebook flask

echo ""
echo -e  "\033[1;34m${PROMPT} pip3 list | grep -i jupyterhub \033[0m" >> /root/dasan_install_log.txt
pip3 list | grep -i jupyterhub

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --list-all \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --list-all

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --add-port=8000/tcp --permanent \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --add-port=8000/tcp --permanent

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --reload \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --reload

echo ""
echo -e  "\033[1;34m${PROMPT} firewall-cmd --list-all \033[0m" >> /root/dasan_install_log.txt
firewall-cmd --list-all

echo ""
echo -e  "\033[1;34m${PROMPT} mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub.service /lib/systemd/system/ \033[0m" >> /root/dasan_install_log.txt
mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub.service /lib/systemd/system/

echo ""
echo -e  "\033[1;34m${PROMPT} chmod 777 /lib/systemd/system/jupyterhub.service \033[0m" >> /root/dasan_install_log.txt
chmod 777 /lib/systemd/system/jupyterhub.service

echo ""
echo -e  "\033[1;34m${PROMPT} mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub /etc/init.d/ \033[0m" >> /root/dasan_install_log.txt
mv /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/jupyterhub /etc/init.d/

echo ""
echo -e  "\033[1;34m${PROMPT} chmod 755 /etc/init.d/jupyterhub \033[0m" >> /root/dasan_install_log.txt
chmod 755 /etc/init.d/jupyterhub

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl daemon-reload \033[0m" >> /root/dasan_install_log.txt
systemctl daemon-reload

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl enable jupyterhub.service \033[0m" >> /root/dasan_install_log.txt
systemctl enable jupyterhub.service

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl restart jupyterhub.service \033[0m" >> /root/dasan_install_log.txt
systemctl restart jupyterhub.service

echo ""
echo -e  "\033[1;34m${PROMPT} R CMD BATCH /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/r_jupyterhub.R \033[0m" >> /root/dasan_install_log.txt
R CMD BATCH /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/2-3-2_GPU/r_jupyterhub.R

echo ""
echo ""

echo -e  "\033[1;32m"==================== Pycharm install ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y snapd \033[0m" >> /root/dasan_install_log.txt
dnf install -y snapd

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl enable --now snapd.socket \033[0m" >> /root/dasan_install_log.txt
systemctl enable --now snapd.socket

echo ""
echo -e  "\033[1;34m${PROMPT} ln -s /var/lib/snapd/snap /snap \033[0m" >> /root/dasan_install_log.txt
ln -s /var/lib/snapd/snap /snap

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl restart snapd.socket \033[0m" >> /root/dasan_install_log.txt
systemctl restart snapd.socket

sleep 30

echo ""
echo -e  "\033[1;34m${PROMPT} snap install pycharm-community --classic \033[0m" >> /root/dasan_install_log.txt
snap install pycharm-community --classic

sleep 300

echo ""
echo ""

echo "  rc.local 등록 "
echo -e  "\033[1;34m${PROMPT} sed -i '14s/Dasan_Centos8-GPU-Package-install.sh/Dasan-dell-install.sh/g' /etc/rc.d/rc.local    \033[0m" >> /root/dasan_install_log.txt
sed -i '14s/Dasan_Centos8-GPU-Package-install.sh/Dasan-dell-install.sh/g' /etc/rc.d/rc.local

echo -e  "\033[1;34m${PROMPT} cat /etc/rc.d/rc.local  | sed -n 14p \033[0m" >> /root/dasan_install_log.txt
cat /etc/rc.d/rc.local  | sed -n 14p

echo " 재 부팅 "
echo -e  "\033[1;34m${PROMPT} reboot  재 부팅 \033[0m" >> /root/dasan_install_log.txt
reboot
