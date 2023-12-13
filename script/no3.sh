iptables -F
iptables -A INPUT -p icmp --icmp-type echo-request -m connlimit --connlimit-above 3 -j DROP
iptables -A INPUT -m STATE --state ESTABLISHED,RELATED -j ACCEPT
iptables -L