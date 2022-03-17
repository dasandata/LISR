#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"


echo " sharing command option "

echo ""
echo ""
echo -e  "${PROMPT} nmcli connection show " >> /root/dasan_install_log.txt
nmcli connection show

UUID=$(nmcli connection show | awk '{print $2}' | sed -n 2p)

echo ""
echo ""
echo -e  "${PROMPT} dconf write /org/gnome/settings-daemon/plugins/sharing/vino-server/enabled-connections "['${UUID}']" " >> /root/dasan_install_log.txt
dconf write /org/gnome/settings-daemon/plugins/sharing/vino-server/enabled-connections "['${UUID}']"

echo ""
echo ""
echo -e  "${PROMPT} gsettings set org.gnome.Vino prompt-enabled false " >> /root/dasan_install_log.txt
gsettings set org.gnome.Vino prompt-enabled false

echo ""
echo ""
echo -e  "${PROMPT} gsettings set org.gnome.Vino require-encryption false " >> /root/dasan_install_log.txt
gsettings set org.gnome.Vino require-encryption false
