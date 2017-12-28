# 1분 git 사용 방법 

## 리눅스에 git 을 설치 합니다.
- Cent OS 계열
```bash
yum install git
```
- Ubuntu 계열
```bash
apt-get install git
```
***
## git 사용자명 설정 (global config)
git 을 사용하면서 commit 을 할때 comment 에 기록될 사용자 정보를 미리 정의 합니다.  
필요한 정보는 email 주소와 이름 입니다. 
```
git config --global user.email "이메일@주소"
git config --global user.name "이름"
```
## 다산데이타 저장소 복사 (clone)
git clone 명령을 실행한 위치에서 저장소 명과 동일한 이름으로 폴더가 생성 됩니다.  
예를 들어 아래 명령을 user 계정의 home 디렉토리에서 실행 한 경우,  
생성되는 저장소 위치는 아래와 같습니다.  
/home/user/dasandata-LinuxInstall
```
git clone https://github.com/dasandata/dasandata-LinuxInstall
```
## 사용 또는 편집
복제된 문서나 스크립트를 사용하거나 필요한 경우 편집 합니다.
## 저장소 업데이트
수시로(?) 발생하는 업데이트를 반영하기 위해 새로운 정보를 내려받습니다.  
업데이트가 필요한 저장소 폴더로 이동한 후 실행 합니다.  
(예를 들어 = /home/user/dasandata-LinuxInstall)



end.