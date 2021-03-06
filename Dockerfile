FROM debian:buster-slim

CMD ["/usr/lib/plexmediaserver/Plex Media Server"]

RUN \
  apt-get update && \
  apt-get install -y avahi-utils && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN \
  apt-get update && \
  apt-get install -y curl && \
  curl -s -L https://downloads.plex.tv/plex-media-server-new/1.21.3.4021-5a0a3e4b2/debian/plexmediaserver_1.21.3.4021-5a0a3e4b2_amd64.deb -o /tmp/plex.deb && \
  dpkg -i /tmp/plex.deb && \
  apt-get autoremove -y curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME /var/lib/plexmediaserver

VOLUME /var/lib/plexmediaserver
