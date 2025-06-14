#!/bin/bash

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

# Check if the file exists in the source directory
if [ ! -f "$SOURCE_DIR/$FILE_NAME" ]; then
    echo "File '$FILE_NAME' does not exist in directory '$SOURCE_DIR'."
    exit 1
fi

# Print the numser of lines in the file
LINE_COUNT=$(wc -l < "$SOURCE_DIR/$FILE_NAME")
echo "The file '$FILE_NAME' in directory '$SOURCE_DIR' has $LINE_COUNT lines."
