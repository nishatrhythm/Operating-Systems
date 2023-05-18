#!/bin/bash

# Prompt the user for the directory name
read -p "Enter a directory name: " directory

# Check if the directory exists
if [[ ! -d $directory ]]; then
  echo "Error: Directory does not exist"
  exit 1
fi

# Find all files within the directory and its subdirectories
# and compute their MD5 hash
find "$directory" -type f -exec md5sum {} + | sort >/tmp/files.md5

# Find all duplicate files based on their MD5 hash
awk '{
  if ($1 in seen) {
    if (!($1 in duplicates)) {
      print "Original: " seen[$1]
      duplicates[$1] = 1
    }
    print "Duplicate: " $2
  } else {
    seen[$1] = $2
  }
}' /tmp/files.md5 | sort -u

# Remove the temporary file
rm /tmp/files.md5
