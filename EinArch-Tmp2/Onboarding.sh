#!/bin/bash
# =============================================================
# Project: EinArch-Hyprland
# Script: On-boarding.sh
# Author: Einarr Northman
# Function: Store user inputs as variable and export them.
# Version: 0.0.1
# =============================================================

# WARNING:: 
# This script could cause damage to your system.
# This is an automated script and will perform functions without warining or user interaction. 
# This script is also hard coded to function with my personal system. USE AT OWN RISK. 

#Clear the screen prepare user for On-boarding
clear

#On-boarding welcome message.
printf '\e[1;36mWelcome to the \e[32m"On-boarding" \e[36mProcess'
printf '\n\e[1;91mThis \e[32m"On-boarding" \e[91mProcess will guide through the \e[93muser input \e[36mrequired for a \e[93mautomated \e[31mArch Linux \e[93mvanilla \e[36minstall.'

SuccessFlag01=0
while [[ "$SuccessFlag01" -eq 0 ]] ; do
  # Prompt user for root password
  printf '\n\n\e[1;36mPlease provide a \e[31m"root" \e[93mpassword \e[36mfor the system.\n'
  printf '\e[31m"Root" \e[93mPassword:\e[36m '
  read -s RootPassword

  # Prompt user to verify root password
  printf '\n\n\e[1;36mPlease \e[93mverify \e[36mthe \e[31m"root" \e[93mpassword \e[36mfor the system.\n'
  printf '\e[93mVerify \e[31m"root" \e[93mPassword:\e[36m '
  read -s VerifiedRootPassword

  # Logic to verify root password
  if [[ $RootPassword != $VerifiedRootPassword ]]; then
    SuccessFlag01=0
    printf '\n\n\e[1;31mError: \e[93m"Password Missmatch" \e[31mPlease try again,'
  else
    SuccessFlag01=1
    printf '\n\n\e[1;32mSuccess: \e[93mVerification match\e[36m, \e[93mPassword \e[36mhas been set for \e[31m"Root"'
    RootPassword="$RootPassword"
    break
  fi
done

# Prompt user for hostname
printf '\n\n\e[1;36mPlease provide a \e[31m"hostname" \e[36mthis will be the name of the \e[93msystem.\n'
printf '\e[93mSystem \e[31mHostname:\e[36m '
read hostname

# Prompt user for username.
printf '\n\e[1;36mPlease provide a \e[31m"username" \e[36mto create a \e[32mnew \e[31m"user" \e[36mon the system.\n'
printf '\e[32mNew \e[31mUsername:\e[36m '
read username

SuccessFlag02=0
while [[ "$SuccessFlag02" -eq 0 ]]; do
 
  # Prompt user for user password
  printf '\n\e[1;36mPlease provide a \e[93mpassword \e[36mfor the \e[32mnew \e[31m"user" \e[36mjust created.\n'
  printf '\e[32mNew \e[31m"user" \e[93mPassword:\e[36m '
  read -s UserPassword

  # Prompt user to verify user password
  printf '\n\n\e[1;36mPlease \e[93mverify \e[36mthe \e[93mpassword \e[36mfor the \e[32mnew \e[31m"user" \e[36mjust created.\n'
  printf '\e[93mVerify \e[32mnew \e[31m"user" \e[93mPassword:\e[36m '
  read -s VerifiedUserPassword

  # Logic to verify user password
  if [[ $UserPassword != $VerifiedUserPassword ]]; then
    SuccessFlag02=0
    printf '\n\n\e[1;31mError: \e[93m"Password Missmatch" \e[31mPlease try again,'
  else
    SuccessFlag02=1
    printf '\n\n\e[1;32mSuccess: \e[93mVerification match\e[36m, \e[93mPassword \e[36mhas been set for the \e[32mnew \e[31m"User"'
    UserPassword="$UserPassword"
    break
  fi

done
# On-boarding Complete message
printf '\n\n\e[1;32mOn-Boarding \e[36mcomplete ! \nThe \e[93mAutomation \e[36mscripts will now complete the base install of vanilla Arch Linux \e[0m'
sleep 3
export RootPassword
export hostname
export username
export UserPassword
