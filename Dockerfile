FROM ubuntu:latest

RUN apt update -qq && \
    apt install -y -qq build-essential cmake gcc make wget zip unzip libssl-dev libcurl4-gnutls-dev  && \
    wget -q https://boostorg.jfrog.io/artifactory/main/release/1.83.0/source/boost_1_83_0.tar.gz && \
    tar -xf boost_1_83_0.tar.gz && \
    rm boost_1_83_0.tar.gz && \
    cd boost_1_83_0 && \
    ./bootstrap.sh toolset=clang && \
    ./b2 install release \
        variant=release \
        debug-symbols=on \
        optimization=speed \
            --with-json \
            --with-thread \
            --with-headers \
            --with-coroutine \
            --with-iostreams \
            --with-system \
            --with-regex \
            --with-system \
            --with-serialization \
            --with-program_options \
            --with-exception \
            --with-contract \
            --with-container \
            --with-context \
            --with-chrono \
            --with-locale \
            --with-thread \
            --with-test \
            --with-timer && \
    cd ../ && \
    rm boost_1_83_0 -Rf
