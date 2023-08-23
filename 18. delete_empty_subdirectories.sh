#!/bin/bash

echo "Please enter a directory name:"
read directory

if [ -d "$directory" ]; then
  find "$directory" -type d -empty -delete
  echo "Empty subdirectories have been deleted."
else
  echo "$directory is not a valid directory."
fi
