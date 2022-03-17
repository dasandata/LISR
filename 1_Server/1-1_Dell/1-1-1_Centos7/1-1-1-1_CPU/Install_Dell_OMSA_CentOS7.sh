#!/bin/bash
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr

# dell linux repo 추가.
echo "###
### dell linux repo 추가...
### "
wget http://linux.dell.com/repo/hardware/dsu/bootstrap.cgi -O  ./dellomsainstall.sh
sed -i -e "s/enabled=1/enabled=0/g" ./dellomsainstall.sh
bash ./dellomsainstall.sh
rm -f ./dellomsainstall.sh

# 설치 시작
echo "###
### 설치 시작...
### "
yum -y erase  tog-pegasus-libs  >>  dasan_log_install_dell_OMSA.txt 2>&1
tail -5  dasan_log_install_dell_OMSA.txt

yum -y install --enablerepo=dell-system-update_dependent -y  srvadmin-all openssl-devel \
 >>   dasan_log_install_dell_OMSA.txt 2>&1
tail -5  dasan_log_install_dell_OMSA.txt

# 방화벽 설정 (web base 모니터링)
echo "###
### 방화벽 설정 (firewall-cmd)...
### "
firewall-cmd   --add-port=1311/tcp  --zone=external   --permanent
firewall-cmd   --reload

# 시스템이 시작될 때 관련 서비스가 실행 되도록 설정 (systemctl enable)
echo "###
### 시스템이 시작될 때 관련 서비스가 실행 되도록 설정 (systemctl enable)...
### "
systemctl enable dataeng
systemctl enable dsm_om_connsvc

# 서비스 시작
echo "###
### 서비스 시작...
### "
systemctl start dataeng
systemctl start dsm_om_connsvc

# 명령어 테스트
echo "###
### 명령어 테스트...
### "
/opt/dell/srvadmin/sbin/racadm getsysinfo | grep "System Model\|Service Tag"
/opt/dell/srvadmin/sbin/omreport system alertlog | head

# end of file.
