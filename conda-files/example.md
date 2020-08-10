# 0. dasan conda 파일 저장소 로드

```
[sonic@test3:~]$

[sonic@test3:~]$ pwd

/home/sonic

[sonic@test3:~]$

[sonic@test3:~]$ git clone https://github.com/dasandata/LISR

[sonic@test3:~]$

[sonic@test3:~]$ ls

Anaconda3-2020.07-Linux-x86_64.sh  LISR  anaconda3  snap

[sonic@test3:~]$

[sonic@test3:~]$ ll /home/sonic/LISR/conda-files/

total 20K

drwxrwxr-x 2 sonic sonic 4.0K Aug  7 14:46 Bio

-rw-rw-r-- 1 sonic sonic 5.1K Aug  7 14:46 README.md

drwxrwxr-x 2 sonic sonic 4.0K Aug  7 14:46 pytorch-gpu

drwxrwxr-x 2 sonic sonic 4.0K Aug  7 14:46 tensorflow-gpu

[sonic@test3:~]$

[sonic@test3:~]$ ll /home/sonic/LISR/conda-files/tensorflow-gpu/

total 84K

-rwxrwxr-x 1 sonic sonic 2.6K Aug  7 14:46 cuda10.0-tf-g1.13.1-py35.yaml

-rwxrwxr-x 1 sonic sonic 2.6K Aug  7 14:46 cuda10.0-tf-g1.13.1-py36.yaml

-rwxrwxr-x 1 sonic sonic 2.7K Aug  7 14:46 cuda10.0-tf-g1.13.1-py37.yaml

-rwxrwxr-x 1 sonic sonic 2.6K Aug  7 14:46 cuda10.0-tf-g1.14-py35.yaml

-rwxrwxr-x 1 sonic sonic 2.6K Aug  7 14:46 cuda10.0-tf-g1.14-py36.yaml

-rwxrwxr-x 1 sonic sonic 2.7K Aug  7 14:46 cuda10.0-tf-g1.14-py37.yaml

-rwxrwxr-x 1 sonic sonic 2.8K Aug  7 14:46 cuda10.1-tf-g2.0-py35.yaml

-rwxrwxr-x 1 sonic sonic 2.8K Aug  7 14:46 cuda10.1-tf-g2.0-py36.yaml

-rwxrwxr-x 1 sonic sonic 2.9K Aug  7 14:46 cuda10.1-tf-g2.0-py37.yaml

-rwxrwxr-x 1 sonic sonic 2.8K Aug  7 14:46 cuda10.1-tf-g2.1-py35.yaml

-rwxrwxr-x 1 sonic sonic 2.8K Aug  7 14:46 cuda10.1-tf-g2.1-py36.yaml

-rwxrwxr-x 1 sonic sonic 2.9K Aug  7 14:46 cuda10.1-tf-g2.1-py37.yaml

-rwxrwxr-x 1 sonic sonic 2.8K Aug  7 14:46 cuda10.1-tf-g2.2-py35.yaml

-rwxrwxr-x 1 sonic sonic 2.9K Aug  7 14:46 cuda10.1-tf-g2.2-py36.yaml

-rwxrwxr-x 1 sonic sonic 3.0K Aug  7 14:46 cuda10.1-tf-g2.2-py37.yaml

-rwxrwxr-x 1 sonic sonic 2.5K Aug  7 14:46 cuda9.0-tf-g1.11-py35.yaml

-rwxrwxr-x 1 sonic sonic 2.5K Aug  7 14:46 cuda9.0-tf-g1.11-py36.yaml

-rwxrwxr-x 1 sonic sonic 2.4K Aug  7 14:46 cuda9.0-tf-g1.5-py35.yaml

-rwxrwxr-x 1 sonic sonic 2.4K Aug  7 14:46 cuda9.0-tf-g1.5-py36.yaml

-rwxrwxr-x 1 sonic sonic 2.5K Aug  7 14:46 cuda9.0-tf-g1.8-py35.yaml

-rwxrwxr-x 1 sonic sonic 2.5K Aug  7 14:46 cuda9.0-tf-g1.8-py36.yaml

[sonic@test3:~]$

[sonic@test3:~]$ ll /home/sonic/LISR/conda-files/pytorch-gpu/

total 48K

-rwxrwxr-x 1 sonic sonic 3.1K Aug  7 14:46 cuda10.1-torch-gpu-py35.yaml

-rwxrwxr-x 1 sonic sonic 3.3K Aug  7 14:46 cuda10.1-torch-gpu-py36.yaml

-rwxrwxr-x 1 sonic sonic 3.4K Aug  7 14:46 cuda10.1-torch-gpu-py37.yaml

-rwxrwxr-x 1 sonic sonic 3.3K Aug  7 14:46 cuda10.1-torch-gpu-py38.yaml

-rwxrwxr-x 1 sonic sonic 3.0K Aug  7 14:46 cuda10.2-torch-gpu-py35.yaml

-rwxrwxr-x 1 sonic sonic 3.2K Aug  7 14:46 cuda10.2-torch-gpu-py36.yaml

-rwxrwxr-x 1 sonic sonic 3.3K Aug  7 14:46 cuda10.2-torch-gpu-py37.yaml

-rwxrwxr-x 1 sonic sonic 3.3K Aug  7 14:46 cuda10.2-torch-gpu-py38.yaml

-rwxrwxr-x 1 sonic sonic 3.9K Aug  7 14:46 cuda9.2-torch-gpu-py35.yaml

-rwxrwxr-x 1 sonic sonic 3.3K Aug  7 14:46 cuda9.2-torch-gpu-py36.yaml

-rwxrwxr-x 1 sonic sonic 3.4K Aug  7 14:46 cuda9.2-torch-gpu-py37.yaml

-rwxrwxr-x 1 sonic sonic 3.3K Aug  7 14:46 cuda9.2-torch-gpu-py38.yaml

[sonic@test3:~]$
```

