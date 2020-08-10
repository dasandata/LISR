# Dasandata conda file Install


| Build           | Tensorflow-gpu  | torch-gpu |         |         |         |
| :-------------: | :-------------: | :-------: | :-----: | :-----: | :-----: |
| Your OS         | Linux           | Linux     |         |         |         |
| Package         | Conda           | Conda     |         |         |         |
| Language        | Python          | Python    |         |         |         |
| Python Version  | 3.5.5           | 3.6.5     |  3.7.5  |  3.8.3  |         |
| Cuda Version    | 9.0             |  9.2      |   10.0  |   10.1  |   10.2  |

## Install option

- :white_check_mark: &nbsp; [Linux](https://github.com/dasandata/LISR/blob/master/conda-files/Linux.md)
- :white_check_mark: &nbsp; [Cuda](https://github.com/dasandata/LISR/blob/master/conda-files/Cuda.md)
- :white_check_mark: &nbsp; [Conda](https://github.com/dasandata/LISR/blob/master/conda-files/Conda.md)

### Conda yaml file Import command [예제](https://github.com/dasandata/LISR/blob/master/conda-files/example.md)

```
git clone https://github.com/dasandata/LISR

conda env create -f /home/$USER/LISR/conda-files/(tensor & pytorch)/option.yaml
```

#### Tensorflow-GPU rescue

```
+-- Tensorflow-GPU
    |
    |-- Cuda 9.0
    |   |-- Tensor Ver 1.5
    |   |   |-- Python 3.5.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda9.0-tf-g1.5-py35.yaml
    |   |   |-- Python 3.6.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda9.0-tf-g1.5-py36.yaml
    |   |
    |   |-- Tensor Ver 1.8
    |   |   |-- Python 3.5.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda9.0-tf-g1.8-py35.yaml
    |   |   |-- Python 3.6.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda9.0-tf-g1.8-py36.yaml
    |   |
    |   |-- Tensor Ver 1.11
    |       |-- Python 3.5.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda9.0-tf-g1.11-py35.yaml
    |       |-- Python 3.6.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda9.0-tf-g1.11-py36.yaml
    |
    |-- Cuda 10.0        
    |   |-- Tensor Ver 1.13.1
    |   |   |-- Python 3.5.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda10.0-tf-g1.13.1-py35.yaml
    |   |   |-- Python 3.6.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda10.0-tf-g1.13.1-py36.yaml
    |   |   |-- Python 3.7.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda10.0-tf-g1.13.1-py37.yaml
    |   |
    |   |-- Tensor Ver 1.14
    |       |-- Python 3.5.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda10.0-tf-g1.14-py35.yaml
    |       |-- Python 3.6.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda10.0-tf-g1.14-py36.yaml
    |       |-- Python 3.7.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda10.0-tf-g1.14-py37.yaml
    |
    |-- Cuda 10.1
        |-- Tensor Ver 2.0
        |   |-- Python 3.5.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.0-py35.yaml
        |   |-- Python 3.6.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.0-py36.yaml
        |   |-- Python 3.7.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.0-py37.yaml
        |
        |-- Tensor Ver 2.1
        |   |-- Python 3.5.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.1-py35.yaml
        |   |-- Python 3.6.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.1-py36.yaml
        |   |-- Python 3.7.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.1-py37.yaml
        |
        |-- Tensor Ver 2.2
            |-- Python 3.5.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.2-py35.yaml
            |-- Python 3.6.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.2-py36.yaml
            |-- Python 3.7.5    /home/$USER/LISR/conda-files/tensorflow-gpu/cuda10.1-tf-g2.2-py37.yaml
```

#### Pytorch-GPU rescue

```
+-- Pytorch-GPU
    |
    |-- Cuda 9.2
    |   |-- Python 3.5.5    /home/$USER/LISR/conda-files/pytorch-gpu/cuda9.2-torch-gpu-py35.yaml
    |   |-- Python 3.6.5    /home/$USER/LISR/conda-files/pytorch-gpu/cuda9.2-torch-gpu-py36.yaml
    |   |-- Python 3.7.5    /home/$USER/LISR/conda-files/pytorch-gpu/cuda9.2-torch-gpu-py37.yaml
    |   |-- Python 3.8.3    /home/$USER/LISR/conda-files/pytorch-gpu/cuda9.2-torch-gpu-py38.yaml
    |
    |-- Cuda 10.1
    |   |-- Python 3.5.5    /home/$USER/LISR/conda-files/pytorch-gpu/cuda10.1-torch-gpu-py35.yaml
    |   |-- Python 3.6.5    /home/$USER/LISR/conda-files/pytorch-gpu/cuda10.1-torch-gpu-py36.yaml
    |   |-- Python 3.7.5    /home/$USER/LISR/conda-files/pytorch-gpu/cuda10.1-torch-gpu-py37.yaml
    |   |-- Python 3.8.3    /home/$USER/LISR/conda-files/pytorch-gpu/cuda10.1-torch-gpu-py38.yaml
    |
    |-- Cuda 10.2
        |-- Python 3.5.5    /home/$USER/LISR/conda-files/pytorch-gpu/cuda10.2-torch-gpu-py35.yaml
        |-- Python 3.6.5    /home/$USER/LISR/conda-files/pytorch-gpu/cuda10.2-torch-gpu-py36.yaml
        |-- Python 3.7.5    /home/$USER/LISR/conda-files/pytorch-gpu/cuda10.2-torch-gpu-py37.yaml
        |-- Python 3.8.3    /home/$USER/LISR/conda-files/pytorch-gpu/cuda10.2-torch-gpu-py38.yaml
```
