# lambo-setup-public
My mac setup: brew installs, zsh setup, etc.

# Steps
1. Run `setup1.sh` script remotely:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/shane-lamb/lambo-setup-public/HEAD/setup1.sh)"
```
2. Run `setup2.sh` locally once the repo has been cloned.

# Homebrew: Configuring completions in zsh
https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
Additionally, if you receive “zsh compinit: insecure directories” warnings when attempting to load these completions, you may need to run this:
```bash
chmod -R go-w "$(brew --prefix)/share"
```

# IntelliJ plugins
- Darcula Darker Theme
- IdeaVim (+ related plugins: IdeaVim-Quickscope, Which-Key and IdeaVim-EasyMotion(w/ AceJump))
