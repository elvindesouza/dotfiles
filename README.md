#!/usr/bin/env bash

# dotfiles - misc dotfiles

## neovim

## i3

## zsh

## tmux

## lf

## sxiv

## zathura

# Restore Instructions

git clone --bare https://github.com/elvindesouza/dotfiles.git "$HOME"/.dotfiles
function config {
	/usr/bin/git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" "$@"
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
echo "Checked out config."
else
echo "Backing up pre-existing dot files."
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi

config checkout
config config status.showUntrackedFiles no

config submodule update --init --recursive

config pull --recurse-submodules

git clone https://github.com/elvindesouza/neovim-config ~/.config/nvim

cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k
