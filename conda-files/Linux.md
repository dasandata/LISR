# 0. Linux OS 환경 ( Redhat 계열 )

[root@test3:~]#

[root@test3:~]# cat /etc/redhat-release

CentOS Linux release 8.2.2004 (Core)

[root@test3:~]#

[root@test3:~]# dnf install -y git

[root@test3:~]#

[sonic@test3:~]$ lspci | grep -i vga

d9:00.0 VGA compatible controller: NVIDIA Corporation GP107GL [Quadro P400] (rev a1)

[sonic@test3:~]$


# 1. Linux OS 환경 ( Debian 계열 )

[root@ubuntu:~]#

[root@ubuntu:~]# cat /etc/issue

Ubuntu 16.04.6 LTS \n \l

[root@ubuntu:~]#

[root@ubuntu:~]# apt-get install -y git

[root@ubuntu:~]#

[root@ubuntu:~]# lspci  | grep -i vga

01:00.0 VGA compatible controller: NVIDIA Corporation Device 21c4 (rev a1)

[root@ubuntu:~]#
