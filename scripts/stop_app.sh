#!/bin/bash
echo "Reloading application with zero downtime..."
if ~/.npm-global/bin/pm2 list | grep -q "node-app"; then
  ~/.npm-global/bin/pm2 reload node-app
else
  echo "Application not running, skipping reload."
fi
