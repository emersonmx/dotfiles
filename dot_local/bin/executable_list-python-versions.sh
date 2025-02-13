#!/bin/bash
# shellcheck disable=SC2086

versions=$(git ls-remote --tags --refs https://github.com/python/cpython.git |
    grep -o 'refs/tags/.*' |
    sed "s#^refs/tags/v##g")
semver $versions
