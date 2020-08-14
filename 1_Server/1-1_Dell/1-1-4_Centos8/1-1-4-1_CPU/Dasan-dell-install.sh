#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo -e  "\033[1;32m"==================== SMTP for Email Alert mailutils or mailx  ===================="\033[0m"

echo ""
echo ""

echo -e "# 이메일 경고에 사용될 메일관리자 이메일 주소 및 로그 타이틀 정보를 생성 파일 작성. "

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} cp /root/LISR/common/usr-local-sbin/dasan_export_global_variable.sh  /usr/local/sbin/dasan_export_global_variable.sh \033[0m" >> /root/dasan_install_log.txt
cp /root/LISR/common/usr-local-sbin/dasan_export_global_variable.sh  /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "\033[1;34m${PROMPT} echo -e "CUSTOMER 고객사 정보를 맞게 변경합니다.: \c " \033[0m" >> /root/dasan_install_log.txt

echo ""
echo -e  "\033[1;34m${PROMPT} read  CUSTOMER 고객사 정보를 맞게 입력하세요 ! \033[0m" >> /root/dasan_install_log.txt
## read  CUSTOMER

echo ""
echo -e  "\033[1;34m${PROMPT} read -a CUSTOMER 적용을 위해 다시 입력하세요 ! \033[0m" >> /root/dasan_install_log.txt
## read -a CUSTOMER

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i  "s/ABCDEFG/${CUSTOMER}/" /usr/local/sbin/dasan_export_global_variable.sh \033[0m" >> /root/dasan_install_log.txt
sed -i  "s/ABCDEFG/${CUSTOMER}/" /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "\033[1;34m${PROMPT} cat /usr/local/sbin/dasan_export_global_variable.sh\033[0m" >> /root/dasan_install_log.txt
cat /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "\033[1;34m${PROMPT} source /usr/local/sbin/dasan_export_global_variable.sh \033[0m" >> /root/dasan_install_log.txt
source /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "\033[1;34m${PROMPT} echo $TITLE_TAIL \033[0m" >> /root/dasan_install_log.txt
echo $TITLE_TAIL

echo ""
echo ""

sleep 10

echo -e "# Centos 8  메일 발송 테스트 "

echo ""
echo -e  "\033[1;34m${PROMPT} dnf install -y mailx postfix \033[0m" >> /root/dasan_install_log.txt
dnf install -y mailx postfix

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl enable postfix.service \033[0m" >> /root/dasan_install_log.txt
systemctl enable postfix.service

echo ""
echo -e  "\033[1;34m${PROMPT} grep inet_protocols   /etc/postfix/main.cf \033[0m" >> /root/dasan_install_log.txt
grep inet_protocols   /etc/postfix/main.cf

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i  's/inet_protocols = all/inet_protocols = ipv4/' /etc/postfix/main.cf \033[0m" >> /root/dasan_install_log.txt
sed -i  's/inet_protocols = all/inet_protocols = ipv4/' /etc/postfix/main.cf

echo ""
echo -e  "\033[1;34m${PROMPT} grep inet_protocols   /etc/postfix/main.cf \033[0m" >> /root/dasan_install_log.txt
grep inet_protocols   /etc/postfix/main.cf

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl restart postfix \033[0m" >> /root/dasan_install_log.txt
systemctl restart postfix

echo ""
echo -e  "\033[1;34m${PROMPT} echo "Test of SMTP... OK." | mail -s $TITLE_TAIL $ADMIN_LOG_EMAIL \033[0m" >> /root/dasan_install_log.txt
echo "Test of SMTP... OK." | mail -s $TITLE_TAIL $ADMIN_LOG_EMAIL

echo ""
echo ""

echo -e  "\033[1;32m"==================== SMTP for Email Alert  postfix for Dell RAID Manager ===================="\033[0m"

echo ""
echo ""

echo -e "# Dell Server RAID Controller Management (MSM) 의 알림 메일 발송 구성 합니다 . "

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl status postfix | grep Active: \033[0m" >> /root/dasan_install_log.txt
systemctl status postfix | grep Active:

echo ""
echo -e  "\033[1;34m${PROMPT} grep 'inet_interfaces =' /etc/postfix/main.cf \033[0m" >> /root/dasan_install_log.txt
grep 'inet_interfaces =' /etc/postfix/main.cf

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i  "s/inet_interfaces = localhost/ inet_interfaces = localhost/" /etc/postfix/main.cf \033[0m" >> /root/dasan_install_log.txt
sed -i  "s/inet_interfaces = localhost/#inet_interfaces = localhost/" /etc/postfix/main.cf

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i  "s/ inet_interfaces = all/inet_interfaces = all/" /etc/postfix/main.cf \033[0m" >> /root/dasan_install_log.txt
sed -i  "s/#inet_interfaces = all/inet_interfaces = all/" /etc/postfix/main.cf

echo ""
echo -e  "\033[1;34m${PROMPT} grep 'inet_interfaces =' /etc/postfix/main.cf \033[0m" >> /root/dasan_install_log.txt
grep 'inet_interfaces =' /etc/postfix/main.cf

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl  restart postfix \033[0m" >> /root/dasan_install_log.txt
systemctl  restart postfix

echo ""
echo ""

echo -e  "\033[1;32m"==================== Dell OpenManage Server Administrator install OMSA ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} perl -p -i -e '$.==20 and print "exclude = libsmbios smbios-utils-bin\n"' /etc/yum.repos.d/CentOS-Base.repo \033[0m" >> /root/dasan_install_log.txt
perl -p -i -e '$.==20 and print "exclude = libsmbios smbios-utils-bin\n"' /etc/yum.repos.d/CentOS-Base.repo

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/yum.repos.d/CentOS-Base.repo | sed -n 20p \033[0m" >> /root/dasan_install_log.txt
cat /etc/yum.repos.d/CentOS-Base.repo | sed -n 20p

echo ""
echo -e  "\033[1;34m${PROMPT} cat /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Install_Dell_OMSA_CentOS7.sh \033[0m" >> /root/dasan_install_log.txt
cat /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Install_Dell_OMSA_CentOS7.sh

echo ""
echo -e  "\033[1;34m${PROMPT} yes | bash /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Install_Dell_OMSA_CentOS7.sh \033[0m" >> /root/dasan_install_log.txt
yes | bash /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Install_Dell_OMSA_CentOS7.sh

sleep 10

echo ""
echo ""

echo -e  "\033[1;32m"==================== Dell OMSA E-Mail Alert ===================="\033[0m"

echo ""
echo ""

echo -e "# 기존 변수 생성파일 확인. "

echo ""
echo -e  "\033[1;34m${PROMPT} cat   /usr/local/sbin/dasan_export_global_variable.sh \033[0m" >> /root/dasan_install_log.txt
cat   /usr/local/sbin/dasan_export_global_variable.sh

echo ""

echo -e "# 경고 메일 내용 생성파일 복사. (dasan_alert_omsa.sh)"

echo ""
echo -e  "\033[1;34m${PROMPT} cp /root/LISR/common/usr-local-sbin/dasan_alert_omsa.sh /usr/local/sbin/ \033[0m" >> /root/dasan_install_log.txt
cp /root/LISR/common/usr-local-sbin/dasan_alert_omsa.sh /usr/local/sbin/

echo ""
echo -e  "\033[1;34m${PROMPT} chmod 744 /usr/local/sbin/dasan_alert_omsa.sh \033[0m" >> /root/dasan_install_log.txt
chmod 744 /usr/local/sbin/dasan_alert_omsa.sh

echo ""
echo -e  "\033[1;34m${PROMPT} tail -20  /usr/local/sbin/dasan_alert_omsa.sh \033[0m" >> /root/dasan_install_log.txt
tail -20  /usr/local/sbin/dasan_alert_omsa.sh

echo ""
echo -e  "\033[1;34m${PROMPT} cat /usr/local/sbin/dasan_alert_omsa.sh | sed -n 69p \033[0m" >> /root/dasan_install_log.txt
cat /usr/local/sbin/dasan_alert_omsa.sh | sed -n 69p

echo ""
echo -e  "\033[1;34m${PROMPT} 69s/#/ / /usr/local/sbin/dasan_alert_omsa.sh  \033[0m" >> /root/dasan_install_log.txt
sed -i "69s/#/ /" /usr/local/sbin/dasan_alert_omsa.sh

echo ""
echo -e  "\033[1;34m${PROMPT} cat /usr/local/sbin/dasan_alert_omsa.sh | sed -n 69p \033[0m" >> /root/dasan_install_log.txt
cat /usr/local/sbin/dasan_alert_omsa.sh | sed -n 69p

echo ""
echo ""

echo -e "# 경고 발생시 dasan_alert_omsa.sh 파일이 실행 되도록 설정"

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} cat   /root/LISR/common/dasan_omconfig_set.sh  \033[0m" >> /root/dasan_install_log.txt
cat   /root/LISR/common/dasan_omconfig_set.sh

echo ""
echo -e  "\033[1;34m${PROMPT} bash  /root/LISR/common/dasan_omconfig_set.sh  \033[0m" >> /root/dasan_install_log.txt
bash  /root/LISR/common/dasan_omconfig_set.sh

sleep 10

echo ""
echo ""

echo -e  "\033[1;32m"==================== Dell RAID Controller Management MSM Alert by Email ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} cat /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Install_Dell_MSM_CentOS7.sh  \033[0m" >> /root/dasan_install_log.txt
cat /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Install_Dell_MSM_CentOS7.sh

echo ""
echo -e  "\033[1;34m${PROMPT} bash /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Install_Dell_MSM_CentOS7.sh \033[0m" >> /root/dasan_install_log.txt
bash /root/LISR/1_Server/1-1_Dell/1-1-1_Centos7/1-1-1-2_GPU/Install_Dell_MSM_CentOS7.sh

sleep 10

echo ""
echo ""

echo -e  "\033[1;32m"==================== 온도 temperature 모니터링 ipmitool ===================="\033[0m"

echo ""
echo ""

echo -e "파일 복사."

echo ""
echo -e  "\033[1;34m${PROMPT} cp /root/LISR/common/usr-local-sbin/dasan_temperature_check_to_log.sh /usr/local/sbin/  \033[0m" >> /root/dasan_install_log.txt
cp /root/LISR/common/usr-local-sbin/dasan_temperature_check_to_log.sh /usr/local/sbin/

echo ""
echo -e  "\033[1;34m${PROMPT} cp /root/LISR/common/usr-local-sbin/dasan_temperature_log_to_mail.sh /usr/local/sbin/  \033[0m" >> /root/dasan_install_log.txt
cp /root/LISR/common/usr-local-sbin/dasan_temperature_log_to_mail.sh /usr/local/sbin/

echo -e "파일 권한 변경 (실행)"

echo ""
echo -e  "\033[1;34m${PROMPT} chmod 744 /usr/local/sbin/dasan_temperature_check_to_log.sh  \033[0m" >> /root/dasan_install_log.txt
chmod 744 /usr/local/sbin/dasan_temperature_check_to_log.sh

echo ""
echo -e  "\033[1;34m${PROMPT} chmod 744 /usr/local/sbin/dasan_temperature_log_to_mail.sh  \033[0m" >> /root/dasan_install_log.txt
chmod 744 /usr/local/sbin/dasan_temperature_log_to_mail.sh

echo -e "테스트"

echo ""
echo -e  "\033[1;34m${PROMPT} source /usr/local/sbin/dasan_export_global_variable.sh \033[0m" >> /root/dasan_install_log.txt
source /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "\033[1;34m${PROMPT} TITLE='IPMI_Temperature_log_by_'${TITLE_TAIL}  \033[0m" >> /root/dasan_install_log.txt
TITLE='IPMI_Temperature_log_by_'${TITLE_TAIL}

echo ""
echo -e  "\033[1;34m${PROMPT} LOG='/var/log/Dasandata_Temperature.log'  \033[0m" >> /root/dasan_install_log.txt
LOG='/var/log/Dasandata_Temperature.log'

echo  "
##################################################
# This Message from ${TITLE_TAIL}
# Using crontab (/etc/crontab)
# The location of the configuration file is below.
# /usr/local/sbin/dasan_export_global_variable.sh,
# /usr/local/sbin/dasan_temperature_check_to_log.sh,
# /usr/local/sbin/dasan_temperature_log_to_mail.sh
##################################################
" >> ${LOG}

echo ""
echo -e  "\033[1;34m${PROMPT} /usr/local/sbin/dasan_temperature_check_to_log.sh  \033[0m" >> /root/dasan_install_log.txt
/usr/local/sbin/dasan_temperature_check_to_log.sh

sleep 10

echo ""
echo -e  "\033[1;34m${PROMPT} /usr/local/sbin/dasan_temperature_check_to_log.sh  \033[0m" >> /root/dasan_install_log.txt
/usr/local/sbin/dasan_temperature_check_to_log.sh

sleep 10

echo ""
echo -e  "\033[1;34m${PROMPT} /usr/local/sbin/dasan_temperature_log_to_mail.sh  \033[0m" >> /root/dasan_install_log.txt
/usr/local/sbin/dasan_temperature_log_to_mail.sh

echo ""
echo ""

echo -e "crontab 에 등록"

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/crontab  \033[0m" >> /root/dasan_install_log.txt
cat /etc/crontab

echo "
# add by dasandata
# 매시 30분에 온도체크 로그생성
30 * * * * root /usr/local/sbin/dasan_temperature_check_to_log.sh
# 매일 오전 8시에 온도체크 로그 발송
0  8 * * * root /usr/local/sbin/dasan_temperature_log_to_mail.sh
" >>  /etc/crontab

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/crontab  \033[0m" >> /root/dasan_install_log.txt
cat /etc/crontab

echo ""
echo -e  "\033[1;34m${PROMPT} racadm set iDRAC.Time.Timezone Asia/Seoul  \033[0m" >> /root/dasan_install_log.txt
racadm set iDRAC.Time.Timezone Asia/Seoul

echo ""
echo -e  "\033[1;34m${PROMPT} racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}') \033[0m" >> /root/dasan_install_log.txt
racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}')


echo ""
echo ""


echo "  rc.local 등록 "

echo -e  "\033[1;34m${PROMPT} sed -i '/root/d' /etc/rc.d/rc.local   \033[0m" >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.d/rc.local

echo " 재 부팅 "
echo -e  "\033[1;34m${PROMPT} reboot  재 부팅 \033[0m" >> /root/dasan_install_log.txt
reboot
