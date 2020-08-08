#!/bin/bash -e

# latest.dump is the big one

git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch public/assets/active_admin-4f6688e34660afd3df24c5216c87ceb0.js' \
  --prune-empty --tag-name-filter cat -- --all
