#!/bin/bash

# exit when any command fails
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
H=$SCRIPT_DIR/home
VIM=$SCRIPT_DIR/vim
PRIVATE=$SCRIPT_DIR/private
if [[ ! -d $PRIVATE ]]; then
   mkdir "$PRIVATE"
fi

# Bootstrap homebrew (if not done already)
eval "$(/opt/homebrew/bin/brew shellenv)"

# for docker containers
brew install orbstack

# needed to build ruby
brew install libyaml

# install asdf: node/python/etc version manager
if [[ ! -d ~/.asdf ]]; then
   git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
fi

# asdf setup
asdf plugin add nodejs || true
asdf plugin add ruby || true
if [[ -L ~/.asdfrc ]]; then
   rm ~/.asdfrc
fi
ln -s "$H"/.asdfrc ~/.asdfrc

brew install gh # github cli

# system preferences
# enable key repeat on hold
defaults write -g ApplePressAndHoldEnabled 1
