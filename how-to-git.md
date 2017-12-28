# 1분 git 사용 방법 (리눅스 터미널에서)

## 리눅스 에 git 을 설치 합니다.

- Cent OS 계열  

```bash
yum install git
```

- Ubuntu 계열  

```bash
apt-get install git
```

## git 사용자명 설정 (global config)
git 을 사용하면서 commit 을 할때 comment 에 기록될 사용자 정보를 미리 정의 합니다.  
필요한 정보는 email 주소와 이름 입니다.  

```
git config --global user.email "이메일@주소"
```

```
git config --global user.name "이름"
```

## 다산데이타 원격저장소 복제 (clone)
git clone 명령을 실행한 위치에서 저장소 명과 동일한 이름으로 폴더가 생성 됩니다. (다르게 지정할 수도 있습니다.)  
예를 들어 아래 명령을 user 계정의 home 디렉토리에서 실행 한 경우,  
생성되는 저장소 위치는 아래와 같습니다.  
/home/user/dasandata-LinuxInstall

```
git clone https://github.com/dasandata/dasandata-LinuxInstall
```

## 사용 또는 편집
복제된 문서나 스크립트를 사용 하거나 필요한 경우 편집 합니다.

## 최신화 / 갱신 / 내려받기 / pull
수시로(?) 발생하는 업데이트를 반영하기 위해 원격저장소로 부터 새로운 정보를 내려받습니다.  
업데이트가 필요한 저장소 폴더로 이동한 후 실행 합니다.  
(예를 들어 = /home/user/dasandata-LinuxInstall 로 이동한 후 실행)

```
git pull
```

## 로컬 변경사항을 원격 저장소에 적용하기 / 올리기 / commit / push
필요에 의해서 스크립트나 문서의 내용이 수정된 경우  
변경사항을 원격 저장소에 적용하기 위해 아래 두 단계를 거쳐야 합니다.
1. commit (커밋)
2. push  

커밋이 무엇인지 설명하려면 글이 길어지니 생략 하고,  
간단히 방법만 이야기 합니다. ^^;;

### commit 명령을 통해 수정된 내용이 무엇인지 기록을 납깁니다.  

아래 명령을 실행하면 vi 편집창이 열리는데, 메세지를 기록한 후 저장하고 빠져나오면 됩니다.

```
commit -a
```


### 커밋 내용과 함께 원격 저장소로 업로드 합니다.

원격 저장소에 접근 가능한 계정을 입력해야 합니다.

```
git push origin master
```

> [${USERNAME}@${HOSTNAME}:${GIT프로젝트 디렉토리}]$ git push origin ***master***
> Username for 'https://github.com': **사용자명 입력**
> Password for 'https://사용자명@github.com': **비밀번호 입력.**
> Counting objects: 5, done.  
> Delta compression using up to 4 threads.  
> Compressing objects: 100% (3/3), done.  
> Writing objects: 100% (3/3), 322 bytes | 0 bytes/s, done.
> Total 3 (delta 2), reused 0 (delta 0)  
> remote: Resolving deltas: 100% (2/2), completed with 2 local objects.  
> To https://github.com/dasandata/dasandata-LinuxInstall  
>    94%^&$%@#$@!$1b6  master -> master  
> [${USERNAME}@${HOSTNAME}:${GIT프로젝트 디렉토리}]$


### 참조링크
- [생활코딩 지옥에서 온 Git](https://opentutorials.org/course/2708)
- [ihoneymon 님의 GIT을 기반으로 한 프로젝트 개발프로세스](https://gist.github.com/ihoneymon/a28138ee5309c73e94f9)
***

end.
