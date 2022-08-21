echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -A POSTROUTING -t nat -o enp0s3 -j MASQUERADE
iptables -A POSTROUTING -t nat -o enp0s8 -j MASQUERADE

export WAN=enp0s3
export VLAN=enp0s8

# Firewall rules to allow only traffic from tun0
#iptables -F
iptables -P FORWARD ACCEPT #[0:0]
iptables -P INPUT ACCEPT #[193:15624]
iptables -P OUTPUT ACCEPT #[58:3096]
##iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT
#iptables -A INPUT -p udp -m udp --dport 1194 -j ACCEPT
#iptables -A INPUT -i tun0 -j ACCEPT
#ip netns exec vm100 iptables -A INPUT -i enp0s8.100 -j ACCEPT
#iptables -A FORWARD -i tun0 -j ACCEPT
#iptables -A FORWARD -o tun0 -j ACCEPT
#ip netns exec vm100 iptables -A FORWARD -i enp0s8.100 -j ACCEPT
#ip netns exec vm100 iptables -A FORWARD -o enp0s8.100 -j ACCEPT
#iptables -A OUTPUT -p udp -m udp --sport 1194 -j ACCEPT
#iptables -A OUTPUT -o tun0 -j ACCEPT
#ip netns exec vm100 iptables -A OUTPUT -o enp0s8.100 -j ACCEPT
#
#
#iptables -A INPUT -i enp0s3 -j ACCEPT
#iptables -A INPUT -i enp0s8 -j ACCEPT
#iptables -A FORWARD -i enp0s3 -j ACCEPT
#iptables -A FORWARD -o enp0s3 -j ACCEPT
#iptables -A FORWARD -i enp0s8 -j ACCEPT
#iptables -A FORWARD -o enp0s8 -j ACCEPT
#iptables -A OUTPUT -o enp0s3 -j ACCEPT
#iptables -A OUTPUT -o enp0s8 -j ACCEPT
#
#iptables -A INPUT -p icmp -j ACCEPT
#iptables -A FORWARD -p icmp -j ACCEPT

iptables -A FORWARD -i $WAN -o $VLAN -j ACCEPT
iptables -A FORWARD -i $VLAN -o $WAN -j ACCEPT
