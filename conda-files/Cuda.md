# 0. Cuda 설치 경로

[root@ubuntu:~]#

[root@ubuntu:~]# ll /usr/local | grep -i cuda

lrwxrwxrwx  1 root root    9 Jul 21 15:06 cuda -> cuda-10.2/

drwxr-xr-x 16 root root 4096 Jul  7 14:05 cuda-10.0/

drwxr-xr-x 15 root root 4096 Jul  8 14:28 cuda-10.1/

drwxr-xr-x 16 root root 4096 Jul 21 15:06 cuda-10.2/

drwxr-xr-x 15 root root 4096 Jul  9 18:39 cuda-9.0/

drwxr-xr-x 15 root root 4096 Jul 10 17:08 cuda-9.2/

[root@ubuntu:~]#


## 1. /home/$USER/.bashrc 환경 변수

[test@ubuntu:~]#

[test@ubuntu:~]# pwd

/home/$USER

[test@ubuntu:~]#

[test@ubuntu:~]# tail -5 /home/$USER/.bashrc

```
 ### ADD Cuda xx PATH

 export PATH=/usr/local/cuda-Version/bin:/usr/local/cuda-Version/include:$PATH

 export LD_LIBRARY_PATH=/usr/local/cuda-Version/lib64:/usr/local/cuda/extras/CUPTI/:$LD_LIBRARY_PATH

 export CUDA_HOME=/usr/local/cuda-Version

 export CUDA_INC_DIR=/usr/local/cuda-Version/include

[test@ubuntu:~]#

```


#### 1-1. Cuda 9.0 환경 변수 적용하기

```
test@ubuntu:~$

test@ubuntu:~$ cat << EOF >> .bashrc

 ### ADD Cuda 9.0 PATH

export PATH=/usr/local/cuda-9.0/bin:/usr/local/cuda-9.0/include:\$PATH

export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH

export CUDA_HOME=/usr/local/cuda-9.0

export CUDA_INC_DIR=/usr/local/cuda-9.0/include

### add end.

EOF

test@ubuntu:~$

test@ubuntu:~$ tail -6 .bashrc

### ADD Cuda 9.0 PATH

export PATH=/usr/local/cuda-9.0/bin:/usr/local/cuda-9.0/include:$PATH

export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:/usr/local/cuda/extras/CUPTI/:$LD_LIBRARY_PATH

export CUDA_HOME=/usr/local/cuda-9.0

export CUDA_INC_DIR=/usr/local/cuda-9.0/include

### add end.

test@ubuntu:~$

test@ubuntu:~$ source .bashrc

test@ubuntu:~$

test@ubuntu:~$ nvcc -V

nvcc: NVIDIA (R) Cuda compiler driver

Copyright (c) 2005-2017 NVIDIA Corporation

Built on Fri_Sep__1_21:08:03_CDT_2017

Cuda compilation tools, release 9.0, V9.0.176

test@ubuntu:~$

```

#### 1-2. Cuda 9.2 환경 변수 적용하기

```
[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ cat << EOF >> .bashrc

 ### ADD Cuda 9.2 PATH

export PATH=/usr/local/cuda-9.2/bin:/usr/local/cuda-9.2/include:\$PATH

export LD_LIBRARY_PATH=/usr/local/cuda-9.2/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH

export CUDA_HOME=/usr/local/cuda-9.2

export CUDA_INC_DIR=/usr/local/cuda-9.2/include

### add end.

EOF

[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ tail -6 .bashrc

### ADD Cuda 9.2 PATH

export PATH=/usr/local/cuda-9.2/bin:/usr/local/cuda-9.2/include:$PATH

export LD_LIBRARY_PATH=/usr/local/cuda-9.2/lib64:/usr/local/cuda/extras/CUPTI/:$LD_LIBRARY_PATH

export CUDA_HOME=/usr/local/cuda-9.2

export CUDA_INC_DIR=/usr/local/cuda-9.2/include

### add end.

[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ source .bashrc

[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ nvcc -V

nvcc: NVIDIA (R) Cuda compiler driver

Copyright (c) 2005-2018 NVIDIA Corporation

Built on Tue_Jun_12_23:07:04_CDT_2018

Cuda compilation tools, release 9.2, V9.2.148

[sonic@ubuntu:~]$

```


