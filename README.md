### DIVIDE SUBNET
The script splitsubnet.sh can be used to divide a network into a predefined number of subnet

Write a bash script to subdivide a given subnet into a pre-defined number of smaller subnets. 
Show network/broadcast address, number of hosts and assign gateway.

Sample run as below:
```
./splitsubnet.sh 192.168.1.1/24 9

192.168.1.0/27 subnet 192.168.1.0 broadcast 192.168.1.31 gateway 192.168.1.1 hosts 29
192.168.1.32/27 subnet 192.168.1.32 broadcast 192.168.1.63 gateway 192.168.1.33 hosts 29
192.168.1.64/27 subnet 192.168.1.64 broadcast 192.168.1.95 gateway 192.168.1.65 hosts 29
192.168.1.96/27 subnet 192.168.1.96 broadcast 192.168.1.127 gateway 192.168.1.97 hosts 29
192.168.1.128/27 subnet 192.168.1.128 broadcast 192.168.1.159 gateway 192.168.1.129 hosts 29
192.168.1.160/27 subnet 192.168.1.160 broadcast 192.168.1.191 gateway 192.168.1.161 hosts 29
192.168.1.192/27 subnet 192.168.1.192 broadcast 192.168.1.223 gateway 192.168.1.193 hosts 29
192.168.1.224/28 subnet 192.168.1.224 broadcast 192.168.1.239 gateway 192.168.1.225 hosts 13
192.168.1.240/28 subnet 192.168.1.240 broadcast 192.168.1.255 gateway 192.168.1.241 hosts 13
```
