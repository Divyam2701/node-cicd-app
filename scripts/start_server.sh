#!/bin/bash
echo "🚀 Starting the application..."

cd /home/ec2-user/node-cicd-app

# Restart the application to ensure changes take effect
if pm2 list | grep -q node-app; then
    echo "🔄 Restarting application..."
    pm2 restart node-app
else
    echo "🚀 Starting application for the first time..."
    pm2 start index.js --name node-app
fi

echo "✅ Application is now running."
