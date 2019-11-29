#!/bin/bash

gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino require-encryption false

gsettings set org.gnome.Vino enabled true

cd /tmp

python3 copy_launcher.py  set

cd
