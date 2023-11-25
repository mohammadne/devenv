# Devenv

Provisioner for setup a tailored environment for development

> This repository is highly itegrated with my own [dotfiles repository](https://github.com/mohammadne/dotfiles) to setup the environment.

## Installation

![Ubuntu Compatibility](https://img.shields.io/badge/works%20on-ubuntu-white?logo=ubuntu&style=for-the-badge)

> **_NOTE:_** I'm using Ubuntu as my personal OS (normally latest version for my desktop and latest LTS version for my server) and this provisioner repository (devenv) is written and tested based on it.

```bash
devenv_directory=$HOME/Develop/devenv
mkdir -p "$(dirname $devenv_directory)"
git clone https://github.com/mohammadne/devenv.git $devenv_directory
cd $devenv_directory && git remote set-url origin git@github.com:mohammadne/devenv.git
```

## run

```bash
eval "$(ssh-agent)"
ssh-add ~/.ssh/github_ed25519

docker compose run devenv
```

## TODOs and Wishlists

Here is a list of works, tools or packages that I want to explore or fix them

- <https://github.com/denisidoro/navi>
- add terraform binary installation
- needs to run `eval "$(ssh-agent)"` and `ssh-add path-to-key` everythime before running compose
- grub splash issue related to initramfs <https://www.reddit.com/r/Ubuntu/comments/umxg0v/how_to_hide_boot_log/> for disabiling splash logs
