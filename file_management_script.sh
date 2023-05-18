#!/bin/bash

# This script simplifies the process of managing files and directories.
# It automates common tasks like moving or renaming files, creating new directories,
# and deleting old files.

# Menu System

# Create a simple menu-driven interface that presents users with options for file
# and directory management tasks.
clear

while true; do
	echo ""
	echo "-----------------------------------------------------------------------------"
	echo "Welcome to the File Manager!"
	echo "What would you like to do?"
	echo "1. Move files"
	echo "2. Rename files"
	echo "3. Create directories"
	echo "4. Delete directories"
	echo "5. Delete files"
	echo "6. Delete old files"
	echo "7. Help"
	echo "8. Quit"
	echo "-----------------------------------------------------------------------------"

	# Get user input

	read -p "Enter your selection: " selection

	# Validate user input

	while [[ $selection -lt 1 || $selection -gt 8 ]]; do
		echo "Invalid selection. Please enter a valid number between 1 and 8."
		read -p "Enter your selection: " selection
	done

	# Perform the selected task

	case $selection in
	1) # Move files
		echo "Moving files..."
		read -p "Enter the source path: " source_path
		read -p "Enter the destination path: " destination_path

		if [[ ! -f $source_path ]]; then
			echo "File $source_path does not exist."
			continue
		fi
		if [[ -e $destination_path ]]; then
			echo "File or directory $destination_path already exists."
			continue
		fi
		mv "$source_path" "$destination_path"
		echo "Moved file from $source_path to $destination_path"

		;;

	2) # Rename files
		echo "Renaming files..."
		read -p "Enter the current name: " current_name
		read -p "Enter the new name: " new_name

		if [[ ! -f $current_name ]]; then
			echo "File $current_name does not exist."
			continue
		fi
		if [[ -e $new_name ]]; then
			echo "File or directory $new_name already exists."
			continue
		fi
		mv "$current_name" "$new_name"
		echo "Renamed file from $current_name to $new_name"

		;;

	3) # Create directories
		echo "Creating directories..."
		read -p "Enter the directory name: " directory_name
		if [[ -d $directory_name ]]; then
			echo "Directory $directory_name already exists."
			continue
		fi
		mkdir "$directory_name"
		echo "Created directory $directory_name"

		;;

	4) # Delete directories
		echo "Deleting directories..."
		read -p "Enter the directory name: " directory_name
		if [[ ! -d $directory_name ]]; then
			echo "Directory $directory_name does not exist."
			continue
		fi
		if [[ -e $directory_name/* ]]; then
			echo "Directory $directory_name is not empty. Please delete all contents before deleting the directory."
			continue
		fi
		rmdir "$directory_name"
		echo "Deleted directory $directory_name"

		;;

	5) # Delete files
		echo "Deleting files..."
		read -p "Enter the file name or path: " file_name
		if [[ ! -f $file_name ]]; then
			echo "File $file_name does not exist."
			continue
		fi
		rm "$file_name"
		echo "Deleted file $file_name"

		;;

	6) # Delete old files
		echo "Deleting old files..."
		read -p "Enter the number of days to keep files: " days
		find . -type f -mtime +$days -delete
		echo "Deleted old files  $days"

		;;

	7) # Help
		echo "This script simplifies the process of managing files and directories. It automates common tasks like moving or renaming files, creating new directories, and deleting old files."
		;;

	8) # Quit
		echo "Goodbye!"
		exit 0
		;;
	esac

done
