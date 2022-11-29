#! /bin/bash

# Curl Install
sudo apt install curl

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


# Alacritty Terminal
sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo install alacritty

# nvim text editor
sudo apt install neovim

# Javascript Stuff
sudo apt install nodejs
sudo apt install npm
sudo apt install yarn

# Zsh shell
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker run hello-world

# Docker auth
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world

# Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/2.13.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Ubuntu tweaks
sudo add-apt-repository universe
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extension-gsconnect

# Vagrant
sudo apt update && sudo apt upgrade
sudo apt-get -y install gcc make linux-headers-$(uname -r) dkms
sudo apt -y install virtualbox
wget https://releases.hashicorp.com/vagrant/2.3.3/vagrant_2.3.3-1_amd64.deb
sudo apt -y install ./vagrant_2.3.3-1_amd64.deb

# Fuse (for app images)
sudo apt install libfuse2

