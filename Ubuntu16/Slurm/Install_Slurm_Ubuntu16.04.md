# Install Slurm for Ubuntu 16.04 (Standalone)   
설치중 log 파일 추척 방법 : tail -f $(ls -tr | tail -1)  

## # 54. slurm   install   

### # 54-1. Install mariadb-server

```bash
aptitude -y install  mariadb-server >> dasan_log_install_slurm-mariadb.txt 2>&1
tail dasan_log_install_slurm-mariadb.txt

ls -l  /var/run/mysqld/

#total 4
#-rw-rw---- 1 mysql mysql 5 Jan 24 13:40 mysqld.pid
#srwxrwxrwx 1 mysql mysql 0 Jan 24 13:40 mysqld.sock

ps -ef | grep  mysql

#root      12876      1  0 13:49 ?        00:00:00 /bin/bash /usr/bin/mysqld_safe
#mysql     13020  12876  0 13:49 ?        00:00:00 /usr/sbin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mysql/plugin #--user=mysql --skip-log-error --pid-file=/var/run/mysqld/mysqld.pid --socket=/var/run/mysqld/mysqld.sock --port=3306
#root      13021  12876  0 13:49 ?        00:00:00 logger -t mysqld -p daemon error
#root      13195   6688  0 13:51 pts/1    00:00:00 grep --color=auto mysql
```

### # 54-2. Install munge     

```bash
aptitude -y install  munge >> dasan_log_install_slurm-munge.txt 2>&1
tail dasan_log_install_slurm-munge.txt


ls -l /etc/munge/


ps -ef | grep  munge


dpkg  -L  munge | head
dpkg  -L  munge | tail

```

### # 54-3. Install slurm-llnl  

```bash
aptitude -y install  slurm-llnl  >> dasan_log_install_slurm-llnl.txt 2>&1
tail dasan_log_install_slurm-llnl.txt

ls -l /etc/slurm-llnl/

# 아직 실행되지 않았음 을 확인.
ps -ef  | grep  slurmd
ps -ef  | grep  slurmctld
```

```bash
ip a

AFTER_IP="$(ip addr | grep "inet " | grep brd | awk '{print $2}' | awk -F/ '{print $1}')"
echo $AFTER_IP

cat /etc/hosts
```

### # /etc/hosts 파일에 HOSTNAME 으로 내부 IP (127.0.x.x)가 설정 되어 있을 경우.
```bash

BEFORE_IP=`grep $HOSTNAME /etc/hosts | awk '{print $1}'`
echo $BEFORE_IP

sed "s/$BEFORE_IP/$AFTER_IP/" /etc/hosts
```
### # or /etc/hosts 파일에 HOSTNAME 으로 아무런 설정이 없을 경우.
```bash
echo "$AFTER_IP    $HOSTNAME" >> /etc/hosts
```

### # 변경된 값 확인.
```bash
cat /etc/hosts
ping -c 4 $HOSTNAME
```

### # 설치 상태 점검.
```bash
cat  /etc/passwd  | grep  'munge\|slurm'
cat  /etc/group   | grep  'munge\|slurm'

dpkg -l  | grep slurm  

dpkg -L  slurm-llnl

ls -l /var/lib/ | grep  'munge\|mysql\|slurm'
ls -l /var/log/ | grep  'munge\|mysql\|slurm'
ls -l /var/run/ | grep  'munge\|mysql\|slurm'

ls -l /dev/ | grep nvidia
```

## # 54-4. Standalon slurm.conf   

```bash
cd /root
git clone https://github.com/dasandata/LISR
cd /root/LISR
git pull
cd
```

```bash
cp /root/LISR/Ubuntu16/Slurm/template_slurm.conf  /etc/slurm-llnl/slurm.conf
grep <SONIC>    /etc/slurm-llnl/slurm.conf
sed "s/<SONIC>/$HOSTNAME"    /etc/slurm-llnl/slurm.conf
grep $HOSTNAME  /etc/slurm-llnl/slurm.conf
tail -20 /etc/slurm-llnl/slurm.conf
```


```bash
cp /root/LISR/Ubuntu16/Slurm/template_gres.conf  /etc/slurm-llnl/gres.conf
cat /etc/slurm-llnl/gres.conf

GPUTYPE=$(nvidia-smi -L | head -1 | awk '{print $3 $4}')
echo $GPUTYPE

sed -i 's/<GPUTYPE>/$GPUTYPE' /etc/slurm-llnl/gres.conf
cat /etc/slurm-llnl/gres.conf
```

```bash
systemctl  list-unit-files  | grep  slurm

systemctl  restart   slurmctld  
systemctl  restart  slurmd  
```

### # 54-5. slurm alias For sinfo,squeue   

