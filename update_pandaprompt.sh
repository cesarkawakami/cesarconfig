#!/usr/bin/env bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$script_dir"

exec git subtree pull --prefix external/pandaprompt https://github.com/cesarkawakami/pandaprompt.git master --squash
