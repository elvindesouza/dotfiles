#!/bin/env bash

# dotfiles

## Software Used
- neovim - code/text editor
- kitty - terminal emulator
- suckless-st+patches - minimal terminal emulator
- tmux - terminal multiplexer
- sway - (Wayland) compositor
- rofi - application launcher (using scripts from https://github.com/adi1090x/rofi)
- zsh - preferred shell
- lf - terminal file manager with file previews
- dolphin - file manager
- swayimg, gwenview - image viewer
- mpv - media player
- zathura, okular - document viewer
- ark - archive manager
- swappy - screenshot utility
- firefox with arkenfox user.js - web browser

## TODO

### High Priority
- neovim
    fix configuration
- zsh (fix): (zsh-autocompletion):
        1. freezing because of autocompletion loading

### Medium Priority
- lf: change previwer, ctpv is unmaintained
- backup: ssh,gpg keys
- fix: vim double Esc to go from insert to normal mode
- backup script- 
    1. add BACKUP_* variables to all other installs .bashrc
    2. remove bash/zsh history from dotfiles tracking
    3. make stable backup script for *arch-laptop*, *ubuntu-laptop*, *arch-pc*, *termux*- should store **important** configurations that are not (in) dotfiles
    
### Low Priority
- use recommended way to set keybindings https://wiki.archlinux.org/title/Zsh#Key_bindings
- use ctrl-T recent files with xdg-open 
- change tmuxa to cd to pwd if shell opened in a directory
- implement .bash_profile for device-specific configurations, make uniform across all devices
- make ranger configuration(identical to lf)
- zsh keybind to open tmuxa(decide whether or not to exec tmuxa or not)
- st alt+o/a/s/u 
- implement the functions from fzf wiki
- firefox (YouTube) hardware acceleration- no support currently for proprietary nvidia drivers


## Restore Instructions

Delete all the non-script text from above the line below and run `bash README.md`

This part might fail, if it does, manually review: delete existing config files, so they can be replaced with the ones from this repository

######################################################################

git clone --bare https://github.com/elvindesouza/dotfiles.git "$HOME"/.dotfiles

function config {
	/usr/bin/git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" "$@"
}

mkdir -p .config-backup

config checkout && \
if [ $? = 0 ]; then
    echo "Checked out config."
else
    echo "Move/delete the conflicting files and run script again"
    exit
fi && \
config config status.showUntrackedFiles no && \
config submodule update --init --recursive && \
config pull --recurse-submodules

mkdir -p "$XDG_STATE_HOME"/zsh/
mkdir -p "$XDG_STATE_HOME"/bash/

## tmux setup

cd "$HOME" || exit && \
mkdir -p "$HOME/.config/tmux" && \
git clone https://github.com/gpakosz/.tmux.git "$HOME/.config/tmux/tmux" && \
ln -s "$HOME/.config/tmux/tmux/.tmux.conf" "$HOME/.config/tmux/tmux.conf" && \
echo "Set up tmux successfully"

# Get missing software and download fonts

echo "Run bin/update_binaries.sh"
echo "Run bin/check_binaries.sh"
echo "Download fonts with the script in .local/share/fonts"

# Set up Flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Recommended flatpaks - com.brave.Browser com.github.ransome1.sleek com.github.tchx84.Flatseal com.rtosta.zapzap com.spotify.Client im.riot.Riot net.cozic.joplin_desktop net.mullvad.MullvadBrowser org.mozilla.Thunderbird"
