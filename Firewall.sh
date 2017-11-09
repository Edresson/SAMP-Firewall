# SAMP-Firewall
# Layer 7 protection for samp servers
# Credits: Edresson Casanova | BlastHosting  : https://www.blasthosting.com.br/ 
# Thanks for: JernejL Beta Tester 
#Working for SA:Mp servers in port 7777

#modprobe ipt_recent ip_list_tot=10000
iptables -F

### Samp check server stats 	
iptables -I INPUT  -s 66.55.155.101 -j ACCEPT
iptables -I INPUT  -s 66.55.155.0/24 -j ACCEPT
iptables -I INPUT  -s  82.192.84.116 -j ACCEPT
iptables -I INPUT  -s  82.192.84.0/24 -j ACCEPT		

iptables -t filter -A OUTPUT -p icmp -m icmp --icmp-type echo-reply -j DROP
iptables -t filter -A OUTPUT -p icmp -m icmp --icmp-type port-unreachable -j DROP



### SAcnr monitor and 
iptables -I INPUT  -s 104.28.17.92 -j ACCEPT
iptables -I INPUT  -s 104.28.17.0/24 -j ACCEPT
#sa-mp.in
iptables -I INPUT  -s 162.144.7.215 -j ACCEPT
iptables -I INPUT  -s 162.144.7.0/24 -j ACCEPT
#game-stats
iptables -I INPUT  -s 149.202.241.189 -j ACCEPT
iptables -I INPUT  -s 149.202.241.0/24 -j ACCEPT

iptables -I INPUT -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|081e77da|' -m recent --name test ! --rcheck  -m recent --name test --set   -j  DROP
iptables -I INPUT -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|081e77da|'  -m recent --name test --rcheck --seconds 2  --hitcount 1     -j DROP 

iptables -I INPUT  -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|53414d50|' -m  string --algo kmp   --hex-string   '|611e63|'  -m recent --name limitC7777 ! --rcheck  -m recent --name limitC7777 --set -j DROP
iptables -I INPUT  -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|53414d50|' -m  string --algo kmp   --hex-string   '|611e63|' -m recent --name limitC7777 --rcheck  --seconds 2 --hitcount 1   -j DROP


iptables -I INPUT  -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|53414d50|' -m  string --algo kmp   --hex-string   '|611e69|'  -m recent --name limitI7777 ! --rcheck  -m recent --name limitI7777 --set 
iptables -I INPUT  -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|53414d50|' -m  string --algo kmp   --hex-string   '|611e69|' -m recent --name limitI7777 --rcheck  --seconds 2 --hitcount 1   -j DROP

iptables -I INPUT  -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|53414d50|' -m  string --algo kmp   --hex-string   '|611e72|'  -m recent --name limitR7777 ! --rcheck  -m recent --name limitR7777 --set -j DROP
iptables -I INPUT -p udp --dport 7777 -m string --algo kmp --hex-string '|53414d50|' -m string --algo kmp --hex-string '|611e72|' -m recent --name limitR7777 --rcheck --seconds 2 --hitcount 1 -j DROP
