# Spine 1 network config

net add interface swp1 ip add 10.1.2.2/30
net add interface swp2 ip add 10.2.2.2/30
#net add interface swp3 ip add 10.3.2.2/30
net add loopback lo ip add 5.5.5.5/32

net add ospf router-id 5.5.5.5
net add ospf network 10.1.2.2/30 area 0
net add ospf network 10.2.2.2/30 area 0
#net add ospf network 10.3.2.2/30 area 0
net add ospf network 5.5.5.5/32 area 0

net add bgp autonomous-system 65000
net add bgp router-id 5.5.5.5
net add bgp neighbor swp1 remote-as external
net add bgp neighbor swp2 remote-as external
#net add bgp neighbor swp3 remote-as external
net add bgp evpn neighbor swp1 activate
net add bgp evpn neighbor swp2 activate
#net add bgp evpn neighbor swp3 activate

net pending
net commit
