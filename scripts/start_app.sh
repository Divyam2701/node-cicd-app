#!/bin/bash
cd /home/ec2-user/node-cicd-app

# Ensure correct permissions
chmod -R 755 /home/ec2-user/node-cicd-app

# Stop any running PM2 processes
~/.npm-global/bin/pm2 stop all

# Start the application with PM2
~/.npm-global/bin/pm2 start app.js
