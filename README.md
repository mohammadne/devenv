# Devenv

Provisioner for setup a tailored environment for development

> This repository is itegrated with my [dotfiles repository](https://github.com/mohammadne/dotfiles) to setup the environment.

## Usage

![Fedora Compatibility](https://img.shields.io/badge/works%20on-fedora-white?logo=fedora&style=for-the-badge)
![Ubuntu Compatibility](https://img.shields.io/badge/works%20on-ubuntu-white?logo=ubuntu&style=for-the-badge)

> **_NOTE:_** I'm using Fedora as my desktop OS and Ubuntu as my development server choice and this provisioner repository (devenv) is written and tested based on them.

```sh
# 1. connect to your wifi
echo -n "YourStrongWifiPassword" | md5sum

# 2. install [xray xtls](https://github.com/XTLS/Xray-core/releases)
# 3. configure xtls via telegram
# 4. configure dnf proxy

# 5. clone devenv, specify your preferred location for cloning after '--' at the end of the script below
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mohammadne/devenv/main/scripts/clone.sh)"

# 6. change to your devenv directory and initialize the dotfiles
cd $HOME/Workspace/personal/devenv && ./scripts/install.sh --initialize git, ssh, docker, golang, gopass

# 7. import your GPG key (file or qrcode)
gpg --import gpg_keys.backup

# 8. obtain and login to the github


# 9. add your public ssh credentials to the Github

# 10. clone credentials

# 11. clone hello-world
# 12. reconfigure xtls via docker
# 13. setup foxyproxy

# 14. install other tools and go ahead...
```

## run

```sh
eval "$(ssh-agent)"
ssh-add ~/.ssh/github_ed25519

docker compose run devenv
```
