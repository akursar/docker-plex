FROM phusion/baseimage:0.9.16

CMD ["/sbin/setuser", "plex", "/usr/sbin/start_pms"]

RUN \
  apt-get update && \
  apt-get install -y avahi-utils && \
  curl -s "https://downloads.plex.tv/plex-media-server/0.9.12.4.1192-9a47d21/plexmediaserver_0.9.12.4.1192-9a47d21_amd64.deb" -o /tmp/plex.deb && \
  dpkg -i /tmp/plex.deb && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /var/lib/plexmediaserver
