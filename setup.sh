#!/bin/bash

#set dnf configuration

echo "Setting up dnf"
sudo mv /etc/dnf/dnf.conf /etc/dnf/dnf.conf.back
sudo cp dnf.conf /etc/dnf/

#change default shell
sudo chsh -s $(which zsh)


#Install RPM fusion
echo "Installing RPM fusion repos" 

sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#Install media plugins
echo "Installing Media Plugins"

sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin --allowerasing --skip-broken
sudo dnf groupupdate -y sound-and-video


#remove pre-installed apps
echo "Remove pre-installed programs"

sudo dnf remove -y gnome-calendar cheese gnome-clocks gnome-contacts simple-scan evince mediawriter eog libreoffice* gnome-maps rhythmbox gnome-text-editor gnome-tour gnome-weather gnome-photos totem
sudo dnf remove -y gnome-boxes --noautoremove

#Install additional packages ackages
sudo dnf install -y git pip glib2-devel gnome-tweak-tool zsh gnome-shell-extension-pop-shell xprop autojump-zsh

#update system

sudo dnf update

sudo dnf autoremove

#reboot

sudo reboot

