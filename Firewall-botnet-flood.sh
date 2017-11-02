#Drop First packet for all ips connection on port 7777 and limit flood in 2 connection for seconds (if you pass this ip is blocked)

iptables -I INPUT -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|081e77da|'  -m recent --name test --set 
iptables -I INPUT -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|081e77da|'  -m recent --name test --rcheck  --seconds 1 --hitcount 2  -m recent --name test --remove -m recent --name blacklist --set   -j DROP

iptables -I INPUT  -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|53414d50|' -m  string --algo kmp   --hex-string   '|611e63|'  -m recent --name testi --set 
iptables -I INPUT  -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|53414d50|' -m  string --algo kmp   --hex-string   '|611e63|' -m recent --name testi --rcheck  --seconds 1 --hitcount 2  -m recent --name testi --remove -m recent --name blacklist --set   -j DROP

iptables -I INPUT  -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|53414d50|' -m  string --algo kmp   --hex-string   '|611e69|'  -m recent --name testr --set 
iptables -I INPUT  -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|53414d50|' -m  string --algo kmp   --hex-string   '|611e69|' -m recent --name testr --rcheck  --seconds 1 --hitcount 2 -m recent --name testr --remove -m recent --name blacklist --set   -j DROP


iptables -I INPUT  -p udp --dport 7777  -m  string --algo kmp   --hex-string   '|53414d50|' -m  string --algo kmp   --hex-string   '|611e72|'  -m recent --name testc --set 
iptables -I INPUT  -p udp --dport 7777   -m  string --algo kmp   --hex-string   '|53414d50|' -m  string --algo kmp   --hex-string   '|611e72|' -m recent --name testc --rcheck  --seconds 1 --hitcount 2  -m recent --name testc --remove -m recent --name blacklist --set   -j DROP


iptables -I INPUT -p udp --dport 7777  -m recent --name blacklist --rcheck -j DROP
