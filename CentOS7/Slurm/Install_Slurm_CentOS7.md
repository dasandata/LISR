# Install Slurm for Centos 7.x (Standalone)   
\# 설치중 log 파일 추척 방법 : ` tail -f $(ls -tr | tail -1)  `

## # 54. slurm  install   

### # 54-1. Install OpenHPC Repository

```bash
yum repolist

yum -y install \
http://build.openhpc.community/OpenHPC:/1.3/CentOS_7/x86_64/ohpc-release-1.3-1.el7.x86_64.rpm >> \
 ~/dasan_log_ohpc_openhpc_repository.txt 2>&1
tail -1  ~/dasan_log_ohpc_openhpc_repository.txt

yum repolist
```

### # 54-2. Install slurm via OpehHPC Repository  

```bash
yum -y install ohpc-slurm-server slurm-contribs-ohpc  \
 >> ~/dasan_log_ohpc_resourcemanager_slurm.txt 2>&1

tail -1 ~/dasan_log_ohpc_resourcemanager_slurm.txt
```

```bash
yum -y install ohpc-slurm-client >> ~/dasan_log_ohpc_slurmclient.txt 2>&1

tail -1 ~/dasan_log_ohpc_slurmclient.txt
```

```bash
ls -l /etc/slurm/

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

#### # (선택사항) /etc/hosts 파일에 HOSTNAME 으로 내부 IP (127.0.x.x)가 설정 되어 있을 경우.
```bash

BEFORE_IP=`grep $HOSTNAME /etc/hosts | awk '{print $1}'`
echo $BEFORE_IP

sed -i "s/$BEFORE_IP/$AFTER_IP/" /etc/hosts
```
#### # (선택사항) /etc/hosts 파일에 HOSTNAME 으로 아무런 설정이 없을 경우.
```bash
echo "$AFTER_IP    $HOSTNAME" >> /etc/hosts
```

#### # 변경된 값 확인.
```bash
cat /etc/hosts
ping -c 4 $HOSTNAME
```

#### # 설치 상태 점검.
```bash
cat  /etc/passwd  | grep  'munge\|slurm'
cat  /etc/group   | grep  'munge\|slurm'

rpm -qa  | grep slurm  

ls -l /dev/ | grep nvidia
```

### # 54-4. Standalon slurm.conf   

```bash
cd /root
git clone https://github.com/dasandata/LISR
cd /root/LISR
git pull
cd
```


```bash
mv /etc/slurm/slurm.conf  /etc/slurm/slurm.conf.backup
cp /root/LISR/CentOS7/Slurm/template_slurm.conf  /etc/slurm/slurm.conf

grep "<SONIC>"    /etc/slurm/slurm.conf
sed -i "s/<SONIC>/$HOSTNAME/"    /etc/slurm/slurm.conf
grep $HOSTNAME  /etc/slurm/slurm.conf
```

```bash
Procs=$(lscpu | grep "CPU(s):" | head -1 | awk '{print $2}')
Sockets=$(lscpu | grep "Socket(s):" | awk '{print $2}')
CoresPerSocket=$(lscpu | grep "Core(s) per socket:" | awk '{print $4}')
ThreadsPerCore=$(lscpu | grep "Thread(s) per core:" |  awk '{print $4}')
RealMemory=$(free -m | grep Mem | awk '{print $2}')  # Megabyte.
```


```bash
sed -i "s/Procs=AA/Procs=$Procs/"                             /etc/slurm/slurm.conf
sed -i "s/Sockets=AA/Sockets=$Sockets/"                       /etc/slurm/slurm.conf
sed -i "s/CoresPerSocket=AA/CoresPerSocket=$CoresPerSocket/"  /etc/slurm/slurm.conf
sed -i "s/ThreadsPerCore=AA/ThreadsPerCore=$ThreadsPerCore/"  /etc/slurm/slurm.conf
sed -i "s/RealMemory=AA/RealMemory=$RealMemory/"              /etc/slurm/slurm.conf
```



#### # 아래 항목은 실제 구성 과 용도에 맞게 변경합니다.
```bash
TmpFS=/tmp                # or /scrach
TmpDisk=16384             # Megabyte
Gres=gpu:TITANXp:4        # 실제 모델과 수량에 맞추어 변경 합니다.
Feature=TITANXp,DellT640  # 실제 모델에 맞추어 변경 합니다.
```


```bash
sed -i "s#TmpFS=AA#TmpFS=$TmpFS#"             /etc/slurm/slurm.conf
sed -i "s/TmpDisk=AA/TmpDisk=$TmpDisk/"       /etc/slurm/slurm.conf
sed -i "s/Gres=AA/Gres=$Gres/"                /etc/slurm/slurm.conf
sed -i "s/Feature=AA/Feature=$Feature/"       /etc/slurm/slurm.conf
```

### # 54-4. Standalon gres.conf   
```bash
cp /root/LISR/CentOS7/Slurm/template_gres.conf  /etc/slurm/gres.conf
```

```bash
GPUTYPE=$(nvidia-smi -L | head -1 | awk '{print $3 $4}')
echo $GPUTYPE

