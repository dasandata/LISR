#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;32m"==================== SMTP for Email Alert mailutils or mailx  ===================="\033[0m"

echo ""
echo ""

echo -e "# 이메일 경고에 사용될 메일관리자 이메일 주소 및 로그 타이틀 정보를 생성 파일 작성. "

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} cp /root/LISR/common/usr-local-sbin/dasan_export_global_variable.sh  /usr/local/sbin/dasan_export_global_variable.sh \033[0m"
cp /root/LISR/common/usr-local-sbin/dasan_export_global_variable.sh  /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "\033[1;34m${PROMPT} echo -e "CUSTOMER 고객사 정보를 맞게 변경합니다.: \c " \033[0m"

echo ""
## echo -e  "\033[1;34m${PROMPT} read  CUSTOMER 고객사 정보를 맞게 입력하세요 ! \033[0m"
## read  CUSTOMER

echo ""
## echo -e  "\033[1;34m${PROMPT} read -a CUSTOMER 적용을 위해 다시 입력하세요 ! \033[0m"
## read -a CUSTOMER

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i  "s/ABCDEFG/${CUSTOMER}/" /usr/local/sbin/dasan_export_global_variable.sh \033[0m"
sed -i  "s/ABCDEFG/${CUSTOMER}/" /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "\033[1;34m${PROMPT} cat /usr/local/sbin/dasan_export_global_variable.sh\033[0m"
cat /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "\033[1;34m${PROMPT} source /usr/local/sbin/dasan_export_global_variable.sh \033[0m"
source /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "\033[1;34m${PROMPT} echo $TITLE_TAIL \033[0m"
echo $TITLE_TAIL

echo ""
echo ""

sleep 10

echo -e "# Ubuntu 16 메일 발송 테스트 "

echo ""
## echo -e  "\033[1;34m${PROMPT} apt-get  -y  install mailutils  \033[0m"
## apt-get  -y  install mailutils

echo ""
echo -e  "\033[1;34m${PROMPT} source /usr/local/sbin/dasan_export_global_variable.sh \033[0m"
source /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "\033[1;34m${PROMPT} echo $TITLE_TAIL \033[0m"
echo $TITLE_TAIL

echo ""
echo -e  "\033[1;34m${PROMPT} echo "Test of SMTP... OK. " >  test_message.txt \033[0m"
echo "Test of SMTP... OK. " >  test_message.txt

echo ""
echo -e  "\033[1;34m${PROMPT} cat test_message.txt \033[0m"
cat test_message.txt

echo ""
echo -e  "\033[1;34m${PROMPT} mail -s   $TITLE_TAIL   -t   $ADMIN_LOG_EMAIL   <   test_message.txt \033[0m"
mail -s   $TITLE_TAIL   -t   $ADMIN_LOG_EMAIL   <   test_message.txt

echo ""
echo ""

echo -e  "\033[1;32m"==================== SMTP for Email Alert  postfix for Dell RAID Manager ===================="\033[0m"

echo ""
echo ""

echo -e "# Dell Server RAID Controller Management (MSM) 의 알림 메일 발송을 위해 postifx를 구성 합니다 . "

echo ""
echo -e  "\033[1;34m${PROMPT} grep "inet_interfaces\|inet_protocols" /etc/postfix/main.cf \033[0m"
grep "inet_interfaces\|inet_protocols" /etc/postfix/main.cf

echo ""
echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/^inet_protocols = all/inet_protocols = ipv4/'  /etc/postfix/main.cf \033[0m"
perl -pi -e 's/^inet_protocols = all/inet_protocols = ipv4/'  /etc/postfix/main.cf

echo ""
echo -e  "\033[1;34m${PROMPT} grep inet_protocols  /etc/postfix/main.cf \033[0m"
grep inet_protocols  /etc/postfix/main.cf

echo -e "# 메일 발송에 문제가 있을 경우  # /etc/postfix/main.cf 의 mynetworks 주석처리 # mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128 "

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} grep 'mynetworks = '   /etc/postfix/main.cf \033[0m"
grep 'mynetworks = '   /etc/postfix/main.cf

echo ""
echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/^mynetworks/#mynetworks/'   /etc/postfix/main.cf \033[0m"
perl -pi -e 's/^mynetworks/#mynetworks/'   /etc/postfix/main.cf

echo ""
echo -e  "\033[1;34m${PROMPT} grep  'mynetworks = '   /etc/postfix/main.cf \033[0m"
grep  'mynetworks = '   /etc/postfix/main.cf

echo ""
echo -e  "\033[1;34m${PROMPT} systemctl restart postfix \033[0m"
systemctl restart postfix

sleep 10

echo ""
echo ""

echo -e  "\033[1;32m"==================== Dell OpenManage Server Administrator install OMSA ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} bash /root/LISR/Ubuntu16/Install_Dell_OMSA_Ubuntu.sh \033[0m"
bash /root/LISR/Ubuntu16/Install_Dell_OMSA_Ubuntu.sh

sleep 10

echo ""
echo ""

echo -e  "\033[1;32m"==================== Dell OMSA E-Mail Alert ===================="\033[0m"

echo ""
echo ""

echo -e "# 기존 변수 생성파일 확인. "

echo ""
echo -e  "\033[1;34m${PROMPT} cat   /usr/local/sbin/dasan_export_global_variable.sh \033[0m"
cat   /usr/local/sbin/dasan_export_global_variable.sh

echo ""

echo -e "# 경고 메일 내용 생성파일 복사. (dasan_alert_omsa.sh)"

echo ""
echo -e  "\033[1;34m${PROMPT} cp /root/LISR/common/usr-local-sbin/dasan_alert_omsa.sh /usr/local/sbin/ \033[0m"
cp /root/LISR/common/usr-local-sbin/dasan_alert_omsa.sh /usr/local/sbin/

echo ""
echo -e  "\033[1;34m${PROMPT} chmod 744 /usr/local/sbin/dasan_alert_omsa.sh \033[0m"
chmod 744 /usr/local/sbin/dasan_alert_omsa.sh

echo ""
echo -e  "\033[1;34m${PROMPT} tail -20  /usr/local/sbin/dasan_alert_omsa.sh \033[0m"
tail -20  /usr/local/sbin/dasan_alert_omsa.sh

echo ""
echo -e  "\033[1;34m${PROMPT} cat /usr/local/sbin/dasan_alert_omsa.sh | sed -n 72p \033[0m"
cat /usr/local/sbin/dasan_alert_omsa.sh | sed -n 72p

echo ""
echo -e  "\033[1;34m${PROMPT} 72s/#/ / /usr/local/sbin/dasan_alert_omsa.sh  \033[0m"
sed -i "72s/#/ /" /usr/local/sbin/dasan_alert_omsa.sh

echo ""
echo -e  "\033[1;34m${PROMPT} cat /usr/local/sbin/dasan_alert_omsa.sh | sed -n 72p \033[0m"
cat /usr/local/sbin/dasan_alert_omsa.sh | sed -n 72p

echo ""
echo ""

echo -e "# 경고 발생시 dasan_alert_omsa.sh 파일이 실행 되도록 설정"

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} cat   /root/LISR/common/dasan_omconfig_set.sh  \033[0m"
cat   /root/LISR/common/dasan_omconfig_set.sh

echo ""
echo -e  "\033[1;34m${PROMPT} bash  /root/LISR/common/dasan_omconfig_set.sh  \033[0m"
bash  /root/LISR/common/dasan_omconfig_set.sh

sleep 10

echo ""
echo ""

echo -e  "\033[1;32m"==================== Dell RAID Controller Management MSM Alert by Email ===================="\033[0m"

echo ""
echo ""

echo -e "For Ubuntu 16.04"

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} cat /root/LISR/Ubuntu16/Install_Dell_MSM_Ubuntu.sh  \033[0m"
cat /root/LISR/Ubuntu16/Install_Dell_MSM_Ubuntu.sh

echo ""
echo -e  "\033[1;34m${PROMPT} bash /root/LISR/Ubuntu16/Install_Dell_MSM_Ubuntu.sh  \033[0m"
bash /root/LISR/Ubuntu16/Install_Dell_MSM_Ubuntu.sh

sleep 10

echo ""
echo ""

echo -e  "\033[1;32m"==================== 온도 temperature 모니터링 ipmitool ===================="\033[0m"

echo ""
echo ""

echo -e "파일 복사."

echo ""
echo -e  "\033[1;34m${PROMPT} cp /root/LISR/common/usr-local-sbin/dasan_temperature_check_to_log.sh /usr/local/sbin/  \033[0m"
cp /root/LISR/common/usr-local-sbin/dasan_temperature_check_to_log.sh /usr/local/sbin/

echo ""
echo -e  "\033[1;34m${PROMPT} cp /root/LISR/common/usr-local-sbin/dasan_temperature_log_to_mail.sh /usr/local/sbin/  \033[0m"
cp /root/LISR/common/usr-local-sbin/dasan_temperature_log_to_mail.sh /usr/local/sbin/

echo -e "파일 권한 변경 (실행)"

echo ""
echo -e  "\033[1;34m${PROMPT} chmod 744 /usr/local/sbin/dasan_temperature_check_to_log.sh  \033[0m"
chmod 744 /usr/local/sbin/dasan_temperature_check_to_log.sh

echo ""
echo -e  "\033[1;34m${PROMPT} chmod 744 /usr/local/sbin/dasan_temperature_log_to_mail.sh  \033[0m"
chmod 744 /usr/local/sbin/dasan_temperature_log_to_mail.sh

echo -e "테스트"

echo ""
echo -e  "\033[1;34m${PROMPT} source /usr/local/sbin/dasan_export_global_variable.sh \033[0m"
source /usr/local/sbin/dasan_export_global_variable.sh

echo ""
echo -e  "\033[1;34m${PROMPT} TITLE='IPMI_Temperature_log_by_'${TITLE_TAIL}  \033[0m"
TITLE='IPMI_Temperature_log_by_'${TITLE_TAIL}

echo ""
echo -e  "\033[1;34m${PROMPT} LOG='/var/log/Dasandata_Temperature.log'  \033[0m"
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
echo -e  "\033[1;34m${PROMPT} /usr/local/sbin/dasan_temperature_check_to_log.sh  \033[0m"
/usr/local/sbin/dasan_temperature_check_to_log.sh

sleep 10

echo ""
echo -e  "\033[1;34m${PROMPT} /usr/local/sbin/dasan_temperature_check_to_log.sh  \033[0m"
/usr/local/sbin/dasan_temperature_check_to_log.sh

sleep 10

echo ""
echo -e  "\033[1;34m${PROMPT} /usr/local/sbin/dasan_temperature_log_to_mail.sh  \033[0m"
/usr/local/sbin/dasan_temperature_log_to_mail.sh

echo ""
echo ""

echo -e "crontab 에 등록"

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/crontab  \033[0m"
cat /etc/crontab

echo "
# add by dasandata
# 매시 30분에 온도체크 로그생성
30 * * * * root /usr/local/sbin/dasan_temperature_check_to_log.sh
# 매일 오전 8시에 온도체크 로그 발송
0  8 * * * root /usr/local/sbin/dasan_temperature_log_to_mail.sh
" >>  /etc/crontab

echo ""
echo -e  "\033[1;34m${PROMPT} cat /etc/crontab  \033[0m"
cat /etc/crontab

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} racadm set iDRAC.Time.Timezone Asia/Seoul  \033[0m"
racadm set iDRAC.Time.Timezone Asia/Seoul

echo ""
echo -e  "\033[1;34m${PROMPT} racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}') \033[0m"
racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}')


echo ""
echo -e  "\033[1;34m${PROMPT} sed -i '/root/d' /etc/rc.local \033[0m"
sed -i '/root/d' /etc/rc.local

echo ""
echo -e  "\033[1;34m${PROMPT} reboot \033[0m"
reboot
