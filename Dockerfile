FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04

SHELL ["/bin/bash", "-c"]
ENV TERM=xterm-256color

RUN --mount=type=cache,target=/var/cache/apt \
  apt-get update && \
  apt-get install --no-install-recommends -y \
  sudo \
  lsb-release \
  wget \ 
  curl \ 
  bash-completion \
  gdb \
  build-essential \ 
  software-properties-common \
  cmake \ 
  cmake-curses-gui \
  gdb \ 
  python3-pip \
  python3-venv \
  libomp-dev \
  git \
  vim \ 
  ninja-build \
  tree \
  htop && \
  rm -rf /var/lib/apt/lists/*

RUN --mount=type=cache,target=/var/cache/apt \
  apt-get update && \
  apt-get install --no-install-recommends -y \
  liblapack-dev \
  libsuitesparse-dev \
  libatlas-base-dev \
  libmetis-dev \
  libfmt-dev \
  libboost-all-dev \
  libgtk2.0-dev \
  pkg-config \
  libavcodec-dev \
  libavformat-dev \
  libswscale-dev \
  libv4l-dev \
  libjpeg-dev \
  libpng-dev \
  gfortran \
  libgstreamer-plugins-base1.0-dev \
  libgstreamer1.0-dev \
  libgtk-3-dev && \
  rm -rf /var/lib/apt/lists/*

# Install CUDA OpenCV.
COPY install_opencv_cuda.sh install_opencv_cuda.sh
RUN chmod +x install_opencv_cuda.sh 
RUN source install_opencv_cuda.sh

# Install clang and LLVM.
ARG CLANG_VERSION=20
RUN wget -O - https://apt.llvm.org/llvm.sh
RUN wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && source ./llvm.sh ${CLANG_VERSION} all

# Setup clang and LLVM environment variables.
ENV CC=/usr/bin/clang-${CLANG_VERSION}
ENV CPP=/usr/bin/clang-cpp-${CLANG_VERSION}
ENV CXX=/usr/bin/clang++-${CLANG_VERSION}
ENV LD=/usr/bin/ld.lld-${CLANG_VERSION}

# Install latest CMake version.
RUN --mount=type=cache,target=/var/cache/apt \
  apt-get update && \
  apt-get install --no-install-recommends -y \
  libssl-dev
WORKDIR /root/temp
RUN wget https://github.com/Kitware/CMake/releases/download/v3.31.0-rc3/cmake-3.31.0-rc3.tar.gz
RUN tar -xzvf cmake-3.31.0-rc3.tar.gz
WORKDIR /root/temp/cmake-3.31.0-rc3/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release
RUN make -j8
RUN make install
WORKDIR /root
RUN rm -rf temp
