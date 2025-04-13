#!/bin/bash
# This is a generic post-installation script for Linux Mint 22.1 "Xia"

# IMPORTANT stuff
sudo timeshift-gtk
gufw

# Remove installed Programs
sudo apt remove hypnotix yaru-theme-icon papirus-icon-theme thunderbird mintchat

# Update System
sudo apt update && sudo apt upgrade

# Install Programs from apt
sudo apt install bibletime qt5ct steam-installer stellarium virtualbox git simplescreenrecorder fonts-ubuntu-classic easytag audacity

# Install Programs from flatpak
flatpak install com.vscodium.codium org.prismlauncher.PrismLauncher md.obsidian.Obsidian net.lutris.Lutris io.github.unknownskl.greenlight

# flatpak permissions
sudo flatpak override --filesystem=xdg-data/themes
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons

# Mint/Cinnamon stuff because idk how to use gsettings or dconf
cinnamon-settings themes
cinnamon-settings fonts
cinnamon-settings screensaver
cinnamon-settings calendar
cinnamon-settings nightlight
cinnamon-settings user
cinnamon-settings gestures
cinnamon-settings applets
cinnamon-settings panels
cinnamon-settings desktop
cinnamon-menu-editor