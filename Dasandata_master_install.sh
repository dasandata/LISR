#!/bin/bash

echo "안녕하세요 다산데이타 리눅스 설치 파일을 실행 한 것을 환영 합니다"
echo ""
echo ""
echo "Hello, Welcome to Run Dasan Data Linux Installation File"
echo ""
echo ""


echo "너의 하드웨어는 무엇 입니까? 하나를 선택하세요."
echo "What is your hardware? Please select one"


echo "1) Server"
echo "2) Workstation_Desktop"
echo "3) Exit"

read WORD
case $WORD in
    1 | server | Server)
        echo Server.
        bash /root/LISR/1_Server/Hardware-select.sh
        ;;
    2 | workstation_desktop | Workstation_Desktop)
        echo Workstation_Desktop.
        bash /root/LISR/2_Workstation_Desktop/Select_os.sh
        ;;
    3 | exit | Exit)
        echo clear out.
        ;;
    *)
        echo command error.
        ;;

esac
