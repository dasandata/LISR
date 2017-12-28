#!/bin/bash
# Copyright (c) 2017 by Dasandata Corp.
# http://www.dasandata.co.kr
# mailto://mail@dasandata.co.kr
# run as a root
# Dasandata_Linux_Install.sh


source 01_Define_common_variable.sh
source 02_Install_to_Default_Utils.sh
source 03_Modify_etc-profile_bashrc.sh
#source 04_Check_to_Hardware_Spec.sh
source 05_Check_to_IP_and_Hostname.sh
source 10_Modify_grub-ipv6-selinux.sh
source 11_Modify_grub_For_GPU-nouveau.sh
#source 12_Desktop-Xwindow_Install_Not-Default.sh
source 13_Disable_of_Unnecessary_Daemon.sh
source 15_Add_epel_repo_for_CentOS7.sh
source 16_For_security_enhance_Setting_to_Firewall_sshdconfig.sh
source 17_Add_user_with_sudo-administrator-privileges.sh



echo " "
CMT="##### End ##### "
${CMT_ECHO_F}${CMT}${CMT_ECHO_B}
# End of File.
