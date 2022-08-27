# Interface setup for VLAN 100
ip link set enp0s8 up
ip link add link enp0s8 name enp0s8.100 type vlan id 100

ip addr add 10.3.3.1/16 dev enp0s8.100
ip link set enp0s8.100 up
ip route add 10.0.0.0/24 via 10.3.3.254 dev enp0s8.100
ip route add 10.1.1.0/24 via 10.3.3.254 dev enp0s8.100


echo 1 > /proc/sys/net/ipv4/ip_forward

# Firewall rules

#iptables -A POSTROUTING -t nat -o enp0s3 -j MASQUERADE
#iptables -A POSTROUTING -t nat -o enp0s8 -j MASQUERADE
#
#export WAN=enp0s3
#export VLAN=enp0s8
#
## Firewall rules to allow only traffic from tun0
#iptables -F #flush previous rules
#
#iptables -P FORWARD ACCEPT #[0:0]
#iptables -P INPUT ACCEPT #[193:15624]
#iptables -P OUTPUT ACCEPT #[58:3096]
#iptables -A INPUT -i WAN -j ACCEPT
#iptables -A INPUT -i VLAN -j ACCEPT
#iptables -A FORWARD -i WAN -j ACCEPT
#iptables -A FORWARD -o WAN -j ACCEPT
#iptables -A FORWARD -i VLAN -j ACCEPT
#iptables -A FORWARD -o VLAN -j ACCEPT
#iptables -A OUTPUT -o WAN -j ACCEPT
#iptables -A OUTPUT -o VLAN -j ACCEPT
#
#iptables -A FORWARD -i $WAN -o $VLAN -j ACCEPT
#iptables -A FORWARD -i $VLAN -o $WAN -j ACCEPT
