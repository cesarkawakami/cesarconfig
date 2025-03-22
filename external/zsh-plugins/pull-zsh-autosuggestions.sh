#!/usr/bin/env bash

set -xe

cd "$(git rev-parse --show-toplevel)"

plugin_dir="external/zsh-plugins/zsh-autosuggestions"
if [[ ! -d $plugin_dir ]]; then
    cmd=add
else
    cmd=pull
fi
git subtree "$cmd" --prefix "$plugin_dir" https://github.com/zsh-users/zsh-autosuggestions v0.7.1 --squash -m "Update zsh-autosuggestions"
