#!/bin/bash 

docker run -it \
  --rm \
  -e DISPLAY=:1 \
  -e QT_X11_NO_MITSHM=1 \
  -e XAUTHORITY=$XAUTH \
  -v "$XAUTH:$XAUTH" \
  -v "/tmp/.X11-unix:/tmp/.X11-unix" \
  -v "/etc/localtime:/etc/localtime:ro" \
  --privileged \
  --network host \
  --name=dev \
  --gpus=all \
  --mount type=bind,source=${PWD},target=/home dev/dev_build:0.1 bash
