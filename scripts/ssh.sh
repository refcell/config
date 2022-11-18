#! /bin/zsh

sudo apt-get upgrade

sudo apt-get install openssh-client
sudo apt-get install openssh-server

echo "Checking installation..."
ps -A | grep sshd

# Settings located in: /etc/ssh/sshd_config

