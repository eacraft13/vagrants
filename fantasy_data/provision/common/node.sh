#!/bin/bash

echo "Installing Node..."

curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get install nodejs -y
apt-get install build-essential -y
