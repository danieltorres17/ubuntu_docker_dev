# ubuntu_docker_dev
Development environment Docker image with Ubuntu 22.04 and CUDA 11.8 support.

I created this in an effort to learn more about Docker and then it turned into something incredibly useful. There are other repos that have similar setups but in the end I wasn't able to find what I was looking for so I made this. The Dockerfile I've included here has the base packages needed to create a useful base image. If more packages are needed they should be added separately of course - I've been using this as a base image to work with different projects. 

If you want to create a container after cloning the repo, run the following:
```
chmod +x entrypoint.sh build_dev.sh run_dev.sh && ./build_dev.sh && ./run_dev.sh
```
I had to copy over my `.bashrc` file from my home directory to the same directory as the Dockerfile in order to enable colors in the terminal prompt once inside the container. I'm still not sure if there's a better solution for this.  

A few things to note:
1. `Dockerfile` creates a container where the user is specified as `dev` (which can be changed) and is also made a sudo user. Why? Why not?   
2. `build_dev.sh` builds the container with the given Dockerfile. 
3. `run_dev.sh` makes the container run as priviledged which isn't advised but it was the only way I found to get visualizations to work. I still need to find a better solution to this but it's worth noting. 

I'm new to Docker and set this up according to suit what I need but any suggestions to improve this are welcome. 
