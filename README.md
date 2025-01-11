# cesarconfig
User shell and utilities configuration

## ZSH
Add to `~/.zshrc`:
```
. ~/cesarconfig/shellconfig.zsh
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

### WezTerm
Add to `~/.wezterm.lua`:
```
package.path = string.format("%s;%s/cesarconfig/wezterm/?.lua", package.path, os.getenv("HOME"))
local cesarconfig = require 'cesarconfig'
local config = {}
cesarconfig.apply_to_config(config)
return config
```
