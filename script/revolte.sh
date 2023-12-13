echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install isc-dhcp-server -y 

rm /var/run/dhcpd.pid

service isc-dhcp-server stop
echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server

echo '
#A1
subnet 10.52.15.104 netmask 255.255.255.252 {}

#A4
subnet 10.52.15.108 netmask 255.255.255.252 {}

#A5
subnet 10.52.15.112 netmask 255.255.255.252 {}

#A6
subnet 10.52.15.116 netmask 255.255.255.252 {}

#A9
subnet 10.52.15.120 netmask 255.255.255.252 {}

#A10
subnet 10.52.15.124 netmask 255.255.255.252 {}

#A3
subnet 10.52.8.0 netmask 255.255.252.0 {
    range 10.52.8.2 10.52.10.226;
    option routers 10.52.8.1;
    option broadcast-address 10.52.11.255;
    option domain-name-servers 10.52.15.122;
    default-lease-time 180;   
    max-lease-time 5760;        
}

#A2
subnet 10.52.0.0 netmask 255.255.248.0 {
    range 10.52.0.2 10.52.4.8;
    option routers 10.52.0.1;
    option broadcast-address 10.52.7.255;
    option domain-name-servers  10.52.15.122;
    default-lease-time 180;   
    max-lease-time 5760;        
}

#A7
subnet 10.52.12.0 netmask 255.255.254.0 {
    range 10.52.12.2 10.52.13.2;
    option routers 10.52.12.1;
    option broadcast-address 10.52.13.255;
    option domain-name-servers  10.52.15.122;
    default-lease-time 180;   
    max-lease-time 5760;        
}

#A8
subnet 10.52.15.128 netmask 255.255.255.128 {
    range 10.52.15.131 10.52.15.195;
    option routers 10.52.15.129;
    option broadcast-address 10.52.15.255;
    option domain-name-servers  10.52.15.122;
    default-lease-time 180;   
    max-lease-time 5760;        
}
' > /etc/dhcp/dhcpd.conf