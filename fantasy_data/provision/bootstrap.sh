#!/bin/bash

echo "Provisioning machine..."

apt-get update && apt-get upgrade -y > /dev/null

# Npm global packages
npm install -g gulp bower pm2

# Add github RSA fingerprint, clone repo, & install vendor packages
mkdir /root/.ssh && touch /root/.ssh/known_hosts
ssh-keyscan -H "github.com" >> /root/.ssh/known_hosts
chmod 600 /root/.ssh/known_hosts
