# Keybindings ------------------------------------------------------

bindkey -v

bindkey ' ' magic-space                           # do history expansion on space

# bindkey '' forward-char  
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
# bindkey '^[[5~' history-beginning-search-backward               # Page up key
# bindkey '^[[6~' history-beginning-search-forward                # Page down key
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
bindkey -v '^?' backward-delete-char
bindkey -s '^o' 'lfcd^M'
bindkey -s '^n' 'nvim $(fzf)^M'
bindkey -s '' 'launcher^M'
bindkey -s '^[[32;2u' ' '
bindkey -s '^[[13;5u' '\n'
bindkey -s '^[[127;2u' '^?'
bindkey "^[[48;5u" beginning-of-line
bindkey "^[[45;5u" end-of-line
