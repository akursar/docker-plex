FROM debian:stretch-slim

CMD ["/usr/sbin/start_pms"]

RUN \
  apt-get update && \
  apt-get install -y avahi-utils && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN \
  apt-get update && \
  apt-get install -y curl && \
  curl -s -L https://downloads.plex.tv/plex-media-server/1.8.1.4139-c789b3fbb/plexmediaserver_1.8.1.4139-c789b3fbb_amd64.deb -o /tmp/plex.deb && \
  dpkg -i /tmp/plex.deb && \
  apt-get autoremove -y curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME /var/lib/plexmediaserver

VOLUME /var/lib/plexmediaserver
