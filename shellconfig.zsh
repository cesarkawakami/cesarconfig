HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history
setopt interactivecomments
setopt hist_ignore_dups

# Command line editing
bindkey -e
bindkey \^U backward-kill-line
autoload -U select-word-style
select-word-style bash

autoload -Uz compinit
compinit

# Where am I
__ccfg_dir=${0:a:h}


# fzf
. "$__ccfg_dir"/external/fzf/shell/completion.zsh
. "$__ccfg_dir"/external/fzf/shell/key-bindings.zsh

# git
alias g='git'

# Initialize starship if installed
if command -v starship &> /dev/null; then
  export STARSHIP_CONFIG="$__ccfg_dir"/starship/starship.toml
  eval "$(starship init zsh)"
  . "$__ccfg_dir"/starship/win-title-config.zsh
else
  # Pandaprompt
  . "$__ccfg_dir"/external/pandaprompt/pandaprompt.zsh
fi
