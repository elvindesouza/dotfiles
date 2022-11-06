#!/bin/bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100 # limits recursive functions, see 'man bash'

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f "$HOME"/.config/zsh/.profile ]; then
	. "$HOME"/.config/zsh/.profile
fi

if [ -f "$HOME"/.config/zsh/.aliases ]; then
	. "$HOME"/.config/zsh/.aliases
fi

# Expand the history size
export HISTFILESIZE=100000
export HISTSIZE=100000
# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=ignoreboth
export HISTFILE=$XDG_STATE_HOME/bash/history
# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
[[ $DISPLAY ]] && shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# iatest=$(expr index "$-" i)
# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
# if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi
# Show auto-completion list automatically, without double tab
# if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar
# Enable bash programmable completion features in interactive shells

if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# source files
[ -r /usr/share/bash-completion/completions ] &&
	. /usr/share/bash-completion/completions/*


# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
fi


PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '

#setfont -d
