#!/bin/bash

# Define the shortcut function
echo "function run_auto1111() {
    cd \$HOME/stable-diffusion-webui \$@
    sudo python ./launch.py \$@
}" >> ~/.bashrc

# Make the changes take effect immediately in the current shell
source ~/.bashrc
