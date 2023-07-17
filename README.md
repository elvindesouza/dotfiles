#!/usr/bin/env bash


# dotfiles - my dotfiles

#### neovim

#### suckless-st+patches

#### tmux

#### i3-wm

#### zsh

#### lf+ctpv

#### firefox

#### sxiv, zathura, mpv, etc.

# Restore Instructions

## `chmod` this README to x-ecutable and run, or `bash README.md`

## this part might fail, if it does, just manually review and delete config files so they can be replaced with the ones from this repository

git clone --bare https://github.com/elvindesouza/dotfiles.git "$HOME"/.dotfiles

function config {
	/usr/bin/git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" "$@"
}

mkdir -p .config-backup

config checkout

if [ $? = 0 ]; then
    echo "Checked out config."
else
    echo "Attempting to backup up pre-existing dot files, run script again"
    config checkout 2>&1 | grep -E "\s+\." | awk "{'print $1'}" | xargs -I{} mv {} .config-backup/{}
    exit
fi

config checkout
config config status.showUntrackedFiles no
config submodule update --init --recursive
config pull --recurse-submodules

## tmux setup
cd ~ || exit
mkdir -p "~/.config/tmux"
git clone https://github.com/gpakosz/.tmux.git "~/.config/tmux/tmux"
ln -s "~/.config/tmux/tmux/.tmux.conf" "~/.config/tmux/tmux.conf"
cp "~/.config/tmux/tmux/.tmux.conf.local" "~/.config/tmux/tmux.conf.local"
