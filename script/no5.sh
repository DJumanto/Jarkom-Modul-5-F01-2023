iptables -F
iptables -A INPUT --dport 22 -s 10.52.8.3 -m time --timestart 08:00 --timestop 16:00 --weekdays Mon,Tue,Wed,Thu,Fri -j ACCEPT
iptables -L -n -v