echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install isc-dhcp-relay -y
service isc-dhcp-relay 
echo '
SERVERS="10.52.1.2"  
INTERFACES="eth0 eth1 eth2 eth3 eth4"
OPTIONS=
' > /etc/default/isc-dhcp-relay

echo '
net.ipv4.ip_forward=1
' > /etc/sysctl.conf
service isc-dhcp-relay start

