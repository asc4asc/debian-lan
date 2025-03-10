#!/bin/bash
#
sudo modprobe i2c-dev
SMBus=$(sudo i2cdetect -l |grep smbus|cut -d'-' -f2|cut  -f1)
echo "Test start:"
while true; do
  sudo i2cset -y ${SMBus} 0x2E 0xa0 0x80 b # LED
  # sudo i2cset -y ${SMBus} 0x2E 0xa0 0x04 b # Watchdog
  sleep 0.01
  sudo i2cset -y ${SMBus} 0x2E 0xa0 0x00 b 
  sleep 0.01
done
