FROM nvidia/cuda:11.8.0-base-ubuntu22.04

ENV HOME /home
SHELL ["/bin/bash", "-c"]

RUN DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y \
    tzdata \
 && ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
 && dpkg-reconfigure --frontend noninteractive tzdata \
 && apt-get clean 

# Install base packages.
RUN apt-get update && \
  apt-get install -y \
  lsb-release \
  wget \ 
  curl \ 
  sudo \
  software-properties-common \
  nvidia-cuda-toolkit 

# Install other packages.
RUN apt-get update && \
  apt-get install -y \
  cmake \ 
  cmake-curses-gui \
  git \
  build-essential \ 
  bash-completion \
  gdb \
  vim \ 
  ninja-build \
  tree \ 
  && apt-get clean -qq \
  && rm -rf /var/lib/apt/lists/*

# Create user and add it to sudo group.
ARG user_id=dev
RUN useradd -m ${user_id} && \
  echo "${user_id}:${user_id}" | chpasswd 
RUN usermod -aG sudo ${user_id} 
RUN adduser ${user_id} sudo
USER ${user_id}

# Copy over the entrypoint script to create a dev directory entrypoint.
COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
WORKDIR /home/dev
CMD ["bash"]

