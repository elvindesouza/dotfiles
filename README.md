#!/bin/env bash

# dotfiles

## Software Used
- neovim - code/text editor, modern replacement for vim
- suckless-st+patches - minimal terminal emulator
- kitty - feature-rich terminal emulator
- tmux - terminal multiplexer, scrollback, clipboard on select etc. 
- i3-wm - window manager for X
- zsh - preferred shell
- lf+ctpv - terminal file manager with image previews
- sxiv/feh/viu - simple image viewer
- zathura - simple document viewer
- mpv - simple+powerful media player
- xarchiver - lightweight archive manager
- thunar/pcmanfm - lightweight file manager
- flameshot - screenshot utility
- firefox - web browser

## TODO
### High Priority
- neovim
    remove unnecessary plugins
    fix lsp running many diagnostic servers causing duplicated diagnostics
- fix: Nuke dotfiles branch again and remove large files from being tracked in the first place
- fix: (zsh-autocompletion):
        1. freezing because of autocompletion loading
        2. erroneously autoselecting the first completion
        3. zsh crashing
        4. Fix zsh keybinding to show/navigate the full completion list
- find bash invalid expression on login, possibly related to infinite loop with xrdb. 

### Medium Priority
- backup: ssh,gpg keys
- fix: vim double Esc to go from insert to normal mode
- backup script- 
    1. add BACKUP_* variables to all other installs .bashrc
    2. remove bash/zsh history from dotfiles tracking
    3. make stable backup script for *arch-laptop*, *ubuntu-laptop*, *arch-pc*, *termux*- should store **important** configurations that are not (in) dotfiles
- migrate fully to zsh login shell, put checks so it doesnt break home-archlinux
    
### Low Priority
- browser-
    1. arkenfox script to use arkenfox overrides from dotfiles and apply arkenfox to a (new?)firefox profile
    2. consider 
- use recommended way to set keybindings https://wiki.archlinux.org/title/Zsh#Key_bindings
- use ctrl-T recent files with xdg-open 
- change tmuxa to cd to pwd if shell opened in a directory
- implement .bash_profile for device-specific configurations, make uniform across all devices
- make ranger configuration, and add check for whether ranger/lf installed
- zsh keybind to open tmuxa(decide whether or not i should exec tmuxa or not)
- st alt+o/a/s/u 
- implement the functions from fzf wiki
- firefox (youtube.com)hardware acceleration- no support currently for proprietary nvidia drivers


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
    echo "Move/delete the conflicting files and run script again"
    exit
fi && \
config config status.showUntrackedFiles no && \
config submodule update --init --recursive && \
config pull --recurse-submodules

mkdir -p "$XDG_STATE_HOME"/zsh/
mkdir -p "$XDG_STATE_HOME"/bash/

## tmux setup
cd ~ || exit && \
mkdir -p "~/.config/tmux" && \
git clone https://github.com/gpakosz/.tmux.git "~/.config/tmux/tmux" && \
ln -s "~/.config/tmux/tmux/.tmux.conf" "~/.config/tmux/tmux.conf" && \
cp "~/.config/tmux/tmux/.tmux.conf.local" "~/.config/tmux/tmux.conf.local"


# Run bin/update_binaries.sh
echo "Run bin/update_binaries.sh"
#curl https://raw.githubusercontent.com/srevinsaju/zap/main/install.sh | bash -s
#zap install firefox
#zap install plexamp
#zap install --from https://appimages.libreitalia.org/LibreOffice-fresh.basic-x86_64.AppImage LibreOffice
#zap install --from https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage neovim
#zap install --from https://github.com/zilti/code-oss.AppImage/releases/download/continuous/Code_OSS-x86_64.AppImage CodeOSS
#zap install --from https://github.com/nelsonenzo/tmux-appimage/releases/download/3.4/tmux.appimage tmux
#flatpak install io.mpv.Mpv
#flatpak install org.cubocore.CoreArchiver
#flatpak install org.cubocore.CoreShot
#flatpak install org.cubocore.CorePDF
#flatpak install org.cubocore.CoreFM
#flatpak install org.cubocore.CoreImage
#flatpak install org.cubocore.CoreStats
#flatpak install org.cubocore.CorePad
#flatpak install org.cubocore.CoreInfo
#flatpak install org.cubocore.CoreHunt
#flatpak install org.keepassxc.KeePassXC
#flatpak install org.mozilla.firefox
#flatpak install org.flameshot.Flameshot
