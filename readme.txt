Instruction

# Ubuntu 22.04 is required to run the script
# GPU availability is required to run the script

1. Connect via SSH.
2. git clone https://github.com/AndriiLarionov/sd-training-base-scripts.git
3. cd sd-training-base-scripts
4. bash index.sh (it requires user interaction to apply some actions).
5. Update password of your user:
"sudo passwd USERNAME" and then type twicely new password.
6. After installations finished we need to establish Google Remote Desktop connection. Go to https://remotedesktop.google.com/headless.
7. After you connected to the remote desktop, open browser and go to http://127.0.0.1:7860 to reach the Automatic1111.
8. Manually install ControlNet and Canvas Zoom.