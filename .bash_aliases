alias vim='nvim'
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
alias ll='ls -alF'
alias la='ls -A'
#alias l='ls -CF'


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


alias reload="source $HOME/.zshrc"
# alias
alias c="clear"
alias cd..="cd .."
alias curl="curl --user-agent 'noleak'"
alias l="ls -ahls --color=auto"
alias r="lfcd"
alias shred="shred -zf"
alias sl="ls --color=auto"
alias vi="vim"
alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias diff='diff --color=auto'
alias vdir="vdir --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias wget="wget -c --user-agent 'noleak'"
alias dd="dd status=progress"
alias cp="cp -i"                          # confirm before overwriting something
alias rm="rm -i"
alias mv="mv -i"
alias df="df -h"                          # human-readable sizes
alias free="free -h"
alias du="du -h"
alias ip='ip -color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

run(){
    "$@" & 
    disown %2 && exit
}
