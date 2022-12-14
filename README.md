#!/usr/bin/env bash

# dotfiles - misc dotfiles

#### neovim

#### i3

#### zsh

#### tmux

#### lf

#### sxiv

#### zathura

# Restore Instructions

# `chmod` this README to x-ecutable and run, or `bash README.md`

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

## Tmux setup
cd ~ || exit
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf .
