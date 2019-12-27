# 안녕하세요 다산데이타 입니다.  
다산데이타 에서 출고되는 서버 & 워크스테이션에 설치되는 리눅스 표준설치 메뉴얼 과 스크립트 입니다.  

![Dasandata Logo](http://www.dasandata.co.kr/dasanlogo.jpg)

### 먼저 git 사용방법을 간략하게(?) 확인 하시기 바랍니다.    
#### - [1분 git 사용 방법 (리눅스 터미널에서)][how-to-git]  
[how-to-git]:https://github.com/dasandata/LISR/blob/master/how-to-git.md


## 목차
- [1. 리눅스 설치 표준안 - Centos 7.4 (2018.03)][centos7]  
- [2. 리눅스 설치 표준안 - Ubuntu 16.04 / 14 / 18 (2018.06)][ubuntu]  
- (예정...)3. 리눅스 자동설치 스크립트.
  - 운영체제 통합 스크립트
      - centos 7
      - ubunutu 16.04
      - ubunutu 18.04


      [root@dasandata-script-test:~]# yum install -y git  # Centos
      
      [root@dasandata-script-test:~]#

      [root@dasandata-script-test:~]# apt-get install -y git # Ubuntu

      [root@dasandata-script-test:~]#

      [root@dasandata-script-test:~]# git clone https://github.com/dasandata/LISR

      [root@dasandata-script-test:~]#

      [root@dasandata-script-test:~]# bash /root/LISR/Dasandata_master_install.sh

      안녕하세요 다산데이타 리눅스 설치 파일을 실행 한 것을 환영 합니다


      Hello, Welcome to Run Dasan Data Linux Installation File


      너의 하드웨어는 무엇 입니까? 하나를 선택하세요.
      What is your hardware? Please select one
      1) Server
      2) Workstation_Desktop
      3) Exit
      1
      Server.
      어느 제조사의 시스템인가요? 하나를 선택하세요
      Which manufacturer's system? Please select one
      1) Dell
      2) Supermicro_Etc
      3) Exit
      1
      Dell.
      사용되는 os 하나 를 선택하세요.
      use os install ? Please select one
      1) Centos7
      2) Ubuntu16
      3) Ubuntu18
      4) Exit
      1
      Centos7.
      관리자 의 용도는 CPU 인가요 GPU 인가요 ?.
      Administrator purpose CPU or GPU ?
      1) CPU
      2) GPU
      3) Exit





## 기타
- [마크다운에 대하여][markdown]
***

end.

[centos7]: https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md  
[ubuntu]: https://github.com/dasandata/LISR/blob/master/Ubuntu16/Standard_Install_Ubuntu.md  
[markdown]: https://github.com/dasandata/LISR/blob/master/makrdown.md