sed -i "s/<GPUTYPE>/$GPUTYPE/" /etc/slurm/gres.conf
sed -i "s/<SONIC>/$HOSTNAME/"  /etc/slurm/gres.conf

cat  /etc/slurm/gres.conf
```

#### # gres.conf 는 총 GPU 갯수에 맞추어 변경해야 합니다.
```bash
cat /etc/slurm/gres.conf

vi  /etc/slurm/gres.conf
```

```bash
systemctl  list-unit-files  | grep  slurm

systemctl  restart  slurmctld  
systemctl  restart  slurmd  
systemctl  restart  munge  

systemctl  enable  slurmctld  
systemctl  enable  slurmd  
systemctl  enable  munge  
```

### # 54-6. queue status control - Scontrol command  

```bash
sinfo
sinfo  | awk '{print $5}'

scontrol  update  NodeName=$HOSTNAME   state=resume

sinfo
sinfo  | awk '{print $5}'

scontrol  show node

scontrol  show  job
```

### # 54-7. slurm 디버깅 및 log 보기  

```bash
# slurmctld -D  #  -vv 옵션을 주면 더 자세히 나옵니다. / Ctrl+C 를 누를떄 까지 끝나지 않음.  
# slurmd  -D    # -vvv 옵션을 주면 더 자세히 나옵니다. / Ctrl+C 를 누를떄 까지 끝나지 않음.  
# tail -f /var/log/slurm/slurmctld.log    / Ctrl+C 를 누를떄 까지 끝나지 않음.  
```

### # 54-8. slurm interactive job test
#### # cpu test   

```bash
# 인터렉티브 모드 진입전 queue 상태 와 환경변수 확인.
squeue
env  | grep  SLURM | tail
```

```bash
# 인터렉티브 모드로 진입.
srun  -N1  -n 10   --pty bash -i
```

```bash
# 인터렉티브 모드로 진입후 queue 상태 와 환경변수 (env)
squeue  
env  | grep SLURM | tail
```

```bash
# 병렬작업 실행 (모드 진입시 설정한 cpu 수 [-n 값] 만큼 실행 됩니다.)
srun  hostname
srun  hostname | wc -l
```

```bash
# 인터렉티브 모드에서 빠져나와서  queue 상태 와 환경변수 (env)
exit
squeue  
env  | grep  SLURM | tail
```

***

#### # GPU Test   
\# gpu 테스트를 하는동안 모니터링 : ` watch 'squeue ; echo ; echo ; nvidia-smi -l ; echo ; echo' `

```bash
srun --gres=gpu:1 --pty bash -i
squeue  

