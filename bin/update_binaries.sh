#!/bin/env bash

## Colors ----------------------------
Color_Off='\033[0m'
BBlack='\033[1;30m' BRed='\033[1;31m'    BGreen='\033[1;32m' BYellow='\033[1;33m'
BBlue='\033[1;34m'  BPurple='\033[1;35m' BCyan='\033[1;36m'  BWhite='\033[1;37m'

# eza-alternative to ls
echo -e ${BBlue}"\n[*] Eza - alternative to ls" ${Color_Off}
cd "$HOME"/bin || exit
wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
chmod +x eza

# mkdir -p "$HOME"/Downloads/ && \
# cd "$HOME"/Downloads/ || exit && \
# wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64" -O code.tar.gz

# wget https://github.com/srevinsaju/zap/releases/download/continuous/zap-amd64 -O "$HOME"/bin/zap
# chmod +x "$HOME"/bin/zap

echo -e ${BBlue}"\n[*] Neovim" ${Color_Off}
cd "$HOME"/.config/nvim || exit
rm -f nvim.appimage
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod +x nvim.appimage

echo -e ${BBlue}"\n[*] yt-dlp" ${Color_Off}
wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O "$HOME"/bin/yt-dlp
chmod +x "$HOME"/bin/yt-dlp

echo -e ${BBlue}"\n[*] navi - cheatsheet tool" ${Color_Off}
# keep URL up to date https://github.com/denisidoro/navi/releases/latest
cd "$HOME"/bin || exit
wget -c  https://github.com/denisidoro/navi/releases/download/v2.23.0/navi-v2.23.0-aarch64-unknown-linux-gnu.tar.gz  -O - | tar xz --strip-components=1
chmod +x navi

# Chafa
# keep URL up to date from https://hpjansson.org/chafa/download/
echo -e ${BBlue}"\n[*] chafa - terminal graphics" ${Color_Off}
cd "$HOME"/bin || exit
wget -c https://hpjansson.org/chafa/releases/static/chafa-1.14.5-1-x86_64-linux-gnu.tar.gz -O - | tar xz --strip-components=1 
chmod +x chafa

# lf 
echo -e ${BBlue}"\n[*] lf - terminal file manager" ${Color_Off}
cd "$HOME"/bin || exit
wget -c https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz -O - | tar xz
chmod +x lf

# mkdir -p /tmp/lazygit_download
# wget -c https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_arm64.tar.gz -O /tmp/lazygit_download/lazygit.tar.gz
# tar -xzvf /tmp/lazygit_download/lazygit.tar.gz -C /tmp/lazygit_download
# mv /tmp/lazygit_download/lazygit "$HOME"/bin/
# rm -rf /tmp/lazygit_download
# chmod +x "$HOME"/bin/lazygit

# diff-so-fancy
echo -e ${BBlue}"\n[*] diff-so-fancy - fancy diffs" ${Color_Off}
cd "$HOME"/bin || exit
wget -O diff-so-fancy https://github.com/so-fancy/diff-so-fancy/releases/latest/download/diff-so-fancy && chmod +x diff-so-fancy

# Clipboard (https://github.com/Slackadays/Clipboard/issues/171 currently broken on wayland)
# echo -e "\e[1;32mClipboard\e[0m"
# # keep url up to date https://github.com/Slackadays/Clipboard/releases/latest
# cd "$HOME"/bin || exit
# mkdir -p /tmp/clipboard_download
# wget -c https://github.com/Slackadays/Clipboard/releases/latest/download/clipboard-linux-amd64.zip -O /tmp/clipboard_download/clipboard.zip
# unzip /tmp/clipboard_download/clipboard.zip -d /tmp/clipboard_download
# mv /tmp/clipboard_download/bin/cb "$HOME"/bin/
# rm -rf /tmp/clipboard_download
# chmod +x "$HOME"/bin/cb

if command -v pipx &> /dev/null; then
    pipx upgrade-all
fi
