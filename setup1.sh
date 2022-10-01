#!/bin/bash

# exit when any command fails
set -e

# ssh setup
if [[ ! -f ~/.ssh/id_ed25519 ]]; then
  ssh-keygen -f ~/.ssh/id_ed25519 -C shanelamb1@gmail.com -t ed25519
fi
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# copying the public key to clipboard (so it can be pasted in the next step)
pbcopy < ~/.ssh/id_ed25519.pub

# now register the public key with your github account
open "https://github.com/settings/keys"

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# make a source directory
mkdir -p ~/source

# checkout the setup repo (then continue with setup2.sh)
cd ~/source && git clone git@github.com:shane-lamb/lambo-setup-public.git
