#!/bin/bash

BOOTSTRAP_FILE="./bootstrap.sh"

changed_files="$(git diff-tree -r --name-only --no-commit-id HEAD@{0} HEAD@{1} $1)"

check_file() {
    echo "$changed_files" | grep --quiet "$1" && eval "$2"
}

if [ -f "$BOOTSTRAP_FILE" ]; then
    check_file $BOOTSTRAP_FILE "touch ./file_changed.txt"
fi
