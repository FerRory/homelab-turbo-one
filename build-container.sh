#!/bin/bash

podman build --platform "linux/arm64,linux/amd64" -t ghcr.io/ferrory/homelab-turbo-one  .
if [ $? -eq 0 ]; then
  podman push ghcr.io/ferrory/homelab-turbo-one
fi
