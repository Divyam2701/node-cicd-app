#!/bin/bash
echo "Running BeforeInstall script..."

# Ensure the script is run as ec2-user
sudo chown -R ec2-user:ec2-user /home/ec2-user/

# Log location
LOG_FILE="/tmp/before_install.log"
echo "Logging to $LOG_FILE"
exec > >(tee -a "$LOG_FILE") 2>&1

# Check if deployment is already running
LOCK_FILE="/tmp/deployment-in-progress.lock"

if [ -f "$LOCK_FILE" ]; then
    echo "🚨 Deployment is already in progress. Skipping duplicate execution."
    exit 0
fi

# Create lock file
touch "$LOCK_FILE"

# Stop existing application if running
echo "🔴 Stopping any running application..."
if systemctl is-active --quiet node-app; then
    sudo systemctl stop node-app
    echo "✅ Application stopped successfully."
else
    echo "⚠️ Application was not running."
fi

# Remove old application files (prevent conflicts)
echo "🧹 Cleaning up old application files..."
sudo rm -rf /home/ec2-user/node-cicd-app/*

# Ensure directory exists after cleanup
mkdir -p /home/ec2-user/node-cicd-app

# Remove lock file after execution
rm -f "$LOCK_FILE"

echo "✅ BeforeInstall script execution completed!"
