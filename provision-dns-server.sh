#!/bin/bash
set -eux

pandora_ip_address="${1:-10.1.0.2}"; shift || true
pandora_domain="${1:-pandora.rancher.test}"; shift || true

#
# provision the DNS server.
# this will resolve all entries from /etc/hosts by default (like our $pandora_domain).
# NB docker/rancher/coredns/kubernetes inherits resolv.conf from the host.
# see http://www.thekelleys.org.uk/dnsmasq/docs/setup.html
# see http://www.thekelleys.org.uk/dnsmasq/docs/dnsmasq-man.html

default_dns_resolver="$(cat /etc/resolv.conf | awk '/nameserver /{print $2}')" # recurse queries through the default vagrant environment DNS server.
apt-get install -y --no-install-recommends dnsutils dnsmasq
cat >/etc/dnsmasq.d/local.conf <<EOF
server=$default_dns_resolver
EOF
rm /etc/resolv.conf
echo "nameserver 127.0.0.1" >/etc/resolv.conf
echo "dns-nameservers 127.0.0.1" >>/etc/network/interfaces # XXX TODO this does not really work... after reboot it will still use dhcp dns set dns servers...
systemctl restart dnsmasq

# use it.
cat /etc/hosts
dig $pandora_domain
dig -x $pandora_ip_address
