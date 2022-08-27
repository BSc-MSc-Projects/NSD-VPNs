# NSD-VPNs
NSD network topology project (Prof. Bonola)

## Topology overview
![](topology.png)
For this topology, the following VM isos have been used:

| Machine name   | ISO    |
|--------------- | --------------- |
| R1-9   | Cisco router 7200   |
| opevpn-client1, server-1 and 2, customer-A and B  | lubuntu   |
| VPN-server,gw-fw-openvpn-client2  | ubuntu server   |
 

## Configuration

### AS 200
AS is composed by a datacenter, in which there is a EVPN/VXLAN.
The configuration scripts for this are in __evpn\_vxlan__ folder which is organized following the same names in the topology.
To run the scripts, just give it the proper execution permission with `chmod +x filename.sh`.<br>
There is also VLAN-100 between gateway and access leaf/server-1, whose configuration files are in __AS200/vlan100__.<br>
To configure the firewall, just execute `gw_fw.sh`
