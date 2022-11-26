#! /bin/bash

# Define service files
SERVICE_DIR=/etc/systemd/system/
GETH_SERVICE=/etc/systemd/system/geth.service
MEV_BOOST_SERVICE=/etc/systemd/system/mev-boost.service
PRYSM_VALIDATOR_SERVICE=/etc/systemd/system/prysm-validator.service
PRYSM_BEACON_SERVICE=/etc/systemd/system/prysm-beacon.service

# Copy the service files over to the systemd if they don't exist
if ! [ -f "$GETH_SERVICE" ]; then
  echo "WARN: Missing geth service. Placing geth.service in $GETH_SERVICE..."
  sudo cp geth.service $SERVICE_DIR
  if ! [ -f "$GETH_SERVICE" ]; then
    echo "ERROR: geth.service copy failed!"
    exit 1
  else
    echo "geth.service copied successfully"
  fi
fi
if ! [ -f "$MEV_BOOST_SERVICE" ]; then
  echo "WARN: Missing mev-boost service. Placing mev-boost.service in $MEV_BOOST_SERVICE..."
  sudo cp mev-boost.service $SERVICE_DIR
  if ! [ -f "$MEV_BOOST_SERVICE" ]; then
    echo "ERROR: mev-boost.service copy failed!"
    exit 1
  else
    echo "mev-boost.service copied successfully"
  fi
fi
if ! [ -f "$PRYSM_VALIDATOR_SERVICE" ]; then
  echo "WARN: Missing prysm-validator service. Placing prysm-validator.service in $PRYSM_VALIDATOR_SERVICE..."
  sudo cp prysm-validator.service $SERVICE_DIR
  if ! [ -f "$PRYSM_VALIDATOR_SERVICE" ]; then
    echo "ERROR: prysm-validator.service copy failed!"
    exit 1
  else
    echo "prysm-validator.service copied successfully"
  fi
fi
if ! [ -f "$PRYSM_BEACON_SERVICE" ]; then
  echo "WARN: Missing prysm-beacon service. Placing prysm-beacon.service in $PRYSM_BEACON_SERVICE..."
  sudo cp prysm-beacon.service $SERVICE_DIR
  if ! [ -f "$PRYSM_BEACON_SERVICE" ]; then
    echo "ERROR: prysm-beacon.service copy failed!"
    exit 1
  else
    echo "prysm-beacon.service copied successfully"
  fi
fi


# Install missing binaries
if ! [ -x "$(command -v geth)" ]; then
  echo "WARN: geth not found, installing latest stable version..."
  mkdir ~/.temp_config/
  cd ~/.temp_config/
  git clone https://github.com/ethereum/go-ethereum
  cd go-ethereum
  go install ./..
  if ! [ -x "$(command -v geth)" ]; then
    echo "ERROR: geth install failed!"
    exit 1
  else
    echo "geth installed successfully with $(geth version | grep 'Version: 1' | tr '[:upper:]' '[:lower:]')"
  fi
else
  echo "geth already installed with $(geth version | grep 'Version: 1' | tr '[:upper:]' '[:lower:]')"
fi
if ! [ -x "$(command -v mev-boost)" ]; then
  echo "WARN: mev-boost not found, installing latest stable version..."
  go install github.com/flashbots/mev-boost@latest
  if ! [ -x "$(command -v mev-boost)" ]; then
    echo "ERROR: mev-boost install failed!"
    exit 1
  else
    echo "mev-boost installed successfully with version: $(mev-boost --version | sed 's/mev-boost//')"
  fi
else
  echo "mev-boost already installed with version: $(mev-boost --version | sed 's/mev-boost //')"
fi
if ! [ -x "$(command -v prysm)" ]; then
  echo "WARN: prysm not found, installing latest stable version..."
  curl https://raw.githubusercontent.com/prysmaticlabs/prysm/master/prysm.sh --output prysm.sh
  ../../scripts/compile-binary.sh prysm.sh
  if ! [ -x "$(command -v prysm)" ]; then
    echo "ERROR: prysm install failed!"
    exit 1
  else
    echo "prysm installed successfully"
  fi
else
  echo "prysm already installed"
fi


# Reload system daemon
sudo systemctl daemon-reload

# Restart services
# sudo systemctl restart geth
# sudo systemctl restart mev-boost
# sudo systemctl restart prysm-validator
# sudo systemctl restart prysm-beacon

# Enable services
sudo systemctl enable geth.service
sudo systemctl enable mev-boost.service
sudo systemctl enable prysm-validator.service
sudo systemctl enable prysm-beacon.service


