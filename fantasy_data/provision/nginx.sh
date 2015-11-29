#!/bin/bash

echo "Preparing nginx..."

cp /etc/configs/nginx /etc/nginx/sites-available/app
service nginx restart
