#!/bin/bash
# disable Daemon list
systemctl disable bluetooth.service
systemctl disable NetworkManager.service
systemctl stop      NetworkManager.service
systemctl disable NetworkManager-dispatcher.service
systemctl disable NetworkManager-wait-online.service
systemctl disable whoopsie.service
systemctl disable cups-browsed.service
systemctl disable cups.service 

# End of file.
