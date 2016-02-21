FROM debian:jessie

CMD ["/usr/sbin/start_pms"]

RUN \
  apt-get update && \
  apt-get install -y avahi-utils curl && \
  curl -s -L https://downloads.plex.tv/plex-media-server/0.9.15.3.1674-f46e7e6/plexmediaserver_0.9.15.3.1674-f46e7e6_amd64.deb -o /tmp/plex.deb && \
  dpkg -i /tmp/plex.deb && \
  apt-get autoremove -y curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME /var/lib/plexmediaserver

VOLUME /var/lib/plexmediaserver
