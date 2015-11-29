#!/bin/bash

echo "Preparing app..."

cd /sites/app
  git clone git@github.com:eacraft13/fantasy_data-app.git .
  npm install
  bower install --allow-root
cd ../..
