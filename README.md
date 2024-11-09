# ubuntu_docker_dev
Development environment Docker image with Ubuntu 22.04 and CUDA 12.2 support.

I created this in an effort to learn more about Docker and then it turned into something incredibly useful. There are other repos that have similar setups but in the end I wasn't able to find what I was looking for so I made this. The Dockerfile I've included here has the base packages needed for other projects. By default I built OpenCV with CUDA support but if more packages are needed they should be added separately of course.

A few things to note:
1. `Dockerfile` doesn't create a non-root user so as to not affect images built on this. 
2. There is no run script because I didn't intend for this image to be used directly.

I'm still fairly new to Docker and set this up according to suit what I wanted but any suggestions to improve this are welcome. 
You can pull this image by using the following: 
```
docker pull dantorres3600/cuda_dev_base:latest
```

### TODO

- [ ] Make the CUDA and Ubuntu versions arguments to make this more easily customizable