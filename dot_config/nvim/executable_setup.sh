#!/bin/bash

rm -rf $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim \
    -c "so $HOME/.config/nvim/lua/emersonmx/packer.lua" \
    -c PackerSync
