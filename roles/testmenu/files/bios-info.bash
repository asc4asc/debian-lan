#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Collect detailed BIOS information
dmidecode -t bios -t system -t baseboard
