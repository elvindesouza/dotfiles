#!/usr/bin/env bash

## Applet : Gammastep Control for Wofi
## Converted from Rofi to Wofi

# Options
# You can use emojis or FontAwesome icons here
option_gamma_on="🌙 Activate"
option_gamma_off="☀️ Deactivate"

# Wofi Command
# --dmenu: Run in dmenu mode (take input from stdin)
# --cache-file /dev/null: Don't save this to history
# --name: Assign a specific name so we can style it differently in CSS
run_wofi() {
    wofi --dmenu \
	    --prompt "Night Light (Gammastep)" \
         --lines 4 \
         --location center \
         --width 300 \
         --cache-file /dev/null \
         --name "wofi-gammastep"
}

# Execute Command
run_cmd() {
    if [[ "$1" == '--gamma_on' ]]; then
        # Start gammastep only if it's not already running
        if ! pgrep -x "gammastep" > /dev/null; then
            gammastep &
            notify-send "Gammastep" "Enabled"
        fi
    elif [[ "$1" == '--gamma_off' ]]; then
        # Stop gammastep if it's running
        pkill gammastep
        notify-send "Gammastep" "Disabled"
    fi
}

# Main Logic
# echo options into wofi, capture choice
chosen=$(echo -e "$option_gamma_on\n$option_gamma_off" | run_wofi)

# Check which option was chosen
case ${chosen} in
    "$option_gamma_on")
        run_cmd --gamma_on
        ;;
    "$option_gamma_off")
        run_cmd --gamma_off
        ;;
esac
