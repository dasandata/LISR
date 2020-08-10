# 0. Anaconda install 파일 다운로드

![Anaconda-dasan](file:///Users/sewoo/git/image/Anaconda-dasan.jpg)

```
1. 빨간 박스 에 마우스 대기
2. 오른쪽 마우스 버튼 클릭
3. 링크 주소 복사
4. 사용자 계정 현재 위치에 다운로드
```


## 1. Anaconda 설치 하기

```
test1@ubuntu:~$

test1@ubuntu:~$ pwd

/home/test1

test1@ubuntu:~$

test1@ubuntu:~$ wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh

test1@ubuntu:~$

test1@ubuntu:~$ ls

Anaconda3-2020.07-Linux-x86_64.sh  

test1@ubuntu:~$

test1@ubuntu:~$ sh Anaconda3-2020.07-Linux-x86_64.sh


Welcome to Anaconda3 2020.07


In order to continue the installation process, please review the license

agreement.

Please, press ENTER to continue

>>>


Do you accept the license terms? [yes|no]

[no] >>> yes


Anaconda3 will now be installed into this location:

/home/test1/anaconda3


  - Press ENTER to confirm the location

  - Press CTRL-C to abort the installation

  - Or specify a different location below


[/home/test1/anaconda3] >>>                ( anaconda 설치 경로 지정 이부분은 Enter Key 입력 )

PREFIX=/home/test1/anaconda3

Unpacking payload ...


<< 중략 >>


installation finished.

Do you wish the installer to initialize Anaconda3

by running conda init? [yes|no]

[no] >>> yes


If you'd prefer that conda's base environment not be activated on startup,

   set the auto_activate_base parameter to false:


conda config --set auto_activate_base false


ex )  커맨드 예제


test1@ubuntu:~$ source .bashrc

(base) test1@ubuntu:~$

(base) test1@ubuntu:~$ conda config --set auto_activate_base false

(base) test1@ubuntu:~$

(base) test1@ubuntu:~$ source .bashrc

test1@ubuntu:~$

test1@ubuntu:~$ conda env list

# conda environments:

#

base                  *  /home/test1/anaconda3


test1@ubuntu:~$
```
