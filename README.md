# dotfiles
misc dotfiles

# Restore Instructions
```
    git clone --separate-git-dir=$HOME/.dotfiles https://github.com/elvindesouza/dotfiles.git $HOME/myconf-tmp
    cp ~/myconf-tmp/.gitmodules ~  # If you use Git submodules
    rm -r ~/myconf-tmp/
    alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
```
