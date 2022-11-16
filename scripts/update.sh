#! /bin/zsh

# Install rust if not present
if ! [ -x "$(command -v cargo)" ]; then
  echo "Missing rust, installing..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  echo "Rust installed!"
fi

rustup update nightly
echo "Rust nightly updated!"

rustup update stable
echo "Rust stable updated!"


# Install foundry
curl -L https://foundry.paradigm.xyz | bash
source ~/.zshrc
foundryup
foundryup --version nightly

# Update helios
curl https://raw.githubusercontent.com/a16z/helios/master/heliosup/install | bash
source ~/.zshrc
heliosup
