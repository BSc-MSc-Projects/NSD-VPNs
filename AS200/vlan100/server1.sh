ip link add link enp0s8 name enp0s8.100 type vlan id 100
ip addr add 2.1.0.11/16 dev enp0s8.100
ip route add default via 2.1.0.10
ip link set enp0s8.100 up
