#!/bin/bash
echo "📦 Checking and installing application dependencies..."

# Move to the application directory
cd /home/ec2-user/node-cicd-app

# Install PM2 globally if not installed
if ! command -v pm2 &> /dev/null; then
    echo "🚀 Installing PM2..."
    sudo npm install -g pm2
else
    echo "✅ PM2 is already installed."
fi

# Check if node_modules exists
if [ -d "node_modules" ]; then
    echo "✅ Dependencies are already installed."
else
    echo "🚀 Installing dependencies..."
    npm install --only=prod
fi

echo "✅ Dependencies setup completed!"
