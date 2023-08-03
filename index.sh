#!/bin/bash

# Ubuntu 22.04 is required to run the script
# GPU availability is required to run the script

cd $HOME

# ensure Desktop folder in place
DESKTOP_PATH="$HOME/Desktop"
if [ ! -d "$DESKTOP_PATH" ]; then
    mkdir -p "$DESKTOP_PATH"
    echo "Desktop directory created."
else
    echo "Desktop directory already exists."
fi

# allow current user to make shutdown without prompting a password
sudo bash $HOME/sd-training-base-scripts/allow_shutdown.sh

sudo apt update && sudo apt upgrade -y

# install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
bash $HOME/sd-training-base-scripts/create_chrome_shortcut.sh
# set Google Chrome as default browser
sudo apt-get install -y xdg-utils
sudo xdg-settings set default-web-browser google-chrome.desktop
# install Miniconda3
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh

source ~/miniconda3/bin/activate

conda create -n sd python=3.10.6 -y
conda activate sd
pip install fastapi==0.90.1
python -m pip install --upgrade pip

# install CUDA. Do this if CUDA not installed (if you get "Torch is not able to use GPU" error):
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.2.0/local_installers/cuda-repo-ubuntu2204-12-2-local_12.2.0-535.54.03-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-12-2-local_12.2.0-535.54.03-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-12-2-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda
rm cuda-repo-ubuntu2204-12-2-local_12.2.0-535.54.03-1_amd64.deb

# download Automatic1111 (Stable Diffusion Web UI)
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui

cd $HOME/stable-diffusion-webui/models/Stable-diffusion
# download Stable Diffusion model
sudo wget https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt
# download Stable Diffusion ema model. Ema is required if you are going to continue training SD:
sudo wget https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4-full-ema.ckpt
# download Reliberate model
sudo wget -O reliberate.safetensors https://civitai.com/api/download/models/84576?type=Model&format=SafeTensor&size=full&fp=fp16
# download Deliberate model
sudo wget -O deliberate.safetensors https://civitai.com/api/download/models/15236?type=Model&format=SafeTensor&size=full&fp=fp16

cd $HOME/stable-diffusion-webui/models/Lora
# download sxzLuma Lora model
sudo wget -O sxzLuma_09XVAE.safetensors https://civitai.com/api/download/models/127416?type=Model&format=SafeTensor&size=pruned&fp=fp16

# setup auto shutdown
sudo apt-get install -y xprintidle
bash $HOME/sd-training-base-scripts/add_auto_shutdown_to_autostart.sh

cd $HOME/stable-diffusion-webui

python ./launch.py

# open browser and go to http://127.0.0.1:7860