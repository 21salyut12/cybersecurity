#!/bin/bash

while true; do
  # Append the date to the target site_stats.log
  echo "$(date)" >> site_stats.log
  
  # Append data of interest, such as CPU and memory, to the site_stats.log
  ps -C apache -o pid,%cpu,%mem,cmd >> site_stats.log
  
  # Delimiter between each entry in the file 
  echo "----------------------" >> site_stats.log

  # Wait for 1 second and start appending data again
  sleep 1
done
