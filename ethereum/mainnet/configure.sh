#! /bin/bash

# Define service files
SERVICE_DIR=/etc/systemd/system/
BUILDER_SERVICE=/etc/systemd/system/builder-prod.service
MEV_BOOST_SERVICE=/etc/systemd/system/mev-boost-prod.service
PRYSM_VALIDATOR_SERVICE=/etc/systemd/system/prysm-validator-prod.service
PRYSM_BEACON_SERVICE=/etc/systemd/system/prysm-beacon-prod.service

# Copy the service files over to the systemd if they don't exist
if ! [ -f "$BUILDER_SERVICE" ]; then
  echo "WARN: Missing builder service. Placing builder-prod.service in $BUILDER_SERVICE..."
  sudo cp builder-prod.service $SERVICE_DIR
  if ! [ -f "$BUILDER_SERVICE" ]; then
    echo "ERROR: builder-prod.service copy failed!"
    exit 1
  else
    echo "builder-prod.service copied successfully"
  fi
fi
if ! [ -f "$MEV_BOOST_SERVICE" ]; then
  echo "WARN: Missing mev-boost service. Placing mev-boost-prod.service in $MEV_BOOST_SERVICE..."
  sudo cp mev-boost-prod.service $SERVICE_DIR
  if ! [ -f "$MEV_BOOST_SERVICE" ]; then
    echo "ERROR: mev-boost-prod.service copy failed!"
    exit 1
  else
    echo "mev-boost-prod.service copied successfully"
  fi
fi
if ! [ -f "$PRYSM_VALIDATOR_SERVICE" ]; then
  echo "WARN: Missing prysm-validator service. Placing prysm-validator-prod.service in $PRYSM_VALIDATOR_SERVICE..."
  sudo cp prysm-validator-prod.service $SERVICE_DIR
  if ! [ -f "$PRYSM_VALIDATOR_SERVICE" ]; then
    echo "ERROR: prysm-validator-prod.service copy failed!"
    exit 1
  else
    echo "prysm-validator-prod.service copied successfully"
  fi
fi
if ! [ -f "$PRYSM_BEACON_SERVICE" ]; then
  echo "WARN: Missing prysm-beacon service. Placing prysm-beacon-prod.service in $PRYSM_BEACON_SERVICE..."
  sudo cp prysm-beacon-prod.service $SERVICE_DIR
  if ! [ -f "$PRYSM_BEACON_SERVICE" ]; then
    echo "ERROR: prysm-beacon-prod.service copy failed!"
    exit 1
  else
    echo "prysm-beacon-prod.service copied successfully"
  fi
fi


# Install missing binaries
# TODO: Add builder install here
# if ! [ -x "$(command -v geth)" ]; then
#   echo "WARN: geth not found, installing latest stable version..."
#   mkdir ~/.temp_config/
#   cd ~/.temp_config/
#   git clone https://github.com/ethereum/go-ethereum
#   cd go-ethereum
#   go install ./..
#   if ! [ -x "$(command -v geth)" ]; then
#     echo "ERROR: geth install failed!"
#     exit 1
#   else
#     echo "geth installed successfully with $(geth version | grep 'Version: 1' | tr '[:upper:]' '[:lower:]')"
#   fi
#   rm -rf ~/.temp_config
# else
#   echo "geth already installed with $(geth version | grep 'Version: 1' | tr '[:upper:]' '[:lower:]')"
# fi
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
# sudo systemctl restart builder-prod
# sudo systemctl restart mev-boost-prod
# sudo systemctl restart prysm-validator-prod
# sudo systemctl restart prysm-beacon-prod

# Enable services
sudo systemctl enable builder-prod.service
sudo systemctl enable mev-boost-prod.service
sudo systemctl enable prysm-validator-prod.service
sudo systemctl enable prysm-beacon-prod.service


