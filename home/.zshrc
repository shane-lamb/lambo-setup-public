# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOMEBREW_PREFIX/opt/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/.p10k.zsh ]] || source ~/.config/.p10k.zsh

source $HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
source $HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

source $HOMEBREW_PREFIX/opt/zinit/zinit.zsh
zinit snippet OMZ::plugins/globalias/globalias.plugin.zsh

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt HIST_IGNORE_ALL_DUPS
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
source $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh

source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/alias.zsh

path+=("$HOME/.local/bin") # Used by cloud_sql_proxy and pipenv

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Fix gcloud running in python 3 environment: https://gehrcke.de/2021/11/gcloud-on-python-3-10-module-collections-has-no-attribute-mapping/
# export CLOUDSDK_PYTHON="/usr/bin/python2"

alias java11='export JAVA_HOME=$HOMEBREW_PREFIX/Cellar/openjdk@11/11.0.15'
# default to Java11
java11

