Instruction

# Ubuntu 22.04 is required to run the script
# GPU availability is required to run the script

1. Connect via SSH.
2. Update password of your user:
"sudo passwd $USER", press enter and then type twicely new password.
3. git clone https://github.com/AndriiLarionov/sd-training-base-scripts.git
4. bash ./sd-training-base-scripts/index.sh (it requires user interaction to apply some actions).
5. After installation finished, press Ctrl+C to stop Automatic1111 (in the end of the script we launched it to perform required packages installation)
and run another script:
bash ./sd-training-base-scripts/src/install_xfce.sh

6. Now go the remote desktop, double click Automatic1111.sh, wait until it shows http://127.0.0.1:7860 url is ready, then open browser and go to http://127.0.0.1:7860 to reach the Automatic1111.
7. Reboot the machine to make auto shutdown work.