#!/bin/bash
cd /home/ec2-user/node-cicd-app
pm2 start server.js --name "node-app"
