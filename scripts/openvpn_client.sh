#! /bin/zsh

echo "Setting up openvpn client for linux distro..."
echo "(assumes you have a \"server.opvn\" file in the current working directory)"

sudo apt install openvpn

sudo cp server.ovpn /etc/openvpn/client.conf

sudo openvpn --client --config /etc/openvpn/server.conf

sudo systemctl start openvpn@client

ip route

dig TXT +short o-o.myaddr.l.google.com @ns1.google.com

