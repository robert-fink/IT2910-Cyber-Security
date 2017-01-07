sudo iptables -F 
sudo iptables -F INPUT
sudo iptables -F OUTPUT
sudo iptables -F FORWARD
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD DROP
sudo iptables -A INPUT -i eth0 -j ACCEPT

sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

sudo iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

sudo iptables -A OUTPUT -o eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

sudo iptables -A INPUT -p tcp -j LOG --log-prefix ' INPUT TCP ' --log-level 7

sudo iptables -A OUTPUT -p tcp -j LOG --log-prefix ' OUTPUT TCP ' --log-level 7

sudo iptables -A INPUT -j REJECT --reject-with icmp-host-prohibited

sudo iptables -A OUTPUT -j REJECT --reject-with icmp-host-prohibited
