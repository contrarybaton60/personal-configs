#!/bin/bash

# redirect APT to Nala through bash aliasing

sudo apt install nala -y
echo 'apt() { 
  command nala "$@"
}
sudo() {
  if [ "$1" = "apt" ]; then
    shift
    command sudo nala "$@"
  else
    command sudo "$@"
  fi
}' >> .bashrc
source .bashrc