#CentOS7 
echo " " 
echo "##### yum install to default utils" 
echo " " 
yum install -y \
vim pciutils perl openssh mlocate nfs-utils rdate xauth firefox nautilus wget htop tcsh tree lshw mailx tmux \
git
echo " " 
echo "##### time sync" 
echo " " 
rdate  -s  time.bora.net 
clock --systohc  
date
hwclock
echo "end" 
