# docker image for running Plex Media Server

Plex Media Server uses Avahi and GDM for network discovery, and so generally doesn't work well in docker.

The simplest way to make it just work is to use docker's "host" network mode. I run with:

    docker run -d \
    --net=host \
    akursar/plex
