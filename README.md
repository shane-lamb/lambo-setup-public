# lambo-setup-public
My mac setup: brew installs, zsh setup, etc.

# Configuring completions in zsh
https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
Additionally, if you receive “zsh compinit: insecure directories” warnings when attempting to load these completions, you may need to run this:
```bash
chmod -R go-w "$(brew --prefix)/share"
```