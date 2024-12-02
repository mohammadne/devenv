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
gpg --import gpg_key.backup

# 3. obtain and login to the github (use recovery-codes if needed)
cat gpg_key.backup | md5sum

# 4. clone devenv, specify your preferred location for cloning after '--' at the end of the script below
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mohammadne/devenv/main/scripts/clone.sh)"

# 5. change to your devenv directory and initialize the dotfiles
cd $HOME/Workspace/personal/devenv && ./scripts/install.sh git ssh
# 6. add your public ssh credential to the Github

# 7. clone credentials via gopass
./scripts/install.sh security/gopass proxy/xray proxy/dnf
# 8. setup foxyproxy in firefox

# 9. install other tools and go ahead...
```
