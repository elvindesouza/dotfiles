#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100 # limits recursive functions, see 'man bash'

# Expand the history size
export HISTFILESIZE=100000
export HISTSIZE=100000
# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace
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
shopt -s checkwinsize

iatest=$(expr index "$-" i)
# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi
# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

#Automatically do an ls after each cd
cd() {
	if [ "$1" != "" ]; then
		builtin cd "$@" && ls
	else
		builtin cd ~ && ls
	fi
}

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# source files
[ -r /usr/share/bash-completion/completions ] &&
	. /usr/share/bash-completion/completions/*

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.profile ]; then
	. ~/.profile
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '

#setfont -d
