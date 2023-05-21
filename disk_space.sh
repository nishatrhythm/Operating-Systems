#!/bin/bash

# Function to calculate total disk space used by a user
calculate_user_space() {
    user=$1
    total_space=0

    # Loop through all files and directories owned by the user
    while IFS= read -r line; do
        size=$(echo "$line" | awk '{print $1}')
        file=$(echo "$line" | awk '{print $2}')
        total_space=$((total_space + size))
        echo "$file"
    done < <(find "$directory" -type f -user "$user" -exec du -b {} + 2>/dev/null)

    echo "Total disk space used by user '$user': $total_space bytes"
    echo
}

# Main script
read -p "Enter the directory name: " directory

# Check if the directory exists
if [[ ! -d "$directory" ]]; then
    echo "Directory does not exist!"
    exit 1
fi

# Loop through all unique users within the directory
users=$(find "$directory" -type f -printf "%u\n" 2>/dev/null | sort -u)
for user in $users; do
    calculate_user_space "$user"
done

