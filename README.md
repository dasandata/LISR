# 안녕하세요 다산데이타 입니다.  
다산데이타 에서 출고되는 서버 & 워크스테이션에 설치되는 리눅스 표준설치 메뉴얼 과 스크립트 입니다.  
** 아래 GIt 자동 스크립트는 인터넷이 작동 되는 상태에서 진행 되어야 합니다.

![Dasandata Logo](http://dasandata.co.kr/wp-content/uploads/2019/05/%EB%8B%A4%EC%82%B0%EB%A1%9C%EA%B3%A0_%EC%88%98%EC%A0%951-300x109.jpg)

### 먼저 git 사용방법을 간략하게 확인 하시기 바랍니다.    
#### - [1분 git 사용 방법 (리눅스 터미널에서)][how-to-git]  
[how-to-git]:https://github.com/dasandata/LISR/blob/master/how-to-git.md


## 목차
- [1. 리눅스 설치 표준안 - Centos 7.9, Ubuntu 20.04 (2022.03)][Manually Install](https://github.com/dasandata/LISR/blob/9a092efb64e1738db5c506dd0107cb1b80150fe5/Installing_LISR_Manually.md)  

- [2. 리눅스 자동설치 스크립트. ][Linux Auto Script](https://github.com/dasandata/LISR/blob/dc2e0fac2364f203528f6a69e8915a1b8a7aaa6e/LISR_LAS/Linux_Auto_Script.sh)
  - 운영체제 통합 스크립트
      - centos 7.9
      - ubuntu 16.04
      - ubuntu 18.04
      - ubuntu 20.04
- [4. 자동 스크립트 Release Note ][Release Note](https://github.com/dasandata/LISR/blob/81b5b3391e63753433f7522578954a9fba64b7ec/LISR_LAS/Release%20Note/LAS_Release_Note.md)


[root@dasandata-script-test:~]#  yum install -y git  # Centos

[root@dasandata-script-test:~]#

[root@dasandata-script-test:~]# apt-get install -y git # Ubuntu

[root@dasandata-script-test:~]#

[root@dasandata-script-test:~]# git clone https://github.com/dasandata/LISR

[root@dasandata-script-test:~]#

[root@dasandata-script-test:~]# bash /root/LISR/LISR_LAS/Linux_Auto_Script.sh

      You have run Linux_Automatic_Script
      Copyright by Dasandata.co.ltd
      http://www.dasandata.co.kr

      Linux_Automatic_Script Install Start

      CUDA Version Select
      1) 10-0
      2) 10-1
      3) 10-2
      4) 11-0
      5) No-GPU
      #? 






## 기타
- [마크다운에 대하여][markdown]
***

end.

[centos7]: https://github.com/dasandata/LISR/blob/master/CentOS7/Standard_Install_CentOS_7.md  
[ubuntu]: https://github.com/dasandata/LISR/blob/master/Ubuntu16/Standard_Install_Ubuntu.md  
[markdown]: https://github.com/dasandata/LISR/blob/master/makrdown.md
