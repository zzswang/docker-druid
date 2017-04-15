#!/usr/bin/env bash
set -e

export HOSTIP=$(getent hosts $HOSTNAME | awk '{print $1;}')

if [ "${1:0:1}" = '-' ]; then
    set -- supervisord "$@"
elif [ "$1" = "" ]; then
    set -- supervisord -c /work/supervisord.conf
fi

exec "$@"

