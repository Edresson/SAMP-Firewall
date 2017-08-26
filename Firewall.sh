# SAMP-Firewall
# Layer 7 protection for samp servers
# Credits: Edresson Casanova | BlastHosting  : https://www.blasthosting.com.br/ 

### Samp check server stats 	
iptables -I INPUT  -s 66.55.155.101 -j ACCEPT
iptables -I INPUT  -s 66.55.155.0/24 -j ACCEPT
iptables -I INPUT  -s  82.192.84.116 -j ACCEPT
iptables -I INPUT  -s  82.192.84.0/24 -j ACCEPT		

### SAcnr monitor and 
iptables -I INPUT  -s 104.28.17.92 -j ACCEPT
iptables -I INPUT  -s 104.28.17.0/24 -j ACCEPT
#sa-mp.in
iptables -I INPUT  -s 162.144.7.215 -j ACCEPT
iptables -I INPUT  -s 162.144.7.0/24 -j ACCEPT
#game-stats
iptables -I INPUT  -s 149.202.241.189 -j ACCEPT
iptables -I INPUT  -s 149.202.241.0/24 -j ACCEPT

### Novas Regras dropa 1 libera o resto ! 
iptables -I INPUT -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|081e77da|'  -m recent --name nlimitcon7777 ! --rcheck  -m recent --name limitcon7777 --set -j DROP
iptables -I INPUT  -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|081e77da|' -m recent --name limitcon7777 --rcheck -m recent --name limitcon7777 --remove -m recent --name nlimitcon7777 --set -j ACCEPT
iptables -I INPUT  -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|081e77da|' -m recent --name nlimit7777 --rcheck -j ACCEPT	

iptables -I INPUT  -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|53414d50a772c94a611e63|'  -m recent --name nlimitC7777 ! --rcheck  -m recent --name limitC7777 --set -j DROP
iptables -I INPUT  -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|53414d50a772c94a611e63|' -m recent --name limitC7777 --rcheck -m recent --name limitC7777 --remove -m recent --name nlimitC7777 --set -j ACCEPT
iptables -I INPUT  -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|53414d50a772c94a611e63|' -m recent --name nlimitR7777 --rcheck -j ACCEPT	

iptables -I INPUT  -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|53414d50a772c94a611e72|'  -m recent --name nlimitR7777 ! --rcheck  -m recent --name limitR7777 --set -j DROP
iptables -I INPUT   -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|53414d50a772c94a611e72|' -m recent --name limitR7777 --rcheck -m recent --name limitR7777 --remove -m recent --name nlimitR7777 --set -j ACCEPT
iptables -I INPUT   -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|53414d50a772c94a611e72|' -m recent --name nlimitR7777 --rcheck -j ACCEPT	


iptables -I INPUT  -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|53414d50a772c94a611e69|'  -m recent --name nlimitI7777 ! --rcheck -m recent --name limitI7777 --set  -j DROP
iptables -I INPUT   -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|53414d50a772c94a611e69|' -m recent --name limitI7777 --rcheck -m recent --name limitI7777 --remove -m recent --name nlimitI7777 --set -j ACCEPT
iptables -I INPUT   -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|53414d50a772c94a611e69|' -m recent --name nlimitI7777 --rcheck -j ACCEPT								
