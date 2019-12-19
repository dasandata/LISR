#!/bin/bash


cp /root/LISR/2_Workstation_Desktop/2-2_Ubuntu16/2-2-2_GPU/copy_launcher.py /tmp/

cp /root/LISR/2_Workstation_Desktop/2-2_Ubuntu16/2-2-2_GPU/saved_launcher.txt /tmp/


gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino require-encryption false

gsettings set org.gnome.Vino enabled true




cd /tmp

python3 copy_launcher.py  set

cd
