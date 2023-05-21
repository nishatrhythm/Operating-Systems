#!/bin/bash

# Prompt user for file name and substitution key
read -p "Enter the file name: " file_name
read -p "Enter the substitution key: " substitution_key

# Check if the file exists
if [[ ! -f "$file_name" ]]; then
  echo "File '$file_name' does not exist."
  exit 1
fi

# Create a new file name for the encrypted file
encrypted_file="${file_name}.encrypted"

# Perform substitution cipher encryption
encrypted_content=$(tr 'A-Za-z' "$substitution_key" < "$file_name")

# Write encrypted content to the new file
echo "$encrypted_content" > "$encrypted_file"

echo "File successfully encrypted. Encrypted file: $encrypted_file"

