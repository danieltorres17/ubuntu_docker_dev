# ubuntu_docker_dev
Ubuntu development environment Docker container with CUDA support.

I created this in an effort to learn more about Docker and then it turned into something incredibly useful. The Dockerfile I've included here has the base packages needed to create a useful Ubuntu 22.04 image. If more packages are needed they should be added separately of course - I've been using this as a base image to work with ROS2 and on other projects. 

If you want to create a container after cloning the repo, run the following:
```
chmod +x entrypoint.sh build_dev.sh run_dev.sh && ./build_dev.sh && ./run_dev.sh
```
I had to copy over my `.bashrc` file from my home directory to the same directory with my Dockerfile in order to enable colors in the terminal prompt once inside the container. I'm still not sure if there's a better solution for this.  

A few things to note:
1. `Dockerfile` creates a container where the user is specified as "dev" (which can be changed) but is also made a sudo user. Why? Cause I wanted to have sudo access, easy.   
2. `build_dev.sh` builds the container with the given Dockerfile. 
3. `run_dev.sh` makes the container run as priviledged which isn't advised but it was the only way I found to get GUIs to pop up. I still need to find a better solution to this but it's worth noting. 

I'm new to Docker and set this up according to suit what I needed but any suggestions to improve this are welcome. 
