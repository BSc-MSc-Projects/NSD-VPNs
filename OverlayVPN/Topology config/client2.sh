
ip link set enp0s3 up
ip addr add 2.0.0.2/8 dev enp0s3
ip route add default via 2.0.0.1 