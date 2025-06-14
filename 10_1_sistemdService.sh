#!/bin/bash

WATCH_DIR="$HOME/watch"

# Create the watch directory if it doesn't exist
mkdir -p "$WATCH_DIR"

echo "Monitoring directory: $WATCH_DIR"

# Watch for new files in the directory
inotifywait -m -r -e create --format '%w%f' "$WATCH_DIR" | while read FILE; do
    # if the file is a regular file
    if [ -f "$FILE" ]; then
        echo "New file detected: $(basename "$FILE")"
        echo "Content:"
        cat "$FILE"
        mv "$FILE" "$FILE.back"
        echo "Renamed to: $(basename "$FILE").back"
    fi
done