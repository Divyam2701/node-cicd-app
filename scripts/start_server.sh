#!/bin/bash
echo "🚀 Starting application with PM2..."

# Ensure correct user
sudo su - ec2-user

# Set correct PATH (for nvm users)
export NVM_DIR="/home/ec2-user/.nvm"
export PATH="/home/ec2-user/.nvm/versions/node/$(node -v)/bin:$PATH"

# Navigate to app directory
cd /home/ec2-user/node-cicd-app || { echo "❌ Directory not found"; exit 1; }

# Start or restart the application with PM2
pm2 stop node-cicd-app || true
pm2 start app.js --name node-cicd-app
pm2 save
pm2 startup

echo "✅ Application started successfully!"
