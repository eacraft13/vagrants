#!/bin/bash

echo "Preparing proxy..."

cd /sites/proxy
  git clone git@github.com:eacraft13/fantasy_data-proxy.git .
  npm install
  pm2 start index.js --name="proxy"
cd ../..

mkdir /tmp/cache

echo "Preparing nginx..."

cp /etc/configs/nginx/proxy /etc/nginx/sites-available/proxy
rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/proxy /etc/nginx/sites-enabled/proxy
service nginx restart
