# bashscript
Here is where I store some of the bash script that I did
### DIVIDE SUBNET
The script splitsubnet.sh can be used to divide a network into a predefined number of subnet

Write a bash script to subdivide a given subnet into a pre-defined number of smaller subnets. 
Show network/broadcast address, number of hosts and assign gateway.

Sample run as below:
```
./splitsubnet.sh 192.168.1.1/24 5
Network is 192.168.1.1
CIDR is 24
Divide into 5 networks
192.168.1.0/26 subnet 192.168.1.0 broadcast 192.168.1.63 gateway 192.168.1.1 hosts 61
192.168.1.64/26 subnet 192.168.1.64 broadcast 192.168.1.127 gateway 192.168.1.65 hosts 61
192.168.1.0/26 subnet 192.168.1.0 broadcast 192.168.1.63 gateway 192.168.1.1 hosts 61
192.168.1.0/27 subnet 192.168.1.0 broadcast 192.168.1.31 gateway 192.168.1.1 hosts 29
192.168.1.32/27 subnet 192.168.1.32 broadcast 192.168.1.63 gateway 192.168.1.33 hosts 29
```