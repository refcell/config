#! /bin/bash

# Create wireshark config
mkdir -p ~/.wireshark

# Install wireshark
if ! [ -x "$(command -v wireshark)" ]; then
  echo "installing wireshark..."
  sudo add-apt-repository ppa:wireshark-dev/stable
  sudo apt update
  sudo apt install wireshark
  echo "wireshark installed successfully"
fi

# Install tshark
if ! [ -x "$(command -v tshark)" ]; then
  echo "installing tshark binary..."
  sudo add-apt-repository -y ppa:wireshark-dev/stable
  sudo apt install -y tshark
  echo "tshark installed successfully"
fi

# Install the wireshark tui
if ! [ -x "$(command -v termshark)" ]; then
  echo "installing termshark with go..."
  go install github.com/gcla/termshark/v2/cmd/termshark@v2.4.0
  echo "termshark installed successfully"
fi

# Install ethereum dissectors plugin
if ~ [ -d "~/.wireshark/ethereum-dissectors" ]; then
  echo "Cloning ethereum-dissectors..."
  git clone https://github.com/ConsenSys/ethereum-dissectors ~/.wireshark/
  mkdir -p ~/.local/lib/wireshark/plugins/epan/ethereum
  ln -s ~/.wireshark/ethereum-dissectors ~/.local/lib/wireshark/plugins/epan/ethereum
  echo "plugin installed successfully"
fi

echo "Running termshark with live capture on interface enp0s31f6..."
termshark -i enp0s31f6 
