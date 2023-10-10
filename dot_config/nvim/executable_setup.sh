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

MASON_PACKAGES=(
    bash-language-server \
    black \
    commitlint \
    djlint \
    docker-compose-language-service \
    dockerfile-language-server \
    editorconfig-checker \
    efm \
    emmet-ls \
    eslint-lsp \
    flake8 \
    gofumpt \
    golangci-lint \
    golangci-lint-langserver \
    gopls \
    html-lsp \
    isort \
    json-lsp \
    jsonlint \
    lua-language-server \
    markdownlint \
    mypy \
    prettier \
    pyright \
    ruff \
    ruff-lsp \
    rust-analyzer \
    shellcheck \
    shfmt \
    sonarlint-language-server \
    stylelint \
    stylelint-lsp \
    tailwindcss-language-server \
    taplo \
    typescript-language-server \
    yaml-language-server \
    yamlfmt \
    yamllint \
)
nvim --headless -c "MasonInstall ${MASON_PACKAGES[*]}" -c "quit"
