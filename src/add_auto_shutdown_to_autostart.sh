#!/bin/bash

SCRIPT_PATH=$HOME/sd-training-base-scripts/src/auto_shutdown.py

chmod +x $SCRIPT_PATH

cat > ~/.config/autostart/auto_shutdown.desktop << EOF
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