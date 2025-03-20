#!/usr/bin/env bash

set -xe

cd "$(git rev-parse --show-toplevel)"

plugin_dir="external/zsh-plugins/zsh-autocomplete"
if [[ ! -d $plugin_dir ]]; then
    cmd=add
else
    cmd=pull
fi
git subtree "$cmd" --prefix "$plugin_dir" https://github.com/marlonrichert/zsh-autocomplete.git 25.03.19 --squash -m "Update zsh-autocomplete"
