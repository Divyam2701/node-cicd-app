#!/bin/bash
echo "🚀 Starting application with PM2..."

# Move to the application directory
cd /home/ec2-user/node-cicd-app || { echo "❌ Failed to enter application directory"; exit 1; }

# Start the application using the full PM2 path
/usr/bin/pm2 start app.js --name node-app

echo "✅ Application started successfully!"
