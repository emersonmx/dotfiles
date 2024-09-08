#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

rm -f "$SCRIPT_DIR/lazy-lock.json"
rm -f "$SCRIPT_DIR/lazyvim.json"
rm -rf "$HOME/.local/share/nvim/"
rm -rf "$HOME/.local/state/nvim/"

rm -rf "$SCRIPT_DIR/.venv"
python -m venv --upgrade-deps .venv
"$SCRIPT_DIR/.venv/bin/python" --version
"$SCRIPT_DIR/.venv/bin/python" -m pip install pynvim

nvim
