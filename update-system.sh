#!/bin/bash

echo ' '
echo '#############################'
echo '### Updating DNF packages ###'
echo '#############################'
echo ' '
sudo dnf upgrade --refresh -y

echo ' '
echo '#########################'
echo '### Updating Flatpaks ###'
echo '#########################'
echo ' '
flatpak update -y

echo ' '
echo '################'
echo '### Cleaning ###'
echo '################'
echo ' '
sudo dnf autoremove -y
sudo dnf clean all
