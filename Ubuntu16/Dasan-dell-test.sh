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
echo -e  "\033[1;34m${PROMPT} read  CUSTOMER 고객사 정보를 맞게 입력하세요 ! \033[0m"
read  CUSTOMER

echo ""
echo -e  "\033[1;34m${PROMPT} read -a CUSTOMER 적용을 위해 다시 입력하세요 ! \033[0m"
read -a CUSTOMER

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
echo -e  "\033[1;34m${PROMPT} apt-get  -y  install mailutils  \033[0m"
apt-get  -y  install mailutils

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

echo -e "# Dell Server RAID Controller Management MSM 의 알림 메일 발송을 위해 postifx를 구성 합니다 . "

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
echo -e  "\033[1;34m${PROMPT} bash LISR/Ubuntu16/Install_Dell_OMSA_Ubuntu.sh \033[0m"
bash LISR/Ubuntu16/Install_Dell_OMSA_Ubuntu.sh

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
