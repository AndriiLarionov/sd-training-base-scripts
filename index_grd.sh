#!/bin/bash

cd ~

# install Google Remote Desktop
sudo wget dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt install ~/chrome-remote-desktop_current_amd64.deb -y
sudo rm ~/chrome-remote-desktop_current_amd64.deb