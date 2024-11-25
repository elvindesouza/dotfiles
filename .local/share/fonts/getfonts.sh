cd ~/.local/share/fonts || exit

urls=(
    # "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz"
    "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTerm.tar.xz"
    "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Noto.tar.xz"
    "https://use.fontawesome.com/releases/v6.7.1/fontawesome-free-6.7.1-desktop.zip"
    # "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Inconsolata.tar.xz"
)

# Download the tar.xz files
for url in "${urls[@]}"; do
    curl -OL "$url"
done

# Create a temporary directory
mkdir -p tmp

# Extract each tar.xz file, move the *-Regular.ttf files out, and clean up
for archive in *.tar.xz; do
    tar -xf "$archive" -C tmp
    mv tmp/*-Regular.ttf .
    rm -rf tmp/*
    rm -f "$archive"
done

for archive in *.zip; do
    unzip "$archive" -d tmp
    mv tmp/otfs/*.otf .
    rm -rf tmp/*
    rm -f "$archive"
done

# Remove the temporary directory
rm -rf tmp

# wget https://github.com/powerline/fonts/raw/master/Inconsolata/Inconsolata%20for%20Powerline.otf

# Refresh the font cache
fc-cache -fv
