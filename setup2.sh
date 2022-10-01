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
             powerlevel10k \
             zinit \
             zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting \
             asdf # node/python/etc version manager
brew install --cask google-cloud-sdk

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

# git
if [[ -L ~/.gitconfig ]]; then
   rm ~/.gitconfig
fi
ln -s "$H"/.gitconfig ~/.gitconfig

if [[ -L ~/.config/global.gitignore ]]; then
   rm ~/.config/global.gitignore
fi
ln -s "$H"/.config/global.gitignore ~/.config/global.gitignore

# other stuff
brew install gh `#github cli` \
     kubernetes-cli \
     firebase-cli

# todo
# brew install --cask intellij-idea
# brew install --cask obsidian
