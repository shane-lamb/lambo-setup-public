#!/bin/bash

# exit when any command fails
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p ~/.config

mkdir -p ~/.config/karabiner
rm ~/.config/karabiner/karabiner.json
ln -s "$SCRIPT_DIR"/karabiner.json ~/.config/karabiner/karabiner.json
