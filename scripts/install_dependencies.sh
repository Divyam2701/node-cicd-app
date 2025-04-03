#!/bin/bash

echo "📦 Checking and installing application dependencies..."

# Move to the application directory
cd /home/ec2-user/node-cicd-app || { echo "❌ Failed to enter application directory"; exit 1; }

# Ensure NPM is available
if ! command -v npm &> /dev/null; then
    echo "❌ NPM is not installed. Please install Node.js and try again."
    exit 1
fi

# Install PM2 globally if not installed
if ! command -v pm2 &> /dev/null; then
    echo "🚀 Installing PM2..."
    sudo npm install -g pm2
else
    echo "✅ PM2 is already installed."
fi

# Check if node_modules exists, otherwise install dependencies
if [ -d "node_modules" ]; then
    echo "✅ Dependencies are already installed."
else
    echo "🚀 Installing dependencies..."
    sudo npm install --only=prod
fi

echo "✅ Dependencies setup completed!"
