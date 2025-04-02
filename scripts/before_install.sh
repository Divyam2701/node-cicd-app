#!/bin/bash
echo "Running BeforeInstall script..."

# Ensure the script is run as ec2-user
sudo chown -R ec2-user:ec2-user /home/ec2-user/

# Stop the existing application if running
echo "Stopping any running application..."
sudo systemctl stop node-app || true  # Avoid errors if service doesn't exist

# Remove old application files (optional, prevents conflicts)
echo "Cleaning up old application files..."
sudo rm -rf /home/ec2-user/node-cicd-app/*

echo "BeforeInstall script execution completed!"
