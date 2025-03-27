#!/usr/bin/env zsh

ZSH_CUSTOM="${0:a:h}/external/oh-my-zsh-custom"

plugins=(
    git
    fzf
    zsh-github-copilot
)

source $ZSH/oh-my-zsh.sh

# Command line editing
bindkey '^U' backward-kill-line

# zsh-github-copilot
bindkey '^|' zsh_gh_copilot_explain
bindkey '^\' zsh_gh_copilot_suggest
