#!/bin/bash

# findout scripts directory path
scripts_directory="$(cd "$(dirname "${BASH_SOURCE[0]}")"/. && pwd)"

# source required files (core files are needed inside library files)
for core_file in "$scripts_directory/core"/*; do source "$core_file"; done
for library_file in "$scripts_directory/library"/*; do source "$library_file"; done

source_values "$scripts_directory/values.env"

function help_command() {
    echo "HELP"
    exit 0
}

function set_command() {
    # at least one argument should be passed
    if [ $# -ne 1 ]; then
        print_error "set" "invalid number of arguments"
        help;
    fi
    
    source_values $1
}

# Parse arguments
while [ $# -gt 0 ]; do
    case $1 in
        --help) help_command ;;
        --set) set_command $2; shift 2 ;;
        *) modules_list+=("$1"); shift ;;
    esac
done

function install_module() {
    local module=$1
    
    source "$scripts_directory/modules/$module.sh" 2>/dev/null || {
        print_error $module "404 module not found -(("
        return
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
}

print_message "dotfiles" "ensure dotfiles repository is present with the latest changes"
ensure_dotfiles "dotfiles" && echo

# at least one argument should be passed
if [ -z "${modules_list}" ] || [ "${modules_list[@]}" -eq 0 ]; then
    print_warning "devenv" "no module to install, exiting..."
    exit 0
fi

for module in "${modules_list[@]}"; do
    echo && install_module $module
done
