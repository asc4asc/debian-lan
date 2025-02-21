#!/bin/bash
# Collect detailed BIOS information
sudo dmidecode -t bios -t system -t baseboard

echo -n "Name: "; sudo dmidecode -s baseboard-product-name
echo -n "Serial Number: "; sudo dmidecode -s baseboard-serial-number
echo -n "BIOS Build: "; sudo dmidecode -s bios-version
