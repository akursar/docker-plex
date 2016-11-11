FROM debian:jessie

CMD ["/usr/sbin/start_pms"]

RUN \
  apt-get update && \
  apt-get install -y avahi-utils curl && \
  curl -s -L https://downloads.plex.tv/plex-media-server/1.2.7.2987-1bef33a/plexmediaserver_1.2.7.2987-1bef33a_amd64.deb -o /tmp/plex.deb && \
  dpkg -i /tmp/plex.deb && \
  apt-get autoremove -y curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME /var/lib/plexmediaserver

VOLUME /var/lib/plexmediaserver
