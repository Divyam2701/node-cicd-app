#!/bin/bash
echo "Running BeforeInstall script..."

# Ensure the script is run as ec2-user
sudo chown -R ec2-user:ec2-user /home/ec2-user/

<<<<<<< HEAD
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
=======
# Log location
LOG_FILE="/tmp/before_install.log"
echo "Logging to $LOG_FILE"
exec > >(tee -a "$LOG_FILE") 2>&1
>>>>>>> 76804514fccf203dbdbc7e24a1f5ea9730aefd41

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

<<<<<<< HEAD
# Remove the lock file after execution to allow future deployments
rm -f /tmp/deployment-in-progress.lock

echo "BeforeInstall script execution completed!"
=======
# Ensure directory exists after cleanup
mkdir -p /home/ec2-user/node-cicd-app

# Remove lock file after execution
rm -f "$LOCK_FILE"

echo "✅ BeforeInstall script execution completed!"
>>>>>>> 76804514fccf203dbdbc7e24a1f5ea9730aefd41
