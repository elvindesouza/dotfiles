#
# ~/.profile
#

export GPG_TTY=$(tty)
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export LD_PRELOAD=""

export PATH="$HOME/bin:/usr/lib/ccache/bin/:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export KDEHOME="$XDG_CONFIG_HOME"/kde
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

export LESS="-R --use-color -Dd+r$Du+b"

#xrdb -load "$XDG_CONFIG_HOME/X11/xresources"

export GTK_USE_PORTAL=1

# To have colors for ls and all grep commands such
export CLICOLOR=1
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"

export SHELL=/bin/zsh
