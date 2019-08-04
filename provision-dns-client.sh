#!/bin/bash
set -eux

dns_server_ip_address="${1:-10.1.0.2}"; shift || true

# change the dns resolver to the pandora dns server.
rm /etc/resolv.conf
echo "nameserver $dns_server_ip_address" >/etc/resolv.conf
echo "dns-nameservers $dns_server_ip_address" >>/etc/network/interfaces # XXX TODO this does not really work... after reboot it will still use dhcp dns set dns servers...
cat /etc/hosts
