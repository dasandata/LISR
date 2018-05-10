# Install Module System (Standalone) and Make Python3 Module

## ======================

```bash
echo ""  >> /etc/profile
echo "# For Module Command."  >> /etc/profile
echo "alias ml='module'"  >> /etc/profile
echo ""  >> /etc/profile

source /etc/profile
source ~/.bashrc
```

## ======================

```bash
PYTHON_VERSION=3.6.5 #  3.5.5 or 3.6.5
TF=tf1.4
```

```bash

wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
tar  xvzf  Python-${PYTHON_VERSION}.tgz
cd ~/Python-${PYTHON_VERSION}

./configure --enable-optimizations \
--with-ensurepip=install --enable-shared \
--prefix=/opt/packages/python3/${PYTHON_VERSION}

make -j$(nproc)
make install
```

## ======================

```bash
PYTHON_VERSION=3.6.5 #  3.5.5 or 3.6.5
TF=tf1.4
```

```bash
cp -r $PYTHON_VERSION  $PYTHON_VERSION-$TF

cd /opt/packages/python3/
cp -r $PYTHON_VERSION  $PYTHON_VERSION-$TF
ll

sed -i "s#/opt/packages/python3/$PYTHON_VERSION#/opt/packages/python3/$PYTHON_VERSION-$TF#g" \
`grep -r "/opt/packages/python3/$PYTHON_VERSION" /opt/packages/python3/$PYTHON_VERSION-$TF -l | grep -v lib`

cat /opt/packages/python3/$PYTHON_VERSION-$TF/bin/pip3

```

```bash
mkdir /etc/modulefiles/python3/

echo "#%Module1.0

module-whatis "python"
module-whatis "Version: {VERSION}"

setenv PYTHONROOT             /opt/packages/python3/{VERSION}/

prepend-path PATH             /opt/packages/python3/{VERSION}/bin
prepend-path LD_LIBRARY_PATH  /opt/packages/python3/{VERSION}/lib
prepend-path LIBPATH          /opt/packages/python3/{VERSION}/lib
" >> /etc/modulefiles/python3/$PYTHON_VERSION-$TF

cat /etc/modulefiles/python3/$PYTHON_VERSION-$TF

sed -i "s/{VERSION}/$PYTHON_VERSION-$TF/g"  /etc/modulefiles/python3/$PYTHON_VERSION-$TF

cat /etc/modulefiles/python3/$PYTHON_VERSION-$TF

module av
module load python3/$PYTHON_VERSION-$TF
module list

which  python3
python3 -V

which pip3
pip3 -V

```
