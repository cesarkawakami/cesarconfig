# cesarconfig
User shell and utilities configuration

## ZSH
Add to `~/.zshrc`:
```
. ~/cesarconfig/shellconfig.zsh
```

## Oh-My-ZSH
Replace the `source $ZSH/oh-my-zsh.sh` line with (don't use the config above):
```
. ~/cesarconfig/shellconfig.oh-my-zsh.zsh
```

## Starship
Add to `~/.zshrc`:
```
export STARSHIP_CONFIG=~/cesarconfig/starship/starship.toml
eval "$(starship init zsh)"

# For setting window title
. ~/cesarconfig/starship/win-title-config.zsh
```


## Bash (TODO)
Add to `~/.bashrc`:
```
. ~/cesarconfig/shellconfig.bash
```

## Tmux
Add to `~/.tmux.conf`:
```
source-file ~/cesarconfig/tmux.conf
```

To force tmux to use zsh (change to `/usr/local/bin/zsh` if needed):
```
set-option -g default-shell /bin/zsh
```

## Atuin (smart shared history)
```
ln -sf ~/cesarconfig/atuin_config.toml ~/.config/atuin/config.toml
```


## Git
Add to `~/.gitconfig`:
```
[include]
    path = ~/cesarconfig/gitconfig
```

## IdeaVIM
Add to `~/.ideavimrc`:
```
source ~/cesarconfig/ideavimrc
```

## WezTerm
Add to `~/.wezterm.lua`:
```
local wezterm = require "wezterm"
package.path = string.format("%s;%s/cesarconfig/wezterm/?.lua", package.path, wezterm.home_dir)
local cesarconfig = require 'cesarconfig'
local config = {}
cesarconfig.apply_to_config(config)
return config
```

## PowerShell (>= 6.x)
Add to `$PROFILE`, e.g. `C:\Users\me\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`:
```
. ~/cesarconfig/shellconfig.ps1
```


## Fonts

### GitHub Monaspace

https://monaspace.githubnext.com/

```
Font Name:           Monaspace Neon
Normal font weight:  400
Bold font weight:    700

# macOS
brew install font-monaspace
```


## Aider

### Commit prompt

```
commit-prompt: |
  You are an expert software engineer that generates concise, one-line Git
  commit messages based on the provided diffs.  Review the provided context and
  diffs which are about to be committed to a git repo.  Review the diffs
  carefully. Generate a one-line commit message for those changes.

  Ensure the commit message:
  - Is in the imperative mood (e.g., "add feature" not "added feature" or "adding feature").
  - Does not exceed 100 characters.

  Reply only with the one-line commit message, without any additional text, explanations,
  or line breaks.
```
