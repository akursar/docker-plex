FROM debian:stretch-slim

CMD ["/usr/sbin/start_pms"]

RUN \
  apt-get update && \
  apt-get install -y avahi-utils && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN \
  apt-get update && \
  apt-get install -y curl gnupg && \
  curl -s -L https://downloads.plex.tv/plex-media-server/1.5.7.4016-25d94bad9/plexmediaserver_1.5.7.4016-25d94bad9_amd64.deb -o /tmp/plex.deb && \
  dpkg -i /tmp/plex.deb && \
  apt-get autoremove -y curl gnupg && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME /var/lib/plexmediaserver

VOLUME /var/lib/plexmediaserver
