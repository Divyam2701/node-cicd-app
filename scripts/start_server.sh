#!/bin/bash
echo "🚀 Starting application with PM2..."

# Ensure correct PATH for node and pm2
export NVM_DIR="/home/ec2-user/.nvm"
export PATH="/home/ec2-user/.nvm/versions/node/$(node -v)/bin:$PATH"

# Navigate to app directory
cd /home/ec2-user/node-cicd-app

# Restart server with PM2
sudo pm2 stop all || true
sudo pm2 start app.js --name node-cicd-app
sudo pm2 save
sudo pm2 startup
