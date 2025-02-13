#!/bin/bash
# shellcheck disable=SC2086

versions=$(git ls-remote --tags --refs https://github.com/rust-lang/rust.git |
    grep -o 'refs/tags/.*' |
    sed "s#^refs/tags/##g")
semver $versions
