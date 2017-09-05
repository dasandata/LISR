#Copyright by Dasandata.co.ltd
#http://www.dasandata.co.kr

ADMIN_LOG_EMAIL='logdasandata@googlegroups.com'
DASAN_CUSTOMER="User-Name"
DELL_SERVER_MODEL=$(dmidecode --type system | grep 'Product Name:' | cut -d ' ' -f 4)
DELL_SERVICE_TAG=$(dmidecode --type system  | grep 'Serial Number:' | cut -d ' ' -f 3)
TITLE_TAIL=$(hostname)'-'$DASAN_CUSTOMER'-'$DELL_SERVER_MODEL'-'$DELL_SERVICE_TAG
