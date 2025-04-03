#!/bin/bash
echo "📦 Checking and installing application dependencies..."

# Move to the application directory
cd /home/ec2-user/node-cicd-app || { echo "❌ Failed to enter application directory"; exit 1; }

# Check if node_modules exists
if [ -d "node_modules" ]; then
    echo "✅ Dependencies are already installed."
else
    echo "🚀 Installing dependencies..."
    npm install --only=prod
fi

echo "✅ Dependencies setup completed!"
