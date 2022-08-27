## Configuration file for linux gateway/firewall in AS200

# Interface setup for VLAN 100
ip link set enp0s8 up
ip link add link enp0s8 name enp0s8.100 type vlan id 100

ip addr add 10.3.3.1/16 dev enp0s8.100
ip link set enp0s8.100 up
ip route add 10.0.0.0/24 via 10.3.3.254 dev enp0s8.100
ip route add 10.1.1.0/24 via 10.3.3.254 dev enp0s8.100


echo 1 > /proc/sys/net/ipv4/ip_forward

# Firewall rules

# NAT to allow connection from overlay VPN
iptables -A POSTROUTING -t nat -o enp0s8.100 -j MASQUERADE

iptables -F
iptables -P FORWARD DROP
iptables -P INPUT DROP
iptables -P OUTPUT DROP

# rules to establish overlay VPN
iptables -A INPUT -i enp0s3 -p udp -m udp --sport 1194 -j ACCEPT
iptables -A OUTPUT -o enp0s3 -p udp -m udp --dport 1194 -j ACCEPT

iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 1194 -j ACCEPT
iptables -A INPUT -i tun0 -j ACCEPT
iptables -A FORWARD -i tun0 -j ACCEPT
iptables -A FORWARD -o tun0 -j ACCEPT
iptables -A OUTPUT -p udp -m udp --sport 1194 -j ACCEPT
iptables -A OUTPUT -o tun0 -j ACCEPT

iptables -A INPUT -p icmp -j ACCEPT
iptables -A FORWARD -p icmp -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT
