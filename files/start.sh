#!/bin/sh
set -e

PUID=${PUID:=0}
PGID=${PGID:=0}

exec s6-setuidgid $PUID:$PGID putio-download --config /conf/putio-config.ini --verbose
