#!/bin/bash
cd /home/ec2-user/node-cicd-app
~/.npm-global/bin/pm2 start app.js --name "node-app"
