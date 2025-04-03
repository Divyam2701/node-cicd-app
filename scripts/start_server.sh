#!/bin/bash
echo "🚀 Starting application with PM2..."

# Move to the application directory
cd /home/ec2-user/node-cicd-app || { echo "❌ Failed to enter application directory"; exit 1; }

# Start or restart the application
if pm2 list | grep -q "app.js"; then
    echo "🔄 Restarting application..."
    pm2 restart app.js
else
    echo "▶️ Starting application..."
    pm2 start app.js --name node-app
fi

# Save the PM2 process list to ensure auto-restart on reboot
pm2 save

echo "✅ Application is running!"
