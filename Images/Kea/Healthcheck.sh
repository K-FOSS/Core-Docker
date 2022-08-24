#!/bin/bash
status=$(keactrl status | grep "DHCPv4 server" | awk '{print $3}')

if [[ "${status}" == "active" ]]; then
  return 0
else
  return 1 
fi
