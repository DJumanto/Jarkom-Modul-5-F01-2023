STARK="10.52.15.114"
SEIN="10.52.8.2"
iptables -t nat -F
iptables -A PREROUTING -t nat -p tcp --dport 80  -d 10.52.8.2 -m nth --every 2 --packet 0 -j DNAT --to-destination 10.52.8.2:80
iptables -A PREROUTING -t nat -p tcp --dport 80 -d 10.52.8.2 -j DNAT --to-destination 10.52.15.114:80

iptables -A PREROUTING -t nat -p tcp --dport 443  -d 10.52.15.114 -m nth --every 2 --packet 0 -j DNAT --to-destination 10.52.8.2:443
iptables -A PREROUTING -t nat -p tcp --dport 443 -d 10.52.15.114 -j DNAT --to-destination 10.52.15.114:443