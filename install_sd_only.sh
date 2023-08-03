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