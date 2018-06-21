#!/bin/bash
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr

# 다운로드
echo "###
### 설치파일 다운로드...
### "
mkdir /tmp/raid_manager
cd /tmp/raid_manager
wget https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/17.05.00.02_Linux-64_MSM.gz

# 혹시 위 링크로 다운로드 되지 않으면 아래 웹페이지에서 직접 다운로드 합니다..
# https://www.broadcom.com/support/download-search/?pg=Storage+Adapters,+Controllers,+and+ICs&pf=RAID+Controller+Cards&pn=MegaRAID+SAS+9286CV-8e&po=&pa=&dk=

# 압축해제
echo "###
### 압축 해제...
### "
tar xvzf 17.05.00.02_Linux-64_MSM.gz

# 설치파일 변환 (rpm to deb)
echo "###
### 설치파일 변환 (rpm to deb)...
### "
apt-get -y install alien  >> dasan_log_install_alien.txt 2>&1
alien --scripts *.rpm

# 설치 시작
echo "###
### 설치 시작...
### "
dpkg --install lib-utils2_1.00-9_all.deb
dpkg --install megaraid-storage-manager_17.05.00-3_all.deb

systemctl start vivaldiframeworkd.service
systemctl enable vivaldiframeworkd.service

# 기본적으로 변경해야 할 값.
echo "###
### 기본적으로 변경해야 할 값.
###
### 228 Temperature sensor    =>> Disable
### 236 Drive is not certified   ==>> Disable
###
### "

# MSM 실행 (X11 Forwading 구성 필요)
echo "###
### MSM 실행 (X11 Forwading 구성 필요)
### /usr/local/MegaRAID\ Storage\ Manager/startupui.sh  &
### "

xauth add $(xauth -f /home/sonic/.Xauthority list | tail -1)
/usr/local/MegaRAID\ Storage\ Manager/startupui.sh  &

# end of file.
