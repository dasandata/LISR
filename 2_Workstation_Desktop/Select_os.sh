#!/bin/bash

echo "사용되는 os 하나 를 선택하세요."
echo "use os install ? Please select one "


echo "1) Centos7"
echo "2) Ubuntu16"
echo "3) Ubuntu18"
echo "4) Centos8"
echo "5) Exit"

read WORD
case $WORD in
    1 | centos7 | Centos7)
        echo Centos7.
        bash /root/LISR/2_Workstation_Desktop/2-1_Centos7/software.sh
        ;;
    2 | ubuntu16 | Ubuntu16)
        echo Ubuntu16.
        bash /root/LISR/2_Workstation_Desktop/2-2_Ubuntu16/software.sh
        ;;
    3 | ubuntu18 | Ubuntu18)
        echo Ubuntu18.
        bash /root/LISR/2_Workstation_Desktop/2-3_Ubuntu18/software.sh
        ;;
    4 | centos8 | Centos8)
        echo Centos8.
        bash /root/LISR/2_Workstation_Desktop/2-4_Centos8/software.sh
        ;;
    5 | exit | Exit)
        echo clear out.
        ;;
    *)
        echo command error.
        ;;

esac
