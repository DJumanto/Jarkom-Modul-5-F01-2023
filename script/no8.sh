SUB_REVOLTE="10.52.15.124/30"
PEMILU_S=$(date -d "2023-10-19T00:00" +"%Y-%m-%dT%H:%M")
PEMILU_E=$(date -d "2024-02-15T00:00" +"%Y-%m-%dT%H:%M")
iptables -A INPUT -p tcp -s $SUB_REVOLTE --dport 80 -m time --datestart "$PEMILU_S" --datestop "$PEMILU_E" -j DROP