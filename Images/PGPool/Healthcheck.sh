#
# Script found from https://github.com/syndbg/postgres-docker-cluster/blob/5055c87e03a028943d764fb4e5ec80e221e961c6/pgpool/bin/has_write_node.sh
#
#!/usr/bin/env sh

PRIMARY_COUNT=$(PGCONNECT_TIMEOUT=$CHECK_PGCONNECT_TIMEOUT PGPASSWORD=$CHECK_PASSWORD psql -U $CHECK_USER -h 127.0.0.1 template1 -c 'show pool_nodes' | grep primary | wc -l)

if [[ "$PRIMARY_COUNT" == "0" ]]; then
    exit 1
else
    exit 0
fi
