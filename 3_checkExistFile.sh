#!/bin/bash

read -p "Please enter filename to check if exists in the current directory: " filename

if [ -e ./$filename ]; then
    echo "File '$filename' exists in the current directory."
else
    echo "File '$filename' does not exist in the current directory."
fi