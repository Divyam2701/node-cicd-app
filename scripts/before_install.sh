#!/bin/bash
echo "🔧 Running BeforeInstall script..."

# Ensure script runs as ec2-user
sudo chown -R ec2-user:ec2-user /home/ec2-user/

# Install system dependencies
echo "📦 Installing required system dependencies..."
sudo apt update -y
sudo apt install -y curl unzip awscli nodejs npm

# Install PM2 if not already installed
if ! command -v pm2 &> /dev/null; then
    echo "⚙️ Installing PM2..."
    sudo npm install -g pm2
else
    echo "✅ PM2 is already installed."
fi

# Prevent duplicate deployments
LOCK_FILE="/tmp/deployment-in-progress.lock"
if [ -f "$LOCK_FILE" ]; then
    echo "🚨 Deployment already in progress. Skipping..."
    exit 0
fi
touch "$LOCK_FILE"

# Check if server is running and stop it if necessary
echo "🔴 Checking for running application..."
if pm2 list | grep -q node-app; then
    echo "✅ Application is running. Stopping it..."
    pm2 stop node-app
else
    echo "⚠️ Application is not running. Proceeding with deployment."
fi

# Clean up old application files
echo "🧹 Cleaning up old application files..."
sudo rm -rf /home/ec2-user/node-cicd-app/*

echo "✅ BeforeInstall script execution completed!"
