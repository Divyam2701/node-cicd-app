#!/bin/bash
echo "🔄 Checking if the application is already running..."

# Move to the application directory
cd /home/ec2-user/node-cicd-app || { echo "❌ Failed to enter application directory"; exit 1; }

# Check if the application is already running
if pm2 list | grep -q "node-app"; then
    echo "⚠️ Application is already running. Stopping it before proceeding..."
    pm2 stop node-app
    pm2 delete node-app
else
    echo "✅ No running application found. Proceeding with deployment..."
fi

echo "✅ Before install script completed!"
