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
echo -e  "\033[1;34m${PROMPT} curl  -L -o  cuda-repo-rhel7-10.0.130-1.x86_64.rpm \033[0m" >> /root/Dasan_command.txt
curl  -L -o  cuda-repo-rhel7-10.0.130-1.x86_64.rpm

echo ""
echo -e  "\033[1;34m${PROMPT} http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-10.0.130-1.x86_64.rpm \033[0m" >> /root/Dasan_command.txt
http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-10.0.130-1.x86_64.rpm

echo ""
echo -e  "\033[1;34m${PROMPT} yum -y install cuda-repo-rhel7-10.0.130-1.x86_64.rpm" >> /root/Dasan_command.txt
curl  -L -o  cuda-repo-rhel7-10.0.130-1.x86_64.rpm
