#!/bin/bash

echo "[Unit]
Description=Shutdown service when no user action

[Service]
ExecStart=/usr/bin/python3 ~/sd-training-base-scripts/auto_shutdown.py
Restart=on-failure

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/auto_shutdown.service

systemctl enable auto_shutdown.service
systemctl start auto_shutdown.service
