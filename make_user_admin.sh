#!/bin/bash

# Make sure the script is being run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# The line to be added to sudoers file
new_line="$(logname) ALL = NOPASSWD: /sbin/shutdown"

# Add the line to sudoers using visudo
echo "$new_line" >> /tmp/sudoers_tmp
visudo -c -f /tmp/sudoers_tmp

# Check if the syntax is valid
if [ $? -eq 0 ]; then
  # Install the new sudoers file
  cat /tmp/sudoers_tmp > /etc/sudoers
  rm /tmp/sudoers_tmp
  echo "Line added to /etc/sudoers successfully."
else
  echo "Error: Invalid syntax. Line not added to /etc/sudoers."
fi
