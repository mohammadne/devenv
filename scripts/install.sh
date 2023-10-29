#!/bin/bash

# findout scripts directory path
scripts_directory="$(cd "$(dirname "${BASH_SOURCE[0]}")"/. && pwd)"

# source required files (core files are needed inside library files)
for core_file in "$scripts_directory/core"/*; do source "$core_file"; done
for library_file in "$scripts_directory/library"/*; do source "$library_file"; done

source_values "$scripts_directory/values.env"

# print_message "dotfiles" "ensure dotfiles repository is present with the latest changes"
# ensure_dotfiles "dotfiles"

function help() {
    echo "HELP"
    exit 0
}

function info() {
    echo "INFO"
    exit 0
}

function set() {
    # at least one argument should be passed
    if [ $# -ne 1 ]; then
        print_error "main" "invalid set arguments"
        help;
    fi

    source_values $1
}

function install() {
    echo "INSTALL"
    exit 0
}

# at least one argument should be passed
if [ $# -eq 0 ]; then help; fi

# Parse arguments 
while [ $# -gt 0 ]; do
    case $1 in
        --help) help ;;
        --info) info ;;
        --set) set $2; shift 2 ;;
        *) install_list+=("$1"); shift ;;
    esac
done

for module in "${install_list[@]}"; do
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
