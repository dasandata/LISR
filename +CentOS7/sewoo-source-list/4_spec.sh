#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " 하드웨어 사양 / 기본 환경 확인 (os 버젼 등) "

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} bash /root/LISR/common/dasan_check_to_hardware_spec.sh \033[0m"
bash /root/LISR/common/dasan_check_to_hardware_spec.sh
