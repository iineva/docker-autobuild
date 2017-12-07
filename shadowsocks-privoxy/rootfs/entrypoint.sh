#!/bin/sh

#------------------------------------------------------------------------------
# Configure the service:
#------------------------------------------------------------------------------
env /go-shadowsocks2 -c ss://${METHOD:-CHACHA20-IETF-POLY1305}:$PASSWORD@$SERVER_ADDR:$SERVER_PORT -socks :7070 &

env /usr/sbin/privoxy --no-daemon /etc/privoxy/config
