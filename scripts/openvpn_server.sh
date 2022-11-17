#! /bin/zsh

wget https://git.io/vpn -O openvpn-install.sh

chmod +x openvpn-install.sh

sudo ./openvpn-install.sh

sudo systemctl status openvpn-server@server.service # <--- get server status

echo "Openvpn server successfully running!"

