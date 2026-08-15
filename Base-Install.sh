#!/bin/bash
# =============================================================
# Project: EinArch-Hyprland
# Script: Base-Install.sh
# Author: Einarr Northman
# Function: Automate installation process of base vanilla Arch Linux.
# Version: 0.0.1
# =============================================================

# WARNING:: 
# This script could cause damage to your system.
# This is an automated script and will perform functions without warining or user interaction. 
# This script is also hard coded to function with my personal system. USE AT OWN RISK. 

# Mount root partition /mnt.
mount /dev/sda3 /mnt

# Create boot/efi and  home directories.
mkdir -p /mnt/{boot/efi,home}

# Mount boot partition.
mount /dev/sda1 /mnt/boot/efi

#Mount home partition.
mount /dev/sda4 /mnt/home

# Insall base packages
pacstrap -K /mnt linux linux-firmware base base-devel neovim git

#Generate file system table
genfstab -U /mnt >> /mnt/etc/fstab
