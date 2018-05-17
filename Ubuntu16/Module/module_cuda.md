# Install Module System (Standalone) and Make cuda Module

## Install Module.
```bash
cd

apt-get -y install tcl-dev

mkdir /opt/modules
mkdir /opt/packages

wget https://sourceforge.net/projects/modules/files/Modules/modules-4.1.2/modules-4.1.2.tar.gz

tar xvzf modules-4.1.2.tar.gz
cd modules-4.1.2/
./configure --with-module-path=/opt/modules/ --modulefilesdir=/etc/modulefiles
make ; make install

cp ./init/profile.sh  /opt/modules/
cp ./init/profile.csh  /opt/modules/
ln -s /opt/modules/profile.sh /etc/profile.d/modules.sh
ln -s /opt/modules/profile.csh /etc/profile.d/modules.csh

cd
```

***

## Module alias.

```bash
echo ""  >> /etc/profile
echo "# For Module Command."  >> /etc/profile
echo "alias ml='module'"  >> /etc/profile
echo ""  >> /etc/profile

source /etc/profile
source ~/.bashrc
```

***

## Make Modulefile for CUDA 8.0, 9.0, 9.1

```bash
mkdir /etc/modulefiles/cuda/
```

```bash
for VERSION in 8.0 9.0 9.1  ;
do echo "#%Module1.0

module-whatis "cuda"
module-whatis "Version: ${VERSION}"

prepend-path PATH             /usr/local/cuda-${VERSION}/bin
prepend-path LD_LIBRARY_PATH  /usr/local/cuda-${VERSION}/inclued
prepend-path INCLUED          /usr/local/cuda-${VERSION}/lib
" >> /etc/modulefiles/cuda/${VERSION}
done
```


```bash
module purge
module list
module load cuda/8.0

nvcc -V
```

```bash
module purge
module list
module load cuda/9.0
nvcc -V
```

```bash
module purge
module list
module load cuda/9.1

nvcc -V
```
***
