#!/bin/bash

# Download "mint-themes-vanessa" (https://codeberg.org/PeacefulWilliam/mint-themes-vanessa)
wget https://codeberg.org/PeacefulWilliam/mint-themes-vanessa/archive/main.zip
unzip main.zip
rm main.zip
cd mint-themes-vanessa
mv Mint-Y-Purple/ ~/.themes/Mint-L-P-Vanessa
mv Mint-Y-Dark-Purple ~/.themes/Mint-L-DP-Vanessa
cd ~/.themes
cd Mint-L-P-Vanessa/
rm -r -f cinnamon/
cd ..
cd Mint-L-DP-Vanessa/
rm -r -f cinnamon/
cd
