
if [ "$1" = 'freeswitch' ]; then
    BASEURL=https://files.freeswitch.org/releases/sounds/
    PID_FILE=/var/run/freeswitch/freeswitch.pid

    if [ "$EPMD" = "true" ]; then
        /usr/bin/epmd -daemon
    fi

    chown -R freeswitch:freeswitch /etc/freeswitch
    chown -R freeswitch:freeswitch /var/lib/freeswitch
    chown -R freeswitch:freeswitch /var/run/freeswitch
    chown -R freeswitch:freeswitch /var/log/freeswitch

    trap '/usr/bin/freeswitch -stop' TERM

    if [ -d /docker-entrypoint.d ]; then
        for f in /docker-entrypoint.d/*.sh; do
            [ -f "$f" ] && . "$f"
        done
    fi
    su-exec freeswitch:freeswitch /usr/bin/freeswitch -nonat -c &
    pid="$!"

    wait $pid
    exit 0
fi

exec "$@"