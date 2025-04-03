#!/bin/bash

cd /home/ec2-user/node-cicd-app  # Update with the correct path of your app

# Stop the existing PM2 process (if running)
if pm2 list | grep -q "node-cicd-app"; then
    echo "Stopping existing PM2 process..."
    pm2 stop node-cicd-app
    pm2 delete node-cicd-app
fi

# Start the app with PM2
echo "Starting application with PM2..."
pm2 start index.js --name "node-cicd-app"  # Update with the correct entry file

# Ensure PM2 restarts the app on reboot
pm2 save
pm2 startup
