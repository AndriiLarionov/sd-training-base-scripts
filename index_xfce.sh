#!/bin/bash

cd $HOME

sudo apt update && sudo apt upgrade -y
# install desktop environment Xfce
sudo apt-get install -y xfce4-session xfce4-goodies
sudo apt install -y xinit
# install Google Remote Desktop
sudo wget dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt install ./chrome-remote-desktop_current_amd64.deb -y
sudo rm ./chrome-remote-desktop_current_amd64.deb