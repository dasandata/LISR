#Ubuntu16
echo "##### apt update"
apt update
echo " "
echo "##### apt install to default utils"
echo " "
apt install -y \
vim nfs-common mailutils rdate xauth firefox gcc make locate htop tmux git wget
echo " "
echo "##### time sync"
echo " "
rdate  -s  time.bora.net 
hwclock --systohc  
date
hwclock
echo " "
echo "##### end" 
