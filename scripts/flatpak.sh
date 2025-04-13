#!/bin/bash

# Install packages through flatpak
flatpak install com.vscodium.codium org.prismlauncher.PrismLauncher md.obsidian.Obsidian net.lutris.Lutris net.minetest.Minetest dev.vencord.Vesktop com.simutrans.Simutrans

# flatpak permissions
sudo flatpak override --filesystem=xdg-data/themes
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons
sudo flatpak override --filesystem=$HOME