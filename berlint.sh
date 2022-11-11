echo "nameserver 192.168.122.1" > /etc/resolv.conf

apt-get update
apt-get install libapache2-mod-php7.0 -y
apt-get install squid -y

echo "
	http_port 5000
	visible_hostname Berlint
	#http_access allow all
" > /etc/squid/squid.conf

# nomor 1
# BELOM PASTI

echo "
    acl AVAILABLE_WORKING time MTWHF 08:00-17:00
    acl AVAILABLE_WORKING time AS 00:00-23:59
" >/etc/squid/acl.conf

echo "
    include /etc/squid/acl.conf

    http_port 5000
    visible_hostname Berlint
    #http_access allow all

    auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwd
    auth_param basic children 5
    auth_param basic realm Proxy
    auth_param basic credentialsttl 2 hours
    auth_param basic casesensitive on
    acl USERS proxy_auth REQUIRED
    http_access allow USERS AVAILABLE_WORKING
    http_access deny all
" > /etc/squid/squid.conf

service squid restart

