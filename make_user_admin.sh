#!/bin/bash

# Function to check if the script is executed with root privileges
check_root() {
  if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or with sudo."
    exit 1
  fi
}

# Function to add the current user to the 'admin' group
add_current_user_to_admin_group() {
  local username="$1"
  echo "Adding user $username to 'admin' group..."
  sudo usermod -aG admin "$username"
}

# Function to configure sudo access for the 'admin' group in sudoers
configure_sudo_access() {
  echo "Configuring sudo access for 'admin' group..."
  echo "%admin ALL=(ALL) ALL" | sudo tee -a /etc/sudoers
}

# Main script starts here

# Check if the script is executed with root privileges
check_root

# Get the current username
current_user=$(logname)

# Add the current user to the 'admin' group
add_current_user_to_admin_group "$current_user"

# Configure sudo access for the 'admin' group
configure_sudo_access

echo "User $current_user has been added to the 'admin' group with sudo access."
