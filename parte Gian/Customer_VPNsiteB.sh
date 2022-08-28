#!/bin/bash

ip link set enp0s3 up
ip addr add 6.5.2.2/30 dev enp0s3
ip route add default via 6.5.2.1
