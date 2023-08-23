#!/bin/bash

# Get the file name from the user.
echo "Enter the file name:"
read filename

# Check if the file exists.
if [ -f "$filename" ]; then
  echo "File exists"
else
  echo "File does not exist"
fi
