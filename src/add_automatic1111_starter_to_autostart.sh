#!/bin/bash

SCRIPT_PATH=$HOME/sd-training-base-scripts/src/run_automatic1111.sh

chmod +x $SCRIPT_PATH

cat > ~/.config/autostart/auto_shutdown.desktop << EOF
[Desktop Entry]
Type=Application
Exec=python3 $SCRIPT_PATH
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Automatic1111 Starter
Name=Automatic1111 Starter
Comment[en_US]=
Comment=
EOF