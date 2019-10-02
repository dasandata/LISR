#!/bin/bash


echo "어느 제조사의 시스템인가요? 하나를 선택하세요"
echo "Which manufacturer's system? Please select one"

echo "1) Dell"
echo "2) Supermicro_Etc"
echo "3) Exit"

read WORD
case $WORD in
    1 | dell | Dell)
        echo Dell.
        bash /root/LISR/1_Server/1-1_Dell/Select_os.sh
        ;;
    2 | supermicro_etc | Supermicro_Etc)
        echo Supermicro_Etc.
        bash /root/LISR/1_Server/1-2_Supermicro_Etc/Select_os.sh
        ;;
    3 | exit | Exit)
        echo clear out.
        ;;
    *)
        echo command error.
        ;;

esac
