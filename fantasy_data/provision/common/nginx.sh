#!/bin/bash

echo "Installing nginx..."

add-apt-repository ppa:nginx/stable
apt-get update > /dev/null
apt-get install nginx -y

service nginx restart
