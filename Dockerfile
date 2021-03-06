FROM ubuntu:18.04

ADD protobuf-all-3.5.0.tar.gz ./   
ADD googletest-release-1.8.0.tar.gz ./ 
ADD folly-2018.03.05.00.tar.gz ./ 
ADD fmt-4.1.0.tar.gz ./
ADD double-conversion-3.0.0.tar.gz ./ 
RUN set -ex \
    && apt update  \
    && apt install -y \
    git \
    g++ \
    cmake \
    curl \
    unzip \
    python3-dev \
    libpthread-stubs0-dev \
    libmysqlclient-dev \
    libboost-all-dev \
    libevent-dev \
    libpthread-stubs0-dev\
    libasio-dev \
    libgoogle-glog-dev \
    libgflags-dev \
    libiberty-dev \
    liblz4-dev \
    liblzma-dev \
    libsnappy-dev \
    make \
    zlib1g-dev \
    binutils-dev \
    libjemalloc-dev \
    libssl-dev \
    pkg-config \
    libunwind8-dev \
    libelf-dev \
    libdwarf-dev \
    liblog4cxx-dev \
    && apt clean all \
    && cd googletest-release-1.8.0 \ 
    && cmake configure . -DCMAKE_INSTALL_PREFIX=/usr \
    && make  \
    && make install  \
    && cd .. \
    && cd double-conversion-3.0.0 \
    && cmake . -DCMAKE_INSTALL_PREFIX=/usr \
    && make \
    && make install \
    && cd .. \
    && cd folly-2018.03.05.00 \
    && mkdir _build \
    && cd _build \
    && cmake configure .. -DCMAKE_INSTALL_PREFIX=/usr \
    && make  \
    && make install  \
    && cd ../../ \
    && cd fmt-4.1.0 \
    && mkdir build \
    && cd build \
    && cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
    && make \
    && make install \
    && cd ../../  \
    && cd protobuf-3.5.0  \
    && ./configure --prefix=/usr \
    && make \
    && make install \ 
    && cd .. \
    && rm -rf fmt-4.1.0 \
    && rm -rf folly-2018.03.05.00 \
    && rm -rf googletest-release-1.8.0 \ 
    && rm -rf protobuf-3.5.0 \
    && rm -rf double-conversion-3.0.0 

