#!/bin/bash
# =============================================================
# Project: EinArch-Hyprland
# Script: System-Config2.sh
# Author: Einarr Northman
# Function: Automate system configuration for a base vanilla Arch Linux.
# Version: 0.0.2 (Variable-safe version)
# =============================================================

# WARNING:: 
# This script could cause damage to your system.
# This is an automated script and will perform functions without warning or user interaction. 
# This script is also hard coded to function with my personal system. USE AT OWN RISK. 

arch-chroot /mnt /bin/bash -c "
# Set system timezone to Pacific/Auckland (New Zealand).
ln -sf /usr/share/zoneinfo/Pacific/Auckland /etc/localtime

# Sync the hardware clock with the system clock.
hwclock --systohc

# Set the system locale.
sed -i 's/^#en_NZ.UTF-8 UTF-8/en_NZ.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo 'LANG=en_NZ.UTF-8' > /etc/locale.conf

# Install grub bootloader.
pacman -S --noconfirm grub efibootmgr

# Configure grub bootloader
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# Set system hostname
echo '$hostname' > /etc/hostname

# Set system hosts file
echo '127.0.1.1 $hostname.localdomain $hostname' >> /etc/hosts

# Install networking software
pacman -S --noconfirm networkmanager
systemctl enable NetworkManager

# Set password for root
echo 'root:$RootPassword' | chpasswd

# Add new user
useradd -m '$username'

# Set password for new user
echo '$username:$UserPassword' | chpasswd

# Add new user to groups
usermod -aG wheel,audio,video,power,storage '$username'

# Configure sudoers
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers
"
