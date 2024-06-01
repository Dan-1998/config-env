#!/usr/bin/env bash

sudo dnf upgrade

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf install code

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video
sudo dnf install vlc

sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

sudo dnf install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client

sudo dnf install @multimedia @sound-and-video ffmpeg-libs gstreamer1-plugins-{bad-*,good-*,base} gstreamer1-plugin-openh264 gstreamer1-libav lame*

sudo dnf copr enable kwizart/fedy
sudo dnf install fedy

# Git
sudo dnf install git-all

# Handbrake
flatpak install flathub fr.handbrake.ghb

# Audacity
flatpak install flathub org.audacityteam.Audacity

# Steam
sudo dnf install steam

# Wine
sudo dnf install wine

# Heroic Launcher
sudo dnf copr enable atim/heroic-games-launcher
sudo dnf install heroic-games-launcher-bin

# Dolphin Emulator (Wii) (Game ROMS at https://vimm.net)
flatpak install flathub org.DolphinEmu.dolphin-emu

# RPCS3 Emulator (PS3) (Game ROMS at https://vimm.net)
flatpak install flathub net.rpcs3.RPCS3

# Discord
flatpak install discord

# Nvidia Drivers
sudo dnf install akmod-nvidia
sudo dnf install xorg-x11-drv-nvidia-cuda
sudo dnf install nvidia-vaapi-driver libva-utils vdpauinfo

# Update sleep mode

# Customize Shell Theme (i.e. Solarized Dark)

# Customize KDE Theme

# Swap ctrl+v and ctrl+shift+v in bash shell

# Fancy Bash Shell (i.e. zsh, system info on shell launch)
sudo dnf install zsh
sudo lcsh $USER # type "/bin/zsh" at interactive prompt and restart for it to become default
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # add neofetch to end of file, plugins=(git dnf python rust vscode)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k # ZSH_THEME="powerlevel10k/powerlevel10k", install MesloLGS NF fonts

sudo dnf install neofetch # used theme from https://github.com/MD-DILDAR-MANDAL/neofetch-themes/blob/main/normal/tuxNature/config.conf

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
