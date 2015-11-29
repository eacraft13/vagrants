#!/bin/bash

echo "Provisioning virtual machine..."

apt-get update && apt-get upgrade -y > /dev/null

# Git
add-apt-repository ppa:git-core/ppa
apt-get update > /dev/null
apt-get install git -y

# Nginx
add-apt-repository ppa:nginx/stable
apt-get update > /dev/null
apt-get install nginx -y
cp /etc/sites/nginx/app /etc/nginx/sites-available/app
service nginx restart

# Node
curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get install nodejs -y
apt-get install build-essential -y

# Npm global packages
npm install -g nodemon gulp bower pm2 node-static

# Add github RSA fingerprint, clone repo, & install vendor packages
mkdir /root/.ssh && touch /root/.ssh/known_hosts
ssh-keyscan -H "github.com" >> /root/.ssh/known_hosts
chmod 600 /root/.ssh/known_hosts
cd /sites/app
  git clone git@github.com:eacraft13/fantasy_data-app.git .
  npm install
  bower install --allow-root
cd ../..
