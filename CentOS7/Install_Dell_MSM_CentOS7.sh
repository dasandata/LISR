#!/bin/bash
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr

# 다운로드
echo ""
echo "### 다운로드..."
echo ""
mkdir /root/raid_manager
cd /root/raid_manager
wget https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/17.05.00.02_Linux-64_MSM.gz

# 혹시 위 링크로 다운로드 되지 않으면 아래 웹페이지에서 직접 다운로드 합니다..
# https://www.broadcom.com/support/download-search/?pg=Storage+Adapters,+Controllers,+and+ICs&pf=RAID+Controller+Cards&pn=MegaRAID+SAS+9286CV-8e&po=&pa=&dk=

# 압축해제
echo ""
echo "### 압축 해제..."
echo ""
tar xvzf 17.05.00.02_Linux-64_MSM.gz

# 설치 시작
echo "### 설치 시작..."
cd /root/raid_manager/disk/
./install.csh  -a

# 기본적으로 변경해야 할 값.
echo ""
echo "### 기본적으로 변경해야 할 값."
echo "##"
echo "### 228 Temperature sensor    =>> Disable"
echo "### 236 Drive is not certified   ==>> Disable"
echo "###"
echo ""

# MSM 실행 (X11 Forwading 구성 필요)
echo ""
echo "### MSM 실행 (X11 Forwading 구성 필요)"
echo "/usr/local/MegaRAID\ Storage\ Manager/startupui.sh  &"
echo ""
/usr/local/MegaRAID\ Storage\ Manager/startupui.sh  &


# end of file.
