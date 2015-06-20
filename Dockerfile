FROM debian:8.1

ENV \
  HOME=/var/lib/plexmediaserver \
  PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR=/var/lib/plexmediaserver

CMD ["/usr/sbin/start_pms"]

RUN apt-get update && apt-get install -y avahi-utils curl

RUN \
  curl -s "https://downloads.plex.tv/plex-media-server/0.9.12.3.1173-937aac3/plexmediaserver_0.9.12.3.1173-937aac3_amd64.deb" -o /tmp/plex.deb && \
  dpkg -i /tmp/plex.deb && \
  rm -f /tmp/plex.deb

VOLUME /var/lib/plexmediaserver

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
