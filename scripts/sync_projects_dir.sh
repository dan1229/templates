#!/usr/bin/env bash

# Use rsync to sync the projects directory to Google Drive

set -e # always immediately exit upon error

# directory config. ending slashes are important!
src_dir="projects/"
dest_dir="My Drive/projects/mbp-projects-backup/"

# run the sync
rsync -ar --delete \
  --filter=':- .gitignore' \
  --exclude='node_modules' \
  --exclude='.git' \
  --exclude='.DS_Store' \
  --chmod='F-w' \
  "$src_dir" "$dest_dir"

