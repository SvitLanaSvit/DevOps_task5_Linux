#!/bin/bash

SOURCE_FILE=$1
DESTINATION_DIR=$2

# Checking if both source file and destination directory are provided
if [ -z "$SOURCE_FILE" ]; then
    echo "Source file not provided."
    read -p "Please enter the source file name: " SOURCE_FILE
fi

# Checking if the source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Source file '$SOURCE_FILE' does not exist."
    exit 1
fi

# Prompting for destination directory if not provided
if [ -z "$DESTINATION_DIR" ]; then
    echo "Destination directory not provided."
    read -p "Please enter the destination directory name: " DESTINATION_DIR
fi

# Checking if the destination directory exists
if [ ! -d "$DESTINATION_DIR" ]; then
    echo "Destination directory '$DESTINATION_DIR' does not exist."
    read -p "Do you want to create it? (y/n): " ANSWER
    case "$ANSWER" in
        y|Y )
            mkdir -p "$DESTINATION_DIR"
            if [ ! -d "$DESTINATION_DIR" ]; then
                echo "Failed to create destination directory '$DESTINATION_DIR'."
                exit 1
            fi
            ;;
        n|N )
            echo "Exiting without copying."
            exit 1
            ;;
        * )
            echo "Please answer y or n."
            exit 1
            ;;
    esac
fi

echo "Copying file '$SOURCE_FILE' to '$DESTINATION_DIR'..."

# Copying the file
cp "$SOURCE_FILE" "$DESTINATION_DIR"

# Checking if the file was copied successfully
if [ -e "$DESTINATION_DIR/$(basename "$SOURCE_FILE")" ]; then
    echo "File '$SOURCE_FILE' copied successfully to '$DESTINATION_DIR'."
else
    echo "Failed to copy file '$SOURCE_FILE' to '$DESTINATION_DIR'."
    exit 1
fi
