#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo -e  "\033[1;32m"==================== Cuda10 Sample Test ===================="\033[0m"

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} ./NVIDIA_CUDA-10.0_Samples/bin/x86_64/linux/release/deviceQuery \033[0m" >> /root/dasan_install_log.txt
./NVIDIA_CUDA-10.0_Samples/bin/x86_64/linux/release/deviceQuery >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} ./NVIDIA_CUDA-10.0_Samples/bin/x86_64/linux/release/p2pBandwidthLatencyTest \033[0m" >> /root/dasan_install_log.txt
./NVIDIA_CUDA-10.0_Samples/bin/x86_64/linux/release/p2pBandwidthLatencyTest >> /root/dasan_install_log.txt 2>&1

echo ""
echo ""

echo -e  "\033[1;32m"==================== Tensorflow-gpu Test ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} git clone https://github.com/aymericdamien/TensorFlow-Examples.git \033[0m" >> /root/dasan_install_log.txt
git clone https://github.com/aymericdamien/TensorFlow-Examples.git >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} ls  TensorFlow-Examples \033[0m" >> /root/dasan_install_log.txt
ls  TensorFlow-Examples

echo ""
echo -e  "\033[1;34m${PROMPT} python        TensorFlow-Examples/examples/1_Introduction/helloworld.py \033[0m" >> /root/dasan_install_log.txt
python        TensorFlow-Examples/examples/1_Introduction/helloworld.py >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} python        TensorFlow-Examples/examples/1_Introduction/basic_operations.py \033[0m" >> /root/dasan_install_log.txt
python        TensorFlow-Examples/examples/1_Introduction/basic_operations.py >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} python3      TensorFlow-Examples/examples/1_Introduction/helloworld.py \033[0m" >> /root/dasan_install_log.txt
python3      TensorFlow-Examples/examples/1_Introduction/helloworld.py >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} python3      TensorFlow-Examples/examples/1_Introduction/basic_operations.py \033[0m" >> /root/dasan_install_log.txt
python3      TensorFlow-Examples/examples/1_Introduction/basic_operations.py >> /root/dasan_install_log.txt 2>&1

echo ""
echo ""

echo -e  "\033[1;32m"==================== Pytorch Test ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} git clone https://github.com/pytorch/examples/ \033[0m" >> /root/dasan_install_log.txt
git clone https://github.com/pytorch/examples/ >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} python     examples/regression/main.py \033[0m" >> /root/dasan_install_log.txt
python     examples/regression/main.py >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} python3     examples/regression/main.py \033[0m" >> /root/dasan_install_log.txt
python3     examples/regression/main.py >> /root/dasan_install_log.txt 2>&1

echo ""
echo ""

echo -e  "\033[1;32m"==================== GPU Burning Test ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} git clone https://github.com/wilicc/gpu-burn \033[0m" >> /root/dasan_install_log.txt
git clone https://github.com/wilicc/gpu-burn >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} cd gpu-burn \033[0m" >> /root/dasan_install_log.txt
cd gpu-burn >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} make \033[0m" >> /root/dasan_install_log.txt
make >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} ./gpu_burn 60 \033[0m" >> /root/dasan_install_log.txt
./gpu_burn 60 >> /root/dasan_install_log.txt 2>&1

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} reboot  \033[0m" >> /root/dasan_install_log.txt
reboot
