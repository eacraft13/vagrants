#!/bin/bash

echo "Preparing proxy..."

cd /sites/proxy
  git clone git@github.com:eacraft13/fantasy_data-proxy.git .
  npm install
cd ../..
