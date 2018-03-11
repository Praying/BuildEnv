FROM ubuntu:18.04

RUN set -ex \
    && apt update  \
    && apt install -y \
    git \
    g++ \
    cmake \
    curl \
    unzip \
    python3 \
    python3-dev \
    mysql-client \
    libmysqlclient-dev \
    libboost-all-dev \
    libevent-dev \
    libpthread-stubs0-dev\
    libasio-dev \
    libprotobuf-dev \
    libprotoc-dev \
    libdouble-conversion-dev \
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
    && git clone https://github.com/google/googletest.git \
    && cd googletest  \
    && cmake configure .  \
    && make  \
    && make install  \
    && git clone https://github.com/facebook/folly.git  \
    && cd folly \
    && mkdir _build \
    && cd _build \
    && cmake configure .. \
    && make  \
    && make install  \
    && cd ../../ \
    && git clone https://github.com/fmtlib/fmt.git  \
    && cd fmt \
    && git checkout remotes/origin/4.x \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && make install \
    && cd ../../  \
    && curl -OL https://github.com/google/protobuf/releases/download/v3.5.0/protoc-3.5.0-linux-x86_64.zip \
    && unzip protoc-3.5.0-linux-x86_64.zip -d protoc3 \
    && rm -f /usr/local/bin/protoc \
    && mv protoc3/bin/* /usr/local/bin/ \
    && mv protoc3/include/* /usr/local/include/ \
    && chown `whoami` /usr/local/bin/protoc \
    && chown -R `whoami` /usr/local/include/google \
    && rm -rf fmt \
    && rm -rf folly \
    && rm -rf googletest \
    && rm -f protoc-3.5.0-linux-x86_64.zip \
    && rm -rf protoc3

