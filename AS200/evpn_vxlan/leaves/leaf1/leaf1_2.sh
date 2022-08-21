# eBGP for leaf1
net add bgp autonomous-system 65001
net add bgp router-id 1.1.1.1
net add bgp neighbor swp2 remote-as 65000
net add bgp neighbor swp3 remote-as 65000
net add bgp evpn neighbor swp2 activate
net add bgp evpn neighbor swp3 activate
net add bgp evpn advertise-all-vni

net pending
net commit
