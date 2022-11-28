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


