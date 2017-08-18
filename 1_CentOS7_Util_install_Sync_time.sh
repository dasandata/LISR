#CentOS7 
yum update
yum install -y \
vim pciutils perl openssh mlocate nfs-utils rdate xauth firefox nautilus wget htop tcsh tree lshw mailx tmux \
git


rdate  -s  time.bora.net 
clock --systohc  
date
hwclock
