#!/bin/bash
# Note: Execute nvim before this script!
nvim --headless +"TSInstall! python" +"TSInstall! c" +"TSInstall! cpp" +"TSInstall! markdown" +q

# Install VSCode Dark plus theme
read -r -p "Setting up VSCode Dark Plus theme. Do you want to install it? [Y/n] " RESPONSE
RESPONSE=${RESPONSE:-Y}
if [[ "${RESPONSE}" =~ ^([yY][eE][sS]|[yY])$ ]]; then

  git clone https://github.com/0zean/NvChad-vscodedarkplus ./temp
  mkdir -p ./lua/custom/themes/vscodedarkplus
  cp -rf ./temp/darkplus.lua ./lua/custom/themes/vscodedarkplus/init.lua
  rm -rf ./temp

else
  echo "Skipping VSCode Dark Plus theme install..."
fi


read -r -p "Setting up silicon for code screenshots. Do you want to install it? [Y/n] " RESPONSE
RESPONSE=${RESPONSE:-Y}
if [[ "${RESPONSE}" =~ ^([yY][eE][sS]|[yY])$ ]]; then

  # Install cargo
  curl https://sh.rustup.rs -sSf | sh
  # Install silicon
  cargo install silicon
  # Add cargo-installed binaries to the path
  export PATH="$PATH:$CARGO_HOME/bin"
  silicon --help

else
  echo "Skipping silicon install..."
fi

echo "Setup completed!"
