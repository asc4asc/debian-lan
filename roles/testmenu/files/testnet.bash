#!/bin/bash

# Variables
INTERFACE_SERVER="eth0"
INTERFACE_CLIENT="eth1"
IP_SERVER="192.168.1.1"
IP_CLIENT="192.168.1.2"
DURATION=60
PARALLEL_STREAMS=4
INTERVAL=1

# Install necessary packages
sudo apt-get update
sudo apt-get install -y iperf3 linux-tools-common linux-tools-$(uname -r)

# Set CPU C-states (disable all except C0)
sudo cpupower idle-set -D 0

# Assign IP addresses to interfaces
sudo ip addr add $IP_SERVER/24 dev $INTERFACE_SERVER
sudo ip addr add $IP_CLIENT/24 dev $INTERFACE_CLIENT

# Bring up the interfaces
sudo ip link set $INTERFACE_SERVER up
sudo ip link set $INTERFACE_CLIENT up

# Start iperf3 server on the server interface
iperf3 -s -B $IP_SERVER &

# Wait a moment to ensure the server starts
sleep 2

# Run iperf3 client on the client interface
iperf3 -c $IP_SERVER -B $IP_CLIENT -t $DURATION -P $PARALLEL_STREAMS -i $INTERVAL

# Re-enable all C-states after the test
sudo cpupower idle-set -E

# Clean up IP addresses
sudo ip addr del $IP_SERVER/24 dev $INTERFACE_SERVER
sudo ip addr del $IP_CLIENT/24 dev $INTERFACE_CLIENT
