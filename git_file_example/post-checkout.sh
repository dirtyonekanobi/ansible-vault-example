#!/bin/bash

changed_files="$(git diff-tree -r --name-only --no-commit-id $1 $2)"

echo "COMMENTS"
