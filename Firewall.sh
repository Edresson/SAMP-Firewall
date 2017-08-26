# SAMP-Firewall
# Layer 7 protection for samp servers
# Credits: Edresson Casanova | BlastHosting  : https://www.blasthosting.com.br/ 

iptables -I INPUT -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|081e77da|'  -m recent --name limitcon --set -j DROP

iptables -I INPUT -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|081e77da|' -m recent --name limitcon --update --hitcount 2 -m recent --name limitcon --remove -j ACCEPT


iptables -I INPUT -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|53414d50a772c94a611e69|'  -m recent --name limitI --set -j DROP

iptables -I INPUT -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|53414d50a772c94a611e69|' -m recent --name limitI --update --hitcount 2 -m recent --name limitI --remove -j ACCEPT


iptables -I INPUT -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|53414d50a772c94a611e63|'  -m recent --name limitC --set -j DROP

iptables -I INPUT -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|53414d50a772c94a611e63|' -m recent --name limitC --update --hitcount 2 -m recent --name limitC --remove -j ACCEPT


iptables -I INPUT -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|53414d50a772c94a611e72|'  -m recent --name limitR --set -j DROP

iptables -I INPUT -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|53414d50a772c94a611e72|' -m recent --name limitR --update --hitcount 2 -m recent --name limitR --remove -j ACCEPT


 





