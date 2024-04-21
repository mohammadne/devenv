# WSL 2

- delete old distributions
wsl --terminate Fedora39
wsl --unregister Fedora39

- download layer rootfs of fedora
<https://www.windowscentral.com/software-apps/how-to-install-fedora-on-wsl-for-windows-10-and-windows-11>
<https://kojipkgs.fedoraproject.org/packages/Fedora-Container-Base/39/>

- install fira-code font
<https://github.com/tonsky/FiraCode/wiki/Installing>

- install desired color-scheme

- install distro based on fedora rootfs
wsl --import fedora39 D:\wsl\fedora39 D:\Downloads\Fedora-Container-Base-39-20240418.0.x86_64\5f2b15901b294cf531d876384cd3b35bcbce41b5455fa1eb08aea785df1ba6bc\layer.tar

- copy and download v2ray on windows and copy it into wsl machine + paste the correct config
cp -R /mnt/d/Downloads/v2ray /usr/local/v2ray

- install systemd init
dnf install systemd

- change /etc/wsl.conf
<https://learn.microsoft.com/en-us/windows/wsl/systemd>
wsl --shutdown

- add mohammadne user
dnf install passwd
adduser mohammadne
passwd mohammadne
sudo usermod -aG wheel mohammadne

- change /etc/wsl.conf
<https://superuser.com/questions/1566022/how-to-set-default-user-for-manually-installed-wsl-distro>

- install required tools
sudo dnf install -y git iproute procps iputils
<!-- iproute -> ip -->
<!-- procps -> ps -->
<!-- iputils -> ping -->
