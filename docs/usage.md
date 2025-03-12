# Usage

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

# 8. configure gopass and proxies
./scripts/install.sh security/gopass proxy/xray proxy/dnf

# 9. install and setup foxyproxy in firefox

# 10. install other tools and go ahead...
```
