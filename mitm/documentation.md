# Man-in-the-Middle Attack  

## Main Objectives
The scope of this project/experiment is to raise awareness about this type of cyber attack and about how vulnerable can ARP be if not protected correctly.

## What is MitM
MitM also known as Man-in-the-Middle is a cyber attack where a threat actor intercepts a communication between two devices and impersonates one endpoint while the other is completely unaware of it.

<!--FINISH REFINING THE DOCUMENTATION-->

## ARP Spoofing
ARP Spoofing is one of the many methods through which a MitM attack can be successfully executed. It works by intercepting traffic on the network, acquiring a valid target's MAC address and associating it to the attacker's machine.

## Key Components
The experiment was created in a controlled and contained environment called GNS3 and it used a couple of virtual PCs, a Kali Linux virtual machine and a Cisco 2600 router.

### GNS3
GNS3 is an application in which real network environments can be emulated making it a perfect fit for this demonstration. GNS3 has a lot of ISO images available online for either free or paid use, that can be downloaded and emulate network devices such as switches, firewalls or in the case of this project, routers. Therefore a Cisco 2600 router ISO image was downloaded.

### Kali Linux
Kali Linux is a Debian-based Linux distribution used to perform advanced penetration testing and security auditing.

### Wireshark
Wireshark is a network traffic analyzer tool which is used in this experiment to gather information about the target devices and check for network connectivity.

## Setup

### Network Topology
For convenience, the network topology is more of a star topology as every device (the two virtual PCs, Kali and the Cisco router) is connected to a single switch.

### Connecting Kali to GNS3
As mentioned in the **Key Components** sections Kali is a virtual machine within VMware in our case. Therefore in order to connect Kali to the network emulated inside GNS3, the VM had to be added to a list of virtual devices GNS3 can use in its topologies.

## Attack Execution
To execute the attack, the default gateway's MAC address was spoofed using the following command: ```sudo arpspoof -i eth0 -t <ROUTER_IP> <ATTACKER_IP>```. To break down the command, the ```-i``` option needs the user to specify the interface connected to the targeet device and the ```-t``` option where a target IP must be specified. The command simply associates the router's ARP information to the attacker machine. The same command can now be used to tell other devices on the network that Kali is the default gateway through which network traffic should be sent: ```sudo aprspoof i -eth0 <DEVICE_IP> <SPOOFED_IP>```.
After the spoofing process a few pings were sent through the network to check connectivity between devices.

![Screenshot during the attack](/mitm/mitm_imgs/mitm_attack.jpg)

To clear out the ARP cache on Kali, after successfully executing the attack, the following command was issued:
```sudo ip -s -s neigh flush all```
To break down the command the ```ip``` utility configures network interfaces, ```-s -s``` flags offer verbose output, the ```neigh``` (short for neighbor) refers to the ARP table and ```flush all``` deletes every entry in this table. 

## Conclusions

### Objective
The experiment demonstrated successfully how vulnerable ARP can be and how spoofing it can compromise network security and lead to a Man-in-the-Middle attack.

## Mitigation Techniques  
To prevent MITM attacks, the following security measures can be implemented:  
1. Dynamic ARP Inspection (DAI) to block spoofed ARP packets.  
2. Static ARP entries for critical devices to prevent ARP poisoning.  
3. VLAN segmentation to limit the impact of spoofing within a network.  
4. Encryption protocols (HTTPS, TLS, VPNs) to secure communication even if traffic is intercepted.
