#!/bin/bash
# Copyright (c) 2018 by Dasandata Corp.
# run as a root

ROOT_UID=0
if [ "$UID" != "$ROOT_UID" ]; then
  echo "Must be a root to run this script."
  exit 1
fi

System=$(dmidecode --type system | grep -i product)
FanOffset=$(racadm get system.ThermalSettings.FanSpeedOffset | grep FanSpeedOffset | cut -d '=' -f 2 )
LFMMode=$(racadm get system.PCIeSlotLFM.1.LFMMode  | grep LFMMode | cut -d '=' -f 2)
GPU=$(nvidia-smi -L | head -1 | awk '{print $3 $4 $5 $6 }')

# export VAR
export LOGFILENAME="/root/${System}-${LFMMode}-${FanOffset}-${GPU}-4EA.txt"

# gpu gurn
cd ~
git clone https://github.com/wilicc/gpu-burn  > /dev/null 2>&1
cd gpu-burn
git pull      > /dev/null 2>&1
make          > /dev/null 2>&1
nohup  ./gpu_burn $((60*11)) &
cd ~

# make log
for I in $(seq 1 11)
do  echo "" | tee -a $LOGFILENAME
date    | tee -a $LOGFILENAME
nvidia-smi  | grep C  | tee -a $LOGFILENAME
nvidia-smi -q -d PERFORMANCE,clock  | grep "^GPU\|Thermal\|Graphics\|MHz" | grep -v "SM\|Memory\|Video\|N/A" | tee -a $LOGFILENAME
sleep 60
done
