#!/bin/bash

# Generic bash file for AM/AppMan
wget -q https://raw.githubusercontent.com/ivan-hc/AM/main/AM-INSTALLER
chmod a+x ./AM-INSTALLER
./AM-INSTALLER

# other commands I use for personal stuff
## am extra zyachel/luanti-appimage luanti
## am install vscodium lutris librewolf steam obsidian prismlauncher audacity gimp stellarium simplescreenrecorder wine
## am download supertux supertuxkart 
## am icons --all

# extend functionality with Junest, but why not just use distrobox?
## am install junest

##echo 'alias am="appman $@"' >> .bashrc
