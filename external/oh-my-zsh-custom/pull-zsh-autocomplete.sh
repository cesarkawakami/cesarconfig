#!/usr/bin/env bash

set -xe

cd "$(git rev-parse --show-toplevel)"

plugin_dir="external/oh-my-zsh-custom/plugins/zsh-github-copilot"
repo_url="https://github.com/loiccoyle/zsh-github-copilot"
if [[ ! -d $plugin_dir ]]; then
    cmd=add
else
    cmd=pull
fi
git subtree "$cmd" --prefix "$plugin_dir" "$repo_url" main --squash -m "Update $repo_url"
