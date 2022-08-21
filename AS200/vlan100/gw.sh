ip link add link enp0s8 name enp0s8.100 type vlan id 100
ip addr add 2.1.0.10/16 dev enp0s8.100
ip link set enp0s8 up
ip link set enp0s8.100 up
