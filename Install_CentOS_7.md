# 다산데이타 CentOS 7 설치 표준안 (2018.03)
다산데이터 출고 장비에 설치되는 리눅스 (CenOS7) 의 설치 표준안 입니다.  
별도의 요청사항이 없는 경우 기본적으로 아래 절차에 따라 설치한 후 출고 하고 있습니다.  
보완이 필요한 점이나 새로운 아이디어를 제보해 주시면 적극 반영하겠습니다 :)  

감사합니다.  

![Dasandata Logo](http://www.dasandata.co.kr/dasanlogo.jpg)

## #목차

***

## # 범례(변수).
- <내용>: 상황에 따라 변경이 필요한 내용을 표현 합니다.  
- ${변수명} : 반복되어 사용되는 부분이 있을 때 사용되는 변수 입니다.  

## # 팁.
- 명령을 실행시킬때, 명령어 박스 단위로 복사하여 터미널에 붙여 넣으면 됩니다.  
- 박스가 분리되어 있는 경우 분리된 단위로 복사하여 붙여 넣어야 합니다.

## # 리눅스 설치시 IP 와 HOSTNAME 은 수동으로 미리 설정 한다.
\# 처음 설치 할때부터 고정 IP를 설정하고 HOSTNAME을 정의 하는 것을 권장 합니다.  

## # 터미널을 통해 리눅스가 새로 설치된 장비에 로그인 합니다.

```bash
ssh <사용자 계정>@<IP 주소>
```

## # 관리자(root) 로 전환.
```bash
# sudo -i
# 또는
# su -
```
### # sudo -i 와 su - 의 차이점
\# 1. sudo -i 는 sudo 권한이 있는 사용자가, 사용자의 암호를 사용해서 root 권한으로 명령을 실행 하는 것 입니다.
\#    즉, root 의 패스워드를 몰라도 root 권한의 명령을 수행할 수 있습니다.
\# 2. su -    는 sudo 권한과 관계 없이 root 의 암호를 사용해서 root 계정으로 전환 하는 것 입니다.  
\#  
\# 'su - ' 의 경우 재접속 없이 다른 사용자 계정으로 전환 할 수 있는 명령 이며 아래와 같이 실행 합니다.  
\# ex) su  -  <다른사용자 계정명>   

***

### # [1. 기본 유틸 설치 / 시간 동기화](#목차)
\# 서버 기본 설정에 필요한 유틸리티들을 설치 한 후, 인터넷 시간에 맞추어 서버의 시간을 조정 합니다.

```bash
# 기본 유틸 설치.
# 화면에 로그가 뿌려지지 않도록 하기 위해 파이프라인(>) 처리를 합니다.
yum -y install \
vim pciutils perl openssh mlocate nfs-utils rdate xauth firefox nautilus wget \
tcsh tree lshw tmux git kernel-headers kernel-devel ipmitool gcc make gcc-c++ \
cmake python-devel ntfs-3g   >>  dasan_log_install_centos_default_util.txt

tail dasan_log_install_centos_default_util.txt # 설치 결과 확인.

# Development Tools 설치
yum -y groups install "Development Tools" >> dasan_log_install_centos_developtoosl.txt

tail dasan_log_install_centos_developtoosl.txt

# 서버 시간 동기화.
rdate  -s  time.bora.net
clock --systohc  
date
hwclock
```

### # [2. profile 설정 - Console Color , alias](#목차)
\# 사용 편의를 위한 alias를 설정, History Size 및 format 변경.  
\# Console 의 가독성을 높이기 위하여 Prompt 색상변경.
\# Console Color Codes : http://bitmote.com/public/ansi_4bit_color_table.png  
![Console Color Codes](http://bitmote.com/public/ansi_4bit_color_table.png)  

#### # 기본 alias.
```bash
echo " "  >> /etc/profile
echo "# add by dasandata"             >>   /etc/profile
echo "alias vi='vim' "                        >>   /etc/profile
echo "alias ls='ls --color=auto' "       >>   /etc/profile
echo "alias ll='ls -lh' "                        >>   /etc/profile
echo "alias grep='grep --color=auto' "   >>   /etc/profile
```

#### # 히스토리 사이즈 변경 (1000개 -> 100,000개), Format 변경
```bash
echo $HISTSIZE
grep HISTSIZE= /etc/profile
perl -pi -e 's/HISTSIZE=1000/HISTSIZE=100000/'  /etc/profile
grep HISTSIZE= /etc/profile

echo " "  >> /etc/profile
echo "# Add timestamp to .bash_history "  >> /etc/profile
echo 'export HISTTIMEFORMAT="20%y/%m/%d %T "' >> /etc/profile
echo " "  >> /etc/profile
```

#### # root 와 user 의 프롬프트 색상을 다르게 설정.
```bash
echo "export PS1='\[\e[1;30;41m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc
tail -1 /root/.bashrc

echo "export PS1='\[\e[1;31;40m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/user/.bashrc
tail -1 /home/user/.bashrc
```

#### # 적용확인.
```bash
tail -10 /etc/profile

source  /etc/profile

echo $HISTSIZE

source  .bashrc
```

### # [3. 하드웨어 사양 / 기본 환경 확인 (os 버젼 등)](#목차)






### # [4. ip 및 hostname 정보 / 인터넷 연결 확인](#목차)











***
## end.
