echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update
apt-get install isc-dhcp-server -y

# nomor 2
echo "
    # On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
    #       Separate multiple interfaces with spaces, e.g. \"eth0 eth1\".
    INTERFACES=\"eth0\"
" > /etc/default/isc-dhcp-server

# nomor 7
echo " 
    host Eden {
        hardware ethernet be:c0:ff:37:bb:09;
        fixed-address 10.45.3.13;
    }
" >  /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart

service isc-dhcp-server status