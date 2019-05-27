#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo -e  "\033[1;32m"==================== SMTP for Email Alert ===================="\033[0m"

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

echo -e  "\033[1;32m"==================== Ubuntu 16 메일 발송 테스트 ===================="\033[0m"

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

echo -e  "\033[1;32m"==================== SMTP for Email Alert ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} grep "inet_interfaces\|inet_protocols" /etc/postfix/main.cf \033[0m"
grep "inet_interfaces\|inet_protocols" /etc/postfix/main.cf

echo ""
echo -e  "\033[1;34m${PROMPT} perl -pi -e 's/^inet_protocols = all/inet_protocols = ipv4/'  /etc/postfix/main.cf \033[0m"
perl -pi -e 's/^inet_protocols = all/inet_protocols = ipv4/'  /etc/postfix/main.cf

echo ""
echo -e  "\033[1;34m${PROMPT} grep inet_protocols  /etc/postfix/main.cf \033[0m"
grep inet_protocols  /etc/postfix/main.cf

echo -e "# 메일 발송에 문제가 있을 경우 ? # /etc/postfix/main.cf 의 mynetworks 주석처리 # mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128 "

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
