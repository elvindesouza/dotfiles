#!/usr/bin/env bash

read -r -p "Are you sure you want to aggressively set the laptop into battery mode? (y/n): " choice

if [[ $choice != "y" && $choice != "Y" ]]; then
    echo "Exiting..."
    exit 1
fi

#xbacklight -set 50
echo "Reminder: put laptop into blue mode"
echo "Reminder: unplug unnecessary peripherals"
echo "Reminder: put laptop in airplane mode (Fn+f8)"
# sudo systemctl restart tlp
echo 100 | sudo tee /sys/class/backlight/intel_backlight/brightness
#echo '1500' | sudo tee /proc/sys/vm/dirty_writeback_centisecs
sudo swapoff -a
# sudo ip link set enp7s0 down
# sudo ip link set lo down
sudo iw dev wlp0s20f3 set power_save on
sudo rfkill block bluetooth
