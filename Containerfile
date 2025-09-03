#FROM registry.redhat.io/rhel10/rhel-bootc:10.0
FROM quay.io/centos-bootc/centos-bootc:stream10

#include unit files and containers
ADD etc etc
ADD var var

#add additional software
RUN dnf install -y cockpit cockpit-podman cockpit-storaged cockpit-ws lm_sensors sysstat tuned firewalld && \
      dnf clean all && \
      firewall-offline-cmd --port=8080:tcp && \
      firewall-offline-cmd --port=2222:tcp && \
      firewall-offline-cmd --port=3000:tcp && \
      firewall-offline-cmd --port=5000:tcp && \
      firewall-offline-cmd --port=5601:tcp && \
      rm -rf /var/log/*.log /var/cache/* /var/log/rhsm/rhsm.log


#enable desired units
RUN systemctl enable lm_sensors sysstat tuned fstrim.timer podman.socket podman-auto-update.timer cockpit.socket

RUN ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

RUN bootc container lint

LABEL org.opencontainers.image.source="https://github.com/ferrory/homelab-turbo-one"
LABEL org.opencontainers.image.description="My homelab-turbo-one bootc server hosting the following containers: Docker Registry, Gitea, HTTPD and ELK."
LABEL org.opencontainers.image.license="MIT"
