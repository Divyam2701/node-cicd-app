#!/bin/bash
echo "🔧 Running BeforeInstall script..."

# Ensure script runs as ec2-user
sudo chown -R ec2-user:ec2-user /home/ec2-user/

# Check if server is running
if pm2 list | grep -q node-app; then
    echo "✅ Server is already running."
else
    echo "⚠️ Server is not running. Proceeding with deployment."
fi

# Prevent duplicate deployments
LOCK_FILE="/tmp/deployment-in-progress.lock"
if [ -f "$LOCK_FILE" ]; then
    echo "🚨 Deployment already in progress. Skipping..."
    exit 0
fi
touch "$LOCK_FILE"

# Stop the existing application only if it's running
echo "🔴 Stopping any running application..."
if pm2 list | grep -q node-app; then
    pm2 stop node-app
    echo "✅ Application stopped."
else
    echo "⚠️ Application was not running."
fi

echo "🧹 Cleaning up old application files..."
sudo rm -rf /home/ec2-user/node-cicd-app/*

echo "✅ BeforeInstall script completed."
