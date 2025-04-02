#!/bin/bash
cd /home/ec2-user/node-cicd-app
nohup npm start > app.out.log 2> app.err.log < /dev/null &
