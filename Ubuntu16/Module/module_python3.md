# Install Module System (Standalone) and Make Python3 Module

## Install Module.
```bash
cd

apt-get -y install tcl-dev

mkdir /opt/modules
mkdir /opt/packages

wget https://sourceforge.net/projects/modules/files/Modules/modules-4.1.2/modules-4.1.2.tar.gz

tar xvzf modules-4.1.2.tar.gz
cd modules-4.1.2/
./configure --modulepath=/opt/modules/ --modulefilesdir=/etc/modulefiles
make ; make install

cp ./init/profile.sh  /opt/modules/
cp ./init/profile.csh  /opt/modules/
ln -s /opt/modules/profile.sh /etc/profile.d/modules.sh
ln -s /opt/modules/profile.csh /etc/profile.d/modules.csh

cd
```

## Module alias.

```bash
echo ""  >> /etc/profile
echo "# For Module Command."  >> /etc/profile
echo "alias ml='module'"  >> /etc/profile
echo ""  >> /etc/profile

source /etc/profile
source ~/.bashrc
```

## Install Python3

```bash
apt-get -y install libssl-dev
apt-get -y install make build-essential libssl-dev zlib1g-dev libbz2-dev libsqlite3-dev
```

```bash
PYTHON_VERSION=3.5.5 #  3.5.5 or 3.6.5

wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
tar  xvzf  Python-${PYTHON_VERSION}.tgz
cd ~/Python-${PYTHON_VERSION}

./configure --enable-optimizations \
--with-ensurepip=install --enable-shared \
--prefix=/opt/packages/python3/${PYTHON_VERSION}

make -j$(nproc)
make install
```

## Make Modulefile fot Python3

```bash
mkdir /etc/modulefiles/python3/

echo "#%Module1.0

module-whatis "python"
module-whatis "Version: {VERSION}"

setenv PYTHONROOT             /opt/packages/python3/{VERSION}/

prepend-path PATH             /opt/packages/python3/{VERSION}/bin
prepend-path LD_LIBRARY_PATH  /opt/packages/python3/{VERSION}/lib
prepend-path LIBPATH          /opt/packages/python3/{VERSION}/lib
" >> /etc/modulefiles/python3/${PYTHON_VERSION}
```

```bash
sed -i "s/{VERSION}/${PYTHON_VERSION}/g"  /etc/modulefiles/python3/${PYTHON_VERSION}

module purge
module list
module load python3/${PYTHON_VERSION}

which python3
which pip3

python3 -V
pip3 -V
```
***


## Copy Python3 Directory

```bash
OLD_PYTHON=3.5.5   #  3.5.5 or 3.6.5
NEW_PYTHON=3.5.5-tf-1.4
```

```bash
cp -r /opt/packages/python3/$OLD_PYTHON  /opt/packages/python3/$NEW_PYTHON
ll /opt/packages/python3/
```

```bash
sed -i "s#/opt/packages/python3/$OLD_PYTHON#/opt/packages/python3/$NEW_PYTHON#g" \
`grep -r "/opt/packages/python3/$OLD_PYTHON" /opt/packages/python3/$NEW_PYTHON -l | grep -v lib`

head -1  /opt/packages/python3/$NEW_PYTHON/bin/pip3
```


## Copy Python3 modulefiles
```bash
OLD_PYTHON=3.5.5   #  3.5.5 or 3.6.5
NEW_PYTHON=3.5.5-tf-1.4
```

```bash
cp /etc/modulefiles/python3/$OLD_PYTHON  /etc/modulefiles/python3/$NEW_PYTHON

sed -i "s/$OLD_PYTHON/$NEW_PYTHON/g" /etc/modulefiles/python3/$NEW_PYTHON

cat /etc/modulefiles/python3/$NEW_PYTHON
```

```bash
module purge

module av
module load python3/$NEW_PYTHON
module list

which  python3
which pip3

python3 -V
pip3 -V
```
