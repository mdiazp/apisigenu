#!/bin/sh
### BEGIN INIT INFO
# Provides:          postgrest
# Required-Start:    $local_fs $network postgresql
# Required-Stop:     $local_fs $network
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Description:       PostgreSQL REST API daemon
### END INIT INFO

. /lib/lsb/init-functions
#if test -f /etc/default/postgrest; then
#    . /etc/default/postgrest
#fi
POSTGREST=/usr/local/bin/postgrest

START_PARAMS="/etc/apisigenu/postgrest.conf"

start()
{
	log_daemon_msg "Starting PostgreSQL REST API daemon" "postgrest" || true
	if start-stop-daemon --start --quiet --oknodo --chuid postgrest --startas /usr/local/bin/postgrest-wrapper --exec $POSTGREST -- $START_PARAMS; then
		log_end_msg 0 || true
	else
		log_end_msg 1 || true
	fi
}

stop()
{
	log_daemon_msg "Stopping PostgreSQL REST API daemon" "postgrest" || true
	if start-stop-daemon --stop --quiet --oknodo --exec $POSTGREST; then
		log_end_msg 0 || true
	else
		log_end_msg 1 || true
	fi
}

status()
{
	status_of_proc $POSTGREST postgrest && exit 0 || exit $?
}

case "$1" in
start)
	start
	;;
stop)
	stop
	;;
restart)
	stop
	start
	;;
status)
	status
	;;
*)
	echo "Usage: $0 {start|stop|restart|status}"
esac