#!/bin/sh

apt-get update

apt-get install -y \
  libedit-dev \
  libjansson-dev \
  libncurses5-dev \
  libsqlite3-dev \
  libssl-dev \
  libuuid1 \
  libxml2-dev \
  openssl \
  uuid-dev

useradd asterisk
echo "asterisk:Obelix" | chpasswd
