# Devenv

Provisioner for setup a tailored environment for development

> This repository is itegrated with my [dotfiles repository](https://github.com/mohammadne/dotfiles) to setup the environment.

## Usage

![Fedora Compatibility](https://img.shields.io/badge/works%20on-fedora-white?logo=fedora&style=for-the-badge)
![Ubuntu Compatibility](https://img.shields.io/badge/works%20on-ubuntu-white?logo=ubuntu&style=for-the-badge)

> **_NOTE:_** I'm using Fedora as my desktop OS and Ubuntu as my development server choice and this provisioner repository (devenv) is written and tested based on them.

```sh
devenv_directory=$HOME/Develop/devenv
mkdir -p "$(dirname $devenv_directory)"
git clone https://github.com/mohammadne/devenv.git $devenv_directory
cd $devenv_directory && git remote set-url origin git@github.com:mohammadne/devenv.git
```

## run

```sh
eval "$(ssh-agent)"
ssh-add ~/.ssh/github_ed25519

docker compose run devenv
```
