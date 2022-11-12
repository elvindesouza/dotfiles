#!/bin/env zsh

# if [ -z "$TMUX" ]; then
#     tmuxa
#     exit
# fi
#

echo -ne '\e[5 q' # Use beam shape cursor on startup.
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


source ~/.config/zsh/custom/plugins/vi-mode.plugin.zsh
source ~/.config/zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source ~/.config/zsh/custom/plugins/zsh-z/zsh-z.plugin.zsh
source ~/.config/zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/custom/plugins/fzf.plugin.zsh
# source ~/.config/zsh/custom/plugins/dirhistory.plugin.zsh

# autoload -U colors && colors

setopt autocd              # change directory just by typing its name
setopt extendedglob
setopt nonomatch           # hide error message if there is no match for the pattern
setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt
#
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

# unset SINGLE_LINE_ZLE
# PS1="%{$fg[cyan]%}%B>%b%{$reset_color%} "
# RPROMPT="%~"

# ZSH history file
setopt EXTENDED_HISTORY
HISTFILE="$XDG_STATE_HOME"/zsh/history

# Fancy auto-complete
autoload -Uz compinit
zstyle ':completion:*:*:*:*:*' menu yes select
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate #enable approximate matches for completion
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*' insert-tab pending # pasting with tabs doesn't perform completion
zmodload zsh/complist
zstyle ':completion:*' format '>>> %d'
_comp_options+=(globdots) # hidden files are included
compinit -d ~/.cache/zcompdump

# export $TERM='xterm'
#
# Keybindings section
bindkey -v

bindkey ' ' magic-space                           # do history expansion on space

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

bindkey '' forward-char  
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^[[127;5u' backward-kill-word                          # delete previous word with ctrl+backspace
bindkey '' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[3;5~' kill-word
bindkey '^[[Z' undo                                             # Shift+tab undo last action
bindkey '' backward-kill-word                                 # delete previous word with ctrl+backspace

bindkey -s '^o' 'lfcd^M'
bindkey -s '^n' 'nvim $(fzf)^M'
bindkey "^p" history-substring-search-up # Up
bindkey "^n" history-substring-search-down # Down
bindkey "^k" history-substring-search-up # Up
bindkey "^j" history-substring-search-down # Down
bindkey -s '^[[32;2u' ' '
bindkey -s '^[[13;5u' '\n'
bindkey -s '^[[127;2u' '^?'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bindkey "\e[A" history-substring-search-up
bindkey "\e[B" history-substring-search-down
bindkey "^[OA" history-substring-search-up
bindkey "^[OB" history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

if [ -f $HOME/.config/zsh/.aliases ]; then
    . $HOME/.config/zsh/.aliases
fi

# if [ -f $HOME/.config/zsh/.profile ]; then
#     . $HOME/.config/zsh/.profile
# fi

# eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
