#!/bin/bash
# =============================================================
# Project: EinArch-Hyprland
# Script: Desktop-Install.sh
# Author: Einarr Northman
# Function: Automate installation process the desltop installation.
# Version: 0.0.1
# =============================================================

# WARNING:: 
# This script could cause damage to your system.
# This is an automated script and will perform functions without warining or user interaction. 
# This script is also hard coded to function with my personal system. USE AT OWN RISK. 

## RUN THIS SCRIPT AFTER ARCH INSTALLED AND SUCCESSFULK REBOOT

# Install Video Drivers
sudo pacman -S --noconfirm --needed linux-headers nvidia-open

# Install Audio Drivers.
sudo pacman -S --noconfirm --needed pipewire pipewire-alsa pipewire-pulse

# Install Window Manager.
sudo pacman -S --noconfirm --needed hyprland

# Install Applications.
sudo pacman -S --noconfirm --needed alacritty waybar wofi brave-bin


