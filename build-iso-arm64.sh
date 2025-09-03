#!/bin/bash
mkdir -p output

podman run \
--rm \
--name homelab-turbo-one-bootc-gitops-bootc-image-builder \
--tty \
--privileged \
--security-opt label=type:unconfined_t \
-v ./output:/output/ \
-v /var/lib/containers/storage:/var/lib/containers/storage \
-v ./config.toml:/config.toml:ro \
--label bootc.image.builder=true \
quay.io/centos-bootc/bootc-image-builder:latest \
ghcr.io/ferrory/homelab-turbo-one-arm64-local:latest \
--output /output/ \
--type anaconda-iso \
--target-arch arm64 \
--use-librepo=True \
--rootfs xfs
