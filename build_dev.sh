#!/bin/bash 

CONTAINER_NAME="dantorres3600/cuda_dev_base"
TAG="latest"

docker build \
  -t ${CONTAINER_NAME}:${TAG} \
  -f Dockerfile .