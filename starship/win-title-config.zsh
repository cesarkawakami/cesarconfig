#!/usr/bin/env zsh

set_win_title() {
    local win_title=$(print -P "%~")
    echo -ne "\033]0;${win_title}\007"
}

precmd_functions+=(set_win_title)
