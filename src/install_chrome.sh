# install Google Chrome
cd $HOME
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install -y
rm google-chrome-stable_current_amd64.deb
bash $HOME/sd-training-base-scripts/src/create_chrome_shortcut.sh
# set Google Chrome as default browser
sudo apt-get install -y xdg-utils
sudo xdg-settings set default-web-browser google-chrome.desktop
