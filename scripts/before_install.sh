#!/bin/bash
echo "Running BeforeInstall script..."

# Ensure the script is run as ec2-user
sudo chown -R ec2-user:ec2-user /home/ec2-user/

# Check if a deployment is already in progress to avoid running twice
if [ -f "/tmp/deployment-in-progress.lock" ]; then
    echo "Deployment is already in progress. Skipping duplicate execution."
    exit 0
fi

# Create a lock file to prevent duplicate execution
touch /tmp/deployment-in-progress.lock

# Stop the existing application if running
echo "Stopping any running application..."
sudo systemctl stop node-app || true  # Avoid errors if service doesn't exist

# Remove old application files (optional, prevents conflicts)
echo "Cleaning up old application files..."
sudo rm -rf /home/ec2-user/node-cicd-app/*

# Remove the lock file after execution to allow future deployments
rm -f /tmp/deployment-in-progress.lock

echo "BeforeInstall script execution completed!"
