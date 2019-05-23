#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo ""
echo ""

echo -e  "\033[1;32m"==================== Install Module. ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} pwd \033[0m"
pwd

echo ""
echo -e  "\033[1;34m${PROMPT} apt-get -y install tcl-dev \033[0m"
apt-get -y install tcl-dev

echo ""
echo -e  "\033[1;34m${PROMPT} mkdir /opt/modules \033[0m"
mkdir /opt/modules

echo ""
echo -e  "\033[1;34m${PROMPT} mkdir /opt/packages \033[0m"
mkdir /opt/packages

echo ""
echo -e  "\033[1;34m${PROMPT} wget https://sourceforge.net/projects/modules/files/Modules/modules-4.1.2/modules-4.1.2.tar.gz \033[0m"
wget https://sourceforge.net/projects/modules/files/Modules/modules-4.1.2/modules-4.1.2.tar.gz

echo ""
echo -e  "\033[1;34m${PROMPT} tar xvzf modules-4.1.2.tar.gz \033[0m"
tar xvzf modules-4.1.2.tar.gz

echo ""
echo -e  "\033[1;34m${PROMPT} cd modules-4.1.2/ \033[0m"
cd modules-4.1.2/

echo ""
echo -e  "\033[1;34m${PROMPT} ./configure --with-module-path=/opt/modules/ --modulefilesdir=/etc/modulefiles \033[0m"
./configure --with-module-path=/opt/modules/ --modulefilesdir=/etc/modulefiles

echo ""
echo -e  "\033[1;34m${PROMPT} make ; make install \033[0m"
make ; make install

echo ""
echo -e  "\033[1;34m${PROMPT} cp ./init/profile.sh  /opt/modules/ \033[0m"
cp ./init/profile.sh  /opt/modules/

echo ""
echo -e  "\033[1;34m${PROMPT} cp ./init/profile.csh  /opt/modules/ \033[0m"
cp ./init/profile.csh  /opt/modules/

echo ""
echo -e  "\033[1;34m${PROMPT} ln -s /opt/modules/profile.sh /etc/profile.d/modules.sh \033[0m"
ln -s /opt/modules/profile.sh /etc/profile.d/modules.sh

echo ""
echo -e  "\033[1;34m${PROMPT} ln -s /opt/modules/profile.csh /etc/profile.d/modules.csh \033[0m"
ln -s /opt/modules/profile.csh /etc/profile.d/modules.csh

echo ""
echo -e  "\033[1;34m${PROMPT} cd \033[0m"
cd

echo ""
echo ""

sleep 3

echo -e  "\033[1;32m"==================== Module alias. ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} echo ""  >> /etc/profile \033[0m"
echo ""  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo # For Module Command.  >> /etc/profile \033[0m"
echo "# For Module Command."  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo "alias ml='module'"  >> /etc/profile \033[0m"
echo "alias ml='module'"  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo ""  >> /etc/profile \033[0m"
echo ""  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} source /etc/profile \033[0m"
source /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} source ~/.bashrc \033[0m"
source ~/.bashrc

echo ""
echo ""

sleep 3

echo -e  "\033[1;32m"==================== Make Modulefile for CUDA 9.0 , 10.0 ===================="\033[0m"

echo ""
echo -e  "\033[1;34m${PROMPT} mkdir /etc/modulefiles/cuda/ \033[0m"
mkdir /etc/modulefiles/cuda/

echo ""
echo -e  "\033[1;34m${PROMPT} for VERSION in 9.0 10.0  ; \033[0m"
for VERSION in 9.0 10.0  ;

echo ""
echo -e  "\033[1;34m${PROMPT} do echo #%Module1.0 \033[0m"
do echo "#%Module1.0

echo ""
echo -e  "\033[1;34m${PROMPT} module-whatis "cuda" \033[0m"
module-whatis "cuda"

echo ""
echo -e  "\033[1;34m${PROMPT} module-whatis "Version: ${VERSION}" \033[0m"
module-whatis "Version: ${VERSION}"

echo ""
echo ""

echo ""
echo -e  "\033[1;34m${PROMPT} prepend-path PATH             /usr/local/cuda-${VERSION}/bin \033[0m"
prepend-path PATH             /usr/local/cuda-${VERSION}/bin

echo ""
echo -e  "\033[1;34m${PROMPT} prepend-path LD_LIBRARY_PATH  /usr/local/cuda-${VERSION}/lib64 \033[0m"
prepend-path LD_LIBRARY_PATH  /usr/local/cuda-${VERSION}/lib64

echo ""
echo -e  "\033[1;34m${PROMPT} prepend-path INCLUED          /usr/local/cuda-${VERSION}/inclued \033[0m"
prepend-path INCLUED          /usr/local/cuda-${VERSION}/inclued

echo ""
echo -e  "\033[1;34m${PROMPT} " >> /etc/modulefiles/cuda/${VERSION} \033[0m"
" >> /etc/modulefiles/cuda/${VERSION}

echo ""
echo -e  "\033[1;34m${PROMPT} done \033[0m"
done

echo ""
echo -e  "\033[1;34m${PROMPT} module list \033[0m"
module list

echo ""
echo -e  "\033[1;34m${PROMPT} module load cuda/9.0 \033[0m"
module load cuda/9.0

echo ""
echo -e  "\033[1;34m${PROMPT} nvcc -V \033[0m"
nvcc -V

echo ""
echo -e  "\033[1;34m${PROMPT} module purge \033[0m"
module purge
