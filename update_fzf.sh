#!/usr/bin/env bash

url='https://github.com/junegunn/fzf/releases/download/0.43.0/fzf-0.43.0-linux_amd64.tar.gz'
target=external/fzf

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
cd "$script_dir" || exit 1

rm -rf "$target"

mkdir -p "$target/bin"
curl -L "$url" | tar -C "$target/bin" -xz

mkdir -p "$target/shell"
for fn in {completion,key-bindings}.{bash,zsh}; do
    curl -L 'https://raw.githubusercontent.com/junegunn/fzf/master/shell/'"$fn" -o "$target/shell/$fn"
done
