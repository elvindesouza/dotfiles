#! /usr/bin/env bash
alias tmux n='tmux new-session -A -s 1 -c 'zsh' -d'
alias tmux a='alias -2 -u attach -d' 
alias vim='nvim'
alias vi="nvim"
alias flatpak='flatpak --installation=extra'
alias kexec='sudo kexec -l /boot/vmlinuz-linux --initrd=/boot/initramfs-linux.img --reuse-cmdline && sudo systemctl kexec'
alias pacman='sudo pacman'
alias aur='yay'
alias sc='sudo systemctl'
alias s='sudo'
alias python='python3'
alias gpu='watch -n.1 "nvidia-smi"'
alias lx='less'
alias note='vim ~/Documents/temp.txt'
alias q='exit'
alias c='clear'
alias pip='pip3'

alias inst='sudo pacman -S'
alias uninst='sudo pacman -Rns'
alias search='aur -Ss'
alias list='pacman -Qet | less'
alias listall='pacman -Q | less'
alias upgrade='aur -Syyu ; flatpak update'

alias eal='vim ~/.bash_aliases'
alias sal='source ~/.bash_aliases'

# some more ls aliases
# alias ll='ls -alF'
# alias la='ls -A'
#alias l='ls -CF'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

alias reload="source \$HOME/.zshrc"
alias c="clear"
alias cd..="cd .."
alias curl="curl --user-agent 'noleak'"
alias l="ls -ahls --color=auto"
alias r="lfcd"
alias shred="shred -zf"
alias sl="ls --color=auto"
alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias diff='diff --color=auto'
alias vdir="vdir --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias wget="wget -c --user-agent 'noleak'"
alias dd="dd status=progress"
alias cp="cp -i" # confirm before overwriting something
alias rm="rm -i"
alias mv="mv -i"
alias df="df -h" # human-readable sizes
alias free="free -h"
alias du="du -h"
alias ip='ip -color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Search command line history
alias h="history | grep "

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | so  rt -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# Count all files (recursively) in the current fold  er
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t;   done 2> /dev/null"

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -pr  int0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file   {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$/  /g' | grep -v '[0-9]$' | xargs tail -f"


# Alias's for multiple directory listing commands
alias la='ls -Alh'                # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
# alias lx='ls -lXBh'               # sort by extension
alias lk='ls -lSrh'               # sort by size
alias lc='ls -lcrh'               # sort by change time
alias lu='ls -lurh'               # sort by access time
alias lr='ls -lRh'                # recursive ls
alias lt='ls -ltrh'               # sort by date
alias lm='ls -alh |more'          # pipe through 'more'
alias lw='ls -xAh'                # wide listing format
alias ll='ls -Fls'                # long listing format
alias labc='ls -lap'              #alphabetical sort
alias lf="ls -l | egrep -v '^d'"  # files only
alias ldir="ls -l | egrep '^d'"   # directories only

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."
