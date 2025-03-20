# Distributed Denial of Service

## Description 
The project consists of a simple DDoS attack in which I attempted to bring down an Apache web server hosted
on a Sparky-Linux virtual machine using command-line utilities such as hping3 for SYN flooding and curl for
POST requests.

## Conclusion
Due to hardware limitations and the simplicity of such an attack, the experiment resulted into the host system
increased resource usage such as CPU and RAM.

## How to mitigate the attack  
In order to mitigate such an attack I implemented rate-limiting to allow only a certain number of web requests
per second.
Other ways to stop a DDoS attack from occuring:
  - Using a reverse proxy which can absorb attack traffic before reaching the server
  - Blocking traffic coming from a specific range of IPs
  - Enable SYN flood protection for TCP-based attacks
