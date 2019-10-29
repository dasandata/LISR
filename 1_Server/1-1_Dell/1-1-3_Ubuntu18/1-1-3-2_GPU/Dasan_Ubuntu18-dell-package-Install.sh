#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

echo -e  "==================== SMTP for Email Alert mailutils or mailx  ===================="

echo ""
echo ""

echo -e "# 이메일 경고에 사용될 메일관리자 이메일 주소 및 로그 타이틀 정보를 생성 파일 작성. " >> /root/dasan_install_log.txt

echo ""
echo ""

echo ""
echo -e  "${PROMPT} cp /root/LISR/common/usr-local-sbin/dasan_export_global_variable.sh  /usr/local/sbin/dasan_export_global_variable.sh " >> /root/dasan_install_log.txt
cp /root/LISR/common/usr-local-sbin/dasan_export_global_variable.sh  /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "${PROMPT} echo -e "CUSTOMER 고객사 정보를 맞게 변경합니다.: \c " " >> /root/dasan_install_log.txt

echo ""
echo -e  "${PROMPT} read  CUSTOMER 고객사 정보를 맞게 입력하세요 ! " >> /root/dasan_install_log.txt
## read  CUSTOMER

echo ""
echo -e  "${PROMPT} read -a CUSTOMER 적용을 위해 다시 입력하세요 ! " >> /root/dasan_install_log.txt
## read -a CUSTOMER

echo ""
echo -e  "${PROMPT} sed -i  "s/ABCDEFG/${CUSTOMER}/" /usr/local/sbin/dasan_export_global_variable.sh " >> /root/dasan_install_log.txt
sed -i  "s/ABCDEFG/${CUSTOMER}/" /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "${PROMPT} cat /usr/local/sbin/dasan_export_global_variable.sh" >> /root/dasan_install_log.txt
cat /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "${PROMPT} source /usr/local/sbin/dasan_export_global_variable.sh " >> /root/dasan_install_log.txt
source /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "${PROMPT} echo $TITLE_TAIL " >> /root/dasan_install_log.txt
echo $TITLE_TAIL

echo ""
echo ""

sleep 10

echo -e "# Ubuntu 18 메일 발송 테스트 " >> /root/dasan_install_log.txt

echo ""
echo -e  "${PROMPT} apt-get  -y  install mailutils  " >> /root/dasan_install_log.txt
## apt-get  -y  install mailutils

echo ""
echo -e  "${PROMPT} source /usr/local/sbin/dasan_export_global_variable.sh " >> /root/dasan_install_log.txt
source /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "${PROMPT} echo $TITLE_TAIL " >> /root/dasan_install_log.txt
echo $TITLE_TAIL

echo ""
echo -e  "${PROMPT} echo "Test of SMTP... OK. " >  test_message.txt " >> /root/dasan_install_log.txt
echo "Test of SMTP... OK. " >  test_message.txt

echo ""
echo -e  "${PROMPT} cat test_message.txt " >> /root/dasan_install_log.txt
cat test_message.txt

echo ""
echo -e  "${PROMPT} mail -s   $TITLE_TAIL   -t   $ADMIN_LOG_EMAIL   <   test_message.txt " >> /root/dasan_install_log.txt
echo "Test of SMTP... OK." | mail -s $TITLE_TAIL $ADMIN_LOG_EMAIL

echo ""
echo ""

echo -e  "==================== SMTP for Email Alert  postfix for Dell RAID Manager ===================="

echo ""
echo ""

echo -e "# Dell Server RAID Controller Management (MSM) 의 알림 메일 발송을 위해 postifx를 구성 합니다 . " >> /root/dasan_install_log.txt

echo ""
echo -e  "${PROMPT} grep "inet_interfaces\|inet_protocols" /etc/postfix/main.cf " >> /root/dasan_install_log.txt
grep "inet_interfaces\|inet_protocols" /etc/postfix/main.cf

echo ""
echo -e  "${PROMPT} perl -pi -e 's/^inet_protocols = all/inet_protocols = ipv4/'  /etc/postfix/main.cf " >> /root/dasan_install_log.txt
perl -pi -e 's/^inet_protocols = all/inet_protocols = ipv4/'  /etc/postfix/main.cf

echo ""
echo -e  "${PROMPT} grep inet_protocols  /etc/postfix/main.cf " >> /root/dasan_install_log.txt
grep inet_protocols  /etc/postfix/main.cf

echo -e "# 메일 발송에 문제가 있을 경우  # /etc/postfix/main.cf 의 mynetworks 주석처리 # mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128 " >> /root/dasan_install_log.txt

echo ""
echo ""

echo ""
echo -e  "${PROMPT} grep 'mynetworks = '   /etc/postfix/main.cf " >> /root/dasan_install_log.txt
grep 'mynetworks = '   /etc/postfix/main.cf

