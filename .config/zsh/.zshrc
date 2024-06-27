#!/bin/env zsh

if [[ ! -o interactive ]]; then
    return
fi

# Check for tmux and launch zsh-tmux environment
if [ -z "$TMUX" ] && command -v tmux > /dev/null && [ "$TERM" = "st-256color" ] && [ -f "$HOME/bin/tmuxa" ]; then
    exec $HOME/bin/tmuxa
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

echo -ne '\e[5 q' # Use beam shape cursor on startup.

# Plugins and Themes------------------------------------------------
source ~/.config/zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

source ~/.config/zsh/custom/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh # https://github.com/jeffreytse/zsh-vi-mode

if [ ! -f "$HOME"/.config/zsh/custom/plugins/zsh-defer/zsh-defer.plugin.zsh ]; then
    if [ -f $HOME/.config/zsh/.aliases ]; then
        . $HOME/.config/zsh/.aliases
    fi
    if [[ -f $HOME/.config/zsh/functions.zsh ]]; then
        . $HOME/.config/zsh/functions.zsh
    fi
    if [[ -f $HOME/.config/zsh/keybindings.zsh ]]; then
        . $HOME/.config/zsh/keybindings.zsh
    fi
else
    source ~/.config/zsh/custom/plugins/zsh-defer/zsh-defer.plugin.zsh
    zsh-defer . $HOME/.config/zsh/.aliases
    zsh-defer source ~/.config/zsh/functions.zsh
    if [[ -f ~/.config/zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]]; then
        zsh-defer source ~/.config/zsh/autocomplete.zsh # https://github.com/marlonrichert/zsh-autocomplete
    fi
    zsh-defer source ~/.config/zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    zsh-defer source ~/.config/zsh/custom/plugins/zsh-z/zsh-z.plugin.zsh
    zsh-defer source ~/.config/zsh/custom/plugins/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh
    if [[ -f /etc/zsh_command_not_found ]]; then
        zsh-defer source /etc/zsh_command_not_found
    fi
    if [[ -f $HOME/.config/zsh/keybindings.zsh ]]; then
        zsh-defer . $HOME/.config/zsh/keybindings.zsh
    fi
fi

# .profile should already be sourced
# if [ -f $HOME/.config/zsh/.profile ]; then
#     . $HOME/.config/zsh/.profile
# fi

# Zsh options ------------------------------------------------
setopt autocd              # change directory just by typing its name
setopt extendedglob        # Extends the globbing capabilities of Zsh, enabling more advanced pattern matching
setopt nonomatch           # hide error message if there is no match for the pattern
setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt prompt_subst         # enable command substitution in prompt
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
setopt globdots
setopt pushd_ignore_dups # Prevents duplicate entries in the directory stack when using pushd to change directories.
setopt rcquotes # Allows nested quotes inside command substitutions, making it easier to work with complex command substitutions.

# Completion options (Autocomplete plugin configured in autocomplete.zsh) ------------------------------------------------
# (from /etc/zsh/newuser.zshrc.recommended)
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _extensions _complete _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive, Smart matching of dashed values, e.g. f-b matching foo-bar
#testing
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select=long
zstyle ':completion:*:*:man:*:*' menu select=long search
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true # Verbose completion results
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:::::' completer _expand _complete _ignored _approximate #enable approximate matches for completion
# zstyle ':completion::complete:*' gain-privileges 1
# zstyle ':completion::*:rm:*:*' file-patterns '*.o:object-files:object\ file *(~|.(old|bak|BAK)):backup-files:backup\ files *~*(~|.(o|old|bak|BAK)):all-files:all\ files' # rm: advanced completion (e.g. bak files first)
# vi: advanced completion (e.g. tex and rc files first)
# zstyle ':completion::*:vi:*:*' file-patterns 'Makefile|*(rc|log)|*.(php|tex|bib|sql|zsh|ini|sh|vim|rb|sh|js|tpl|csv|rdf|txt|phtml|tex|py|n3):vi-files:vim\ likes\ these\ files *~(Makefile|*(rc|log)|*.(log|rc|php|tex|bib|sql|zsh|ini|sh|vim|rb|sh|js|tpl|csv|rdf|txt|phtml|tex|py|n3)):all-files:other\ files'
# zstyle ':completion:*' rehash true # Automatically update PATH entries
# zstyle ':completion:*' insert-tab pending # pasting with tabs doesn't perform completion
## Always use menu selection for `cd -`
# zstyle ':completion:*:*:cd:*:directory-stack' force-list always
# zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
## Nicer format for completion messages
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:corrections' format '%U%F{green}%d (errors: %e)%f%u'
zstyle ':completion:*:warnings' format '%F{202}%BSorry, no matches for: %F{214}%d%b'
# Show message while waiting for completion
# zstyle ':completion:*' show-completer true
# Prettier completion for processes
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,args -w -w"
# zmodload zsh/complist
# zstyle ':completion:*' format '>>> %d'


# ZSH history file --------------------------------
setopt EXTENDED_HISTORY
HISTFILE="$XDG_STATE_HOME"/zsh/history

# Other configuration that must be at the end of .zshrc -------------------------
# eval "$(direnv hook zsh)"

# mkdir if they do not exist
dirs=(
  "$XDG_DATA_HOME"
  "$XDG_CONFIG_HOME"
  "$XDG_STATE_HOME"
  "$XDG_CACHE_HOME"
  "$XDG_STATE_HOME"/zsh/
  "$XDG_STATE_HOME"/bash/
)
for dir in "${dirs[@]}"; do
  [ ! -d "$dir" ] && mkdir -p "$dir"
done

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
