#!/bin/bash
# shellcheck disable=SC2086

versions=$(git ls-remote --tags https://github.com/nodejs/node.git |
    sed -e "s#^.*tags/##g" -e "s/[^0-9.]//g" |
    sort -u)
semver $versions
