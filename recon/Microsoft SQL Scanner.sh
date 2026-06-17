#!/bin/bash

# This script uses Nmap to scan a user-defined range of IPs for a specific service, in this case Microsoft's SQL Server.

# User inputs first IP address in the desired range.
echo "Enter starting IP address: "
read FirstIP

# User types the last usable IP from the desired range.
echo "Enter last octet in address range: "
read LastOctet

# Prompt that let's the user specify which service to scan the target network for.
echo "Enter port number: "
read port

# Nmap executes a TCP connect scan on each IP, searches for the target service/port and with the -oG option it sends the output to a grep-able file named MSSQLscan.
# Note that using the ">/dev/null" does not display the scanning process.
nmap -sT $FirstIP-$LastOctet -p $port >/dev/null -oG MSSQLscan

# After the output has been redirected, we can use grep to only display the vulnerable targets. This process is then written to a file named MSSQLscan2 which is the final result of scan.
cat MSSQLscan | grep open > MSSQLscan2

# Display final scan results.
cat MSSQLscan2
