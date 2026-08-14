#!/bin/zsh

# 1. Define the save folder and create it if it doesn't exist
SAVE_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SAVE_DIR"

# 2. Define the exact filename with a timestamp
FILE_NAME="Screenshot_$(date +%Y%m%d_%H%M%S).png"
SAVE_PATH="$SAVE_DIR/$FILE_NAME"

# 3. Check what argument was passed from the keybinding
if [[ "$1" == "p" ]]; then
    # Option P: Full Screen Screenshot
    grim "$SAVE_PATH"
    
    # Copy to clipboard and send notification
    cat "$SAVE_PATH" | wl-copy
    notify-send "Screenshot Saved" "Full screen copied to clipboard" -i "$SAVE_PATH"

elif [[ "$1" == "s" ]]; then
    # Option S: Selected Region Screenshot
    grim -g "$(slurp)" "$SAVE_PATH"
    
    # Copy to clipboard and send notification
    cat "$SAVE_PATH" | wl-copy
    notify-send "Region Captured" "Selection copied to clipboard" -i "$SAVE_PATH"

else
    # Fallback if no argument is provided
    echo "Usage: $0 [p|s]"
    echo "p: Full screen"
    echo "s: Select region"
fi