echo ""
echo -e  "${PROMPT} perl -pi -e 's/^mynetworks/#mynetworks/'   /etc/postfix/main.cf " >> /root/dasan_install_log.txt
perl -pi -e 's/^mynetworks/#mynetworks/'   /etc/postfix/main.cf

echo ""
echo -e  "${PROMPT} grep  'mynetworks = '   /etc/postfix/main.cf " >> /root/dasan_install_log.txt
grep  'mynetworks = '   /etc/postfix/main.cf

echo ""
echo -e  "${PROMPT} systemctl restart postfix " >> /root/dasan_install_log.txt
systemctl restart postfix

sleep 10

echo ""
echo ""

echo -e  "==================== Dell OpenManage Server Administrator install OMSA ===================="

echo ""
echo -e  "${PROMPT} bash /root/LISR/1_Server/1-1_Dell/1-1-3_Ubuntu18/1-1-3-2_GPU/Install_Dell_OMSA_Ubuntu.sh " >> /root/dasan_install_log.txt
bash /root/LISR/1_Server/1-1_Dell/1-1-3_Ubuntu18/1-1-3-2_GPU/Install_Dell_OMSA_Ubuntu.sh >> /root/log.txt

sleep 10

echo ""
echo ""

echo -e  "==================== Dell OMSA E-Mail Alert ===================="

echo ""
echo ""

echo -e "# 기존 변수 생성파일 확인. " >> /root/dasan_install_log.txt

echo ""
echo -e  "${PROMPT} cat   /usr/local/sbin/dasan_export_global_variable.sh " >> /root/dasan_install_log.txt
cat   /usr/local/sbin/dasan_export_global_variable.sh

echo ""

echo -e "# 경고 메일 내용 생성파일 복사. (dasan_alert_omsa.sh)" >> /root/dasan_install_log.txt

echo ""
echo -e  "${PROMPT} cp /root/LISR/common/usr-local-sbin/dasan_alert_omsa.sh /usr/local/sbin/ " >> /root/dasan_install_log.txt
cp /root/LISR/common/usr-local-sbin/dasan_alert_omsa.sh /usr/local/sbin/

echo ""
echo -e  "${PROMPT} chmod 744 /usr/local/sbin/dasan_alert_omsa.sh " >> /root/dasan_install_log.txt
chmod 744 /usr/local/sbin/dasan_alert_omsa.sh

echo ""
echo -e  "${PROMPT} tail -20  /usr/local/sbin/dasan_alert_omsa.sh " >> /root/dasan_install_log.txt
tail -20  /usr/local/sbin/dasan_alert_omsa.sh

echo ""
echo -e  "${PROMPT} cat /usr/local/sbin/dasan_alert_omsa.sh | sed -n 72p " >> /root/dasan_install_log.txt
cat /usr/local/sbin/dasan_alert_omsa.sh | sed -n 72p

echo ""
echo -e  "${PROMPT} 72s/#/ / /usr/local/sbin/dasan_alert_omsa.sh  " >> /root/dasan_install_log.txt
sed -i "72s/#/ /" /usr/local/sbin/dasan_alert_omsa.sh

echo ""
echo -e  "${PROMPT} cat /usr/local/sbin/dasan_alert_omsa.sh | sed -n 72p " >> /root/dasan_install_log.txt
cat /usr/local/sbin/dasan_alert_omsa.sh | sed -n 72p

echo ""
echo ""

echo -e "# 경고 발생시 dasan_alert_omsa.sh 파일이 실행 되도록 설정" >> /root/dasan_install_log.txt

echo ""
echo ""

echo ""
echo -e  "${PROMPT} cat   /root/LISR/common/dasan_omconfig_set.sh  " >> /root/dasan_install_log.txt
cat   /root/LISR/common/dasan_omconfig_set.sh

echo ""
echo -e  "${PROMPT} bash  /root/LISR/common/dasan_omconfig_set.sh  " >> /root/dasan_install_log.txt
bash  /root/LISR/common/dasan_omconfig_set.sh

sleep 10

echo ""
echo ""

echo -e  "==================== Dell RAID Controller Management MSM Alert by Email ===================="

echo ""
echo ""

echo -e "For Ubuntu 18.04" >> /root/dasan_install_log.txt

echo ""
echo ""

echo ""
echo -e  "${PROMPT} cat /root/LISR/1_Server/1-1_Dell/1-1-3_Ubuntu18/1-1-3-2_GPU/Install_Dell_MSM_Ubuntu.sh  " >> /root/dasan_install_log.txt
cat /root/LISR/1_Server/1-1_Dell/1-1-3_Ubuntu18/1-1-3-2_GPU/Install_Dell_MSM_Ubuntu.sh >> /root/log.txt

