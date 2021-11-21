#!/bin/bash

# Cleaning all rules
iptables -F
iptables -t nat -F
iptables -t mangle -F

# Avoiding DoS attacks
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

# Setting necessaries services
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT

# Blocking other ports
iptables -A INPUT -p tcp --syn -j DROP

