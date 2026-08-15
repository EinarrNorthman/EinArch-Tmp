#!/bin/bash
# =============================================================
# Project: EinArch-Hyprland
# Script: User-Dirs.sh
# Author: Einarr Northman
# Function: Automate the creationg of user skeleton/default directories.
# Version: 0.0.1
# =============================================================

# WARNING:: 
# This script could cause damage to your system.
# This is an automated script and will perform functions without warining or user interaction. 
# This script is also hard coded to function with my personal system. USE AT OWN RISK. 

## RUN THIS SCRIPT FROM THE LIVE ISO ONLY. AFTER INSTALLATION IS COMPLETE ##

# Install user dirs package on live ISO
pacman -S --noconfirm xdg-user-dirs

# set HOME variables and run package on target system
HOME=/mnt/home/$username XDG_CONFIG_HOME=/mnt/home/$username/.config xdg-user-dirs-update --force

#give ownship of directories to user
arch-chroot /mnt /bin/bash -c "chown -R $username:$username /home/$username"
