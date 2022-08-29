ip link set enp0s3 up
ip addr add 1.1.0.2/16 dev enp0s3
ip route add default via 1.1.0.1

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -A POSTROUTING -t nat -o enp0s3 -j MASQUERADE

# Firewall rules to allow only traffic from tun0
iptables -F
iptables -P FORWARD DROP #[0:0]
iptables -P INPUT DROP #[193:15624]
iptables -P OUTPUT DROP #[58:3096]
iptables -A INPUT -p udp -m udp --dport 1194 -j ACCEPT
iptables -A INPUT -i tun0 -j ACCEPT
iptables -A FORWARD -i tun0 -j ACCEPT
iptables -A FORWARD -o tun0 -j ACCEPT
iptables -A OUTPUT -p udp -m udp --sport 1194 -j ACCEPT
iptables -A OUTPUT -o tun0 -j ACCEPT
