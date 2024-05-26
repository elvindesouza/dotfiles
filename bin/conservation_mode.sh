#!/bin/bash

echo "Enable(1) Disable(0)"
read -n1 var
echo $var | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
