#!/bin/bash

# configs
sudo cp dnf.conf /etc/dnf/
cp -r .config ~/

# remove firefox
sudo dnf remove firefox -y

# enable rpm
sudo dnf install -y "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf install -y "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# media codecs
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

# configure nvidia
sudo dnf install -y \
akmod-nvidia \
xorg-x11-drv-nvidia-cuda

# enable flatpak
sudo dnf install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# apps
sudo dnf install -y \
persepolis \
qbittorrent \
fish

flatpak install -y \
com.brave.Browser \
com.rtosta.zapzap \
com.stremio.Stremio \
com.usebottles.bottles \
it.mijorus.gearlever \
micro \
wl-clipboard

# configure fish
chsh -s /usr/bin/fish
