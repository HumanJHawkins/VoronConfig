#!/bin/bash
# Path to your config folder
TARGET=~/printer_data/config

# Watch for 'modify' or 'create' events, ignoring the .git folder
inotifywait -m -r -e modify,create,delete --exclude '\.git' "$TARGET" |
    while read -r directory events filename; do
        # When a change is detected, wait 5 seconds (to catch batch saves) then sync
        sleep 5
        ~/printer_data/autocommit.sh
    done
