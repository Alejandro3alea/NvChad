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


read -r -p "Setting up sss_code for code screenshots. Do you want to install it? [Y/n] " RESPONSE
RESPONSE=${RESPONSE:-Y}
if [[ "${RESPONSE}" =~ ^([yY][eE][sS]|[yY])$ ]]; then

  SSS_CODE_NAME=sss_code-x86_64-unknown-linux-gnu
  wget https://github.com/SergioRibera/sss/releases/download/sss_code/v0.2.0/${SSS_CODE_NAME}.tar.xz
  tar -xf ${SSS_CODE_NAME}.tar.xz && rm ${SSS_CODE_NAME}.tar.xz
  sudo mv ${SSS_CODE_NAME}/sss_code /usr/local/bin/ && rm -rf ${SSS_CODE_NAME}/
  sss_code --help

else
  echo "Skipping sss_code install..."
fi

echo "Setup completed!"
