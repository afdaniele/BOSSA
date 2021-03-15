ARG ARCH
ARG OS_FAMILY=trusty

FROM ${ARCH}/ubuntu:${OS_FAMILY}

ENV DEBIAN_FRONTEND=noninteractive

ARG ARCH
COPY ./assets/qemu/${ARCH}/ /usr/bin/

RUN apt update && \
    apt install -y --no-install-recommends \
	libreadline-dev \
	wx2.8-headers \
	libwxgtk2.8-0 \
	libwxgtk2.8-dev \
	build-essential \
	git \
	ca-certificates

COPY . /BOSSA

WORKDIR ./BOSSA

CMD make bin/bossac -j 4
