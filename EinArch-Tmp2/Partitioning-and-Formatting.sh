#!/bin/bash
# =============================================================
# Project: EinArch-Hyprland
# Script: Partitioning-and-Formatting.sh
# Author: Einarr Northman
# Function: Automate GPT Partitioning and formatting of drive.
# =============================================================

# WARNING:: 
# This is an automated script and will wipe the drive /dev/nvme0n1 without warning or user interaction. 
# This script is also hard coded to function with my personal system. USE AT OWN RISK. 

## Wipe the drive and clear all current partition data. ##

# Wipe sata drive
sgdisk --zap-all /dev/sda

## Create Partitions ##

# Partition 1: (EFI partition)
sgdisk -n 1:0:+1024M -t 1:ef00 -c 1:"EFI" /dev/sda

# Partition 2: (Swap partition)
sgdisk -n 2:0:+16384M -t 2:8200 -c 2:"SWAP" /dev/sda

# Partition 3: (Root system partition)
sgdisk -n 3:0:+65536M -t 3:8304 -c 3:"ROOT" /dev/sda

# Partition 4: (Home system partition)
sgdisk -n 4:0:0 -t 4:8302 -c 4:"HOME" /dev/sda

#update kernal
udevadm settle

## Formating Partitions ##

# Format Partition 1: (EFI partition):
mkfs.fat -F32 /dev/sda1

#Format Partition 2: (SWAP partition)
mkswap /dev/sda2
#Turn SWAP on
swapon /dev/sda2

#Format Partition 3: (Root partition)
mkfs.ext4 /dev/sda3

#Format Partition 4: (Home partition)
mkfs.ext4 /dev/sda4
