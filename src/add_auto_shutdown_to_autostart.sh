#!/bin/bash

SCRIPT_PATH=$HOME/sd-training-base-scripts/src/auto_shutdown.py

chmod +x $SCRIPT_PATH

cd $HOME

# establish .config/autostart directory 
CONFIG_PATH=".config/autostart"
if [ ! -d "$CONFIG_PATH" ]; then
    mkdir -p "$CONFIG_PATH"
    echo "$CONFIG_PATH directory created."
else
    echo "$CONFIG_PATH directory already exists."
fi

cat > $CONFIG_PATH/auto_shutdown.desktop << EOF
[Desktop Entry]
Type=Application
Exec=python3 $SCRIPT_PATH
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Auto Shutdown
Name=Auto Shutdown
Comment[en_US]=
Comment=
EOF