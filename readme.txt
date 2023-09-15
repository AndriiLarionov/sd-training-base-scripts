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

6. We need to establish Google Remote Desktop connection. 
On your machine (not the remote) go to 
https://remotedesktop.google.com/headless 
-> Set up via SSH (on the left) 
-> Begin 
-> Next (skip installation as it was already installed by the script)
-> Authorize
-> Copy a piece of code under "Debian Linux", paste it to the terminal of remote machine and run. It will ask you to write PIN code and then confirm it.
-> Start over (in your browser)
-> "Remote Access" in left menu. Here you can see a new connection. When you click, it asks you to input the PIN code you provided in the terminal of the remote machine.

7. Now go the remote desktop, double click Automatic1111.sh, wait until it shows http://127.0.0.1:7860 url is ready, then open browser and go to http://127.0.0.1:7860 to reach the Automatic1111.
8. Reboot the machine to make auto shutdown work.