## Server B first machine, with 2 VMs ("emulated" by the use of network namespaces)
#  Each Vm belongs to a different BD  

ip netns add vmC
ip netns add vmD
ip link add link enp0s8 name enp0s8.10 type vlan id 10
ip link add link enp0s8 name enp0s8.20 type vlan id 20
ip link set enp0s8.10 netns vmD
ip link set enp0s8.20 netns vmC
ip netns exec vmC ip addr add 10.0.0.2/24 dev enp0s8.20
#ip netns exec vmC ip route add default via 10.0.0.254
ip netns exec vmD ip addr add 10.1.1.2/24 dev enp0s8.10
#ip netns exec vmD ip route add default via 10.1.1.254

ip netns exec vmC ip link set enp0s8.20 up
ip netns exec vmD ip link set enp0s8.10 up
