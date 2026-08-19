#!/bin/bash

echo "Starting Hyprland Rice Installation..."

# 1. Install all packages from the master list
echo "Installing packages from pkglist.txt..."
yay -S --needed - < pkglist.txt

# 2. Link all configurations using Stow
echo "Symlinking dotfiles..."
stow cava fastfetch gtk gtk2 hypr kitty matugen nvim rofi swaync waybar wlogout zsh

echo "Installation complete! Please reboot your system."
