#!/bin/sh
set -e

PUID=${PUID:=0}
PGID=${PGID:=0}

COUNT=`ps -ef | grep [p]utio-download | wc -l`

if [ $COUNT == 0 ]; then
    exec s6-setuidgid $PUID:$PGID putio-download --config /conf/putio-config.ini >> /var/log/putio-download.log 2>&1
else
	echo "putio-downloader is already running"
fi
