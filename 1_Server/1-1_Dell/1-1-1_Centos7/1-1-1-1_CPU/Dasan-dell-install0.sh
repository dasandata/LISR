#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"



echo ""
echo -e  "${PROMPT} racadm set iDRAC.Time.Timezone Asia/Seoul  " >> /root/dasan_install_log.txt
racadm set iDRAC.Time.Timezone Asia/Seoul

echo ""
echo -e  "${PROMPT} racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}') " >> /root/dasan_install_log.txt
racadm set iDRAC.NIC.DNSRacName ${HOSTNAME}-$(racadm getsysinfo | grep "Service Tag" | awk '{print $4}')

echo ""
echo ""
echo " ipmitool Fan speed Max "
echo ""
echo ""

echo ""
echo -e  "${PROMPT} Ipmitool sdr type fan  " >> /root/dasan_install_log.txt
ipmitool sdr type fan

echo ""
echo -e  "${PROMPT} racadm set system.PCIeSlotLFM.1.lfmmode 0  " >> /root/dasan_install_log.txt
racadm set system.PCIeSlotLFM.1.lfmmode 0

sleep 5

echo ""
echo -e  "${PROMPT} racadm set system.PCIeSlotLFM.3.lfmmode 0  " >> /root/dasan_install_log.txt
racadm set system.PCIeSlotLFM.3.lfmmode 0

 sleep 5 

echo ""
echo -e  "${PROMPT} racadm set system.PCIeSlotLFM.6.lfmmode 0  " >> /root/dasan_install_log.txt
racadm set system.PCIeSlotLFM.6.lfmmode 0

 sleep 5 

echo ""
echo -e  "${PROMPT} racadm set system.PCIeSlotLFM.8.lfmmode 0  " >> /root/dasan_install_log.txt
racadm set system.PCIeSlotLFM.8.lfmmode 0

 sleep 5 

echo ""
echo -e  "${PROMPT} racadm set system.ThermalSettings.FanSpeedOffset 3  " >> /root/dasan_install_log.txt
racadm set system.ThermalSettings.FanSpeedOffset 3

sleep 5

echo ""
echo -e  "${PROMPT} Ipmitool sdr type fan  " >> /root/dasan_install_log.txt
ipmitool sdr type fan

echo ""
echo ""

echo "  rc.local 등록 "

echo -e  "${PROMPT} sed -i '/root/d' /etc/rc.d/rc.local   " >> /root/dasan_install_log.txt
sed -i '/root/d' /etc/rc.d/rc.local

echo " 재 부팅 "
echo -e  "${PROMPT} reboot  재 부팅 " >> /root/dasan_install_log.txt
reboot
