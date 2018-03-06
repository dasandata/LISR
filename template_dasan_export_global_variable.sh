#!/bin/bash
# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr

ADMIN_LOG_EMAIL='logdasandata@googlegroups.com'  # 관리자 메일주소 입력 / 여려명일 경우 콤마(,) 로 구분
DASAN_CUSTOMER="ABCDEFG" # 고객사 정보를 기입 (회사명, 기관명 등..)

# 발송되는 이메일 제목의 뒷 부분에 기입되는 정보를 생성하는 부분 입니다.
DELL_SERVER_MODEL=$(dmidecode --type system | grep 'Product Name:' | cut -d ' ' -f 4)
DELL_SERVICE_TAG=$(dmidecode --type system  | grep 'Serial Number:' | cut -d ' ' -f 3)
TITLE_TAIL=$(hostname)'-'$DASAN_CUSTOMER'-'$DELL_SERVER_MODEL'-'$DELL_SERVICE_TAG
# file of end.
