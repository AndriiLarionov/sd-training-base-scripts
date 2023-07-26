#!/bin/bash

# Backup original file
sudo cp /etc/systemd/logind.conf /etc/systemd/logind.conf.bak

# Replace lines in file
sudo sed -i 's/^#IdleAction=ignore/IdleAction=poweroff/' /etc/systemd/logind.conf
sudo sed -i 's/^#IdleActionSec=30min/IdleActionSec=1min/' /etc/systemd/logind.conf