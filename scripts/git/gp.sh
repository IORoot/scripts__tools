#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 COMMIT_MESSAGE" >&2
    exit 1
fi

git add --all;
git commit $1;
git push;