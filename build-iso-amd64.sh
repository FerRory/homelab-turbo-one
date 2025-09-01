#!/bin/bash
mkdir -p output

podman run \
--rm \
--name homelab-turbo-one-image-builder \
--tty \
--privileged \
--security-opt label=type:unconfined_t \
-v ./output:/output/ \
-v /var/lib/containers/storage:/var/lib/containers/storage \
-v ./config.toml:/config.toml:ro \
--label bootc.image.builder=true \
quay.io/centos-bootc/bootc-image-builder:latest \
ghcr.io/ferrory/homelab-turbo-one-amd64:latest \
--output /output/ \
--type anaconda-iso \
--target-arch amd64 \
--use-librepo=True \
--rootfs xfs
