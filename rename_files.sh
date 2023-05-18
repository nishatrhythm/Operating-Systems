#!/bin/bash

# set the directory path
dir_path=/home/rhythm/aaa

# navigate to the directory
cd "$dir_path"

# loop through all files in the directory
for file in *; do
  # add "new_" prefix to file name
  new_file="new_$file"

  # rename the file
  mv "$file" "$new_file"
done
