#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo ""
echo -e  "\033[1;34m${PROMPT} mount -t nfs 192.168.0.5:file /mnt \033[0m"
mount -t nfs 192.168.0.5:file /mnt

echo ""
echo -e  "\033[1;34m${PROMPT} mkdir /root/cudnn7 \033[0m"
mkdir /root/cudnn7

echo ""
echo -e  "\033[1;34m${PROMPT} cp /mnt/2_windows\ 관련\ \(서울대\)/windows_cuda_file/cudnn-9.0-linux-x64-v7.* /root/cudnn7 \033[0m"
cp /mnt/2_windows\ 관련\ \(서울대\)/windows_cuda_file/cudnn-9.0-linux-x64-v7.* /root/cudnn7

sleep 5

echo ""
echo -e  "\033[1;34m${PROMPT} cd  /root/cudnn7 \033[0m"
cd  /root/cudnn7

echo ""
echo -e  "\033[1;34m${PROMPT} umount /mnt #마운트 해제 \033[0m"
umount /mnt #마운트 해제

echo ""
echo -e  "\033[1;34m${PROMPT} pwd \033[0m"
pwd

echo ""
echo -e  "\033[1;34m${PROMPT} ll \033[0m"
ll

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-9.0-linux-x64-v7.tgz \033[0m"
tar xvzf cudnn-9.0-linux-x64-v7.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-9.0-linux-x64-v7.1.tgz \033[0m"
tar xvzf cudnn-9.0-linux-x64-v7.1.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-9.0-linux-x64-v7.3.1.20.tgz \033[0m"
tar xvzf cudnn-9.0-linux-x64-v7.3.1.20.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf cudnn-9.0-linux-x64-v7.4.1.5.tgz \033[0m"
tar xvzf cudnn-9.0-linux-x64-v7.4.1.5.tgz

echo ""
echo -e  "\033[1;34m${PROMPT} ls -l cuda/include/ \033[0m"
ls -l cuda/include/

echo ""
echo -e  "\033[1;34m${PROMPT} ls -l cuda/lib64/ \033[0m"
ls -l cuda/lib64/

echo ""
echo -e  "\033[1;34m${PROMPT} chmod  a+r  cuda/include/* \033[0m"
chmod  a+r  cuda/include/*

echo ""
echo -e  "\033[1;34m${PROMPT} chmod  a+r  cuda/lib64/* \033[0m"
chmod  a+r  cuda/lib64/*

echo ""
echo -e  "\033[1;34m${PROMPT} cp  -rp  cuda/include/cudnn.h  /usr/local/cuda-9.0/include/ \033[0m"
cp  -rp  cuda/include/cudnn.h  /usr/local/cuda-9.0/include/

echo ""
echo -e  "\033[1;34m${PROMPT} cp  -rp  cuda/lib64/libcudnn*  /usr/local/cuda-9.0/lib64/ \033[0m"
cp  -rp  cuda/lib64/libcudnn*  /usr/local/cuda-9.0/lib64/

echo ""
echo -e  "\033[1;34m${PROMPT} ls -l /usr/local/cuda-9.0/lib64/libcudnn* \033[0m"
ls -l /usr/local/cuda-9.0/lib64/libcudnn*

echo ""
echo -e  "\033[1;34m${PROMPT} cd ~ \033[0m"
cd ~
