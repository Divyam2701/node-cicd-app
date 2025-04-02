#!/bin/bash
set -e  # Exit if any command fails

# Ensure the correct directory exists
if [ ! -d "/home/ec2-user/node-cicd-app" ]; then
    mkdir -p /home/ec2-user/node-cicd-app
fi

cd /home/ec2-user/node-cicd-app

# Fix permission issues
sudo chmod -R 777 /home/ec2-user/node-cicd-app
sudo chown -R ec2-user:ec2-user /home/ec2-user/node-cicd-app

# Install dependencies safely
npm install --unsafe-perm=true
