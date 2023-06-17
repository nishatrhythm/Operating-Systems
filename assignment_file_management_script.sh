#!/bin/bash

# File and Directory Management Script

# Displays the main menu
function display_menu() {
    echo "
---------------------------------------------------
Welcome to the File Manager!
What would you like to do?
1. Move files
2. Rename files
3. Create directories
4. Delete directories
5. Delete files
6. Delete old files
7. Help
8. Quit
---------------------------------------------------"
}

# Validates non-empty input
function validate_input() {
    local input="$1"
    if [[ -z $input ]]; then
        echo "Error: Input cannot be empty."
        return 1
    fi
}

# Moves a file from source to destination
function move_file() {
    echo "Moving files..."
    read -p "Enter the source path: " source_path

    [[ -f $source_path ]] || { echo "File $source_path does not exist."; return 1; }

    read -p "Enter the destination path: " destination_path

    [[ -e $destination_path ]] && mv "$source_path" "$destination_path" && echo "Moved file from $source_path to $destination_path" || echo "Destination path $destination_path does not exist."
}

# Renames a file
function rename_file() {
    echo "Renaming files..."
    read -p "Enter the current name (optional - file path): " current_name

    validate_input "$current_name" || return 1

    [[ -f $current_name ]] || { echo "File $current_name does not exist."; return 1; }

    read -p "Enter the new name: " new_name

    validate_input "$new_name" || return 1

    [[ ! -e $new_name ]] && mv "$current_name" "$new_name" && echo "Renamed file from $current_name to $new_name" || echo "File or directory $new_name already exists."
}

# Creates a new directory
function create_directory() {
    echo "Creating directories..."
    read -p "Enter the directory name: " directory_name

    validate_input "$directory_name" || return 1

    [[ -d $directory_name ]] && echo "Directory $directory_name already exists." || { mkdir "$directory_name" && echo "Created directory $directory_name"; }
}

# Deletes an existing directory
function delete_directory() {
    echo "Deleting directories..."
    read -p "Enter the directory name: " directory_name

    validate_input "$directory_name" || return 1

    [[ ! -d $directory_name ]] && { echo "Directory $directory_name does not exist."; return 1; }
    [[ -n $(ls -A "$directory_name") ]] && { echo "Directory $directory_name is not empty. Please delete all contents before deleting the directory."; return 1; }

    rmdir "$directory_name" && echo "Deleted directory $directory_name"
}

# Deletes a file
function delete_file() {
    echo "Deleting files..."
    read -p "Enter the file name or path: " file_name

    validate_input "$file_name" || return 1

    [[ ! -f $file_name ]] && { echo "File $file_name does not exist."; return 1; }

    rm "$file_name" && echo "Deleted file $file_name"
}

# Deletes files that haven't been accessed for a specified number of days
function delete_old_files() {
    echo "Deleting old files..."
    read -p "Enter the number of days to keep files: " days

    validate_input "$days" || return 1

    find . -type f -mtime +$days -delete && echo "Deleted old files older than $days days"
}

# Displays help information
function display_help() {
    echo "This script is designed to facilitate efficient management of files and directories. It offers automated solutions for tasks such as file relocation, renaming, directory creation, and deletion of old files. By streamlining these operations, it aims to enhance productivity and organization in file management workflows."
}

# Main script execution
while true; do
    display_menu

    # Get user input
    read -p "Enter your selection: " task

    # Validate user input
    [[ $task =~ ^[1-8]$ ]] || { echo "Error: Invalid selection. Please enter a number between 1 and 8."; continue; }

    # Perform the selected task
    case $task in
        1) move_file ;;
        2) rename_file ;;
        3) create_directory ;;
        4) delete_directory ;;
        5) delete_file ;;
        6) delete_old_files ;;
        7) display_help ;;
        8) echo "Thank you for using this program."$'\n'; exit 0 ;;
    esac

    # Ask if the user wants to start over
    while true; do
        read -p $'\nDo you want to start over? (Y/N): ' start_over

        case $start_over in
            [Yy])
                clear
                break
                ;;
            [Nn])
                echo "Thank you for using this program."
                echo
                exit 0
                ;;
            *)
                echo "Invalid input. Please enter 'Y' or 'N'."
                ;;
        esac
    done
done
