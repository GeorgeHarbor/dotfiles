
!/bin/bash

# Network interface (replace with your interface)
interface="eno1"

# Capture the RX and TX bytes from /sys/class/net
rx_bytes=$(cat /sys/class/net/$interface/statistics/rx_bytes)
tx_bytes=$(cat /sys/class/net/$interface/statistics/tx_bytes)
sleep 1
rx_bytes_new=$(cat /sys/class/net/$interface/statistics/rx_bytes)
tx_bytes_new=$(cat /sys/class/net/$interface/statistics/tx_bytes)

# Calculate the speed
rx_speed=$(( ($rx_bytes_new - $rx_bytes) / 1024 ))
tx_speed=$(( ($tx_bytes_new - $tx_bytes) / 1024 ))

# Output in a human-readable format
echo " $rx_speed KB/s  $tx_speed KB/s"
