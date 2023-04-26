################ Autocomplete
#zstyle ':autocomplete:*' list-lines 5
#zstyle ':autocomplete:history-search:*' list-lines 5
#zstyle ':autocomplete:history-incremental-search-*:*' list-lines 5

zstyle ':autocomplete:*' fzf-completion yes
# no:  Tab uses Zsh's completion system only.
# yes: Tab first tries Fzf's completion, then falls back to Zsh's.
# ⚠️ NOTE: This setting can NOT be changed at runtime and requires that you
# have installed Fzf's shell extensions.

##
# Config in this section should come BEFORE sourcing Autocomplete and cannot be
# changed at runtime.
#
# Autocomplete automatically selects a backend for its recent dirs completions.
# So, normally you won't need to change this.
# However, you can set it if you find that the wrong backend is being used.
zstyle ':autocomplete:recent-dirs' backend zsh-z
# cdr:  Use Zsh's `cdr` function to show recent directories as completions.
# no:   Don't show recent directories.
# zsh-z|zoxide|z.lua|z.sh|autojump|fasd: Use this instead (if installed).
# ⚠️ NOTE: This setting can NOT be changed at runtime.
zstyle ':autocomplete:*' widget-style menu-select
# complete-word: (Shift-)Tab inserts the top (bottom) completion.
# menu-complete: Press again to cycle to next (previous) completion.
# menu-select:   Same as `menu-complete`, but updates selection in menu.
# ⚠️ NOTE: This setting can NOT be changed at runtime.
#

# source /path/to/zsh-autocomplete.plugin.zsh
source ~/.config/zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# # Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect '' send-break
bindkey -M menuselect '^@' list-expand
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
bindkey -M menuselect '\r' .accept-line

##
# Config in this section should come AFTER sourcing Autocomplete.
#

# Up arrow:
bindkey '\e[A' up-line-or-search
bindkey '\eOA' up-line-or-search
bindkey '^k' up-line-or-search
# up-line-or-search:  Open history menu.
# up-line-or-history: Cycle to previous history line.

# Down arrow:
bindkey '\e[B' down-line-or-select
bindkey '\eOB' down-line-or-select
bindkey '^j' down-line-or-history
# down-line-or-select:  Open completion menu.
# down-line-or-history: Cycle to next history line.


# Control-Space:
bindkey '^@' list-expand
# list-expand:      Reveal hidden completions.
# set-mark-command: Activate text selection.

