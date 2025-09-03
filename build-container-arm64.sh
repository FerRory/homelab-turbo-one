#!/bin/bash

podman build -t ghcr.io/ferrory/homelab-turbo-one-arm64-local  .
if [ $? -eq 0 ]; then
  podman push ghcr.io/ferrory/homelab-turbo-one-arm64-local
fi
