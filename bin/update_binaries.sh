#!/bin/env bash

# cd "$HOME"/bin || exit
# wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
# chmod +x eza

# mkdir -p "$HOME"/Downloads/ && \
# cd "$HOME"/Downloads/ || exit && \
# wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64" -O code.tar.gz

# wget https://github.com/srevinsaju/zap/releases/download/continuous/zap-amd64 -O "$HOME"/bin/zap
# chmod +x "$HOME"/bin/zap

cd "$HOME"/.config/nvim || exit
rm -f nvim.appimage
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod +x nvim.appimage

wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O "$HOME"/bin/yt-dlp
chmod +x "$HOME"/bin/yt-dlp

# cd "$HOME"/bin || exit
# wget -c  https://github.com/denisidoro/navi/releases/download/v2.23.0/navi-v2.23.0-x86_64-unknown-linux-musl.tar.gz -O - | tar xz --strip-components=1 
# chmod +x navi

cd "$HOME"/bin || exit
wget -c https://hpjansson.org/chafa/releases/static/chafa-1.14.2-1-x86_64-linux-gnu.tar.gz -O - | tar xz --strip-components=1 
chmod +x chafa

cd "$HOME"/bin || exit
wget -c https://github.com/gokcehan/lf/releases/download/r32/lf-linux-amd64.tar.gz -O - | tar xz
chmod +x lf

# mkdir -p /tmp/lazygit_download
# wget -c https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_arm64.tar.gz -O /tmp/lazygit_download/lazygit.tar.gz
# tar -xzvf /tmp/lazygit_download/lazygit.tar.gz -C /tmp/lazygit_download
# mv /tmp/lazygit_download/lazygit "$HOME"/bin/
# rm -rf /tmp/lazygit_download
# chmod +x "$HOME"/bin/lazygit

if command -v pipx &> /dev/null; then
    pipx upgrade-all
fi
