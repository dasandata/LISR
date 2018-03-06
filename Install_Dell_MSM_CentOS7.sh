#!/bin/bash
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr

mkdir /root/raid_manager
cd /root/raid_manager
wget https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/17.05.00.02_Linux-64_MSM.gz

# 혹시 위 링크로 다운로드 되지 않으면 아래 웹페이지에서 직접 다운로드 합니다..
# https://www.broadcom.com/support/download-search/?pg=Storage+Adapters,+Controllers,+and+ICs&pf=RAID+Controller+Cards&pn=MegaRAID+SAS+9286CV-8e&po=&pa=&dk=

tar xvzf 17.05.00.02_Linux-64_MSM.gz

/root/raid_manager/disk/install.csh  -a

echo
echo "# 228 Temperature sensor    =>> Disable"
echo "# 236 Drive is not certified   ==>> Disable"
echo

/usr/local/MegaRAID\ Storage\ Manager/startupui.sh   &

# end of file.
