#!/bin/bash
set -e

cd /home/
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git

cd opencv
mkdir build 
cd build
cmake \
  -DCMAKE_BUILD_TYPE=RELEASE \
  -DCMAKE_INSTALL_PREFIX=/usr/local \
  -DINSTALL_C_EXAMPLES=OFF \
  -DINSTALL_PYTHON_EXAMPLES=OFF \
  -DWITH_TBB=ON \
  -DWITH_V4L=ON \
  -DWITH_QT=ON \
  -DWITH_OPENGL=ON \
  -DWITH_GSTREAMER=ON \
  -DWITH_CUDA=ON \
  -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-12.2 \
  -DCUDA_ARCH_BIN=7.5 \
  -DCUDA_ARCH_PTX="" \
  -DWITH_CUDNN=ON \
  -DOPENCV_DNN_CUDA=ON \
  -DENABLE_FAST_MATH=1 \
  -DCUDA_FAST_MATH=1 \
  -DWITH_CUBLAS=1 \
  -DOPENCV_EXTRA_MODULES_PATH=/home/opencv_contrib/modules \
  -DHAVE_opencv_python3=ON \
  -DPYTHON_EXECUTABLE=$(which python3) \
  -DOPENCV_GENERATE_PKGCONFIG=ON \
  -DWITH_NVCUVID=OFF \
  -DWITH_NVCUVENC=OFF \
  -DBUILD_EXAMPLES=OFF ..

make -j8 && sudo make install && sudo ldconfig
rm -rf opencv opencv_contrib