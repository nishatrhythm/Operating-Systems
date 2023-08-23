#!/bin/bash

# Get the directory path from the user
echo -n "Enter the directory path: "
read directory

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Directory does not exist."
  exit 1
fi

# Find the largest file in the directory
largest_file=""
largest_size=0

for file in "$directory"/*; do
  if [ -f "$file" ]; then
    size=$(stat -c %s "$file")
    if [ "$size" -gt "$largest_size" ]; then
      largest_size="$size"
      largest_file="$file"
    fi
  fi
done

# Display the result
if [ -n "$largest_file" ]; then
  echo "The largest file is: $largest_file"
  echo "Size: $largest_size bytes"
else
  echo "No files found in the directory."
fi
