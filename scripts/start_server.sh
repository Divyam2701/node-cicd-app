#!/bin/bash
echo "🚀 Starting application with PM2..."

# Ensure correct PATH for node and pm2
export NVM_DIR="/home/ec2-user/.nvm"
export PATH="/home/ec2-user/.nvm/versions/node/$(node -v)/bin:$PATH"

# Navigate to app directory
cd /home/ec2-user/node-cicd-app

# Restart server with PM2
pm2 stop all || true
pm2 start app.js --name node-cicd-app
pm2 save
pm2 startup
