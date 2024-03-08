#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -f "$SCRIPT_DIR/lazy-lock.json"
rm -rf "$HOME/.local/share/nvim/"
rm -rf "$HOME/.local/state/nvim/"
