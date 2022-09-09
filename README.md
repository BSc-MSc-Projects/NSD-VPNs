# NSD-VPNs
NSD network topology project (Prof. Bonola).

## Topology overview
![](topology.png)
For this topology, the following VM isos have been used:

| Machine name   | ISO    |
|--------------- | --------------- |
| R1-9   | Cisco router 7200   |
| opevpn-client1, server 1 and 2, customer A and B  | lubuntu   |
| VPN-server, gw-fw-openvpn-client2  | ubuntu server   |
 

## Configuration

### eBGP between AS100, AS200 and AS300
The comunication between the ASes is managed by eBGP protocol. Each AS has a border router linked to the IXP LAN
and comunicate the network behind him to the others routers. Only the router in AS100 applies route filtering.
The configuration of the routers is in the folder `eBGP and OSPF`

### OSPF - MPLS in AS100
Inside the AS100, the routers exchange information about the sub-networks they manage using the OSPF protocol. In addition, the packets travel in the AS through the use of labels, by means of the MPLS protocol. The configuration is in the folder `eBGP and OSPF`.

### BGP/MPLS VPN between cusomer site A and site B
The VPN permit to a packet in site A to reach the other site and vice versa. Packets travel again using MPLS protocol inside the AS100.
Only packets belonging to the VPN can travel this path, because the physical address informations are not widely propagated.
In order to establish the VPN, the previous OSPF configuration is required. The files are stored in the folder `BGP-MPLS VPN`

### AS200
AS is composed of 

- a datacenter, in which there is a EVPN/VXLAN
- an access gateway and firewall, that allows the datacenter to be reached from WAN
- a cisco router

The configuration scripts for this piece are in `AS200` folder.<br>
In particular, inside `evpn\_vxlan` contains the configuration file to run EVPN/VXLAN:

- `spines` folder contains files to configure __spine-1__ and __spine-2__
- `leaves` folder contains files to configure __leaf-1__ and __leaf-2__
- `end_hosts` folder contains files to configure `server-1` and `server-2`
Finally, `gw_fw.sh` is the configuration file for the linux gateway and firewall.<br>
To run the scripts, just give it the proper execution permission with `chmod +x filename.sh`.<br>


### Overlay VPN

