#!/bin/bash

# exit when any command fails
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

files=(
  ".zshrc"
  ".zprofile"
  ".gitconfig"
  "global.gitignore .config"
  ".p10k.zsh .config"
  "globalias.plugin.zsh .config/zsh"
  "config .ssh"
)

for entry in "${files[@]}"; do
  read -r filename subdir <<<"$entry"

  if [[ -n "$subdir" ]]; then
    mkdir -p "$HOME/$subdir"
    mkdir -p "$SCRIPT_DIR/$subdir"

    base_file="$SCRIPT_DIR/base/$subdir/$filename"
    src_file="$SCRIPT_DIR/$subdir/$filename"
    dst_file="$HOME/$subdir/$filename"
  else
    base_file="$SCRIPT_DIR/base/$filename"
    src_file="$SCRIPT_DIR/$filename"
    dst_file="$HOME/$filename"
  fi

  if [[ -e "$dst_file" ]]; then
    if [[ ! -e "$src_file" ]]; then
      cp "$dst_file" "$src_file"
    fi
    rm "$dst_file"
  fi

  if [[ ! -e "$src_file" ]]; then
    cp "$base_file" "$src_file"
  fi

  ln -s "$src_file" "$dst_file"
done

# Bootstrap homebrew (if not done already)
eval "$(/opt/homebrew/bin/brew shellenv)"

# zsh setup
brew install zsh \
             powerlevel10k \
             zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting
