#!/bin/bash
echo "Running BeforeInstall script..."

# Stop the existing application if running
echo "Stopping any running application..."
sudo systemctl stop node-app || true  # Avoid errors if service doesn't exist

# Ensure correct ownership for the deployment folder
sudo chown -R ec2-user:ec2-user /home/ec2-user/node-cicd-app

echo "BeforeInstall script execution completed!"
