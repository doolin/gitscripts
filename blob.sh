#!/bin/sh

blob=9e7d5d96bc555411b3da1aff0ac3dc8631a19a18

git rev-list --all |
while read commit; do
    if git ls-tree -r $commit | grep -q $blob; then
        echo $commit
    fi
done
