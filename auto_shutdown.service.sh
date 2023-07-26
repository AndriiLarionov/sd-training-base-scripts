#!/bin/bash

# Replace these values with your actual username and the path to the Python script
USERNAME=$(whoami)
SCRIPT_PATH="./auto_shutdown.py"

# create the systemd service unit file
SERVICE_PATH="/etc/systemd/system/auto_shutdown.service"
echo "Creating the systemd service unit file..."
cat <<EOT > "$SERVICE_PATH"
[Unit]
Description=Auto Shutdown Service
After=network.target

[Service]
User=$USERNAME
ExecStart=/usr/bin/python3 $SCRIPT_PATH
Restart=always

[Install]
WantedBy=multi-user.target
EOT
echo "Systemd service unit file created: $SERVICE_PATH"

# enable and start the service
echo "Enabling and starting the service..."
sudo systemctl daemon-reload
sudo systemctl enable auto_shutdown.service
sudo systemctl start auto_shutdown.service
echo "Service enabled and started."

echo "Setup completed successfully!"
