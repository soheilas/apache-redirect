#!/bin/bash

# Install Apache and PHP
sudo apt-get update
sudo apt-get install apache2 php libapache2-mod-php -y

# Remove the index.html file created by Apache
sudo rm /var/www/html/index.html

# Set the default website directory
website_directory="/var/www/html"

# Read the redirect URL from user input
read -p "Please enter the redirect URL: " redirect_url

# Get the server IP address
server_ip=$(curl -s ifconfig.me)

# Create the index.php file with the redirect code
echo "<?php header('Location: http://$redirect_url/'); ?>" | sudo tee "$website_directory/index.php"

# Restart Apache
sudo systemctl restart apache2

# Print completion message in red
echo -e "\e[31mInstallation and configuration completed successfully.\e[0m\n"

# Print server IP and redirect information
echo -e "\e[1m\e[31m$server_ip redirect to $redirect_url\e[0m"
