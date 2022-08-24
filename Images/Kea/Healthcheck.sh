#!/bin/bash
status=$(keactrl status -c /etc/DHCP/keactrl.conf | grep "DHCPv4 server" | awk '{print $3}')

if [[ "${status}" == "active" ]]; then
  exit 0
else
  exit 1 
fi
