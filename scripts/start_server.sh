cd /home/ec2-user/node-cicd-app
pm2 delete node-app
pm2 start app.js --name node-app