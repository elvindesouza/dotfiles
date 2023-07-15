#!/bin/env zsh
# Use fd and fzf to get the args to a command.
# Works only with zsh
# Examples:
# f mv # To move files. You can write the destination after selecting the files.
# f 'echo Selected:'
# f 'echo Selected music:' --extension mp3
# fm rm # To rm files in current directory
f() {
    sels=( "${(@f)$(fd "${fd_default[@]}" "${@:2}"| fzf)}" )
    test -n "$sels" && print -z -- "$1 ${sels[@]:q:q}"
}

# Like f, but not recursive.
fm() f "$@" --max-depth 1

# Deps
alias fz="fzf-noempty --bind 'tab:toggle,shift-tab:toggle+beginning-of-line+kill-line,ctrl-j:toggle+beginning-of-line+kill-line,ctrl-t:top' --color=light -1 -m"
fzf-noempty () {
	local in="$(</dev/stdin)"
	test -z "$in" && (
		exit 130
	) || {
		ec "$in" | fzf "$@"
	}
}
ec () {
	if [[ -n $ZSH_VERSION ]]
	then
		print -r -- "$@"
	else
		echo -E -- "$@"
	fi
}

run() {
	nohup "$@" >/dev/null 2>/dev/null &
}

#Automatically do an ls after each cd
cd() {
	if [ "$1" != "" ]; then
		builtin cd "$@" && ls --color=auto -A
	else
		builtin cd ~ && ls --color=auto -A
	fi
}

lfcd() {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		if [ -d "$dir" ]; then
			if [ "$dir" != "$PWD" ]; then
				cd "$dir"
			fi
		fi
	fi
}

fmpc() {
	local song_path
	song_path=$(
		mpc -f "%artist% - %title% ;%file%" listall |
			fzf-tmux --query="$1" --reverse --select-1 --exit-0 |
			awk -F ";" '{print $2}'
		# sed -n 's/^\([0-9]\+\)).*/\1/p'
	) || return 1
	echo song "$song_path"
	[ "$song_path" != "" ] && mpc add "$song_path"
}

preview(){
    chafa -f sixel "$@"
}
