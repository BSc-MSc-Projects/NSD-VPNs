ip link set enp0s3 up
ip addr add 3.0.0.100/8 dev enp0s3
ip route add default via 3.0.0.1 