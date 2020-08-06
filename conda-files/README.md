# Dasandata conda file Install


| Build           | Tensorflow-gpu  | torch-gpu |         |         |         |
| :-------------: | :-------------: | :-------: | :-----: | :-----: | :-----: |
| Your Os         | Linux                                                 |||||
| Package         | Conda                                                 |||||
| Language        | Python                                                |||||
| Python Version  | 3.5.5           | 3.6.5     |  3.7.5  |  3.8.3  |         |
| Cuda Version    | 9.0             |  9.2      | 10.0    | 10.1    | 10.2    |

## Install option

- [x] Linux
- [x] Python
- [x] Cuda
- [x] Conda

### Tensorflow-GPU rescue

```
+-- Tensorflow-GPU
    |
    |-- Cuda 9.0
    |   |-- Tensor Ver 1.5
    |   |   |-- Python 3.5.5    /root/LISR/conda-files/tensorflow-gpu/cuda9.0-tf-g1.5-py35.yaml
    |   |   |-- Python 3.6.5    /root/LISR/conda-files/tensorflow-gpu/cuda9.0-tf-g1.5-py36.yaml
    |   |
    |   |-- Tensor Ver 1.8
    |   |   |-- Python 3.5.5    /root/LISR/conda-files/tensorflow-gpu/cuda9.0-tf-g1.8-py35.yaml
    |   |   |-- Python 3.6.5    /root/LISR/conda-files/tensorflow-gpu/cuda9.0-tf-g1.8-py36.yaml
    |   |
    |   |-- Tensor Ver 1.11
    |       |-- Python 3.5.5    /root/LISR/conda-files/tensorflow-gpu/cuda9.0-tf-g1.11-py35.yaml
    |       |-- Python 3.6.5    /root/LISR/conda-files/tensorflow-gpu/cuda9.0-tf-g1.11-py36.yaml
    |
    |-- Cuda 10.0        
    |   |-- Tensor Ver 1.13.1
    |   |   |-- Python 3.5.5    /root/LISR/conda-files/tensorflow-gpu/cuda10.0-tf-g1.13.1-py35.yaml
    |   |   |-- Python 3.6.5    /root/LISR/conda-files/tensorflow-gpu/cuda10.0-tf-g1.13.1-py36.yaml
    |   |   |-- Python 3.7.5    /root/LISR/conda-files/tensorflow-gpu/cuda10.0-tf-g1.13.1-py37.yaml
    |   |
    |   |-- Tensor Ver 1.14
    |       |-- Python 3.5.5    /root/LISR/conda-files/tensorflow-gpu/cuda10.0-tf-g1.14-py35.yaml
    |       |-- Python 3.6.5    /root/LISR/conda-files/tensorflow-gpu/cuda10.0-tf-g1.14-py36.yaml
    |       |-- Python 3.7.5    /root/LISR/conda-files/tensorflow-gpu/cuda10.0-tf-g1.14-py37.yaml
    |
    |-- Cuda 10.1
        |-- Tensor Ver 2.0
        |   |-- Python 3.5.5    /root/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.0-py35.yaml
        |   |-- Python 3.6.5    /root/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.0-py36.yaml
        |   |-- Python 3.7.5    /root/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.0-py37.yaml
        |
        |-- Tensor Ver 2.1
        |   |-- Python 3.5.5    /root/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.1-py35.yaml
        |   |-- Python 3.6.5    /root/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.1-py36.yaml
        |   |-- Python 3.7.5    /root/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.1-py37.yaml
        |
        |-- Tensor Ver 2.2
            |-- Python 3.5.5    /root/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.2-py35.yaml
            |-- Python 3.6.5    /root/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.2-py36.yaml
            |-- Python 3.7.5    /root/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.2-py37.yaml
```

### Pytorch-GPU rescue

```
+-- Pytorch-GPU
    |
    |-- Cuda 9.2
    |   |-- Python 3.5.5    /root/LISR/conda-files/pytorch-gpu/cuda9.2-torch-gpu-py35.yaml
    |   |-- Python 3.6.5    /root/LISR/conda-files/pytorch-gpu/cuda9.2-torch-gpu-py36.yaml
    |   |-- Python 3.7.5    /root/LISR/conda-files/pytorch-gpu/cuda9.2-torch-gpu-py37.yaml
    |   |-- Python 3.8.3    /root/LISR/conda-files/pytorch-gpu/cuda9.2-torch-gpu-py38.yaml
    |
    |-- Cuda 10.1
    |   |-- Python 3.5.5    /root/LISR/conda-files/pytorch-gpu/cuda10.1-torch-gpu-py35.yaml
    |   |-- Python 3.6.5    /root/LISR/conda-files/pytorch-gpu/cuda10.1-torch-gpu-py36.yaml
    |   |-- Python 3.7.5    /root/LISR/conda-files/pytorch-gpu/cuda10.1-torch-gpu-py37.yaml
    |   |-- Python 3.8.3    /root/LISR/conda-files/pytorch-gpu/cuda10.1-torch-gpu-py38.yaml
    |
    |-- Cuda 10.2
        |-- Python 3.5.5    /root/LISR/conda-files/pytorch-gpu/cuda10.2-torch-gpu-py35.yaml
        |-- Python 3.6.5    /root/LISR/conda-files/pytorch-gpu/cuda10.2-torch-gpu-py36.yaml
        |-- Python 3.7.5    /root/LISR/conda-files/pytorch-gpu/cuda10.2-torch-gpu-py37.yaml
        |-- Python 3.8.3    /root/LISR/conda-files/pytorch-gpu/cuda10.2-torch-gpu-py38.yaml
```

#### Conda yaml file Import command

```
conda env create -f /root/LISR/conda-files/(tensor & pytorch)/option.yaml
```
