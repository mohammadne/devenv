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

# 2. import your GPG key (file or qrcode)
gpg --import gpg_keys.backup

# 3. install [xray xtls](https://github.com/XTLS/Xray-core/releases)
# 4. configure xtls via telegram
# 5. configure dnf proxy

# 6. obtain and login to the github
curl -fsSL https://raw.githubusercontent.com/mohammadne/devenv/main/secrets/github.gpg | gpg --decrypt --recipient 612B2E1E8B985A3B2A9BE578EA86378778D71842

# 7. clone devenv, specify your preferred location for cloning after '--' at the end of the script below
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mohammadne/devenv/main/scripts/clone.sh)"

# 8. change to your devenv directory and initialize the dotfiles
cd $HOME/Workspace/personal/devenv && ./scripts/install.sh --initialize git, ssh

# 9. add your public ssh credential to the Github

# 10. clone credentials via gopass
./scripts/install.sh languages/golang, security/gopass

# 11. clone hello-world
# 12. reconfigure xtls via docker
# 13. setup foxyproxy

# 14. install other tools and go ahead...
```
