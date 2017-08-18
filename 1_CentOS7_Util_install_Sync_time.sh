#CentOS7 
echo "##### yum update"
echo " " 
echo "##### yum install to default utils" 
yum install -y \
vim pciutils perl openssh mlocate nfs-utils rdate xauth firefox nautilus wget htop tcsh tree lshw mailx tmux \
git
echo " " 
echo "##### time sync" 
rdate  -s  time.bora.net 
clock --systohc  
date
hwclock
echo "end" 
