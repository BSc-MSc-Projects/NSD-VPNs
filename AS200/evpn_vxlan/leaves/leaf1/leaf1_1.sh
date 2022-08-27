# Bridge configuration for leaf 1
net add bridge bridge ports swp1,swp4
net add bridge bridge pvid 1
net add bridge bridge vids 10,20,100

# IP addr for leaf 1
net add interface swp2 ip add 10.1.1.1/30
net add interface swp3 ip add 10.1.2.1/30
net add loopback lo ip add 1.1.1.1/32

# OSPF config for leaf 1
net add ospf router-id 1.1.1.1
net add ospf network 10.1.1.1/30 area 0
net add ospf network 10.1.2.1/30 area 0
net add ospf network 1.1.1.1/32 area 0

# VXLAN config for leaf 1
net add vxlan vni-100 vxlan id 100
net add vxlan vni-100 vxlan local-tunnelip 1.1.1.1
net add vxlan vni-100 bridge access 10
net add vxlan vni-200 vxlan id 200
net add vxlan vni-200 vxlan local-tunnelip 1.1.1.1
net add vxlan vni-200 bridge access 20


net pending
net commit
