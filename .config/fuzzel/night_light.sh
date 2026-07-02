#!/usr/bin/env bash

## Applet : Gammastep Control for Fuzzel

# Options
# Use emojis or FontAwesome icons
option_gamma_on="🌙 Activate"
option_gamma_off="☀️ Deactivate"

# Execute Command
run_cmd() {
    local action="$1"
    if [[ "$action" == '--gamma_on' ]]; then
        # Start gammastep only if it's not already running
        if ! pgrep -x "gammastep" > /dev/null; then
            # The '&' runs gammastep in the background
            gammastep &
            notify-send "Gammastep" "Enabled"
        else
            notify-send "Gammastep" "Already running"
        fi
    elif [[ "$action" == '--gamma_off' ]]; then
        # Stop gammastep if it's running
        if pkill -x "gammastep"; then
            notify-send "Gammastep" "Disabled"
        else
            notify-send "Gammastep" "Not running or failed to stop"
        fi
    fi
}

# Main Logic
# 1. Echo options into fuzzel.
# 2. Use --dmenu to read from stdin, acting as a simple selector.
# 3. Use --prompt to display the necessary context.
chosen=$(echo -e "$option_gamma_on\n$option_gamma_off" | fuzzel \
    --dmenu \
    --prompt "Night Light (Gammastep)" \
    --no-exit-on-keyboard-focus-loss \
    --lines 2)

# Check which option was chosen
case "${chosen}" in
    "$option_gamma_on")
        run_cmd --gamma_on
        ;;
    "$option_gamma_off")
        run_cmd --gamma_off
        ;;
    *)
        # User pressed ESC or cancelled the menu
        exit 0
        ;;
esac
