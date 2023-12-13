iptables -N portscan

iptables -A INPUT -m recent --name portscan --update --seconds 600 --hitcount 20 -j LOG --log-prefix "PORTSCAN DROP: " --log-level 6
iptables -A INPUT -m recent --name portscan --update --seconds 600 --hitcount 20 -j DROP

iptables -A FORWARD -m recent --name portscan --update --seconds 600 --hitcount 20 -j LOG --log-prefix "PORTSCAN DROP: " --log-level 6
iptables -A FORWARD -m recent --name portscan --update --seconds 600 --hitcount 20 -j DROP

iptables -A INPUT -m recent --name portscan --set -j ACCEPT
iptables -A FORWARD -m recent --name portscan --set -j ACCEPT
