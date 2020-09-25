#!/bin/bash


echo "어느 제조사의 시스템인가요? 하나를 선택하세요"
echo "Which manufacturer's system? Please select one"

echo "1) Dell"
echo "2) Supermicro"
echo "3) Qct"
echo "4) Exit"

read WORD
case $WORD in
    1 | dell | Dell)
        echo Dell.
        bash /root/LISR/1_Server/1-1_Dell/Select_os.sh
        ;;
    2 | supermicro | Supermicro)
        echo Supermicro.
        bash /root/LISR/1_Server/1-2_Supermicro/Select_os.sh
        ;;
    3 | qct | QCT)
        echo Qct.
        bash /root/LISR/1_Server/1-3_Qct/Select_os.sh
        ;;
    4 | exit | Exit)
        echo clear out.
        ;;
    *)
        echo command error.
        ;;

esac
