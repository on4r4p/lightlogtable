#!/bin/sh
echo "Stopping firewall and allowing everyone..."
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -F
sudo iptables -X
echo "Adding Basics Rules Psad Friendly .."
sudo iptables -A INPUT -m limit --limit 5/min -j LOG --log-tcp-options --log-prefix "[IPTABLES-INPUT] "
sudo iptables -A FORWARD -m limit --limit 5/min -j LOG --log-tcp-options --log-prefix "[IPTABLES-FORWARD] "
sudo iptables -A REJECT -m limit --limit 5/min -j LOG --log-tcp-options --log-prefix "[IPTABLES-REJECT] "
sudo iptables -A OUTPUT -m limit --limit 5/min -j LOG --log-tcp-options --log-prefix "[IPTABLES-OUTPUT] "
echo "Done..."

