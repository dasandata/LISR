#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo -e  "==================== Cuda10 Sample Test ===================="

echo ""
echo ""

echo ""
echo -e  "${PROMPT} ./NVIDIA_CUDA-10.0_Samples/bin/x86_64/linux/release/deviceQuery " >> /root/dasan_install_log.txt
./NVIDIA_CUDA-10.0_Samples/bin/x86_64/linux/release/deviceQuery >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "${PROMPT} ./NVIDIA_CUDA-10.0_Samples/bin/x86_64/linux/release/p2pBandwidthLatencyTest " >> /root/dasan_install_log.txt
./NVIDIA_CUDA-10.0_Samples/bin/x86_64/linux/release/p2pBandwidthLatencyTest >> /root/dasan_install_log.txt 2>&1

echo ""
echo ""

echo -e  "==================== Tensorflow-gpu Test ===================="

echo ""
echo -e  "${PROMPT} git clone https://github.com/aymericdamien/TensorFlow-Examples.git " >> /root/dasan_install_log.txt
git clone https://github.com/aymericdamien/TensorFlow-Examples.git >> /root/log.txt

echo ""
echo -e  "${PROMPT} ls  TensorFlow-Examples " >> /root/dasan_install_log.txt
ls  TensorFlow-Examples

echo ""
echo -e  "${PROMPT} python        TensorFlow-Examples/examples/1_Introduction/helloworld.py " >> /root/dasan_install_log.txt
python        TensorFlow-Examples/examples/1_Introduction/helloworld.py >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "${PROMPT} python        TensorFlow-Examples/examples/1_Introduction/basic_operations.py " >> /root/dasan_install_log.txt
python        TensorFlow-Examples/examples/1_Introduction/basic_operations.py >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "${PROMPT} python3      TensorFlow-Examples/examples/1_Introduction/helloworld.py " >> /root/dasan_install_log.txt
python3      TensorFlow-Examples/examples/1_Introduction/helloworld.py >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "${PROMPT} python3      TensorFlow-Examples/examples/1_Introduction/basic_operations.py " >> /root/dasan_install_log.txt
python3      TensorFlow-Examples/examples/1_Introduction/basic_operations.py >> /root/dasan_install_log.txt 2>&1

echo ""
echo ""

echo -e  "==================== GPU Burning Test ===================="

echo ""
echo -e  "${PROMPT} git clone https://github.com/wilicc/gpu-burn " >> /root/dasan_install_log.txt
git clone https://github.com/wilicc/gpu-burn >> /root/log.txt

echo ""
echo -e  "${PROMPT} cd gpu-burn " >> /root/dasan_install_log.txt
cd gpu-burn >> /root/dasan_install_log.txt 2>&1

echo ""
echo -e  "${PROMPT} make " >> /root/dasan_install_log.txt
make >> /root/log.txt

echo ""
echo -e  "${PROMPT} ./gpu_burn 60 " >> /root/dasan_install_log.txt
./gpu_burn 60 >> /root/dasan_install_log.txt 2>&1

echo ""
echo ""

echo ""
echo -e  "${PROMPT} reboot  " >> /root/dasan_install_log.txt
reboot
