# Note that this script only works for Debian-based systems.

# Download Dependencies.
sudo apt install btrfs-progs gawk git

# clone it through git
git clone --branch 4.13 --single-branch https://github.com/Antynea/grub-btrfs.git

# the rest
cd grub-btrfs/
sudo make install
sudo grub-mkconfig


echo 'Script Done, read the README!!'
