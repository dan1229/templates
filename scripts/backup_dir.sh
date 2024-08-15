#!/usr/bin/env bash

#
# type "crontab -e" to view active cron commands
# this should be one
#

set -e # always immediately exit upon error

# Check if script is run from the home directory
if [ "$PWD" != "$HOME" ]; then
    echo "Not in home dir. Attempting to switch..."
    cd "$HOME" || exit 1
fi

# Directory config. Ending slashes are important!
src_dir="TODO"  # the location from the home directory
dest_dir="TODO"  # the destination to back up to

# Check if source directory exists
if [ ! -d "$src_dir" ]; then
    echo "Source directory '$src_dir' does not exist."
    exit 1
fi

# Run the sync
# Ensure we ignore files we're not interested in backing up
rsync -ar --delete \
  --filter=':- .gitignore' \
  --exclude='node_modules' \
  --exclude='.git' \
  --exclude='.DS_Store' \
  --chmod='F-w' \
  "$src_dir" "$dest_dir"


  echo "Sync complete."