```bash
cat  /root/LISR/Ubuntu16/Slurm/alias.slurm.sh
cp   /root/LISR/Ubuntu16/Slurm/alias.slurm.sh  /etc/profile.d/
source /etc/profile.d/alias.slurm.sh


sinfo | grep drain
PARTITION            NODES CPUS(A/I/O/T)        NODES(A/I/O/T) STATE  S:C:T    MEMORY     TMP_DISK   TIMELIMIT   FEATURES         NODELIST GRES
cpu                  1     0/0/20/20            0/0/1/1        drain  1:10:2   60000      900000     10-00:00:00 (null)           DataMining gpu:gtx1080ti:1
gpu*                 1     0/0/20/20            0/0/1/1        drain  1:10:2   60000      900000     10-00:00:00 (null)           DataMining gpu:gtx1080ti:1

```

### # 54-6. Scontrol command  

```bash
scontrol  update  NodeName=DataMining   state=resume

sinfo  
PARTITION            NODES CPUS(A/I/O/T)        NODES(A/I/O/T) STATE  S:C:T    MEMORY     TMP_DISK   TIMELIMIT   FEATURES         NODELIST GRES
cpu                  1     0/20/0/20            0/1/0/1        idle   1:10:2   60000      900000     10-00:00:00 (null)           DataMining gpu:gtx1080ti:1
gpu*                 1     0/20/0/20            0/1/0/1        idle   1:10:2   60000      900000     10-00:00:00 (null)           DataMining gpu:gtx1080ti:1

scontrol  show node

NodeName=3452453456 Arch=x86_64 CoresPerSocket=10
   CPUAlloc=0 CPUErr=0 CPUTot=20 CPULoad=0.00 Features=(null)
   Gres=gpu:gtx1080ti:1
   NodeAddr=DataMining NodeHostName=DataMining Version=15.08
   OS=Linux RealMemory=60000 AllocMem=0 FreeMem=63052 Sockets=1 Boards=1
   State=IDLE ThreadsPerCore=2 TmpDisk=900000 Weight=1 Owner=N/A
   BootTime=2018-01-24T15:11:16 SlurmdStartTime=2018-01-24T16:30:39
   CapWatts=n/a
   CurrentWatts=0 LowestJoules=0 ConsumedJoules=0
   ExtSensorsJoules=n/s ExtSensorsWatts=0 ExtSensorsTemp=n/s


scontrol  show  job
No jobs in the system

```

### # 54-7. slurm log 보기  

```bash
slurmctld -D  -vv

slurmd  -D  -vvv

tail -f /var/log/slurm-llnl/slurmctld.log   
```

### # 54-8. slurm interactive job test

#### # cpu test   

```bash
squeue
env  | grep  SLURM | tail

# 인터렉티브 모드로 진입.
srun  -N1  -n 10   --pty /bin/bash

# 인터렉티브 모드로 진입후 queue 상태 와 환경변수 (env)
squeue  
env  | grep SLURM | tail

hostname

# 병렬작업 실행 (모드 진입시 설정한 cpu 수 [-n 값] 만큼 실행 됩니다.)
srun  hostname

logout
# 인터렉티브 모드에서 빠져나와서  queue 상태 와 환경변수 (env)
squeue  
env  | grep  SLURM | tail
```

#### # GPU Test   

```bash
srun  --gres=gpu:1   --exclusive  --pty  /bin/bash  
squeue  

/root/NVIDIA_CUDA-8.0_Samples/bin/x86_64/linux/release/deviceQuery | tail
python  /root/TensorFlow-Examples/examples/5_DataManagement/tensorflow_dataset_api.py | tail
```

### # 54-9. batch job test
#### # cpu batch job
```bash
cd
mkdir SLURM_TEST
cd SLURM_TEST
cp /root/LISR/Ubuntu16/Slurm/test-sbatch-cpu.sh  .
cat test-sbatch-cpu.sh

sbatch test-sbatch-cpu.sh
sbatch test-sbatch-cpu.sh
sbatch test-sbatch-cpu.sh
sbatch test-sbatch-cpu.sh
sbatch test-sbatch-cpu.sh

squeue
```

```bash
ls -ltr

cat $(ls -tr | tail -1)
```

#### # GPU batch job  
##### # nbody batch job    
```bash
cd /root/SLURM_TEST
cp /root/LISR/Ubuntu16/Slurm/test-sbatch-nbody.sh  .

pwd
cat test-sbatch-nbody.sh

sbatch  test-sbatch-nbody.sh
sbatch  test-sbatch-nbody.sh
sbatch  test-sbatch-nbody.sh
sbatch  test-sbatch-nbody.sh
sbatch  test-sbatch-nbody.sh

sinfo
squeue
```

```bash
ls -ltr

cat $(ls -tr | tail -1)
```

##### # Tensor flow   Test   

```bash
cd /root/SLURM_TEST
cp /root/LISR/Ubuntu16/Slurm/test-sbatch-tensorflow.sh  .

pwd
cat test-sbatch-tensorflow.sh

sbatch  test-sbatch-tensorflow.sh
sbatch  test-sbatch-tensorflow.sh
sbatch  test-sbatch-tensorflow.sh
sbatch  test-sbatch-tensorflow.sh
sbatch  test-sbatch-tensorflow.sh

info
squeue
```


### END.
