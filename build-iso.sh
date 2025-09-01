#!/bin/bash
mkdir -p output

podman run \
--rm \
--name homelab-turbo-one-bootc-gitops-bootc-image-builder \
--tty \
--privileged \
--security-opt label=type:unconfined_t \
-v /Users/roryschellekens/workspace/ferrory-homelab/servers/turbo-one/output:/output/ \
-v /var/lib/containers/storage:/var/lib/containers/storage \
-v /Users/roryschellekens/workspace/ferrory-homelab/servers/turbo-one/config.toml:/config.toml:ro \
--label bootc.image.builder=true \
quay.io/centos-bootc/bootc-image-builder:latest \
localhost/homelab-turbo-1:latest \
--output /output/ \
--type anaconda-iso \
--target-arch arm64 \
--use-librepo=True \
--rootfs xfs
