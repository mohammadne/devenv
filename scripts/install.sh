#!/bin/bash

# findout scripts directory path
scripts_directory="$(cd "$(dirname "${BASH_SOURCE[0]}")"/. && pwd)"

# source environemt values
source "$scripts_directory/values.env"

# source library files into the script
for library_file in "$scripts_directory/library"/*; do source "$library_file"; done

print_message "dotfiles" "ensure dotfiles repository is present and has the latest changes"
error_message=$(ensure_dotfiles)
if [ $? -ne 0 ]; then print_error "dotfiles" $error_message; fi

print_message "$1" ""
source "$scripts_directory/src/$1"
