Instruction

# Ubuntu 22.04 is required to run the script
# GPU availability is required to run the script

1. Connect via SSH.
2. Update password of your user:
"sudo passwd $USER", press enter and then type twicely new password.
3. git clone https://github.com/AndriiLarionov/sd-training-base-scripts.git
4. bash ./sd-training-base-scripts/index.sh (it requires user interaction to apply some actions).
5. Perform commands:
cd $HOME/stable-diffusion-webui
python ./launch.py
6. When Automatic1111 is launched, Ctrl+C to stop it. Then run:
bash $HOME/sd-training-base-scripts/src/install_xfce.sh
7. Now go the remote desktop, double click Automatic1111.sh, wait until it shows http://127.0.0.1:7860 url is ready, then open browser and go to http://127.0.0.1:7860 to reach the Automatic1111.
8. Reboot the machine to make auto shutdown work.