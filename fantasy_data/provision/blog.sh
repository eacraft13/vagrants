#!/bin/bash

echo "Preparing blog..."

sudo apt-get update
sudo apt-get upgrade -y
sudo aptitude install -y zip vim wget

curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs

sudo mkdir -p /var/www/
cd /var/www/
sudo wget https://ghost.org/zip/ghost-latest.zip
sudo unzip -d ghost ghost-latest.zip
cd ghost/
sudo npm install --production

# change host: '127.0.0.1', --> host: '0.0.0.0',
sudo cp config.example.js config.js
sudo vi config.js

# create ghost user
sudo adduser --shell /bin/bash --gecos 'Ghost application' ghost
sudo chown -R ghost:ghost /var/www/ghost/

su - ghost
cd /var/www/ghost/

npm start --production
