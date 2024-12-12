#!/bin/bash

# List of commands
commands=("zsh" "nvim" "lf" "dolphin" "firefox" "mpv" "swayimg" "zathura" "fzf" "ctpv" "grim" "swappy" "slurp" "tmux" "sway" "swaylock" "swayidle" "wl-paste" "cliphist" "brightnessctl" "pactl" "playerctl" "st" "kitty" "rofi" "xdg-open" "mimeopen" "vim" "fastfetch" "eza" "bat" "batcat" "nala" "swaync" "nwg-clipman" "blueman-manager" "nm-connection-editor" "nm-applet")

# Loop through the commands and check if they are executable
for cmd in "${commands[@]}"; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "Warning: '$cmd' is not installed or not in PATH."
    fi
done
