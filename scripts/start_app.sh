#!/bin/bash
cd /home/ec2-user/node-cicd-app
if ~/.npm-global/bin/pm2 list | grep -q "node-app"; then
  echo "Application is already running, skipping start."
else
  echo "Starting application..."
  ~/.npm-global/bin/pm2 start app.js.js --name "node-app" --update-env
fi
~/.npm-global/bin/pm2 save
