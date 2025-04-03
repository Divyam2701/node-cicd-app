#!/bin/bash
echo "📦 Checking and Installing Dependencies..."

cd /home/ec2-user/node-cicd-app

# Check if node_modules exists
if [ -d "node_modules" ]; then
    echo "✅ Dependencies already installed. Skipping installation."
else
    echo "⚠️ Dependencies not found. Installing now..."
    npm install --only=prod  # Install only production dependencies
    echo "✅ Dependencies installed."
fi
