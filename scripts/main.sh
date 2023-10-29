#!/bin/bash

# findout scripts directory path
scripts_directory="$(cd "$(dirname "${BASH_SOURCE[0]}")"/. && pwd)"

# source required files (core files are needed inside library files)
for core_file in "$scripts_directory/core"/*; do source "$core_file"; done
for library_file in "$scripts_directory/library"/*; do source "$library_file"; done

source_values_file "$scripts_directory/values.env"

print_message "dotfiles" "ensure dotfiles repository is present with the latest changes"
ensure_dotfiles "dotfiles"

# TODO: add (--set, --install, --help, --info) as arguments
for module in "${@}"; do
    echo # a newline to seperate modules from each others

    source "$scripts_directory/modules/$module.sh" 2>/dev/null || {
        print_error $module "404 module not found -(("
        continue
    }

    if declare -f run &> /dev/null; then
        if declare -f info &> /dev/null; then
            print_message $module $(info)
        fi

        if ! run $module; then
            print_error $module "exited with an error, exiting the installer ..."
            exit 1
        fi
    else
        print_warning $module "run function not found, there is nothing to do"
    fi
done
