#!/bin/bash

# Ubuntu 22.04 is required to run the script
# GPU availability is required to run the script

cd $HOME

# establish Desktop directory 
DESKTOP_PATH="$HOME/Desktop"
if [ ! -d "$DESKTOP_PATH" ]; then
    mkdir -p "$DESKTOP_PATH"
    echo "Desktop directory created."
else
    echo "Desktop directory already exists."
fi

# allow current user to make shutdown without prompting a password
sudo bash $HOME/sd-training-base-scripts/src/allow_shutdown.sh

sudo apt update && sudo apt upgrade -y

# install Google Chrome
bash $HOME/sd-training-base-scripts/src/install_chrome.sh
# install Python
bash $HOME/sd-training-base-scripts/src/install_python.sh
# install CUDA
bash $HOME/sd-training-base-scripts/src/install_cuda.sh
# setup Automatic1111
bash $HOME/sd-training-base-scripts/src/install_automatic1111.sh

# setup auto shutdown
sudo apt-get install -y xprintidle
bash $HOME/sd-training-base-scripts/src/add_auto_shutdown_to_autostart.sh

# setup Xfce desktop environment and Xrdp
# bash $HOME/sd-training-base-scripts/src/install_xfce.sh

cd $HOME/stable-diffusion-webui

python ./launch.py

# open browser and go to http://127.0.0.1:7860