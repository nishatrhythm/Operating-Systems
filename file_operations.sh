#!/bin/bash

while true; do
    echo "Select an option:"
    echo "1. Create a file"
    echo "2. Rename a file"
    echo "3. Delete a file"
    echo "4. Exit"

    read choice

    case $choice in
    1)
        echo "Enter the name of the file to create:"
        read filename
        touch $filename
        echo "File created: $filename"
        ;;
    2)
        echo "Enter the name of the file to rename:"
        read oldname
        echo "Enter the new name of the file:"
        read newname
        mv $oldname $newname
        echo "File renamed from $oldname to $newname"
        ;;
    3)
        echo "Enter the name of the file to delete:"
        read filename
        rm $filename
        echo "File deleted: $filename"
        ;;
    4)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid option. Please try again."
        ;;
    esac
done
