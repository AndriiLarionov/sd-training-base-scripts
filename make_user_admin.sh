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
  # Use visudo to safely edit the sudoers file
  sudo visudo -f /etc/sudoers.tmp
  # Check for any syntax errors in the temporary file
  if [ $? -eq 0 ]; then
    # If no syntax errors, replace the sudoers file with the temporary file
    sudo chown root:root /etc/sudoers.tmp
    sudo chmod 440 /etc/sudoers.tmp
    sudo mv /etc/sudoers.tmp /etc/sudoers
  else
    # If there are syntax errors, exit with an error message
    echo "Error: There were syntax errors in the sudoers file. No changes made."
    exit 1
  fi
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
