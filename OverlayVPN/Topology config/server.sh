ip link set enp0s3 up
ip addr add 1.1.0.2/16 dev enp0s3
ip route add default via 1.1.0.1

echo 1 > /proc/sys/net/ipv4/ip_forward
#iptables -t NAT -A POSTROUTING -o enp0s3 -j MASQUERADE
