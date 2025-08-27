#!/bin/bash
# Note: Execute nvim before this script!
nvim --headless +"TSInstall! python" +"TSInstall! c" +"TSInstall! cpp" +"TSInstall! markdown" +q

# Install VSCode Dark plus theme
git clone https://github.com/0zean/NvChad-vscodedarkplus ./temp
mkdir -p ./lua/custom/themes/vscodedarkplus
cp -rf ./temp/darkplus.lua ./lua/custom/themes/vscodedarkplus/init.lua
rm -rf ./temp

echo "Setup completed!"
