#!/bin/bash
# Collect detailed BIOS information
sudo dmidecode -t bios -t system -t baseboard

echo Name: ; sudo dmidecode -s baseboard-product-name
echo Serial Number ; sudo dmidecode -s baseboard-serial-number
echo BIOS Build ; sudo dmidecode -s bios-version
