#!/bin/bash
# =============================================================
# Project: EinArch-Hyprland
# Script: CachyOS-Kernel.sh
# Author: Einarr Northman
# Function: Replace the standard Arch Linux Kernels/Headers with the CachyOS version.
# Version: 0.0.1
# =============================================================

# WARNING:: 
# This script could cause damage to your system.
# This is an automated script and will perform functions without warining or user interaction. 
# This script is also hard coded to function with my personal system. USE AT OWN RISK. 

## RUN THIS SCRIPT FROM THE LIVE ISO ONLY. BEFORE THE BASE-INSTALL>SH ##

# Download the CachyOS Automated Setup
curl -O https://mirror.cachyos.org/cachyos-repo.tar.xz

# Extract the CachyOS Automated Setup
tar xvf cachyos-repo.tar.xz && cd cachyos-repo

# Run the CachyOS Automated Setup
./cachyos-repo.sh

#Update Package database
pacman -Sy

# Go back to parent directory to complete runnning the genesis script
cd ../
