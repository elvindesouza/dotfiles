# script to install my zsh config
# TODO test this script

cd /tmp
git clone --depth 1 --no-checkout https://github.com/elvindesouza/dotfiles.git
cd dotfiles
git sparse-checkout init --cone
git sparse-checkout set .config/zsh
git checkout master
git submodule update --init --recursive .config/zsh
mkdir -p ~/.config/zsh
mv /tmp/.config/zsh ~/.config/zsh

cd
wget https://raw.githubusercontent.com/elvindesouza/dotfiles/refs/heads/master/.zshenv
