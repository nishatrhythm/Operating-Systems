#!/bin/bash

# Get the directory name from the user
echo "Enter the directory name to archive:"
read directory_name

# Check if the directory exists
if [[ ! -d "$directory_name" ]]; then
  echo "The directory '$directory_name' does not exist."
  exit 1
fi

# Create a compressed archive of the directory
tar -zcvf ${directory_name}.tar.gz -C ${directory_name} . --exclude='*/*'

# Display a success message
echo "The archive has been created successfully."
