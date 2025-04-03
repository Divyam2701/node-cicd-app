#!/bin/bash

# Stop the server if running
if pm2 list | grep -q "node-cicd-app"; then
    echo "Stopping PM2 process..."
    pm2 stop node-cicd-app
    pm2 delete node-cicd-app
else
    echo "No running PM2 process found."
fi
