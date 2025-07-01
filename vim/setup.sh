#!/bin/bash

# exit when any command fails
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# vim setup
IDEAVIMRC_CONTENT="source $SCRIPT_DIR/shared.vim\nsource $SCRIPT_DIR/idea.vim"
if [[ -f ~/.ideavimrc ]]; then
   rm ~/.ideavimrc
fi
echo -e "$IDEAVIMRC_CONTENT" >> ~/.ideavimrc
