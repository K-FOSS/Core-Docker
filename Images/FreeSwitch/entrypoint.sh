#!/bin/sh


BASEURL=https://files.freeswitch.org/releases/sounds/
PID_FILE=/var/run/freeswitch/freeswitch.pid

if [ "$EPMD" = "true" ]; then
    /usr/bin/epmd -daemon
fi


trap '/usr/bin/freeswitch -stop' TERM

/usr/bin/freeswitch -nonat -c &
pid="$!"

wait $pid
exit 0


