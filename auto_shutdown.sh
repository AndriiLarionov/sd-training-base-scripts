#!/bin/bash

# Backup original file
sudo cp /etc/systemd/logind.conf /etc/systemd/logind.conf.bak

# Replace lines in file
sudo sed -i 's/^#IdleAction=/IdleAction=poweroff/' /etc/systemd/logind.conf
sudo sed -i 's/^#IdleActionSec=/IdleActionSec=15min/' /etc/systemd/logind.conf