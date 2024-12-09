#!/bin/bash

# Ensure the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root!" 1>&2
  exit 1
fi

# Install OpenSSH server
echo "Installing OpenSSH server..."
pacman -S --noconfirm openssh

# Start and enable the SSH service
echo "Starting and enabling SSH service..."
systemctl enable sshd --now

# Configure SSH to use a non-standard port (e.g., 2323)
echo "Configuring SSH to use a non-standard port (2323)..."
sed -i 's/#Port 22/Port 2323/' /etc/ssh/sshd_config

# Allow SSH access through the firewall for the specified port
echo "Allowing SSH on port 2323 through the firewall..."
ufw allow 2323/tcp

# Create a user with a weak password (honeypot user)
echo "Creating a honeypot user with weak credentials..."
useradd -m -p $(openssl passwd -1 "password") honeypotuser

# Restart the SSH service to apply the changes
echo "Restarting SSH service to apply configuration changes..."
systemctl restart sshd

echo "SSH honeypot setup complete."
