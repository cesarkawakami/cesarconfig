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

# zsh-autocomplete, supersedes other completion configuration
. "$__ccfg_dir"/external/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# completion colors
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*' list-colors 'di=1:fi=96:*.m=31:*.py=32:*.txt=36:*.out=35'

# zsh-autosuggestions
. "$__ccfg_dir"/external/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf
. "$__ccfg_dir"/external/fzf/shell/completion.zsh
. "$__ccfg_dir"/external/fzf/shell/key-bindings.zsh

# git
unalias g git &> /dev/null || true
unfunction g git &> /dev/null || true
alias g='git-branchless wrap --'
alias git='git-branchless wrap --'
fpath=("$__ccfg_dir"/external/git-branchless/zsh $fpath)

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
