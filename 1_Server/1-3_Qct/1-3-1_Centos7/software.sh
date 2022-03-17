#!/bin/bash

echo "관리자 의 용도는 CPU 인가요 GPU 인가요 ?."
echo "Administrator purpose CPU or GPU ?"


echo "1) CPU"
echo "2) GPU"
echo "3) Exit"

read WORD
case $WORD in
    1 | cpu | CPU)
        echo start centos7 CPU software.
        bash /root/LISR/1_Server/1-3_Qct/1-3-1_Centos7/1-3-1-1_CPU/start-cpu.sh
        ;;
    2 | gpu | GPU)
        echo start centos7 GPU software.
        echo " Installed application test file "
        echo " bash /root/LISR/1_Server/1-3_Qct/1-3-1_Centos7/1-3-1-2_GPU/Dasan_Centos7-CUDA10_3-install.sh "
        bash /root/LISR/1_Server/1-3_Qct/1-3-1_Centos7/1-3-1-2_GPU/start-gpu.sh
        ;;
    3 | exit | Exit)
        echo clear out.
        ;;
    *)
        echo command error.
        ;;

esac
