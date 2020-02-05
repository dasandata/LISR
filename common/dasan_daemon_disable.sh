#!/bin/bash
# disable Daemon list
systemctl disable bluetooth.service
systemctl disable iscsi.service
systemctl disable ksm.service
systemctl disable ksmtuned.service
systemctl disable libstoragemgmt.service
systemctl disable libvirtd.service
systemctl disable NetworkManager.service
systemctl stop      NetworkManager.service
systemctl disable NetworkManager-dispatcher.service
systemctl disable NetworkManager-wait-online.service
systemctl disable spice-vdagentd.service
systemctl disable vmtoolsd.service
systemctl disable ModemManager.service
systemctl disable cups.service
systemctl disable cups-browsed.service

# End of file.
