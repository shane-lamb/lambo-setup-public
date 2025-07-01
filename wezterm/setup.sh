#!/bin/bash

# exit when any command fails
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Bootstrap homebrew (if not done already)
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install --cask wezterm

mkdir -p ~/.config

# wezterm config
if [[ -L ~/.wezterm.lua ]]; then
   rm ~/.wezterm.lua
fi
ln -s "$SCRIPT_DIR"/wezterm.lua ~/.wezterm.lua

# wezterm shell integration
if [[ -L ~/.config/wezterm.sh ]]; then
   rm ~/.config/wezterm.sh
fi
ln -s "$SCRIPT_DIR"/shell_integration_config.sh ~/.config/wezterm.sh
