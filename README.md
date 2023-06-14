# ubuntu_docker_dev
Ubuntu development environment Docker container with CUDA support.

I created this in an effort to learn more about Docker and then it turned into something incredibly useful. The Dockerfile I've included here has the base packages needed to create a useful Ubuntu 22.04 image. If more packages are needed they should be added separately of course - I've been using this as a base image to work with ROS2 and on other projects. 

A few things to note:
1. The Dockerfile creates a container where the user is specified as "dev" (which can be changed) but is also made a sudo user. Why? Cause I wanted to have sudo access, easy.   
2. build_dev.sh builds the container with the given Dockerfile. 
3. run_dev.sh makes the container run as priviledged which isn't advised but it was the only way I found to get GUIs to pop up. I still need to find a better solution to this but it's worth noting. 

I'm new to Docker so any suggestions to improve this are welcome. 
