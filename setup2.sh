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
if [[ -d "/opt/homebrew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)" # for M1
else
    eval "$(/usr/local/bin/brew shellenv)" # for Intel
fi

# vim setup
IDEAVIMRC_CONTENT="source $VIM/shared.vim\nsource $VIM/idea.vim"
if [[ -f ~/.ideavimrc ]]; then
   rm ~/.ideavimrc
fi
echo -e $IDEAVIMRC_CONTENT >> ~/.ideavimrc

# zsh setup
brew install zsh \
             romkatv/powerlevel10k/powerlevel10k \
             zinit \
             zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting \
             asdf # node/python/etc version manager

brew install --cask google-cloud-sdk
gcloud components install cloud_sql_proxy --quiet

if [[ -L ~/.zshrc ]]; then
   rm ~/.zshrc
fi
ln -s "$H"/.zshrc ~/.zshrc

if [[ -L ~/.zprofile ]]; then
   rm ~/.zprofile
fi
ln -s "$H"/.zprofile ~/.zprofile

if [[ -L ~/.config/.p10k.zsh ]]; then
   rm ~/.config/.p10k.zsh
fi
ln -s "$H"/.config/.p10k.zsh ~/.config/.p10k.zsh

if [[ ! -f $PRIVATE/alias.zsh ]]; then
   touch "$PRIVATE"/alias.zsh
fi
if [[ -L ~/alias.zsh ]]; then
   rm ~/alias.zsh
fi
ln -s "$PRIVATE"/alias.zsh ~/alias.zsh

# asdf setup
asdf plugin add nodejs || true
asdf plugin add ruby || true
if [[ -L ~/.asdfrc ]]; then
   rm ~/.asdfrc
fi
ln -s "$H"/.asdfrc ~/.asdfrc

# git
if [[ -L ~/.gitconfig ]]; then
   rm ~/.gitconfig
fi
ln -s "$H"/.gitconfig ~/.gitconfig

if [[ -L ~/.config/global.gitignore ]]; then
   rm ~/.config/global.gitignore
fi
ln -s "$H"/.config/global.gitignore ~/.config/global.gitignore

# ssh config
if [[ -L ~/.ssh/config ]]; then
   rm ~/.ssh/config
fi
ln -s "$H"/.ssh/config ~/.ssh/config

# other stuff
brew install gh `#github cli` \
     firebase-cli
brew install --cask obsidian \
                    karabiner-elements \
                    docker \
                    wezterm \
                    raycast \
                    jetbrains-toolbox

# karabiner-elements
if [[ -L ~/.config/karabiner/karabiner.json ]]; then
   rm ~/.config/karabiner/karabiner.json
fi
ln -s "$SCRIPT_DIR"/karabiner.json ~/.config/karabiner/karabiner.json

# wezterm config
if [[ -L ~/.wezterm.lua ]]; then
   rm ~/.wezterm.lua
fi
ln -s "$H"/.wezterm.lua ~/.wezterm.lua

# wezterm shell integration
if [[ -L ~/.config/wezterm.sh ]]; then
   rm ~/.config/wezterm.sh
fi
ln -s "$H"/.config/wezterm.sh ~/.config/wezterm.sh
