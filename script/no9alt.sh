iptables -N portscan

iptables -A FORWARD -m recent --name portscan --rcheck --seconds 86400 --hitcount 20 -j DROP
iptables -A FORWARD -m recent --name portscan --rcheck --seconds 86400 --hitcount 20 -j DROP


iptables -A INPUT -m recent --name portscan --set -j ACCEPT
iptables -A FORWARD -m recent --name portscan --set -j ACCEPT
