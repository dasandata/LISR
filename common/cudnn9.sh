#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo ""
echo -e  "\033[1;34m${PROMPT} pwd \033[0m"
pwd

echo ""
echo -e  "\033[1;34m${PROMPT} ls \033[0m"
ls

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
