FROM quay.io/centos-bootc/centos-bootc:stream10

LABEL org.opencontainers.image.source="https://github.com/ferrory/homelab-turbo-one"
LABEL org.opencontainers.image.description="My homelab-turbo-one bootc server hosting the following containers: Docker Registry, Gitea, HTTPD and ELK."
LABEL org.opencontainers.image.license="MIT"

#include unit files and containers
ADD etc etc
ADD var var

#add additional software
RUN dnf install -y cockpit cockpit-podman cockpit-storaged cockpit-ws cockpit-ostree lm_sensors sysstat tuned firewalld && \
      dnf clean all && \
      rm -rf /var/log/*.log /var/cache/* /var/log/rhsm/rhsm.log


#enable desired units
RUN systemctl enable lm_sensors sysstat tuned fstrim.timer podman.socket podman-auto-update.timer cockpit.socket

RUN ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

# Add containers
ADD containers-systemd etc/containers/systemd
ADD containers-config etc/containers-config

# Add firewall rules for containers
RUN firewall-offline-cmd --port=8080:tcp && \
      firewall-offline-cmd --port=2222:tcp && \
      firewall-offline-cmd --port=3000:tcp && \
      firewall-offline-cmd --port=5000:tcp && \
      firewall-offline-cmd --port=5601:tcp && \
      firewall-offline-cmd --port=9091:tcp

RUN dnf install -y openscap-utils scap-security-guide && dnf clean all && \
      rm -rf /var/log/*.log /var/cache/* /var/log/rhsm/rhsm.log

RUN oscap-im --profile cis /usr/share/xml/scap/ssg/content/ssg-rhel10-ds.xml 

RUN bootc container lint
