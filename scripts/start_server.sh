#!/bin/bash
echo "🚀 Starting application with PM2..."

# Add PM2 to PATH
export PATH=$PATH:$HOME/.npm-global/bin

# Navigate to the application directory
cd /home/ec2-user/node-cicd-app || { echo "❌ Failed to enter application directory"; exit 1; }

# Start the application using the full PM2 path
~/.npm-global/bin/pm2 start app.js --name node-app --update-env

echo "✅ Application started successfully!"
