#! /bin/bash

# Stash working directory
CURRENT_DIR=$(pwd)
BINARY_NAME=$(echo $1 | sed 's/\..*//')
FULL_BINARY="/usr/local/bin/$BINARY_NAME"
SHC_OUTPUT="$1.x"

# Install prerequisite packages for the shc compiler
sudo apt-get install libc6-dev
sudo apt install shc

# Compile
shc -f $1

# Remove any scrap files
if [ -f "$1.x.c" ]; then
  rm -rf "$1.x.c"
fi

# Move to the binary directory
echo "Copying binary to /usr/local/bin/ ..."
sudo mv $SHC_OUTPUT $FULL_BINARY
if ! [ -x "$(command -v $FULL_BINARY)" ]; then
  echo "ERROR: Failed to compile binary!"
  exit 1
else
  echo "binary successfully installed at $FULL_BINARY"
fi

