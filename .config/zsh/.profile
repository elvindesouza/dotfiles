#!/bin/env bash
#
# ~/.profile
#

export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_DIRS="$HOME/.local/share:$XDG_DATA_DIRS"


export PATH="/usr/lib/ccache/bin/:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# add Flatpak apps to PATH
if [ -d "/var/lib/flatpak/exports/bin" ]; then
	PATH="/var/lib/flatpak/exports/bin:$PATH"
fi

if [ -d "$HOME/.local/share/flatpak/exports/bin" ]; then
	PATH="$HOME/.local/share/flatpak/exports/bin:$PATH"
fi

if [ -d "/media/elvin/extra/Flatpak/flatpak/exports/bin" ]; then
    PATH="/media/elvin/extra/Flatpak/flatpak/exports/bin:$PATH"
fi

export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export KDEHOME="${XDG_CONFIG_HOME:-$HOME/.config}"/kde
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}"/readline/inputrc
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
#
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
# export LESS="-R --use-color -Dd+r$Du+b"

# export QT_FONT_DPI=96
# export GDK_SCALE=1
# export GDK_DPI_SCALE=1

[[ -f $XDG_CONFIG_HOME/X11/xresources ]] && xrdb -merge "$XDG_CONFIG_HOME/X11/xresources"

export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xinitrc"

export GTK_USE_PORTAL=1

# To have colors for ls and all grep commands such
export CLICOLOR=1

export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export NEXTCLOUD_PHP_CONFIG=/etc/webapps/nextcloud/php.ini
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export LD_PRELOAD=""

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export HISTSIZE=1000000000
export SAVEHIST=1000000000
export HISTCONTROL=erasedups:ignoredups:ignorespace # Don't put duplicate lines in the history and do not add lines that start with a space

export KEYTIMEOUT=1
export VI_MODE_SET_CURSOR=true

# Preferred editor for local and remote sessions
export EDITOR='nvim'
export VISUAL='nvim'
export TERMINAL='st'
export QT_QPA_PLATFORMTHEME=qt5ct
export SHELL=/bin/zsh


## testing
export ANDROID_HOME="$XDG_DATA_HOME"/android
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export GRIPHOME="$XDG_CONFIG_HOME/grip"
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer
export _Z_DATA="$XDG_DATA_HOME/z"
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export SONARLINT_USER_HOME="$XDG_DATA_HOME/sonarlint"
