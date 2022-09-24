#!/bin/bash

# exit when any command fails
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# vim setup
IDEAVIMRC_CONTENT="source $SCRIPT_DIR/shared.vim\nsource $SCRIPT_DIR/idea.vim"
if [[ -f ~/.ideavimrc ]]; then
   rm ~/.ideavimrc
fi
echo -e $IDEAVIMRC_CONTENT >> ~/.ideavimrc

# zsh setup
if [[ -L ~/.zshrc ]]; then
   rm ~/.zshrc
fi
ln -s "$SCRIPT_DIR"/.zshrc ~/.zshrc

if [[ -L ~/.zprofile ]]; then
   rm ~/.zprofile
fi
ln -s "$SCRIPT_DIR"/.zprofile ~/.zprofile

if [[ -L ~/.p10k.zsh ]]; then
   rm ~/.p10k.zsh
fi
ln -s "$SCRIPT_DIR"/.p10k.zsh ~/.p10k.zsh

if [[ ! -f "$SCRIPT_DIR"/private/alias.zsh ]]; then
   mkdir -p "$SCRIPT_DIR"/private
   touch "$SCRIPT_DIR"/private/alias.zsh
fi
if [[ -L ~/alias.zsh ]]; then
   rm ~/alias.zsh
fi
ln -s "$SCRIPT_DIR"/private/alias.zsh ~/alias.zsh
