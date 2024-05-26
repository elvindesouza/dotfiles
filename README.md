#!/bin/env bash

# dotfiles

## Software Used
- neovim - code/text editor, modern replacement for vim
- suckless-st+patches - minimal terminal emulator
- kitty - feature-rich terminal emulator
- tmux - terminal multiplexer, scrollback, clipboard on select etc. 
- i3-wm/sway - window manager for X/Wayland
- zsh - preferred shell
- lf+ctpv - terminal file manager with image previews
- sxiv/feh/viu - simple image viewer
- zathura - simple document viewer
- mpv - simple(yet powerful) media player
- xarchiver - lightweight archive manager
- thunar/pcmanfm - lightweight file manager
- flameshot - screenshot utility
- firefox - web browser

## TODO
- fix ZSH configuration
- change tmuxa to cd to pwd if shell opened in a directory
- sixel- ctpv uses chafa. chafa recently got support for sixel but ubuntu ships old chafa version. lf now supports sixel but ubuntu still ships old version. tmux now supports sixel but ubuntu still ships old version.st patch enabled for sixel support. TODO: fixing tmux3.4 build script. 
- clilauncher - add cache
- vim double Esc to go from insert to normal mode
- implement .bash_profile for device-specific configurations, make uniform across all devices
- make ranger configuration, and add check for whether ranger/lf installed
- zsh keybind to open tmuxa(decide whether or not i should exec tmuxa or not)
- fix zsh crashing
- write script in .config/zsh to do an independent install with all plugins
- firefox (youtube.com)hardware acceleration
- st alt+o/a/s/u 
- implement the functions from fzf wiki
- find bash invalid expression on login
- prune deprecated neovim plugins and configuration files
- backup ssh,gpg keys
- add BACKUP_* variables to all other installs .bashrc
- keyboard shortcut for terminal should open tmuxa, any other way should open zsh shell without tmuxa
- build st appimage as well

## Restore Instructions

## `chmod` this README to x-ecutable and run, or `bash README.md`

## this part might fail, if it does, just manually review and delete config files so they can be replaced with the ones from this repository

git clone --bare https://github.com/elvindesouza/dotfiles.git "$HOME"/.dotfiles

function config {
	/usr/bin/git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" "$@"
}

mkdir -p .config-backup

config checkout && \
if [ $? = 0 ]; then
    echo "Checked out config."
else
    echo "Attempting to backup up pre-existing dot files, run script again"
    config checkout 2>&1 | grep -E "\s+\." | awk "{'print $1'}" | xargs -I{} mv {} .config-backup/{}
    exit
fi && \

config checkout && \
config config status.showUntrackedFiles no && \
config submodule update --init --recursive && \
config pull --recurse-submodules 

## tmux setup
cd ~ || exit
mkdir -p "~/.config/tmux"
git clone https://github.com/gpakosz/.tmux.git "~/.config/tmux/tmux"
ln -s "~/.config/tmux/tmux/.tmux.conf" "~/.config/tmux/tmux.conf"
cp "~/.config/tmux/tmux/.tmux.conf.local" "~/.config/tmux/tmux.conf.local"

mkdir -p "$XDG_STATE_HOME"/zsh/
mkdir -p "$XDG_STATE_HOME"/bash/

# Run bin/update_binaries.sh
curl https://raw.githubusercontent.com/srevinsaju/zap/main/install.sh | bash -s
zap install firefox
zap install plexamp
zap install --from https://appimages.libreitalia.org/LibreOffice-fresh.basic-x86_64.AppImage LibreOffice
zap install --from https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage neovim
zap install --from https://github.com/zilti/code-oss.AppImage/releases/download/continuous/Code_OSS-x86_64.AppImage CodeOSS
zap install --from https://github.com/nelsonenzo/tmux-appimage/releases/download/3.4/tmux.appimage tmux
flatpak install io.mpv.Mpv
flatpak install org.cubocore.CoreArchiver
flatpak install org.cubocore.CoreShot
flatpak install org.cubocore.CorePDF
flatpak install org.cubocore.CoreFM
flatpak install org.cubocore.CoreImage
flatpak install org.cubocore.CoreStats
flatpak install org.cubocore.CorePad
flatpak install org.cubocore.CoreInfo
flatpak install org.cubocore.CoreHunt
flatpak install org.keepassxc.KeePassXC
flatpak install org.mozilla.firefox
flatpak install org.flameshot.Flameshot
