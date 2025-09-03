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
* https://github.com/containers/prometheus-podman-exporter
* https://willhbr.net/2023/07/16/simple-home-server-monitoring-with-prometheus-in-podman/

## Todo

* https://grafana.com/docs/grafana-cloud/send-data/metrics/metrics-prometheus/prometheus-config-examples/docker-compose-linux/