#### 1-3. Cuda 10.0 환경 변수 적용하기

```
[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ cat << EOF >> .bashrc

 ### ADD Cuda 10.0 PATH

export PATH=/usr/local/cuda-10.0/bin:/usr/local/cuda-10.0/include:\$PATH

export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH

export CUDA_HOME=/usr/local/cuda-10.0

export CUDA_INC_DIR=/usr/local/cuda-10.0/include

### add end.

EOF

[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ tail -6 .bashrc

### ADD Cuda 10.0 PATH

export PATH=/usr/local/cuda-10.0/bin:/usr/local/cuda-10.0/include:$PATH

export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:/usr/local/cuda/extras/CUPTI/:$LD_LIBRARY_PATH

export CUDA_HOME=/usr/local/cuda-10.0

export CUDA_INC_DIR=/usr/local/cuda-10.0/include

### add end.

[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ source .bashrc

[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ nvcc -V

nvcc: NVIDIA (R) Cuda compiler driver

Copyright (c) 2005-2018 NVIDIA Corporation

Built on Sat_Aug_25_21:08:01_CDT_2018

Cuda compilation tools, release 10.0, V10.0.130

[sonic@ubuntu:~]$

```

#### 1-4. Cuda 10.1 환경 변수 적용하기

```
[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ cat << EOF >> .bashrc

 ### ADD Cuda 10.1 PATH

export PATH=/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/include:\$PATH

export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH

export CUDA_HOME=/usr/local/cuda-10.1

export CUDA_INC_DIR=/usr/local/cuda-10.1/include

### add end.

EOF

[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ tail -6 .bashrc

### ADD Cuda 10.1 PATH

export PATH=/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/include:$PATH

export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64:/usr/local/cuda/extras/CUPTI/:$LD_LIBRARY_PATH

export CUDA_HOME=/usr/local/cuda-10.1

export CUDA_INC_DIR=/usr/local/cuda-10.1/include

### add end.

[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ source .bashrc

[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ nvcc -V

nvcc: NVIDIA (R) Cuda compiler driver

Copyright (c) 2005-2019 NVIDIA Corporation

Built on Sun_Jul_28_19:07:16_PDT_2019

Cuda compilation tools, release 10.1, V10.1.243

[sonic@ubuntu:~]$

```


#### 1-5. Cuda 10.2 환경 변수 적용하기

```
[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ cat << EOF >> .bashrc

 ### ADD Cuda 10.2 PATH

export PATH=/usr/local/cuda-10.2/bin:/usr/local/cuda-10.2/include:\$PATH

export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64:/usr/local/cuda/extras/CUPTI/:\$LD_LIBRARY_PATH

export CUDA_HOME=/usr/local/cuda-10.2

export CUDA_INC_DIR=/usr/local/cuda-10.2/include

### add end.

EOF

[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ tail -6 .bashrc

### ADD Cuda 10.2 PATH

export PATH=/usr/local/cuda-10.2/bin:/usr/local/cuda-10.2/include:$PATH

export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64:/usr/local/cuda/extras/CUPTI/:$LD_LIBRARY_PATH

export CUDA_HOME=/usr/local/cuda-10.2

export CUDA_INC_DIR=/usr/local/cuda-10.2/include

### add end.

[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ source .bashrc

[sonic@ubuntu:~]$

[sonic@ubuntu:~]$ nvcc -V

nvcc: NVIDIA (R) Cuda compiler driver

Copyright (c) 2005-2019 NVIDIA Corporation

Built on Wed_Oct_23_19:24:38_PDT_2019

Cuda compilation tools, release 10.2, V10.2.89

[sonic@ubuntu:~]$

```
