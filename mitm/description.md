# Man-In-The-Middle Attack  

## Description  
This project consists of a simulated Man-In-The-Middle (MITM) attack using Kali Linux and GNS3. The attack was carried out through ARP spoofing, allowing the attacker to intercept and manipulate traffic between two virtual PCs.

## Conclusion  
The experiment demonstrated the effectiveness of ARP spoofing in compromising network security. The attack enabled traffic interception and modification, highlighting the risks of unprotected network environments.  

## How to mitigate the attack  
To prevent MITM attacks, the following security measures can be implemented:  
- Dynamic ARP Inspection (DAI) to block spoofed ARP packets.  
- Static ARP entries for critical devices to prevent ARP poisoning.  
- VLAN segmentation to limit the impact of spoofing within a network.  
- Encryption protocols (HTTPS, TLS, VPNs) to secure communication even if traffic is intercepted.  
