FROM debian:bullseye-slim

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

ARG ZULU_VER=8.62.0.19
ARG ZULU_JAVA_VER=8.0.332

RUN apt-get -qq update && \
    apt-get -qq -y --no-install-recommends install locales curl tzdata && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    curl -sLO https://cdn.azul.com/zulu/bin/zulu${ZULU_VER}-ca-fx-jdk${ZULU_JAVA_VER}-linux_amd64.deb && \
    chmod a+rx zulu${ZULU_VER}-ca-fx-jdk${ZULU_JAVA_VER}-linux_amd64.deb && \
    apt-get install -y --no-install-recommends zulu${ZULU_VER}-ca-fx-jdk${ZULU_JAVA_VER}-linux_amd64.deb \
    apt-get -qq -y purge && \
    apt -y autoremove && \
    rm -rf /var/lib/apt/lists/* zulu${ZULU_VER}-ca-fx-jdk${ZULU_JAVA_VER}-linux_amd64.deb

ENV JAVA_HOME=/usr/lib/jvm/zulu-fx-8-amd64
