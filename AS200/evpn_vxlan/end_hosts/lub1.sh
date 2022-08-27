## Server A first machine, with 2 VMs ("emulated" by the use of network namespaces)
#  Each Vm belongs to a different BD

ip netns add vmA
ip netns add vmB
ip link add link enp0s8 name enp0s8.10 type vlan id 10
ip link add link enp0s8 name enp0s8.20 type vlan id 20
ip link set enp0s8.10 netns vmB
ip link set enp0s8.20 netns vmA
ip netns exec vmA ip addr add 10.0.0.1/24 dev enp0s8.20
ip netns exec vmB ip addr add 10.1.1.1/24 dev enp0s8.10

ip netns exec vmA ip link set enp0s8.20 up
ip netns exec vmB ip link set enp0s8.10 up
ip netns exec vmA ip route add default via 10.0.0.254
ip netns exec vmB ip route add default via 10.1.1.254
