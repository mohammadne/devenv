#!/bin/bash

function ensure_dotfiles() {
    local module=$1
    local remote_https="https://github.com/$dotfiles_repository.git"
    local remote_ssh="git@github.com:$dotfiles_repository.git"

    # clone dotfiles if not exist
    if [ ! -d "$dotfiles_directory" ]; then
        mkdir -p "$(dirname $dotfiles_directory)"
        git clone $remote_https $dotfiles_directory -q
        cd $dotfiles_directory && git remote set-url origin $remote_ssh
        return
    fi

    if [ ! -d "$dotfiles_directory/.git" ]; then
        print_error $module "dotfiles is present but is not a git repository"
        exit 1
    fi

    current_remote="$(cd $dotfiles_directory && git config --get remote.origin.url)"
    if [ "$current_remote" != "$remote_ssh" ] && [ "$current_remote" != "$remote_https" ]; then
        print_error $module "existing dotfiles directory has an invalid remote_url"
        exit 1
    fi

    cd $dotfiles_directory && git remote set-url origin $remote_ssh
    cd $dotfiles_directory && git pull origin -q --force
    if [ $? -ne 0 ]; then
        print_error $module "unable to pull the latest changes"
        exit 1
    fi
}
