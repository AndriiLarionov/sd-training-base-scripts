#!/bin/bash

cd $HOME

sudo apt update && sudo apt upgrade -y
sudo apt install -y xrdp
sudo apt-get install -y xfce4
sudo service xrdp restart
# type new root password