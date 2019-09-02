#!/bin/bash
# Copyright (c) 2018 by Dasandata Corp.
# run as a root

ROOT_UID=0
if [ "$UID" != "$ROOT_UID" ]; then
  echo "Must be a root to run this script."
  exit 1
fi


echo "# Custom + Off"
racadm set system.PCIeSlotLFM.1.lfmmode 2  # custom
racadm set system.PCIeSlotLFM.3.lfmmode 2  # custom
racadm set system.PCIeSlotLFM.6.lfmmode 2  # custom
racadm set system.PCIeSlotLFM.8.lfmmode 2  # custom

racadm set system.ThermalSettings.FanSpeedOffset 255 # off


bash /root/LISR/common/Dell-Server-gpuburn-throttling-test.sh

echo "# Auto + Off"
racadm set system.PCIeSlotLFM.1.lfmmode 0  # auto
racadm set system.PCIeSlotLFM.3.lfmmode 0  # auto
racadm set system.PCIeSlotLFM.6.lfmmode 0  # auto
racadm set system.PCIeSlotLFM.8.lfmmode 0  # auto

racadm set system.ThermalSettings.FanSpeedOffset 255 # off

echo "##### sleep 10min"
sleep 1200

bash /root/LISR/common/Dell-Server-gpuburn-throttling-test.sh


echo "# Custom +  max"
racadm set system.PCIeSlotLFM.1.lfmmode 2  # custom
racadm set system.PCIeSlotLFM.3.lfmmode 2  # custom
racadm set system.PCIeSlotLFM.6.lfmmode 2  # custom
racadm set system.PCIeSlotLFM.8.lfmmode 2  # custom

racadm set system.ThermalSettings.FanSpeedOffset 3  # max

echo "##### sleep 10min"
sleep 1200

bash /root/LISR/common/Dell-Server-gpuburn-throttling-test.sh

echo "######### Test Done"
