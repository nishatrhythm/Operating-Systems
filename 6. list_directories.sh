#!/bin/bash

# Prompt the user to enter a directory name
echo "Enter a directory name:"
read directory_name

# Change the current directory to the directory that the user entered
cd "$directory_name"

# Recursively list all files and subdirectories in the current directory
find . -type f -o -type d
