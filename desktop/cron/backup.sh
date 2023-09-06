#!/bin/bash

BACKUP_DIR="$HOME/Dropbox/backup"
FILES_TO_BACKUP=(
    "$HOME/.zsh_history"
)

for src in "$FILES_TO_BACKUP"; do
    fname=$(basename "$src")
    dest="$BACKUP_DIR/$fname"
    echo "$(date -u +"%Y-%m-%dT%H:%M:%SZ") Copying $src to $dest"
    mv "$BACKUP_DIR/$fname" "$BACKUP_DIR/$fname.bak"
    cp "$src" "$BACKUP_DIR/$fname"
done
