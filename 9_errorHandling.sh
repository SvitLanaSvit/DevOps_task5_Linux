#!/bin/bash
# set -e 
# trap 'echo "An error occurred on line $LINENO. Script terminated." >&2' ERR

SOURCE_DIR=$1
FILE_NAME=$2

# Prompt  for source directory if not provided
if [ -z "$SOURCE_DIR" ]; then
    echo "Source directory not provided." 
    read -p "Please enter the source directory: " SOURCE_DIR
fi

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Prompt for file name if not provided
if [ -z "$FILE_NAME" ]; then
    echo "File name not provided."
    read -p "Please enter the file name: " FILE_NAME
fi

Check if the file exists in the source directory and readable
if [ -f "$SOURCE_DIR/$FILE_NAME" ] && [ -r "$SOURCE_DIR/$FILE_NAME" ]; then
    echo "File contents of '$FILE_NAME' in directory '$SOURCE_DIR':"
    cat "$SOURCE_DIR/$FILE_NAME"
else
    echo "Error: File '$FILE_NAME' does not exist or is not readable in directory '$SOURCE_DIR'."
    exit 1 
fi

# Can be used for tracing the script execution with set -e and trap commands
# cat "$SOURCE_DIR/$FILE_NAME"