/root/NVIDIA_CUDA-8.0_Samples/bin/x86_64/linux/release/deviceQuery | tail
/root/NVIDIA_CUDA-9.0_Samples/bin/x86_64/linux/release/deviceQuery | tail

python  /root/TensorFlow-Examples/examples/5_DataManagement/tensorflow_dataset_api.py | tail

exit

srun --gres=gpu:2 --pty bash -i
squeue  

/root/NVIDIA_CUDA-8.0_Samples/bin/x86_64/linux/release/deviceQuery | tail
/root/NVIDIA_CUDA-9.0_Samples/bin/x86_64/linux/release/deviceQuery | tail

python  /root/TensorFlow-Examples/examples/5_DataManagement/tensorflow_dataset_api.py | tail

exit
```

### # 54-9. batch job test

##### # Copy of Batch Scripts Samples

```bash
cp -r /root/LISR/CentOS7/Slurm/SLURM_SBATCH_TEST/   /root/
cd /root/SLURM_SBATCH_TEST

```

#### # CPU Batch Job
```bash
cat test-sbatch-cpu.sh

sbatch test-sbatch-cpu.sh
sbatch test-sbatch-cpu.sh
sbatch test-sbatch-cpu.sh
sbatch test-sbatch-cpu.sh
sbatch test-sbatch-cpu.sh

sinfo
squeue
```

```bash
ls -ltr

cat $(ls -tr | tail -1)
```

#### # GPU batch job  
\# gpu 테스트를 하는동안 모니터링 : `watch 'squeue ; echo ; echo ; nvidia-smi -l ; echo ; echo '`

##### # nbody batch job (1GPU)   

```bash
grep -r "CUDA-8.0" ./
sed -i 's/CUDA-8.0/CUDA-9.0/' `grep -r "CUDA-8.0" ./ -l `
grep -r "CUDA-9.0" ./
```


```bash
cat test-sbatch-nbody-1GPU.sh

sbatch  test-sbatch-nbody-1GPU.sh
sbatch  test-sbatch-nbody-1GPU.sh
sbatch  test-sbatch-nbody-1GPU.sh
sbatch  test-sbatch-nbody-1GPU.sh
sbatch  test-sbatch-nbody-1GPU.sh

sinfo
squeue
```

```bash
ls -ltr

tail $(ls -tr | tail -1)
```

##### # nbody batch job (2GPU)    
```bash
cat test-sbatch-nbody-2GPU.sh

sbatch  test-sbatch-nbody-2GPU.sh
sbatch  test-sbatch-nbody-2GPU.sh
sbatch  test-sbatch-nbody-2GPU.sh
sbatch  test-sbatch-nbody-2GPU.sh
sbatch  test-sbatch-nbody-2GPU.sh

sinfo
squeue
```

```bash
ls -ltr

tail $(ls -tr | tail -1)
```

##### # Tensor flow Test (1GPU)  

```bash
cat test-sbatch-tensorflow-1GPU.sh

sbatch  test-sbatch-tensorflow-1GPU.sh
sbatch  test-sbatch-tensorflow-1GPU.sh
sbatch  test-sbatch-tensorflow-1GPU.sh
sbatch  test-sbatch-tensorflow-1GPU.sh
sbatch  test-sbatch-tensorflow-1GPU.sh

sinfo
squeue
```

```bash
ls -ltr

tail $(ls -tr | tail -1)
```

##### # Tensor flow Test (2GPU)  

```bash
cat test-sbatch-tensorflow-2GPU.sh

sbatch  test-sbatch-tensorflow-2GPU.sh
sbatch  test-sbatch-tensorflow-2GPU.sh
sbatch  test-sbatch-tensorflow-2GPU.sh
sbatch  test-sbatch-tensorflow-2GPU.sh
sbatch  test-sbatch-tensorflow-2GPU.sh

sinfo
squeue
```

```bash
ls -ltr

tail $(ls -tr | tail -1)
```


### END.
