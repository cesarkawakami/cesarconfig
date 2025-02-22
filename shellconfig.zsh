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

# Where am I
__ccfg_dir=${0:a:h}

# Completion: fallback to completing basic paths
zstyle ':completion:*' completer _complete _approximate _files

# Completion: show menu if ambiguous
zstyle ':completion:*' menu yes=1 select=1 interactive search
zstyle ':completion:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

# fzf
. "$__ccfg_dir"/external/fzf/shell/completion.zsh
. "$__ccfg_dir"/external/fzf/shell/key-bindings.zsh

# git
unalias g git &> /dev/null || true
unfunction g git &> /dev/null || true
alias g='git-branchless wrap --'
alias git='git-branchless wrap --'
fpath=("$__ccfg_dir"/external/git-branchless/zsh $fpath)

# Allowing tab to select next menu item
zmodload zsh/complist
bindkey -M menuselect '^I' down-line-or-history  # tab
bindkey -M menuselect '^[[Z' reverse-menu-complete  # shift-tab

# Init completion (must be after configuration)
autoload -Uz compinit
compinit

# Initialize starship if installed
if command -v starship &> /dev/null; then
  export STARSHIP_CONFIG="$__ccfg_dir"/starship/starship.toml
  eval "$(starship init zsh)"
  . "$__ccfg_dir"/starship/win-title-config.zsh
else
  # Pandaprompt
  . "$__ccfg_dir"/external/pandaprompt/pandaprompt.zsh
fi

# Initialize direnv if installed
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi
