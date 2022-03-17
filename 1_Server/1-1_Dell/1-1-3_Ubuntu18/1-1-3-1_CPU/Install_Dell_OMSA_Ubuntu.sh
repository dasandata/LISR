#!/bin/bash
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr

# dell linux repo 추가.
echo "###
### dell linux repo 추가...
### "

echo 'deb http://linux.dell.com/repo/community/openmanage/940/bionic bionic main'  >  \
 /etc/apt/sources.list.d/linux.dell.com.sources.list

 wget http://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc
 # ** 최신 gpg key 발급 다운로드

sleep 10
#10초 여유

 apt-key add 0x1285491434D8786F.asc
# ** GPG Key 등록

# 설치 시작
echo "###
### 설치 시작...
### "
apt-get  -y update

apt-get  -y  install srvadmin-all

# SSL Link 추가
cd /usr/lib/x86_64-linux-gnu/

ln -s /usr/lib/x86_64-linux-gnu/libssl.so.1.1 libssl.so

cd

# 방화벽 설정 (web base 모니터링)
echo "###
### 방화벽 설정 (firewall-cmd)...
### "
ufw status numbered
ufw allow 1311/tcp
 #1311 이 기본값 입니다.
ufw status numbered

# 시스템이 시작될 때 관련 서비스가 실행 되도록 설정 (systemctl enable)
echo "###
### 시스템이 시작될 때 관련 서비스가 실행 되도록 설정 (systemctl enable)...
### "
systemctl start dataeng
systemctl start dsm_om_connsvc

# 서비스 시작
echo "###
### 서비스 시작...
### "
systemctl enable dataeng
systemctl enable dsm_om_connsvc

# 명령어 테스트
echo "###
### 명령어 테스트...
### "
/opt/dell/srvadmin/sbin/racadm getsysinfo | grep "System Model\|Service Tag"
/opt/dell/srvadmin/sbin/omreport system alertlog | head

# end of file.
