#!/bin/sh

# define the path for the shortcut
SHORTCUT_PATH="$HOME/Desktop/idle_time.desktop"

# create the shortcut with the required details
echo "[Desktop Entry]
Type=Application
Terminal=false
Name=IdleTime
Exec=mousepad $HOME/idle_time.txt
Icon=text-editor" > $SHORTCUT_PATH

# make the shortcut executable
chmod +x $SHORTCUT_PATH