## 1. Anaconda 환경 파일 로드 하기 ( Tensorflow-GPU )

```
[sonic@test3:~]$

[sonic@test3:~]$ conda env list

# conda environments:

#

base                  *  /home/sonic/anaconda3


[sonic@test3:~]$

[sonic@test3:~]$ conda env create -f /home/sonic/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.0-py36.yaml


<< 중략 >>


#

# To activate this environment, use

#

#     $ conda activate dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36

#

# To deactivate an active environment, use

#

#     $ conda deactivate


[sonic@test3:~]$

[sonic@test3:~]$ conda env list

# conda environments:

#

base                  *  /home/sonic/anaconda3

dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36     /home/sonic/anaconda3/envs/dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36


[sonic@test3:~]$

[sonic@test3:~]$ conda activate dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36

(dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36) [sonic@test3:~]$

(dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36) [sonic@test3:~]$ which python

~/anaconda3/envs/dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36/bin/python

(dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36) [sonic@test3:~]$

(dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36) [sonic@test3:~]$ which pip

~/anaconda3/envs/dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36/bin/pip

(dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36) [sonic@test3:~]$

(dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36) [sonic@test3:~]$ python -V

Python 3.6.5

(dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36) [sonic@test3:~]$

(dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36) [sonic@test3:~]$ pip -V

pip 20.1.1 from /home/sonic/anaconda3/envs/dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36/lib/python3.6/site-packages/pip (python 3.6)

(dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36) [sonic@test3:~]$

(dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36) [sonic@test3:~]$ pip list | grep -i ten

keras-self-attention             0.46.0

sentencepiece                    0.1.91

tensorboard                      2.0.2

tensorflow-datasets              3.1.0

tensorflow-estimator             2.0.1

tensorflow-gpu                   2.0.0

tensorflow-metadata              0.22.2

(dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36) [sonic@test3:~]$

(dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36) [sonic@test3:~]$ conda deactivate

[sonic@test3:~]$
```

