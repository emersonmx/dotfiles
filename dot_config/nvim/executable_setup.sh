#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -f "$SCRIPT_DIR/lazy-lock.json"
rm -rf "$HOME/.local/share/nvim/"
rm -rf "$HOME/.local/state/nvim/"

MASON_PACKAGES=(
    bash-language-server \
    commitlint \
    djlint \
    docker-compose-language-service \
    dockerfile-language-server \
    editorconfig-checker \
    efm \
    emmet-ls \
    eslint-lsp \
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
    prettier \
    pyright \
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
