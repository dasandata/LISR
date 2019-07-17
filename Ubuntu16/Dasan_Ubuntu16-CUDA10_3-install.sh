#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;32m"==================== Cuda10 Sample Test ===================="\033[0m"

echo ""
echo ""

sleep 60

echo ""
echo -e  "\033[1;34m${PROMPT} ./NVIDIA_CUDA-10.0_Samples/bin/x86_64/linux/release/deviceQuery \033[0m" >> /root/Dasan_command.txt
./NVIDIA_CUDA-10.0_Samples/bin/x86_64/linux/release/deviceQuery >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} ./NVIDIA_CUDA-10.0_Samples/bin/x86_64/linux/release/p2pBandwidthLatencyTest \033[0m" >> /root/Dasan_command.txt
./NVIDIA_CUDA-10.0_Samples/bin/x86_64/linux/release/p2pBandwidthLatencyTest >> /root/dasan_install_log.txt 2>&1

echo ""
echo ""

echo -e  "\033[1;32m"==================== Tensorflow-gpu Test ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} git clone https://github.com/aymericdamien/TensorFlow-Examples.git \033[0m" >> /root/Dasan_command.txt
git clone https://github.com/aymericdamien/TensorFlow-Examples.git >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} ls  TensorFlow-Examples \033[0m" >> /root/Dasan_command.txt
ls  TensorFlow-Examples

echo ""
echo -e  "\033[1;34m${PROMPT} python        TensorFlow-Examples/examples/1_Introduction/helloworld.py \033[0m" >> /root/Dasan_command.txt
python        TensorFlow-Examples/examples/1_Introduction/helloworld.py >> /root/dasan_install_log.txt 2>&1

sleep 10

echo ""
echo -e  "\033[1;34m${PROMPT} python        TensorFlow-Examples/examples/1_Introduction/basic_operations.py \033[0m" >> /root/Dasan_command.txt
python        TensorFlow-Examples/examples/1_Introduction/basic_operations.py >> /root/dasan_install_log.txt 2>&1

sleep 10

echo ""
echo -e  "\033[1;34m${PROMPT} python3      TensorFlow-Examples/examples/1_Introduction/helloworld.py \033[0m" >> /root/Dasan_command.txt
python3      TensorFlow-Examples/examples/1_Introduction/helloworld.py >> /root/dasan_install_log.txt 2>&1

sleep 10

echo ""
echo -e  "\033[1;34m${PROMPT} python3      TensorFlow-Examples/examples/1_Introduction/basic_operations.py \033[0m" >> /root/Dasan_command.txt
python3      TensorFlow-Examples/examples/1_Introduction/basic_operations.py >> /root/dasan_install_log.txt 2>&1

sleep 10

echo ""
echo ""

echo -e  "\033[1;32m"==================== Pytorch Test ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} git clone https://github.com/pytorch/examples/ \033[0m" >> /root/Dasan_command.txt
git clone https://github.com/pytorch/examples/ >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} python     examples/regression/main.py \033[0m" >> /root/Dasan_command.txt
python     examples/regression/main.py >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} python3     examples/regression/main.py \033[0m" >> /root/Dasan_command.txt
python3     examples/regression/main.py >> /root/dasan_install_log.txt 2>&1

echo ""
echo ""

echo -e  "\033[1;32m"==================== GPU Burning Test ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} git clone https://github.com/wilicc/gpu-burn \033[0m" >> /root/Dasan_command.txt
git clone https://github.com/wilicc/gpu-burn >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} cd gpu-burn \033[0m" >> /root/Dasan_command.txt
cd gpu-burn >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} make \033[0m" >> /root/Dasan_command.txt
make >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "\033[1;34m${PROMPT} ./gpu_burn 60 \033[0m" >> /root/Dasan_command.txt
./gpu_burn 60 >> /root/dasan_install_log.txt 2>&1

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i '/root/d' /etc/rc.local  \033[0m" >> /root/Dasan_command.txt
sed -i '/root/d' /etc/rc.local

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i '13a nvidia-smi -pm 1' /etc/rc.local  \033[0m" >> /root/Dasan_command.txt
sed -i '13a nvidia-smi -pm 1' /etc/rc.local

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/rc.local | sed -n 13p  \033[0m" >> /root/Dasan_command.txt
cat /etc/rc.local | sed -n 13p

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} reboot  \033[0m" >> /root/Dasan_command.txt
reboot
