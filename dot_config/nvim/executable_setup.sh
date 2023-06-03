#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -rf $HOME/.local/share/nvim/
rm -rf $HOME/.local/state/nvim/
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim \
    --noplugin \
    -u $SCRIPT_DIR/lua/emersonmx/packer.lua \
    -c PackerSync


rm -rf "$SCRIPT_DIR/.venv"
python -m venv --upgrade-deps .venv
$SCRIPT_DIR/.venv/bin/python --version
$SCRIPT_DIR/.venv/bin/python -m pip install \
    black \
    flake8 \
    flake8-bugbear \
    flake8-print \
    ipdb \
    ipython \
    mypy \
    pep8-naming \
    pynvim \
    ruff
