```
/system identity set name=R1
/interface ethernet set ether1 comment="Transit: Internet"
/interface ethernet set ether2 comment="LAN lab"
/ip dhcp-client add interface=ether1
/ip address add address=192.168.10.65/27 interface=ether2
/ip pool add name=pool-lan ranges=192.168.10.70-192.168.10.94
/ip dhcp-server add name=dhcp-lan interface=ether2 address-pool=pool-lan
/ip dhcp-server network add address=192.168.10.64/27 gateway=192.168.10.65 dns-server=8.8.8.8
/ip firewall nat add chain=srcnat out-interface=ether1 action=masquerade
```
