#!/bin/bash
source Onboarding.sh
source CachyOS-Kernel.sh
source Partitioning-and-Formatting.sh
source Base-Install.sh
source System-Config2.sh
source User-Dirs-Config.sh
source Desktop-Install.sh
echo "your system is installed, restarting in 5 seconds"
sleep 5
reboot
