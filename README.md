# Devenv

Provisioner for setup a tailored environment for development

> This repository is itegrated with my [dotfiles repository](https://github.com/mohammadne/dotfiles) to setup the environment.

## Usage

![Fedora Compatibility](https://img.shields.io/badge/works%20on-fedora-white?logo=fedora&style=for-the-badge)
![Ubuntu Compatibility](https://img.shields.io/badge/works%20on-ubuntu-white?logo=ubuntu&style=for-the-badge)

> **_NOTE:_** I'm using Fedora as my desktop OS and Ubuntu as my development server choice and this provisioner repository (devenv) is written and tested based on them.

```sh
# generate ssh-key for your github account and add it to your account
ssh-keygen -t ed25519 -f ~/.ssh/github_ed25519 -N "" -C "" > /dev/null

# specify your preferred location for cloning after '--' at the end of the script below
# bash -c "$(curl -fsSL https://raw.githubusercontent.com/mohammadne/devenv/main/scripts/clone.sh)"
git clone git@github.com:mohammadne/devenv.git Workspace/personal/devenv

# change to your devenv directory and install required packages
cd $HOME/Workspace/personal/devenv && ./scripts/install.sh git ssh
```

## run

```sh
eval "$(ssh-agent)"
ssh-add ~/.ssh/github_ed25519

docker compose run devenv
```