## 2. Anaconda 환경 파일 로드 하기 ( Pytorch-GPU )

```
[sonic@test3:~]$

[sonic@test3:~]$ conda env list

# conda environments:

#

base                  *  /home/sonic/anaconda3

dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36     /home/sonic/anaconda3/envs/dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36


[sonic@test3:~]$

[sonic@test3:~]$ conda env create -f /home/sonic/LISR/conda-files/pytorch-gpu/cuda10.1-torch-gpu-py38.yaml


<< 중략 >>


#

# To activate this environment, use

#

#     $ conda activate dasan-Ubuntu16-Cuda10.1-Pytorch-py38

#

# To deactivate an active environment, use

#

#     $ conda deactivate


[sonic@test3:~]$

[sonic@test3:~]$ conda activate dasan-Ubuntu16-Cuda10.1-Pytorch-py38

(dasan-Ubuntu16-Cuda10.1-Pytorch-py38) [sonic@test3:~]$

(dasan-Ubuntu16-Cuda10.1-Pytorch-py38) [sonic@test3:~]$ which python

~/anaconda3/envs/dasan-Ubuntu16-Cuda10.1-Pytorch-py38/bin/python

(dasan-Ubuntu16-Cuda10.1-Pytorch-py38) [sonic@test3:~]$

(dasan-Ubuntu16-Cuda10.1-Pytorch-py38) [sonic@test3:~]$ which pip

~/anaconda3/envs/dasan-Ubuntu16-Cuda10.1-Pytorch-py38/bin/pip

(dasan-Ubuntu16-Cuda10.1-Pytorch-py38) [sonic@test3:~]$

(dasan-Ubuntu16-Cuda10.1-Pytorch-py38) [sonic@test3:~]$ python -V

Python 3.8.3

(dasan-Ubuntu16-Cuda10.1-Pytorch-py38) [sonic@test3:~]$

(dasan-Ubuntu16-Cuda10.1-Pytorch-py38) [sonic@test3:~]$ pip -V

pip 20.1.1 from /home/sonic/anaconda3/envs/dasan-Ubuntu16-Cuda10.1-Pytorch-py38/lib/python3.8/site-packages/pip (python 3.8)

(dasan-Ubuntu16-Cuda10.1-Pytorch-py38) [sonic@test3:~]$

(dasan-Ubuntu16-Cuda10.1-Pytorch-py38) [sonic@test3:~]$ pip list | grep -i torch

torch                            1.5.1

torchvision                      0.6.0a0+35d732a

(dasan-Ubuntu16-Cuda10.1-Pytorch-py38) [sonic@test3:~]$

(dasan-Ubuntu16-Cuda10.1-Pytorch-py38) [sonic@test3:~]$ conda list torch

# packages in environment at /home/sonic/anaconda3/envs/dasan-Ubuntu16-Cuda10.1-Pytorch-py38:

#

# Name                    Version                   Build  Channel

pytorch                   1.5.1           py3.8_cuda10.1.243_cudnn7.6.3_0    PyTorch

torchvision               0.6.1                py38_cu101    PyTorch

(dasan-Ubuntu16-Cuda10.1-Pytorch-py38) [sonic@test3:~]$

(dasan-Ubuntu16-Cuda10.1-Pytorch-py38) [sonic@test3:~]$ conda deactivate

[sonic@test3:~]$

[sonic@test3:~]$ conda env list

# conda environments:

#

base                  *  /home/sonic/anaconda3

dasan-Ubuntu16-Cuda10.1-Pytorch-py38     /home/sonic/anaconda3/envs/dasan-Ubuntu16-Cuda10.1-Pytorch-py38

dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36     /home/sonic/anaconda3/envs/dasan-Ubuntu16-Cuda10.1-TensorG-2.0-py36


[sonic@test3:~]$
```
