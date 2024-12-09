#!/bin/bash

# Ensure the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root!" 1>&2
  exit 1
fi

# Install Apache web server
echo "Installing Apache web server..."
pacman -S --noconfirm apache

# Start and enable Apache service
echo "Starting and enabling Apache service..."
systemctl enable httpd --now

# Create a simple vulnerable web page
echo "Creating a simple vulnerable web page..."
echo '<html><body><h1>Welcome to my vulnerable site!</h1></body></html>' > /srv/http/index.html

# Configure Apache to log requests (make sure the LogLevel is set to info)
echo "Configuring Apache to log requests..."
sed -i 's/LogLevel warn/LogLevel info/' /etc/httpd/conf/httpd.conf

# Allow HTTP access through the firewall
echo "Allowing HTTP on port 80 through the firewall..."
ufw allow 80/tcp

# Restart Apache to apply the changes
echo "Restarting Apache to apply configuration changes..."
systemctl restart httpd

echo "Web server honeypot setup complete."