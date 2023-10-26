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

for module in "${@}"; do
    source "$scripts_directory/modules/$module.sh" 2>/dev/null || {
        print_error $module "404 module not found -(("
        continue
    }

    if declare -f run &> /dev/null; then
        if declare -f info &> /dev/null; then
            print_message $module $(info)
        fi
        run $module
    else
        print_warning $module "run function not found, there is nothing to do"
    fi
done
