#!/bin/bash

echo "Preparing app..."

cd /sites/app
  git clone git@github.com:eacraft13/fantasy_data-app.git .
  npm install
  bower install --allow-root
  pm2 start server.js
cd ../..


echo "Preparing nginx..."

cp /etc/configs/nginx/app /etc/nginx/sites-available/app
rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/app
service nginx restart

echo "Preparing nginx error pages..."

cp -r /etc/configs/nginx/errors /usr/share/nginx/html
