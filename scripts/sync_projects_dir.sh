#!/usr/bin/env bash

set -e # always immediately exit upon error

# Check if script is run from the home directory
if [ "$PWD" != "$HOME" ]; then
    echo "Not in home dir. Attempting to switch..."
    cd "$HOME" || exit 1
fi

# Directory config. Ending slashes are important!
src_dir="projects/"
dest_dir="My Drive/projects/mbp-projects-backup/"

# Check if source directory exists
if [ ! -d "$src_dir" ]; then
    echo "Source directory '$src_dir' does not exist."
    exit 1
fi

# Run the sync
rsync -ar --delete \
  --filter=':- .gitignore' \
  --exclude='node_modules' \
  --exclude='.git' \
  --exclude='.DS_Store' \
  --chmod='F-w' \
  "$src_dir" "$dest_dir"
