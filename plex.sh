#!/bin/sh

export PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR=/plex
export PLEX_MEDIA_SERVER_USE_SYSLOG=true

exec /usr/sbin/start_pms >>/var/log/plex.log 2>&1
