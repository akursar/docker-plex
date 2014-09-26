FROM phusion/baseimage:0.9.13

ENV HOME /root

CMD ["/sbin/my_init"]

RUN apt-get update
RUN apt-get install -y avahi-utils

RUN curl -s "https://downloads.plex.tv/plex-media-server/0.9.9.14.531-7eef8c6/plexmediaserver_0.9.9.14.531-7eef8c6_amd64.deb" > /tmp/plex.deb
RUN dpkg -i /tmp/plex.deb

RUN mkdir /etc/service/plex
ADD plex.sh /etc/service/plex/run

VOLUME /plex
VOLUME /media

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
