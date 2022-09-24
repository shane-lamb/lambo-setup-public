# start pyenv setup
# if command -v pyenv 1>/dev/null 2>&1; then
# eval "$(pyenv init - zsh)"
# fi
# 
# export PATH="$HOME/.pyenv/shims:$PATH"
# export PATH="/usr/local/bin:$PATH"
# 
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
# end pyenv setup

# export ANDROID_HOME=~/Library/Android/sdk
# export ANDROID_SDK_ROOT=~/Library/Android/sdk
# export ANDROID_AVD_HOME=~/.android/avd
path+=("$HOME/Library/Android/sdk/platform-tools")
path+=("$HOME/Library/Android/sdk/emulator")

# Seems to be necessary to bootstrap brew on M1
eval "$(/opt/homebrew/bin/brew shellenv)"

# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:${FPATH}"

# setup asdf
. $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

