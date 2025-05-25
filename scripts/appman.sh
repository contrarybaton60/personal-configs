#!/bin/bash

echo 'alias am="appman $@"' >> .bashrc
# Generic bash file for AM/AppMan
wget -q https://raw.githubusercontent.com/ivan-hc/AM/main/AM-INSTALLER
chmod a+x ./AM-INSTALLER
./AM-INSTALLER


am install retroarch lutris stellarium libreoffice steam wine kdenlive gimp vscodium vlc audacity obsidian vesktop librewolf firefox prismlauncher yt-dlp ventoy easytag ntsc-rs appimageupdatetoll archimage-cli
am download supertux supertuxkart woof-doom
am icons --all

# extend functionality with Junest, but why not just use distrobox?
## am install junest
