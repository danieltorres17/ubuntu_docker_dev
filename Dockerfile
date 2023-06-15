FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

ENV HOME /home
SHELL ["/bin/bash", "-c"]

# Install base packages.
RUN apt-get update && \
  apt-get install -y \
  lsb-release \
  wget \ 
  curl \ 
  sudo \
  bash-completion \
  gdb \
  build-essential \ 
  software-properties-common \
  cmake \ 
  cmake-curses-gui \
  gdb \ 
  python3-pip \
  python3-venv 

# Install other packages.
RUN apt-get update && \
  apt-get install -y \
  git \
  vim \ 
  ninja-build \
  tree \
  htop \
  && apt-get clean -qq 

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

