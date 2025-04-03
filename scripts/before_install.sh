#!/bin/bash
echo "🚀 Running BeforeInstall script..."

cd /home/ec2-user/node-cicd-app

# Ensure PM2 is installed
if ! command -v pm2 &> /dev/null; then
    echo "⚙️ PM2 not found. Installing..."
    sudo npm install -g pm2
else
    echo "✅ PM2 is already installed."
fi

# Check if node_modules exists and install dependencies if missing
if [ ! -d "node_modules" ]; then
    echo "📦 Dependencies missing. Installing..."
    npm install
    echo "✅ Dependencies installed."
else
    echo "✅ Dependencies already installed. Skipping installation."
fi

echo "✅ BeforeInstall script completed!"
