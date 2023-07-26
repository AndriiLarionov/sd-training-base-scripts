#!/bin/bash

# Make sure the script is being run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# The line to be added to sudoers file
new_line="$(logname) ALL = NOPASSWD: /sbin/shutdown"

# Create a temporary sudoers file with all the current entries
cp /etc/sudoers /tmp/sudoers_tmp

# Check if the line already exists in the file
if ! grep -Fxq "$new_line" /tmp/sudoers_tmp
then
  # If the line doesn't exist in the file, add it
  echo "$new_line" >> /tmp/sudoers_tmp

  # Check if the syntax of the temporary sudoers file is valid
  visudo -c -f /tmp/sudoers_tmp
  if [ $? -eq 0 ]; then
    # If the syntax is valid, replace the current sudoers file with the temporary one
    cp /tmp/sudoers_tmp /etc/sudoers
    echo "Line added to /etc/sudoers successfully."
  else
    echo "Error: Invalid syntax. Line not added to /etc/sudoers."
  fi
else
  echo "The sudoers file already contains the line."
fi

# Clean up
rm /tmp/sudoers_tmp
