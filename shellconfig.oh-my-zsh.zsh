#!/usr/bin/env zsh

ZSH_CUSTOM="${0:a:h}/external/oh-my-zsh-custom"

plugins=(
    git
    fzf
    zsh-github-copilot
    kubectl
)

DISABLE_AUTO_TITLE=true

source $ZSH/oh-my-zsh.sh

# zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'm:[^a-zA-Z0-9~]=* l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=* l:[^a-zA-Z0-9~]|=** r:|[^a-zA-Z0-9~]=**'

# Command line editing
bindkey '^U' backward-kill-line

# zsh-github-copilot
bindkey '^|' zsh_gh_copilot_explain
bindkey '^\' zsh_gh_copilot_suggest
