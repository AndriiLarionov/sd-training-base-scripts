# download Automatic1111 (Stable Diffusion Web UI)
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui

# install extensions
cd $HOME/stable-diffusion-webui/extensions

# install ControlNet
git clone https://github.com/Mikubill/sd-webui-controlnet
# install Posex
git clone https://github.com/hnmr293/posex
# install Depth
git clone https://github.com/jexom/sd-webui-depth-lib
# install Canvas Zoom
git clone https://github.com/richrobber2/canvas-zoom

# install models
cd $HOME/stable-diffusion-webui/models/Stable-diffusion

sleep 10
# download 1.5 models
# sudo wget -O reliberate.safetensors https://civitai.com/api/download/models/84576?type=Model&format=SafeTensor&size=full&fp=fp16
sudo wget -O Deliberate.safetensors https://civitai.com/api/download/models/15236?type=Model&format=SafeTensor&size=full&fp=fp16
sudo wget -O DreamShaper.safetensors https://civitai.com/api/download/models/128713?type=Model&format=SafeTensor&size=pruned&fp=fp16
sudo wget -O ReV_Animated.safetensors https://civitai.com/api/download/models/46846?type=Model&format=SafeTensor&size=full&fp=fp32

sleep 60
# download XL models
sudo wget -O SDXL.safetensors https://civitai.com/api/download/models/128078?type=Model&format=SafeTensor&size=full&fp=fp32
sudo wget -O SDVN7_NijiStyleXL.safetensors https://civitai.com/api/download/models/155870?type=Model&format=SafeTensor&size=full&fp=fp16
sudo wget -O DynaVision_XL.safetensors https://civitai.com/api/download/models/148259?type=Model&format=SafeTensor&size=pruned&fp=fp16
sudo wget -O Copax_TimeLessXL.safetensors https://civitai.com/api/download/models/150238?type=Model&format=SafeTensor&size=pruned&fp=fp16

sleep 60
# establish Lora directory
LORA_PATH="$HOME/stable-diffusion-webui/models/Lora"
if [ ! -d "$LORA_PATH" ]; then
    mkdir -p "$LORA_PATH"
    echo "Lora directory created."
else
    echo "Lora directory already exists."
fi
cd $LORA_PATH
# download Lora models
sudo wget -O PixelArtXL.safetensors https://civitai.com/api/download/models/135931?type=Model&format=SafeTensor
sudo wget -O xl_more_art_full.safetensors https://civitai.com/api/download/models/152309?type=Model&format=SafeTensor
sudo wget -O Isometric_Cutaway.safetensors https://civitai.com/api/download/models/153780?type=Model&format=SafeTensor
sudo wget -O LeLo_LEGO_XL.safetensors https://civitai.com/api/download/models/157536?type=Model&format=SafeTensor
sudo wget -O Schmanzy_SDXL.safetensors https://civitai.com/api/download/models/132359?type=Model&format=SafeTensor
sudo wget -O ContinousLineXL.safetensors https://civitai.com/api/download/models/139001?type=Model&format=SafeTensor
