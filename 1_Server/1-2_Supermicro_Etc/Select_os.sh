#!/bin/bash

echo select os install?

echo "하나를 선택하세요."
echo "1) Centos7"
echo "2) Ubuntu16"
echo "3) Ubuntu18"
echo "4) Exit"

read WORD
case $WORD in
    1 | centos7 | Centos7)
        echo Centos7.
        bash /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-1_Centos7
        ;;
    2 | ubuntu16 | Ubuntu16)
        echo Ubuntu16.
        bash /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-2_Ubuntu16
        ;;
    3 | ubuntu18 | Ubuntu18)
        echo Ubuntu18.
        bash /root/LISR/1_Server/1-2_Supermicro_Etc/1-2-3_Ubuntu18
        ;;
    4 | exit | Exit)
        echo clear out.
        ;;
    *)
        echo command error.
        ;;

esac
