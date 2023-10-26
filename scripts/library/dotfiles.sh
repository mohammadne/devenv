#!/bin/bash

function ensure_dotfiles() { 
    local dotfiles_repository=${DOTFILES_REPOSITORY:?"dotfiles repository must be set"}
    local dotfiles_directory=${DOTFILES_DIRECTORY:?"dotfiles directory must be set"}

    # evaluate dotfiles_directory
    local dotfiles_directory="$(eval echo "$dotfiles_directory")"

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
        echo "dotfiles is present but is not a git repository"
        return 1
    fi

    current_remote="$(cd $dotfiles_directory && git config --get remote.origin.url)"
    if [ "$current_remote" != "$remote_ssh" ] && [ "$current_remote" != "$remote_https" ]; then
        echo "dotfiles has an invalid remote_url"
        return 1
    fi

    cd $dotfiles_directory && git remote set-url origin $remote_ssh
    cd $dotfiles_directory && git pull origin -q --force
    if [ $? -ne 0 ]; then
        echo "unable to pull the latest changes for the dotfiles"
        return 1
    fi
}
