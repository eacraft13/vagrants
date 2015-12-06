#!/bin/bash

echo "Installing Git..."

add-apt-repository ppa:git-core/ppa
apt-get update > /dev/null
apt-get install git -y
