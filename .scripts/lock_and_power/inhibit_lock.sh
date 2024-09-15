#!/bin/bash

ICON_PATH="/usr/share/icons/Papirus/32x32/status/dialog-information.svg"  # Replace with your icon path

# Function to check if inhibition is active
is_inhibited() {
    # Check if DPMS is disabled and screen saver is off
    xset q | grep -q "DPMS is Disabled" && xset q | grep -q "timeout:  0"
}

if is_inhibited; then
    if [ "$1" == "on" ]; then
        notify-send -i "$ICON_PATH" "Already Inhibited" "Locking and screen off timeout are already disabled."
    elif [ "$1" == "off" ]; then
        notify-send -i "$ICON_PATH" "Locking Restored" "Locking and screen off timeout have been restored."
        xset s 360         # Re-enable screen saver after 6 minutes
        xset dpms 600 600 600  # Re-enable DPMS after 10 minutes
    fi
else
    if [ "$1" == "on" ]; then
        notify-send -i "$ICON_PATH" "Locking Inhibited" "Locking and screen off timeout have been disabled."
        xset s off         # Disable screen saver
        xset -dpms         # Disable DPMS (screen power management)
    elif [ "$1" == "off" ]; then
        notify-send -i "$ICON_PATH" "Already Active" "Locking and screen off timeout are already active."
    else
        notify-send -i "$ICON_PATH" "Usage Error" "Usage: $0 {on|off}"
        exit 1
    fi
fi
