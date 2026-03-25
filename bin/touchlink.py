#!/usr/bin/env python3

import pathlib
import string
import sys
from random import SystemRandom


def _random_string() -> str:
    rng = SystemRandom()
    return "".join(rng.choice(string.ascii_letters) for _ in range(20))


def main() -> None:
    if len(sys.argv) != 2:
        print("Usage: touchlink.py <path>")
        sys.exit(1)

    path = pathlib.Path(sys.argv[1])
    if not path.is_symlink():
        print(f"{path} is not a symlink")
        sys.exit(1)

    target = path.readlink()
    tmp_link = path.parent / _random_string()
    tmp_link.symlink_to(target)
    tmp_link.rename(path)


if __name__ == "__main__":
    main()
