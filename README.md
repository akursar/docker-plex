# Minimal docker image for running Plex Media Server

- Built on baseimage-docker
- Expects media (/media) and config (/plex) to be mounted as data volumes from host directories

Plex Media Server uses Avahi and GDM for network discovery, and so generally doesn't work well in docker.

The simplest way to make it just work is to use docker's "host" network mode. I run with:

    docker run \
    --net="host" \
    -v /path/to/media:/media \
    -v /path/to/plex:/plex \
    -d -t akursar/plex

Alternatively, you can create your own bridge to run docker in the same subnet as your host.

I've done this by creating a br0 device on my host and addign my eth0 to it with a static ip:

/etc/network/interfaces

    auto lo
    iface lo inet loopback

    iface eth0 inet manual

    auto br0
    iface br0 inet static
        address 192.168.1.201
        netmask 255.255.255.0
        gateway 192.168.1.1
        dns-nameservers 192.168.1.1
        bridge_ports eth0
        bridge_stp off

And then by running my image with a specific IP:

    docker run \
    -n=false \
    --lxc-conf="lxc.network.type = veth" \
    --lxc-conf="lxc.network.ipv4 = 192.168.1.150/24" \
    --lxc-conf="lxc.network.ipv4.gateway = 192.168.1.1" \
    --lxc-conf="lxc.network.link = br0" \
    --lxc-conf="lxc.network.name = eth0" \
    --lxc-conf="lxc.network.flags = up" \
    -v /mnt/tb/media:/media \
    -v /mnt/tb/plex:/plex \
    -d -t akursar/plex

Note that this requires running docker with the lxc exec env.
