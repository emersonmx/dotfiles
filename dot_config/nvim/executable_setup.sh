#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -f "$SCRIPT_DIR/lazy-lock.json"
rm -rf "$HOME/.local/share/nvim/"
rm -rf "$HOME/.local/state/nvim/"


rm -rf "$SCRIPT_DIR/.venv"
python -m venv --upgrade-deps .venv
"$SCRIPT_DIR/.venv/bin/python" --version
"$SCRIPT_DIR/.venv/bin/python" -m pip install \
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

nvim --headless -c "quit"
MASON_PACKAGES=(
    black \
    commitlint \
    djlint \
    editorconfig-checker \
    efm \
    flake8 \
    gofumpt \
    golangci-lint \
    isort \
    jsonlint \
    markdownlint \
    mypy \
    prettier \
    ruff \
    shellcheck \
    shfmt \
    sonarlint-language-server \
    stylelint \
    tailwindcss-language-server \
    yamlfmt \
    yamllint \
)
nvim --headless -c "MasonInstall ${MASON_PACKAGES[*]}" -c "quit"
