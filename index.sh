#!/bin/bash

# Ubuntu 22.04 is required to run the script

sudo apt update && sudo apt upgrade -y
# install desktop environment Xfce
sudo apt-get install xfce4-session xfce4-goodies
sudo apt install xinit
# install Chromium
sudo apt-get install chromium-browser
which chromium-browser
bash create_chromium_shortcut.sh

# install Google Remote Desktop
sudo wget dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt install ./chrome-remote-desktop_current_amd64.deb -y
# ...requires user interaction at "https://remotedesktop.google.com/headless" 
# make connection from user device to VM (next command will contain different arguments specifically to user google account!):
DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AZEOvhWg9FM99f-yX7OkXnMXQ4FZK2n6lsi3NecP4Vfm28CC8PKljYBDiSeXtbOa2cNfjQ" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname)
# write connection pincode and repeat it
545467
545467

# install Miniconda3
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh

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
cp ./run_automatic1111.sh $HOME/Desktop/

cd ./stable-diffusion-webui/models/Stable-diffusion

# download Stable Diffusion model
sudo wget https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt
# download Stable Diffusion ema model. Ema is required if you are going to continue training SD:
sudo wget https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4-full-ema.ckpt
# install Reliberate model
sudo wget 'https://civitai.com/api/download/models/84576?type=Model&format=SafeTensor&size=full&fp=fp16'

cd ../../

python ./launch.py

# open browser and go to http://127.0.0.1:7860