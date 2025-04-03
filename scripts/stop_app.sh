#!/bin/bash
echo "Reloading application with zero downtime..."
if ~/.npm-global/bin/pm2 list | grep -q "node-app"; then
  ~/.npm-global/bin/pm2 restart node-app --update-env
else
  echo "Application not running, skipping reload."
fi
