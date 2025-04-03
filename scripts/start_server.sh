#!/bin/bash
echo "🚀 Starting application with PM2..."

cd /home/ec2-user/node-cicd-app

# Check if PM2 process is already running
if pm2 list | grep -q "node-app"; then
    echo "🔄 Restarting application to reflect changes..."
    pm2 restart node-app
else
    echo "🚀 Starting application for the first time..."
    pm2 start app.js --name "node-app"
fi

# Save PM2 process list so it restarts after reboot
pm2 save
pm2 startup systemd

echo "✅ Application started successfully!"
