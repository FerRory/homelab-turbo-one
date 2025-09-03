# homelab-turbo-one

My homelab-turbo-one bootc server hosting the following containers: Docker Registry, Gitea, HTTPD and ELK.

## Elastic

Setup Metricbeat dashboards in Kibana:
   ```
sudo podman exec -it metricbeat bash

./metricbeat setup
   ```


## References

* https://timosarkar.vercel.app/elk/
* https://docs.podman.io/en/latest/markdown/podman-systemd.unit.5.html
* https://www.redhat.com/en/blog/multi-container-application-podman-quadlet