echo ""
echo -e  "${PROMPT} bash /root/LISR/1_Server/1-1_Dell/1-1-3_Ubuntu18/1-1-3-2_GPU/Install_Dell_MSM_Ubuntu.sh  " >> /root/dasan_install_log.txt
bash /root/LISR/1_Server/1-1_Dell/1-1-3_Ubuntu18/1-1-3-2_GPU/Install_Dell_MSM_Ubuntu.sh >> /root/log.txt

sleep 10

echo ""
echo ""

echo -e  "==================== 온도 temperature 모니터링 ipmitool ===================="

echo ""
echo ""

echo -e "파일 복사." >> /root/dasan_install_log.txt

echo ""
echo -e  "${PROMPT} cp /root/LISR/common/usr-local-sbin/dasan_temperature_check_to_log.sh /usr/local/sbin/  " >> /root/dasan_install_log.txt
cp /root/LISR/common/usr-local-sbin/dasan_temperature_check_to_log.sh /usr/local/sbin/

echo ""
echo -e  "${PROMPT} cp /root/LISR/common/usr-local-sbin/dasan_temperature_log_to_mail.sh /usr/local/sbin/  " >> /root/dasan_install_log.txt
cp /root/LISR/common/usr-local-sbin/dasan_temperature_log_to_mail.sh /usr/local/sbin/

echo -e "파일 권한 변경 (실행)" >> /root/dasan_install_log.txt

echo ""
echo -e  "${PROMPT} chmod 744 /usr/local/sbin/dasan_temperature_check_to_log.sh  " >> /root/dasan_install_log.txt
chmod 744 /usr/local/sbin/dasan_temperature_check_to_log.sh

echo ""
echo -e  "${PROMPT} chmod 744 /usr/local/sbin/dasan_temperature_log_to_mail.sh  " >> /root/dasan_install_log.txt
chmod 744 /usr/local/sbin/dasan_temperature_log_to_mail.sh

echo -e "테스트" >> /root/dasan_install_log.txt

echo ""
echo -e  "${PROMPT} source /usr/local/sbin/dasan_export_global_variable.sh " >> /root/dasan_install_log.txt
source /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "${PROMPT} TITLE='IPMI_Temperature_log_by_'${TITLE_TAIL}  " >> /root/dasan_install_log.txt
TITLE='IPMI_Temperature_log_by_'${TITLE_TAIL}

echo ""
echo -e  "${PROMPT} LOG='/var/log/Dasandata_Temperature.log'  " >> /root/dasan_install_log.txt
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
echo -e  "${PROMPT} /usr/local/sbin/dasan_temperature_check_to_log.sh  " >> /root/dasan_install_log.txt
/usr/local/sbin/dasan_temperature_check_to_log.sh

sleep 10

echo ""
echo -e  "${PROMPT} /usr/local/sbin/dasan_temperature_check_to_log.sh  " >> /root/dasan_install_log.txt
/usr/local/sbin/dasan_temperature_check_to_log.sh

sleep 10

echo ""
echo -e  "${PROMPT} /usr/local/sbin/dasan_temperature_log_to_mail.sh  " >> /root/dasan_install_log.txt
/usr/local/sbin/dasan_temperature_log_to_mail.sh

echo ""
echo ""

echo -e "crontab 에 등록" >> /root/dasan_install_log.txt

echo ""
echo ""

echo ""
echo -e  "${PROMPT} cat /etc/crontab  " >> /root/dasan_install_log.txt
cat /etc/crontab

echo "
# add by dasandata
# 매시 30분에 온도체크 로그생성
30 * * * * root /usr/local/sbin/dasan_temperature_check_to_log.sh
# 매일 오전 8시에 온도체크 로그 발송
0  8 * * * root /usr/local/sbin/dasan_temperature_log_to_mail.sh
" >>  /etc/crontab

echo ""
echo -e  "${PROMPT} cat /etc/crontab  " >> /root/dasan_install_log.txt
cat /etc/crontab

echo ""
echo ""

echo ""
echo -e  "${PROMPT} racadm set iDRAC.Time.Timezone Asia/Seoul  " >> /root/dasan_install_log.txt
racadm set iDRAC.Time.Timezone Asia/Seoul

echo ""
echo -e  "${PROMPT} racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}') " >> /root/dasan_install_log.txt
racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}')


echo "  rc.local 등록 "
echo ""
echo -e  "${PROMPT} sed -i '/root/d' /etc/rc.local  " >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.local

echo ""
echo -e  "${PROMPT} cat /etc/rc.local | sed -n 2p " >> /root/dasan_install_log.txt
cat /etc/rc.local | sed -n 2p
