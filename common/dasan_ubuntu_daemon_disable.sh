#!/bin/bash
# disable Daemon list
systemctl disable bluetooth.service
systemctl disable whoopsie.service
systemctl disable cups-browsed.service
systemctl disable cups.service

# End of file.
