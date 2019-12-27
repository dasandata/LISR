#!/bin/bash

echo you system CPU or GPU  install?

echo "select install system."
echo "1) cpu?"
echo "2) gpu?"
echo "3) Exit"

read WORD
case $WORD in
    1 | cpu | CPU)
        echo start CPU system Ubuntu18.
        bash /root/LISR/Ubuntu18/start-cpu.sh
        ;;
    2 | gpu | GPU)
        echo start GPU system Ubuntu18.
        bash /root/LISR/Ubuntu18/start-gpu.sh
        ;;
    3 | exit | Exit)
        echo clear out.
        ;;
    *)
        echo command error.
        ;;

esac
