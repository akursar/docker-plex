FROM phusion/baseimage:0.9.15

ENV HOME /root

RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

CMD ["/sbin/my_init"]

RUN apt-get update
RUN apt-get install -y avahi-utils

RUN curl -s "https://downloads.plex.tv/plex-media-server/0.9.11.7.803-87d0708/plexmediaserver_0.9.11.7.803-87d0708_amd64.deb" -o /tmp/plex.deb
RUN dpkg -i /tmp/plex.deb

ADD plexmediaserver /etc/default/plexmediaserver

RUN mkdir /etc/service/plex
ADD plex.sh /etc/service/plex/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
