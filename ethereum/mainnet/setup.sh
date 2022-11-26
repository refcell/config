#! /bin/bash

# This setup heavily follows: https://github.com/metanull-operator/eth2-ubuntu/blob/master/v2/setup.md

# Refresh
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get autoremove

# Update packages
sudo apt-get install net-tools make curl git

# Create new user
sudo adduser --home /home/octane octane

# Add user to new group
sudo groupadd prod
sudo usermod -a -G prod octane

# Create the directory structures
sudo mkdir -p /builder/validator
sudo mkdir -p /builder/data

# Change builder directory ownership
sudo chgrp -R prod /builder /builder/*

# Move relevant files to the builder directory
sudo cp builder.toml /builder/

if ! [ -x "/builder/prysm" ]; then
  sudo git clone https://github.com/prysmaticlabs/prysm.git /builder/prysm
  echo "Prysm cloned to /builder/prysm"
else
  echo "Prysm directory already exists in /builder/prysm, updating cloned repo..."
  sudo git config --global --add safe.directory /builder/prysm
  cd /builder/prysm
  sudo git pull
fi

sudo chmod +x /builder/prysm/prysm.sh

