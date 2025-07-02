#!/bin/bash

# exit when any command fails
set -e

# Bootstrap homebrew (if not done already)
eval "$(/opt/homebrew/bin/brew shellenv)"

# for docker containers
brew install orbstack

# needed to build ruby
brew install libyaml

brew install gh # github cli

brew install mise

# system preferences
# enable key repeat on hold
defaults write -g ApplePressAndHoldEnabled 1
